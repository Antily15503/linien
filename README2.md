![GitHub release (latest by date)](https://img.shields.io/github/v/release/linien-org/linien)
[![PyPI](https://img.shields.io/pypi/v/linien-gui?color=blue)](https://pypi.org/project/linien-gui/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

Extended Linien ‒ Stock linien extended with additional functionality
=========================================================================================

**NOTE: in order to be compatible with the zynq 7010 chipset, the robust auto-lock functionality had to be removed to ensure the design could fit the resource constraints**

Extneded linien is an extension of stock linien offering several new features. 
these include
- **Programmable waveform generator**: User programmable waveform generators including functions such as sinusoids (LUT based), quadratics, linear ramps, jumps and more
- **Multiple sequences**: up to 4 user defined sequences can be loaded, each being triggered by a separate TTL signal  
- **lock-break and relock**: automatically breaks and re-engages the lock upon the triggering of a ttl signal
  - temporarily pauses the sampling of signals, and restores pre-ttl parameters. 
- **BRAM-based AWG**: includes a 1024 wide BRAM used for arbitrary waveform generation; includes a clock divider to dictate how fast it should be iterated  through 

## Getting started: installing and setting up extended-linien
#### Part 1: setting up WSL
#### Part 2: setting up extended-linien

## Programming sequences

Sequences can be programmed using the following example/pattern. 

1) sequences are communicated from the client side to the server side via the "sequence_blocks" parameter. 
2) after sequence blocks has been communicated to the server side, the values are interpreted and written to the FPGA/PL sides CSR's via the write_sequence_config function. 

#### Interpreting sequence_blocks
sequence_blocks is simply a formatted list of entries that dictate which index the sequence should occupy, and the series of actions the sequence should perform. 
The first entry in the list dictates the index, or "which" sequence is being programmed. recall that extended-linien is able to simultaneously hold 4 sequences, hence the first argument can be any value between 1-4

the following arguments are key-value pairs that dictate
- what kind of instruction it is (jump, linear-ramp, sinusoid, etc)
- the relavant parameters for the instruction (starting voltage, end voltage, etc).

The format of these instructions are documented below. 

  //   type 0 (delay):       2  (hold_voltage, duration)
  //   type 1 (linear_ramp): 3  (v_start,v_step, clk_div, duration)
  //   type 2 (direct_jump): 2  (target_voltage, duration)
  //   type 3 (chirp):       5  (a, b, rate, raterate, duration)
  //   type 4 (sinusoid):    6  (v_mid, v_amp, v_min_cut, v_max_cut, phase_inc, duration)
  //   type 5 (arb_wfm):     4  (clk_div, length, duration) <- ps should calculate how long the awg will take (if it is used) and pass that into the fsm as duration signal.

client.parameters.sequence_blocks.value = [
    1,
    {"type": 0, "params": [0, ms_to_clock(3)]},
    {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(5)]},
    {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(130)]},
    {
        "type": 1,
        "params": [
            volts_to_bits(jump_1),
            0x3AAA,
            int(33333 * abs(ramp)),
            ms_to_clock(12),
        ],
    },
    {"type": 0, "params": [0, ms_to_clock(3)]},
]

client.control.write_sequence_config()


After a sequence is written to a given index, its corresponding LED should be lit up. Each sequence is assigned 2 LED's, one indicating that it is 'armed' and able to be triggered, and the other indicating the sequence is currently running. 


