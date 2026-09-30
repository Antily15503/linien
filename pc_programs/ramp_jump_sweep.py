# Simple ramp + jump sequence on Linien, sweeping otherwise.
#
# Puts Linien in sweep mode, then arms a triggerable sequence:
#   ramp V_START -> V_END over RAMP_MS, jump to V_JUMP and hold for JUMP_MS.
# The sequence runs on a TTL on the selected trigger input. Finally the lock
# is engaged (Linien's start_lock), locking at SWEEP_CENTER.
#
# Usage:  python ramp_jump_sweep.py [--host rp-xxxxxx.local]

import argparse

from red_pitaya import RedPitaya, RedPitayaConfig

HOST = "rp-f0efa8.local"
GAIN = 5.0
TRIGGER = 1  # sequence slot / trigger input, 1-4

# sequence (volts, ms)
V_START = 0.0
V_END = 0.5
RAMP_MS = 100.0
V_JUMP = 0.3
JUMP_MS = 100.0

# sweep (Linien internal units, see linien_server/parameters.py)
SWEEP_SPEED = 8        # f = 3.8 kHz / 2**speed, 0..15
SWEEP_AMPLITUDE = 1.0  # 0.001..1, fraction of full range
SWEEP_CENTER = 0.0     # -1..1


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--host", default=HOST)
    args = parser.parse_args()

    rp = RedPitaya(RedPitayaConfig(host=args.host, gain=GAIN))
    rp.connect()

    rp.set_sweep(speed=SWEEP_SPEED, amplitude=SWEEP_AMPLITUDE, center=SWEEP_CENTER)
    rp._client.control.start_sweep()

    rp.begin_sequence(trigger=TRIGGER)
    rp.add_linear_ramp(V_START, V_END, RAMP_MS)
    rp.add_absolute_jump(V_JUMP, JUMP_MS)
    rp.upload_sequence()

    rp._client.control.start_lock()

    print(f"Sequence armed on trigger {TRIGGER}; lock engaged.")


if __name__ == "__main__":
    main()
