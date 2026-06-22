![GitHub release (latest by date)](https://img.shields.io/github/v/release/linien-org/linien)
[![PyPI](https://img.shields.io/pypi/v/linien-gui?color=blue)](https://pypi.org/project/linien-gui/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

# Extended Linien — FPGA-based laser locking with programmable waveform sequencing

Extended Linien builds on [Linien](https://github.com/linien-org/linien) to add a
fully programmable waveform sequencer triggered by external TTL signals. It was
developed as part of the UW-Madison ECE 554 capstone project ("Guns 'n Lasers"),
where it was used to successfully trap rubidium atoms in a magneto-optical trap —
replacing ~$3,000 of commercial laser servo hardware with a ~$400 Red Pitaya FPGA.

> **Note:** to fit within the resource constraints of the Zynq 7010 (used on the
> Red Pitaya STEMlab 125-14), the robust autolock functionality from upstream Linien
> had to be removed. If you rely on robust autolock, use
> [upstream Linien v0.3.2](https://github.com/linien-org/linien/releases/tag/v0.3.2).

---

## Features

- **Programmable waveform sequencer**: define sequences of waveform blocks including
  linear ramps, direct jumps, sinusoids (LUT-based), chirps, delays, and arbitrary
  waveforms loaded from a BRAM-based AWG.
- **4 independent TTL-triggered sequences**: up to 4 sequences can be loaded
  simultaneously, each triggered by a separate TTL input on the Red Pitaya extension
  connector. A priority encoder handles simultaneous triggers.
- **Lock-break and relock**: on TTL trigger, the PID integrator is frozen to prevent
  windup, the waveform sequence executes, and the system automatically attempts to
  relock when the sequence completes — restoring pre-trigger parameters.
- **BRAM-based AWG**: 1024-sample arbitrary waveform BRAM with a configurable clock
  divider for playback rate control.

---

## Getting started

### Requirements

Extended Linien targets the **Red Pitaya STEMlab 125-14** (Zynq 7010). It is
developed and tested on Linux. Windows users can use WSL (Windows Subsystem for
Linux) — see the [WSL installation guide](https://learn.microsoft.com/en-us/windows/wsl/install).

### Installation

Follow the upstream Linien installation instructions, substituting this repository
in place of the upstream source. The server component is deployed to the Red Pitaya
in the same way as upstream Linien.

### Physical setup

Connect TTL trigger signals to the Red Pitaya extension connector E1:

```
E1 connector:
  DIO0_P  →  oscilloscope trigger (unchanged from upstream Linien)
  DIO1_P  →  sequence 1 trigger
  DIO2_P  →  sequence 2 trigger
  DIO3_P  →  sequence 3 trigger
  DIO4_P  →  sequence 4 trigger
```

Signal levels must be **3.3V logic**. DIO1_P–DIO4_P are configured as inputs.

---

## Programming sequences

Sequences are programmed from the Python client via the `sequence_blocks` parameter,
then committed to the FPGA by calling `write_sequence_config()`.

### Format

`sequence_blocks` is a list where:
- **`[0]`** — sequence index (1–4): which of the 4 slots to program
- **`[1:]`** — list of instruction dicts, each with a `type` and `params` field

### Instruction types

| Type | Block | Parameters |
|------|-------|------------|
| 0 | delay | `hold_voltage, duration` |
| 1 | linear_ramp | `v_start, v_step, clk_div, duration` |
| 2 | direct_jump | `target_voltage, duration` |
| 3 | chirp | `a, b, rate, raterate, duration` |
| 4 | sinusoid | `v_mid, v_amp, v_min_cut, v_max_cut, phase_inc, duration` |
| 5 | arb_wave | `clk_div, length, duration` |

> All voltages are **signed offsets from v_lock** — the DAC value snapshotted at
> TTL trigger time. `volts_to_bits(0)` holds the laser at the lock point.
> Use the helper functions `volts_to_bits()` and `ms_to_clock()` to convert
> physical units to FPGA counts.

### Example

```python
from linien_client.connection import LinienClient

c = LinienClient({"host": "rp-xxxxxx.local", "username": "root", "password": "root"})
c.connect()

# program sequence 1: hold, jump, ramp, return
c.parameters.sequence_blocks.value = [
    1,  # program slot 1
    {"type": 0, "params": [0,               ms_to_clock(3)]},   # hold at v_lock for 3ms
    {"type": 0, "params": [volts_to_bits(1.0), ms_to_clock(5)]},  # jump to +1V for 5ms
    {
        "type": 1,
        "params": [volts_to_bits(1.0), 0x3AAA, int(33333), ms_to_clock(12)],
    },  # linear ramp
    {"type": 0, "params": [0, ms_to_clock(3)]},  # return to v_lock
]
c.connection.root.write_sequence_config()
```

After programming, the corresponding LED pair on the Red Pitaya will light up:
- **Even LED** (e.g. LED0 for sequence 1): sequence is armed and waiting for trigger
- **Odd LED** (e.g. LED1 for sequence 1): sequence is currently executing

A TTL rising edge on the corresponding DIO pin will then trigger execution.

---

## Architecture

See [`docs/linien_architecture.svg`](docs/linien_architecture.svg) for a full
signal-flow diagram covering the PS/CSR/PL boundary and internal module connections.

Key modules:
- `gateware/logic/ttl_handler.py` — TTL synchronizer, edge detector, priority encoder, sequence FSM
- `gateware/logic/sequence.py` — Migen wrapper connecting TTLHandler to sequence_top
- `src/sequence_top.sv` — top-level SystemVerilog instantiating control FSM and waveform blocks
- `src/control.sv` — sequence execution FSM, BRAM address generation
- `linien-server/linien_server/registers.py` — PS-side sequence programming logic

---

## Known limitations

- Robust autolock removed due to Zynq 7010 resource constraints (see note above)
- PZT overdrive / pre-emphasis feature planned but not yet implemented
- `sequence_relock.py` relock monitor is present but not fully validated on hardware
---

## Current bugs being worked out
- sequences 3 and 4 cannot be programmed, causes a crash that requires power Remote-controllable
---

## TODO
- fix bugs
- add convenience functions for linear ramp that optimizes clock divider against increment
- add convenience functions that can calculate any parameter of linear ramp given start, stop and ramp of voltage. 
- de-arm sequences more gracefully, possibly exposing functions to the user to manually turn on/off sequences. 
- double check how pausing the PID works (accumulation of error signals)
---

## Future features
- overdrive of voltage to deform PZT faster, better response. 
---


## Citation

If you use Extended Linien in your research, please also cite the upstream Linien paper:

```
@article{Wiegand2022,
   author = {B. Wiegand and B. Leykauf and R. Jördens and M. Krutzik},
   doi = {10.1063/5.0090384},
   journal = {Review of Scientific Instruments},
   title = {Linien: A versatile, user-friendly, open-source FPGA-based tool for
            frequency stabilization and spectroscopy parameter optimization},
   volume = {93},
   year = {2022},
}
```

---

## License

Extended Linien is released under the GNU General Public License v3, consistent with
upstream Linien. See [LICENSE](LICENSE) for details.
