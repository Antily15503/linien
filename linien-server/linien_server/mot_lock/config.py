from dataclasses import dataclass
from linien_client.device import Device
from linien_client.connection import LinienClient
from linien_common import misc_func

# config classes should only encapsulate behavior/data structure
# actual writing to fpga should be handled by another class/method
# each class should implement a method to convert the parameters into a sequence.
# assume all instructions use sequence 4

# {"en_sin": 1, "type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(5)]},


# coarse sweep
@dataclass(frozen=True)
class Stage1Config:
    v_start: float
    v_end: float
    duration: float

    def _to_seq(self):
        start_bits, best_step, best_clk_div, clk_cyc = misc_func.ramp_params(
            self.v_start, self.v_end, self.duration
        )
        seq = [
            4,
            {
                "en_sin": 0,
                "type": 1,
                "params": [start_bits, best_step, best_clk_div, clk_cyc],
            },
        ]

        return seq
        pass


# fine sweep
@dataclass(frozen=True)
class Stage2Config:
    v_start: float
    v_end: float
    duration: float

    def _to_seq(self):
        start_bits, best_step, best_clk_div, clk_cyc = misc_func.ramp_params(
            self.v_start, self.v_end, self.duration
        )
        seq = [
            4,
            {
                "en_sin": 0,
                "type": 1,
                "params": [start_bits, best_step, best_clk_div, clk_cyc],
            },
        ]

        return seq


# repeated sampling (ramp)
@dataclass(frozen=True)
class Stage3Config:
    v_start: float
    v_end: float
    duration: float
    delay: float
    n_repeats: int

    def _to_seq(self):
        start_bits, best_step, best_clk_div, clk_cyc = misc_func.ramp_params(
            self.v_start, self.v_end, self.duration
        )
        seq = [4]

        for i in range(self.n_repeats):
            inst = {
                "en_sin": 0,
                "type": 1,
                "params": [start_bits, best_step, best_clk_div, clk_cyc],
            }
            seq.append(inst)

        return seq


# writer actually handles the writing to the fpga
# is passed the Device and the LinienClient.
class writer:
    def __init__(self, dev: Device, client: LinienClient):
        self.dev = dev
        self.client = client
        pass

    """
    function responsible for writing a sequence of a given config stage
    to the sequence. 
    """

    def write_sequence(self, stage):
        seq = stage._to_seq()
        self.client.parameters.sequence_blocks.value = seq
        self.client.control.write_sequence_config()
        pass

    """
    method that configures the sinusoid generator
    """

    def config_sinusoid(self, sinusoid_vals):
        self.client.parameters.sinusoid_params.value = sinusoid_vals
        self.client.control.write_sinusoid_config()

    def activate_sinusoid(self):
        self.client.control.activate_sinusoid()
        pass

    def deactivate_sinusoid(self):
        self.client.control.deactivate_sinsuoid()
        pass


""" 
class responsible for orchestrating the writing of stage 1,2 and 3 in a sequence
and collecting/handling the data. 

note: likely needs a new module on the hardware side to detect the peak? 
need to know the corresponding voltage at which the peak was detected

i.e, keep track of what sequence.dac_out is, and measure the corresponding error signal
what about latency between applying/driving a voltage and recieveing the correct error signal? 

steps:
1) detect specified ttl pulse from seperate, specialized pin
    - modify ttl handler to allocate a specialsed pin 
    - add csr to latch this pulse, read by PS to start mot_lock
2) after detecting ttl pulse, set a flag high to indicate "mot lock" is occuring (CSR registert)
3) write stage_1 instructions to index 4 of register file
4) trigger sequence 4 internally (TODO FEATURE)
    - expose csr in sequence_executor that can be set high, connected to o_active
    - recall which instruction to execute is determined by o_active[0:3] + o_fsm_start.   
    - need to add a way for orchestrator to set o_active=4'b1000 and o_fsm_start=1
5) while flag "mot_lock" is high, module should be keeping track of largest signal from one of the ADC's
    - new module thats independent of sequence_executor
    - when csr "mot_lock" is high, keeps a rolling window of values from the DAC. 
    - once o_seq_done is asserted by sequence_executor, stop, update CSR "peak_brightness"
6) once "sequence_done" is asserted by sequence_executor, update a csr with the detected peak value
7) using this value from the csr, construct stage 2 centered around this, with fractional range.
8) once this new peak is detected... use it as the starting point for stage 3 and... collect the data?


"""


class orchestrator:
    pass


if __name__ == "__main__":
    test = Stage3Config(0, 1, 5, 1, 5)
    print(test._to_seq())
