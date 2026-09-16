# Red Pitaya Linien + triggerable AWG support code
# Produced by Steven C., Vedaant N., Ethan L., Tejas B., Kshitij P.
# See github page https://github.com/Antily15503/linien/tree/working_demo
# check out more recent branches


from __future__ import annotations

from dataclasses import dataclass
from pprint import pprint

from linien_client.connection import LinienClient
from linien_client.device import Device


@dataclass(slots=True)
class RedPitayaConfig:
    host: str
    username: str = "root"
    password: str = "root"

    clock_frequency: float = 125e6
    output_vpp: float = 2.0
    output_peak_voltage: float = 1.1
    dac_counts: int = 8192
    gain: float = 5.0

@dataclass(slots=True)
class DelayInstruction:
    hold_voltage: float
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        return {
            "en_sin":self.en_sin,
            "type": 0,
            "params": [
                rp.volts_to_bits(self.hold_voltage),
                rp.ms_to_clock(self.duration_ms),
            ],
        }


@dataclass(slots=True)
class LinearRampInstruction:
    initial_voltage: float
    final_voltage: float
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        start_bits=rp.volts_to_bits(self.initial_voltage)
        end_bits=rp.volts_to_bits(self.final_voltage)
        total_counts=end_bits-start_bits
        total_cycles=rp.ms_to_clock(self.duration_ms)
        best_clk_div=None
        best_step=None
        for clk_div in range(1,total_cycles+1):
            num_steps=total_cycles//clk_div
            if num_steps==0: break
            step=total_counts/num_steps
            if abs(step-round(step))<1e-9 and round(step)!=0:
                best_clk_div=clk_div
                best_step=int(round(step))
                break
        if best_clk_div is None:
            raise ValueError("Couldn't find clean ramp parameters.")
        return {"en_sin":self.en_sin,"type":1,"params":[start_bits,best_step,best_clk_div,total_cycles]}

@dataclass(slots=True)
class AbsoluteJumpInstruction:

    target_voltage: float
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        return {
            "en_sin":self.en_sin,
            "type": 2,
            "params": [
                rp.volts_to_bits(self.target_voltage),
                rp.ms_to_clock(self.duration_ms),
            ],
        }

@dataclass(slots=True)
class ChirpInstruction:
    a: float
    b: float
    rate: float
    raterate: float
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        return {
            "en_sin":self.en_sin,
            "type": 3,
            "params": [self.a, self.b, self.rate, self.raterate, rp.ms_to_clock(self.duration_ms)],
        }

@dataclass(slots=True)
class SinusoidInstruction:
    v_mid: float
    v_amp: float
    v_min_cut: float
    v_max_cut: float
    frequency_hz: float
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        return {
            "en_sin":self.en_sin,
            "type": 4,
            "params": [
                rp.volts_to_bits(self.v_mid),
                rp.volts_to_bits(self.v_amp),
                rp.volts_to_bits(self.v_min_cut),
                rp.volts_to_bits(self.v_max_cut),
                rp._sinusoid_phase_inc(self.frequency_hz, rp.clock_frequency),
                rp.ms_to_clock(self.duration_ms),
            ],
        }

@dataclass(slots=True)
class ArbWaveInstruction:
    clk_div: int
    length: int
    duration_ms: float
    en_sin: bool = False

    def to_linien(self, rp):
        return {
            "en_sin":self.en_sin,
            "type": 5,
            "params": [self.clk_div, self.length, rp.ms_to_clock(self.duration_ms)],
        }


