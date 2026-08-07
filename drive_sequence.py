from linien_client.device import Device
from linien_client.connection import LinienClient
import time
import random

CLOCK_FREQ = 125e6
CLOCK_PER = 1 / CLOCK_FREQ
VPP = 2
VP = 1.1
DAC_COUNTS = 8192
# vout=gain*v_dac
# vout/gain=v_dac
GAIN = 5
V_MAX = VPP / 2
V_MIN = -VPP / 2


# FUNCTIONS TO TRANSLATE FROM TIME TO CYCLES
def us_to_clock(time):
    return time * (10 ** (-6)) * CLOCK_FREQ


def ms_to_clock(time):
    return int(time * (10 ** (-3)) * CLOCK_FREQ)


def s_to_clock(time):
    return time * CLOCK_FREQ


# FUNCTIONS TO TRANSLATE VOLTAGE TO VALUE IN RANGE OF 8191 to -8192 SIGNED
def volts_to_bits(volt):
    if volt > 0:
        return int((volt / VP) / GAIN * DAC_COUNTS - 1)
    return int((volt / VP) / GAIN * DAC_COUNTS)


def freq_to_phase(f_hz, f_clk_hz):
    return int(round(f_hz / f_clk_hz * (1 << 32)))


print(bin(volts_to_bits(-1)))


device = Device(host="rp-f0edf0.local", username="root", password="root")
client = LinienClient(device)
client.connect(autostart_server=True, use_parameter_cache=False)

# ramp v_tart of -1.25 volts, v_end of -1.10 volts, and a duration of 12 ms
# change in 0.15 over 12 ms, step of 0.0125 volts per ms.
#


# to increase by 0.15,required clock div of 5000
# 5000/0.15=33333
#

# for i in range(1000):
#    client.parameters.sequence_blocks.value = [
#        {"type": 0, "params": [0, ms_to_clock(3)]},
#        {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(5)]},
#        {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(130)]},
#        {
#            "type": 1,
#            "params": [volts_to_bits(-1.25), 1, int(33333 * ramp), ms_to_clock(12)],
#        },
#        {"type": 0, "params": [0, ms_to_clock(3)]},
#    ]

# start and end voltage, and time driven.

############## configure the carrier wave generation ###################
client.parameters.sinusoid_params.value = [
    0,
    volts_to_bits(1),
    volts_to_bits(-1),
    volts_to_bits(1),
    freq_to_phase(60 * 10**3, CLOCK_FREQ),
]
client.control.write_sinusoid_config()
client.control.activate_sinusoid()

end = False
while end != True:
    input_voltage = input("input new voltage to try")
    if input_voltage == "q":
        end = True
    else:
        print(f"jump given as {float(input_voltage)}")
        jump_1 = float(input_voltage)
        ramp = -1 * (jump_1) / 5
        jump_2 = -1 * (jump_1 + ramp)

        client.parameters.sequence_blocks.value = [
            1,
            {"en_sin": 1, "type": 0, "params": [0, ms_to_clock(3)]},
            {"en_sin": 1, "type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(5)]},
            {
                "en_sin": 1,
                "type": 0,
                "params": [volts_to_bits(jump_1), ms_to_clock(130)],
            },
            {
                "en_sin": 1,
                "type": 1,
                "params": [
                    volts_to_bits(jump_1),
                    volts_to_bits(-0.1),
                    int(33333 * abs(ramp)),
                    ms_to_clock(12),
                ],
            },
            {"en_sin": 1, "type": 0, "params": [0, ms_to_clock(130)]},
        ]
        client.control.write_sequence_config()
        print("==============================")
        print(f" MOT Locking Sequence Written with voltage:{input}")
        print("==============================")
