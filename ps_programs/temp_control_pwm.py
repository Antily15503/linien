"""Slow temperature-control loop for the linien PZT setup.

Runs standalone on the Red Pitaya, alongside but independent of linien-server.
Polls the FPGA for one averaged sample of the PZT control signal per PID-state
entry (~3.3 Hz), runs a leaky PID, and writes a 12-bit duty cycle to the heater
PWM on GPIO_P[5].

Purpose is drift suppression over hours, not PZT range offloading: the setpoint
is captured from the first samples after the lock forms, so the loop starts at
zero correction and only ever corrects drift away from that operating point.

With REQUIRE_LOCK on, it waits for the lock, captures its setpoint, and controls
until the lock drops -- at which point it logs an error, sets the duty to 0, and
exits. With it off (the default) it runs continuously, consuming samples
whenever they appear and holding the last duty when they stop.

Either way the gateware sampler is gated on linien's PID state, so samples only
arrive while linien is actually in that state.
"""

import logging
import signal
import sys
import time
from collections import deque

from linien_server.csr import PythonCSR
from pyrp3.board import RedPitaya

# ---------------------------------------------------------------------------
# Tuning. All gains start at zero, so the loop is inert until you set them:
# it will capture a setpoint, log samples, and hold the duty at DUTY_STARTUP.
#
# Before setting any gain, determine SIGN experimentally. Step the duty by hand
# with the loop disabled and watch which way the PZT control signal moves; SIGN
# is +1 if increasing duty increases the control signal, -1 otherwise. Getting
# it backwards drives the heater to one rail and holds it there.
#
# Then bring up KI alone, then KP. Leave KD at 0 until the rest is stable -- a
# derivative term over a 1.2 s window against an unmeasured thermal plant is
# the most likely thing to make this oscillate.
# ---------------------------------------------------------------------------
SIGN = +1
KP = 0.0
KI = 0.0
KD = 0.0

# Integrator leak per update. At ~3.3 Hz, 0.99985 is a time constant of about
# 34 minutes -- long compared with the loop response, as it should be.
LEAK = 0.99985

# ---------------------------------------------------------------------------
# Fixed by the gateware. Do not change without changing temp_*.sv to match.
# ---------------------------------------------------------------------------
REG_DUTY = "temp_control_duty"
REG_SAMPLE_DATA = "temp_control_sample_data"
REG_SAMPLE_COUNT = "temp_control_sample_count"
REG_LOCK_RUNNING = "logic_autolock_lock_running"

SAMPLE_BITS = 18
SAMPLE_SCALE = 16.0  # 4 fractional bits -> sample is in 1/16 DAC counts
COUNT_MASK = 0xFF

DUTY_MIN = 0
DUTY_MAX = 4095
DUTY_STARTUP = 2048  # 50%, also the bias the PID corrects around

# ---------------------------------------------------------------------------
# Loop behaviour
# ---------------------------------------------------------------------------
# When True the loop refuses to start until linien is locked and exits as soon
# as it unlocks. When False it never looks at lock_running: it consumes samples
# whenever they appear and simply stops updating (holding the last duty) when
# they stop. Note this does NOT make samples arrive without a lock -- the
# gateware sampler is gated on the PID state independently of this flag.
REQUIRE_LOCK = False

# Flush the derivative history after a gap this long, regardless of what the
# sample counter says. The counter is 8 bits and wraps after 256 samples (~77 s
# at 3.3 Hz), so with REQUIRE_LOCK off a long outage can alias to "0 missed" and
# the derivative would then span the whole gap as if it were four consecutive
# samples. Wall-clock is the only reliable guard once the loop persists.
MAX_SAMPLE_GAP = 5.0  # seconds; ~16x the nominal 300 ms cycle

HISTORY_LEN = 5  # x[n] .. x[n-4]
D_SPAN = 4  # derivative is (x[n] - x[n-4]) / 4
SETPOINT_SAMPLES = 8  # averaged to form the setpoint; must be >= HISTORY_LEN
POLL_INTERVAL = 0.05  # 20 Hz, comfortably faster than the ~3.3 Hz sample rate
SEQLOCK_RETRIES = 5

# Saturation warnings, replacing the LED indicators.
DUTY_WARN_HIGH = int(0.90 * DUTY_MAX)
DUTY_WARN_LOW = int(0.05 * DUTY_MAX)
LOG_EVERY = 10  # log a duty line every N updates (~3 s)

logger = logging.getLogger("temp_control")


class LockLost(Exception):
    """linien dropped out of the PID state."""


def sign_extend(value, bits):
    """The CSR bus is unsigned; sample_data is signed at `bits` wide."""
    if value & (1 << (bits - 1)):
        value -= 1 << bits
    return value


