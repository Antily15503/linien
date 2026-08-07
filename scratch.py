from linien_client.device import Device
from linien_client.connection import LinienClient

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

client.parameters.sinusoid_params.value = [
    0,
    volts_to_bits(1),
    volts_to_bits(-1),
    volts_to_bits(1),
    freq_to_phase(60 * 10**3, CLOCK_FREQ),
]
client.control.deactivate_sinusoid()
client.control.write_sinusoid_config()
client.control.activate_sinusoid()
