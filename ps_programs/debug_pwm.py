"""Drive 50% duty on GPIO_P[5] and check everything that can silently stop it.

Run on the Red Pitaya with no arguments. It checks each link in the chain, says
which one is broken if any, and leaves the pin at 50% if they all pass:

    python3 debug_pwm.py

Every failure mode this checks has the same symptom at the scope -- a flat line
-- so guessing between them wastes bench time. The duty is left set on exit;
nothing needs to keep running.
"""

import sys

from linien_server.csr import PythonCSR
from pyrp3.board import RedPitaya

REG_DUTY = "temp_control_duty"
REG_GPIO_OES = "gpio_p_oes"
REG_GPIO_OUTS = "gpio_p_outs"

PIN = 5  # GPIO_P[5], E1 connector
PERIOD = 4096
TARGET = PERIOD // 2  # 2048 = exactly 50%
PWM_HZ = 125e6 / PERIOD

OK = "  ok   "
BAD = "  FAIL "


def check_csrmap():
    """The register must exist in the installed csrmap."""
    from linien_server import csrmap

    if REG_DUTY not in csrmap.csr:
        print(f"{BAD} {REG_DUTY} is not in csrmap.py")
        print("       The installed linien_server predates the temp control.")
        print("       Fix: rerun deploy.sh to push the current csrmap.py.")
        return False
    bank, addr, width, writable = csrmap.csr[REG_DUTY]
    absolute = 0x40300000 + (bank << 11) + (addr << 2)
    print(f"{OK} {REG_DUTY}: bank {bank}, {width} bits, at 0x{absolute:08x}")
    return True


def check_output_enable(csr):
    """The pin is high-Z unless its output-enable bit is set."""
    oes = csr.get(REG_GPIO_OES)
    if oes >> PIN & 1:
        print(f"{OK} gpio_p_oes = 0b{oes:08b}, bit {PIN} set (pin drives)")
        return True
    print(f"{BAD} gpio_p_oes = 0b{oes:08b}, bit {PIN} CLEAR")
    print(f"       GPIO_P[{PIN}] is high-impedance, so the scope sees nothing.")
    print("       The server normally sets this to 0b11100000 at startup.")
    print(f"       Fix: csr.set('{REG_GPIO_OES}', oes | 1 << {PIN})")
    return False


def check_not_forced_high(csr):
    """Gpio drives each pin from (outs.storage | o) -- an OR, not a mux."""
    outs = csr.get(REG_GPIO_OUTS)
    if not (outs >> PIN & 1):
        print(f"{OK} gpio_p_outs = 0b{outs:08b}, bit {PIN} clear (PWM reaches pin)")
        return True
    print(f"{BAD} gpio_p_outs = 0b{outs:08b}, bit {PIN} SET")
    print("       The GPIO ORs this register with the fabric signal, so the pin")
    print("       is latched HIGH and the PWM is masked entirely.")
    print(f"       Fix: csr.set('{REG_GPIO_OUTS}', outs & ~(1 << {PIN}))")
    return False


def check_write(csr):
    """A write that does not stick means the fabric has no such register."""
    before = csr.get(REG_DUTY)
    csr.set(REG_DUTY, TARGET)
    after = csr.get(REG_DUTY)

    if after == TARGET:
        print(f"{OK} wrote {TARGET}, read back {after} (was {before})")
        return True

    print(f"{BAD} wrote {TARGET} but read back {after}")
    print("       Reads of an undecoded address also return 0, so this means")
    print("       the loaded bitstream has no temp_control -- csrmap.py is")
    print("       newer than the gateware actually in the fabric.")
    print("       Fix: /opt/redpitaya/bin/fpgautil -b \\")
    print("              /usr/local/lib/python3.10/dist-packages/"
          "linien_server/gateware.bin")
    return False


def main():
    print(f"driving GPIO_P[{PIN}] at 50% duty\n")

    if not check_csrmap():
        return 1

    csr = PythonCSR(RedPitaya())

    # Order matters: check the register works before blaming the pin config.
    checks = [
        check_write(csr),
        check_output_enable(csr),
        check_not_forced_high(csr),
    ]

    print()
    if not all(checks):
        print("something above is broken -- the scope will show a flat line.")
        return 1

    print(f"all checks passed. GPIO_P[{PIN}] is now:")
    print(f"    {PWM_HZ / 1e3:.3f} kHz   period {1e6 / PWM_HZ:.2f} us")
    print(f"    {TARGET}/{PERIOD} = 50.00%   high {0.5e6 / PWM_HZ:.2f} us")
    print("    ~2.00 mW into the heater")
    print("\nduty stays set after this exits.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
