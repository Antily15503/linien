from linien_client.device import Device
from linien_client.connection import LinienClient
import random

device = Device(host="rp-F0EFA8.local", username="root", password="root")
client = LinienClient(device)
client.connect(autostart_server=False, use_parameter_cache=False)

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


def volts_to_bits(volt):
    if volt > 0:
        return int((volt / VP) / GAIN * DAC_COUNTS - 1)
    return int((volt / VP) / GAIN * DAC_COUNTS)


def us_to_clock(time):
    return time * (10 ** (-6)) * CLOCK_FREQ


def ms_to_clock(time):
    return int(time * (10 ** (-3)) * CLOCK_FREQ)


def s_to_clock(time):
    return time * CLOCK_FREQ


# client.control.write_awg(vals)

## param count LUT — how many params each block type needs (duration param doesn't go into the blocks though)
##   type 0 (delay):       2  (hold_voltage, duration)
##   type 1 (linear_ramp): 3  (v_start,clk_div, step_size, duration)
##   type 2 (direct_jump): 2  (target_voltage, duration)
##   type 3 (chirp):       5  (a, b, rate, raterate, duration)
##   type 4 (sinusoid):    6  (v_mid, v_amp, v_min_cut, v_max_cut, phase_inc, duration)
##   type 5 (arb_wfm):     4  (clk_div, length, duration) <- ps should calculate how long the awg will take (if it is used) and pass that into the fsm as duration signal.
##   NOTE: changed it so that cur_type is given as decimal, and is
##   seperately converted to one-hot via type_onehot

client.parameters.sequence_blocks.value = [
    1,
    {"en_sin": 0, "type": 0, "params": [volts_to_bits(0.5), ms_to_clock(500)]},
    {"en_sin": 0, "type": 0, "params": [0, ms_to_clock(10)]},
]

client.control.write_sequence_config()
print("sequence programmed")