class RedPitaya:
    """Generic Linien triggerable AWG sequence builder."""

    def __init__(self, config: RedPitayaConfig):
        self.config = config
        self.host = config.host
        self.username = config.username
        self.password = config.password

        self.clock_frequency = config.clock_frequency
        self.output_vpp = config.output_vpp
        self.output_peak_voltage = config.output_peak_voltage
        self.dac_counts = config.dac_counts
        self.gain = config.gain

        self._client = None
        self.trigger = 1
        self.instructions = []

    @property
    def is_connected(self):
        return self._client is not None

    def initialize(self):
        self.connect()

    def connect(self):
        if self.is_connected:
            return
        device = Device(host=self.host, username=self.username, password=self.password)
        self._client = LinienClient(device)
        self._client.connect(autostart_server=False, use_parameter_cache=False)

    def disconnect(self):
        self._client = None

    def begin_sequence(self, trigger: int = 1):
        """Start a new triggerable sequence."""
        if trigger not in (1,2,3,4):
            raise ValueError("Trigger must be between 1 and 4.")
        self.trigger = trigger
        self.instructions = []

    def clear_sequence(self):
        """Remove all instructions."""
        self.instructions.clear()

    def _append_instruction(self, instruction):
        self.instructions.append(instruction)

    def update_sinusoid(self, v_mid,v_amp,v_min_cut,v_max_cut,frequency_Hz):
        self._client.control.deactivate_sinusoid()
        self._client.parameters.sinusoid_params.value = [
            self.volts_to_bits(v_mid),
            self.volts_to_bits(v_amp),
            self.volts_to_bits(v_min_cut),
            self.volts_to_bits(v_max_cut),
            self._sinusoid_phase_inc(frequency_Hz, self.clock_frequency),
        ]
        self._client.control.write_sinusoid_config()
        self._client.control.activate_sinusoid()



    def add_delay(self, hold_voltage: float, duration_ms: float, en_sin: bool = False):
        instruction = DelayInstruction(hold_voltage, duration_ms, en_sin)
        self._append_instruction(instruction)
        return instruction

    def add_linear_ramp(self, initial_voltage: float, final_voltage: float, duration_ms: float=1, en_sin: bool = False):
            instruction=LinearRampInstruction(initial_voltage,final_voltage,duration_ms, en_sin)
            self._append_instruction(instruction)
            return instruction

    def add_absolute_jump(self, jump_voltage: float, duration_ms: float, en_sin: bool = False):
        instruction = AbsoluteJumpInstruction(jump_voltage, duration_ms, en_sin)
        self._append_instruction(instruction)
        return instruction

    def add_chirp(self,a,b,rate,raterate,duration_ms:float, en_sin: bool = False):
        instruction=ChirpInstruction(a,b,rate,raterate,duration_ms, en_sin)
        self._append_instruction(instruction)
        return instruction

    def add_sinusoid(self,v_mid,v_amp,v_min_cut,v_max_cut,frequency_hz,duration_ms, en_sin: bool = False):
        instruction=SinusoidInstruction(v_mid,v_amp,v_min_cut,v_max_cut,frequency_hz,duration_ms, en_sin)
        self._append_instruction(instruction)
        return instruction

    def add_arb_wave(self,clk_div,length,duration_ms, en_sin: bool = False):
        instruction=ArbWaveInstruction(int(clk_div),int(length),duration_ms, en_sin)
        self._append_instruction(instruction)
        return instruction

    
    def upload_sequence(self):
        """Upload the current sequence to Linien."""
        if not self.is_connected:
            self.connect()
        if not self.instructions:
            raise RuntimeError("Sequence contains no instructions.")

        blocks=[self.trigger]

        for inst in self.instructions:
            blocks.append(inst.to_linien(self))

        self._client.parameters.sequence_blocks.value=blocks
        self._client.control.write_sequence_config()

        self.print_sequence()


    def print_sequence(self):
        print(f"Trigger: {self.trigger}")
        for inst in self.instructions:
            pprint(inst)

    def us_to_clock(self, t): return int(t*1e-6*self.clock_frequency)
    def ms_to_clock(self, t): return int(t*1e-3*self.clock_frequency)
    def s_to_clock(self, t): return int(t*self.clock_frequency)

    def volts_to_bits(self, v):
        if v>0:
            return int((v/self.output_peak_voltage)/self.gain*self.dac_counts-1)
        return int((v/self.output_peak_voltage)/self.gain*self.dac_counts)

    def bits_to_volts(self, bits):
        return bits*self.gain*self.output_peak_voltage/self.dac_counts

    def set_sweep(self, speed=None, amplitude=None, center=None):
        """Set the sweep parameters on the Red Pitaya. including the speed 
        and amplitude of the sweep, and the center voltage. If any of these are None,"""
        if not self.is_connected:
            self.connect()
        p = self._client.parameters
        if speed is not None:
            p.sweep_speed.value = speed
        if amplitude is not None:
            p.sweep_amplitude.value = amplitude
        if center is not None:
            p.sweep_center.value = center

    @staticmethod
    def _sinusoid_phase_inc(f_hz, f_clk_hz):
        return int(round((f_hz/f_clk_hz)*(1<<32)))