import time
import logging

logger = logging.getLogger(__name__)


# ttl_handler status register bits
STATUS_ACTIVE = 0b01  # bit 0: sequence running
STATUS_ARMED = 0b10  # bit 1: enabled and waiting for trigger


class SequenceRelock:
    def __init__(self, csr, settle_time=0.01):
        """
        Args:
            csr:         register read/write interface (csr.get / csr.set)
            settle_time: seconds to wait for PID to settle after sequence
        """
        self.csr = csr
        self.settle_time = settle_time

    def is_sequence_active(self):
        """check if a sequence is currently running."""
        status = self.csr.get("regfile_adapter_status")
        return bool(status & STATUS_ACTIVE)

    def is_locked(self):
        """check if linien's autolock reports lock acquired."""
        return bool(self.csr.get("logic_autolock_lock_running"))

    def handle_sequence_done(self):
        """
        called after detecting that the sequence completed (o_active dropped).

        relies on the PID resuming on its own when o_active drops — the
        gateware reasserts pid.running, and the error signal pulls the laser
        back to the same zero-crossing held before the sequence drove the DAC.

        returns True if lock held, False if PID lost lock.
        """
        time.sleep(self.settle_time)

        if self.is_locked():
            logger.debug("lock held after sequence (PID resumed on its own)")
            return True

        logger.debug("relock failed: PID did not recover lock after sequence")
        return False
