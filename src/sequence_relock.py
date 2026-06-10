import time
import logging

logger = logging.getLogger(__name__)


# ttl_handler status register bits
STATUS_ACTIVE = 0b01  # bit 0: sequence running
STATUS_ARMED = 0b10  # bit 1: enabled and waiting for trigger


class SequenceRelock:
    def __init__(
        self,
        csr,
        settle_time=0.01,
        lock_timeout=0.05,
        max_retries=5,
        widen_step=500,
        relock_window=500,
    ):
        """
        Args:
            csr:           register read/write interface (csr.get / csr.set)
            settle_time:   seconds to wait for PID to settle after sequence
            lock_timeout:  seconds to wait for autolock per attempt
            max_retries:   how many times to widen sweep before giving up
            widen_step:    how much to widen sweep.min/max per retry (in DAC LSBs)
            relock_window: ± LSBs around v_lock for the initial narrow relock
        """
        self.csr = csr
        self.settle_time = settle_time
        self.lock_timeout = lock_timeout
        self.max_retries = max_retries
        self.widen_step = widen_step
        self.relock_window = relock_window

# to check if the seuqence is active, look at the output of the ttl handler. 
    def is_sequence_active(self):
        """check if a sequence is currently running."""
        """ERROR: regfile_adapter_status is  not instantiated; needs to be rewored"""
        #replace with check on o_active signal from ttl handler. 
        #status = self.csr.get("regfile_adapter_status")
        status=(self.csr.get("logic_o_active")!=0)
        return bool(status & STATUS_ACTIVE)

    def is_locked(self):
        """check if linien's autolock reports lock acquired."""
        return bool(self.csr.get("logic_autolock_lock_running"))

    def request_lock(self):
        """re-trigger autolock (0→1 edge on request_lock)."""
        self.csr.set("logic_autolock_request_lock", 0)
        self.csr.set("logic_autolock_request_lock", 1)

    def widen_sweep(self, amount):
        """expand sweep range symmetrically by `amount` LSBs."""
        current_min = self.csr.get("logic_sweep_min")
        current_max = self.csr.get("logic_sweep_max")
        new_min = max(current_min - amount, -(1 << 13))  # clamp to 14-bit signed min
        new_max = min(current_max + amount, (1 << 13) - 1)  # clamp to 14-bit signed max
        self.csr.set("logic_sweep_min", new_min)
        self.csr.set("logic_sweep_max", new_max)
        logger.info(f"widened sweep: min={new_min}, max={new_max}")

    def get_lock_voltage(self):
        """read v_lock (linien DAC value snapshotted by ttl_handler at TTL trigger).

        returns signed 14-bit. the CSR bus reports the value unsigned, so
        sign-extend from the declared 14-bit width.
        """
        v = self.csr.get("logic_sequence_saved_dac_out")
        if v & (1 << 13):
            v -= 1 << 14
        return v

    def narrow_sweep_around_lock(self, window):
        """center the sweep range on v_lock with ±`window` LSBs (clamped to 14-bit signed).

        biases linien's autolock toward the same zero-crossing it held before
        the TTL sequence drove the DAC away.
        """
        v_lock = self.get_lock_voltage()
        new_min = max(v_lock - window, -(1 << 13))
        new_max = min(v_lock + window, (1 << 13) - 1)
        self.csr.set("logic_sweep_min", new_min)
        self.csr.set("logic_sweep_max", new_max)
        logger.info(f"narrowed sweep around v_lock={v_lock}: [{new_min}, {new_max}]")
        return v_lock

    def handle_sequence_done(self):
        """
        called after detecting that the sequence completed (o_active dropped).
        attempts to re-establish linien's lock.

        relock strategy:
          1. let PID resume on its own (it ungates when o_active drops).
          2. if still unlocked, narrow the sweep around v_lock and re-trigger
             autolock to bias toward the original zero-crossing.
          3. if that fails, progressively widen the sweep until autolock
             catches a peak or retries are exhausted.

        returns True if lock was re-acquired, False if all retries exhausted.
        """

        # level 1: PID resumes automatically when o_active drops.
        # the gateware already reasserted pid.running. give it a moment
        # to settle - the error signal might ring for a few hundred us
        # after the sequence drove arbitrary voltages.
        time.sleep(self.settle_time)

        if self.is_locked():
            logger.info("lock held after sequence (PID resumed on its own)")
            return True

        # we're about to mutate sweep bounds; snapshot originals so we can
        # restore them whether we end up locking or giving up.
        original_min = self.csr.get("logic_sweep_min")
        original_max = self.csr.get("logic_sweep_max")

        try:
            # level 2: PID couldn't hold. narrow the sweep around v_lock so
            # linien's autolock targets the same zero-crossing held before
            # the sequence, then re-trigger.
            logger.info("lock lost after sequence, narrowing sweep around v_lock")
            self.narrow_sweep_around_lock(self.relock_window)
            self.request_lock()
            time.sleep(self.lock_timeout)

            if self.is_locked():
                logger.info("autolock re-acquired around v_lock")
                return True

            # level 3: zero-crossing drifted outside the narrow window.
            # widen progressively (symmetrically around v_lock, since that's
            # where we just centered) until we catch it.
            logger.warning("autolock failed at narrow window, widening")
            for attempt in range(self.max_retries):
                self.widen_sweep(self.widen_step)
                self.request_lock()
                time.sleep(self.lock_timeout)

                if self.is_locked():
                    logger.info(f"lock re-acquired after {attempt + 1} widen(s)")
                    return True

            logger.error(f"relock failed after {self.max_retries} retries")
            return False
        finally:
            # restore whatever the user had configured; the PID is either
            # holding (sweep frozen anyway) or we failed (don't want to
            # leave the sweep stuck on our narrow window).
            self.csr.set("logic_sweep_min", original_min)
            self.csr.set("logic_sweep_max", original_max)

