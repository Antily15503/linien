CLOCK_FREQ = 125e6
CLOCK_PER = 1 / CLOCK_FREQ
VPP = 2
VP = 1.1
DAC_COUNTS = 8192
# vout=gain*v_dac
# vout/gain=v_dac
GAIN = 1
V_MAX = VPP / 2
V_MIN = -VPP / 2


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


def ramp_params(v_start, v_end, duration_ms):
    start_bits = volts_to_bits(v_start)
    end_bits = volts_to_bits(v_end)
    total_counts = end_bits - start_bits
    total_cycles = ms_to_clock(duration_ms)

    if total_counts == 0:
        raise ValueError("start and end voltage are the same")

    for clk_div in range(1, total_cycles + 1):
        num_steps = total_cycles // clk_div
        if num_steps == 0:
            break
        step = total_counts / num_steps
        if abs(step - round(step)) < 1e-9 and round(step) != 0:
            best_clk_div = clk_div
        best_step = int(round(step))

    if best_clk_div is None:
        raise ValueError(
            f"couldn't find clean ramp params for {v_start}V → {v_end}V in {duration_ms}ms"
        )

    return start_bits, best_step, best_clk_div, total_cycles