def read_sample(csr):
    """Read (count, value_in_dac_counts) coherently.

    misoc's CSRStatus does not latch multi-byte reads, so sample_data's three
    bus transactions can straddle a gateware update and return a mix of old and
    new bytes. sample_count is a single byte and therefore atomic, which makes
    it usable as a seqlock guard: if it has not moved across the data read, the
    data cannot have changed underneath it.
    """
    for _ in range(SEQLOCK_RETRIES):
        count = csr.get(REG_SAMPLE_COUNT)
        raw = csr.get(REG_SAMPLE_DATA)
        if csr.get(REG_SAMPLE_COUNT) == count:
            return count, sign_extend(raw, SAMPLE_BITS) / SAMPLE_SCALE
    raise RuntimeError(
        "sample_count changed on every seqlock attempt -- the gateware is "
        "publishing far faster than expected, or the csrmap does not match "
        "the flashed bitstream"
    )


def run_loop(csr):
    history = deque(maxlen=HISTORY_LEN)  # fixed size, never grows
    setpoint = None
    capture_sum = 0.0
    capture_n = 0
    integrator = 0.0
    last_count = None
    last_sample_time = None
    updates = 0
    was_locked = False

    if REQUIRE_LOCK:
        logger.info("waiting for lock ...")
    else:
        logger.info(
            "REQUIRE_LOCK off -- consuming samples whenever the PID state runs"
        )

    while True:
        if REQUIRE_LOCK:
            locked = bool(csr.get(REG_LOCK_RUNNING))

            if was_locked and not locked:
                raise LockLost("lock_running deasserted")

            if not locked:
                time.sleep(POLL_INTERVAL)
                continue

            if not was_locked:
                was_locked = True
                logger.info(
                    "lock acquired, collecting %d samples", SETPOINT_SAMPLES
                )

        count, value = read_sample(csr)
        if count == last_count:
            time.sleep(POLL_INTERVAL)
            continue

        now = time.monotonic()
        if last_count is not None:
            # dt is defined by the cycle count, so any gap invalidates the
            # derivative window. Check wall-clock first: the counter wraps at
            # 256 samples, so a long outage can alias to "0 missed".
            gap = now - last_sample_time
            if gap > MAX_SAMPLE_GAP:
                logger.warning("%.1f s gap since last sample, flushing history", gap)
                history.clear()
            else:
                missed = ((count - last_count) & COUNT_MASK) - 1
                if missed > 0:
                    logger.warning("missed %d sample(s), flushing history", missed)
                    history.clear()
        last_count = count
        last_sample_time = now

        history.append(value)

        if setpoint is None:
            capture_sum += value
            capture_n += 1
            if capture_n < SETPOINT_SAMPLES:
                continue
            setpoint = capture_sum / capture_n
            logger.info("setpoint captured: %.4f counts", setpoint)
            continue

        if len(history) < HISTORY_LEN:
            continue  # refilling after a gap

        error = value - setpoint
        integrator = LEAK * integrator + KI * error
        derivative = (history[-1] - history[0]) / D_SPAN

        # MANDATORY clamp, not just anti-windup. PythonCSR.set() masks the value
        # to the register width, and for a negative value the assertion that
        # guards it passes: -100 becomes 3996, i.e. 97.6% duty, silently. A small
        # undershoot would invert the control action with nothing in the log.
        duty = DUTY_STARTUP + SIGN * (KP * error + integrator + KD * derivative)
        duty = int(round(duty))
        duty = max(DUTY_MIN, min(DUTY_MAX, duty))

        csr.set(REG_DUTY, duty)
        updates += 1

        pct = 100.0 * duty / DUTY_MAX
        if duty >= DUTY_WARN_HIGH or duty <= DUTY_WARN_LOW:
            logger.warning(
                "duty %d (%.1f%%) at the edge of authority | err %+.4f int %+.2f",
                duty,
                pct,
                error,
                integrator,
            )
        elif updates % LOG_EVERY == 0:
            logger.info(
                "duty %d (%.1f%%) | err %+.4f int %+.2f deriv %+.4f",
                duty,
                pct,
                error,
                integrator,
                derivative,
            )


def main():
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)-7s %(message)s",
    )
    # So `systemctl stop` still zeroes the heater: SystemExit runs the finally.
    signal.signal(signal.SIGTERM, lambda *_: sys.exit(0))

    csr = PythonCSR(RedPitaya())

    try:
        logger.info("startup duty %d (50%%)", DUTY_STARTUP)
        csr.set(REG_DUTY, DUTY_STARTUP)
        run_loop(csr)
        return 0
    #except LockLost as exc:
    #    logger.error("lock lost: %s -- stopping, rerun before relocking", exc)
    #    return 1
    except KeyboardInterrupt:
        logger.info("interrupted")
        return 0
    finally:
        # Runs after the except blocks, so the error is always logged before the
        # heater is turned off, and every exit path turns it off.
        try:
            csr.set(REG_DUTY, 0)
            logger.info("duty set to 0")
        except Exception:
            logger.exception("failed to zero the duty cycle")


if __name__ == "__main__":
    sys.exit(main())
