#Self-locking MOT with TOF
#generate from a starting relative jump of ~0.09 V

from little_moon.hardware.lab import create_lab, SelfLock2Config

import time
from dataclasses import dataclass, fields, is_dataclass
import subprocess

from little_moon.hardware.red_pitaya import (
    DelayInstruction,
    LinearRampInstruction,
    AbsoluteJumpInstruction
)

@dataclass(slots=True)
class experimental_params():

    MOT_form_frequency: float = 0.09
    MOT_form_power: float = 1.8
    subdoppler_power_min: float = 0.8
    MOT_subdop_frequency_factor: float = 2


    #timing:
    MOT_charge_time: float = 95.0
    PZT_creep_time: float = 1.0
    referencing_time: float = 4.0
    coil_turn_on_delay: float = 0.5
    exposure_time: float = 0.5
    relock_time: float = 5.0
    subdoppler_duration: float = 12.0

    #sinusoid overlay generation (functionality added by Vedaant Aug 2026):
    sinusoid_amp: float = 0.08 #in V (60 mV worked for the Zurich MFLI lock in)
    sinusoid_freq: float = 30000 #in Hz

@dataclass(slots=True)
class SL_TOF_Sequence:
    tof_delay: DelayInstruction
    mot_form: DelayInstruction
    subdoppler: LinearRampInstruction
    creep_delay: DelayInstruction



def program_pulsebox(
    pulsebox,
    experiment,
    tof,
    ):

    pulsebox.clear()

    pulsebox.set_channel(
        "repump_switch",
        f"p{experiment.MOT_charge_time}m{tof}m "
        f"p{experiment.MOT_charge_time + tof + experiment.exposure_time}m0.5m"
    )

    pulsebox.set_channel(
        "placeholder",
        "p105m1m",
    )

    pulsebox.set_channel(
        "camera",
        f"p{experiment.MOT_charge_time + tof}m1m"
    )

    pulsebox.set_channel(
        "red_pitaya_trigger",
        f"p{experiment.MOT_charge_time + experiment.PZT_creep_time + experiment.referencing_time}m1m",
    )

    coil = (
        f"p{experiment.MOT_charge_time + experiment.coil_turn_on_delay}"
        f"m{tof - (1.9 * experiment.coil_turn_on_delay)}m"
    )

    pulsebox.set_channel("inner_coil", coil)
    pulsebox.set_channel("outer_coil", coil)

    pulsebox.set_channel(
        "soa_dac",
        f"p{experiment.MOT_charge_time - experiment.subdoppler_duration}m1m",
    )

    pulsebox.load_sequence(f"SL-MOT :)")

def build_power_sequence(
    experiment,
    tof,
):
    if tof < (experiment.PZT_creep_time + experiment.referencing_time):
        raise ValueError("TOF must be larger than total referencing period (PZT_creep_time + referencing_time). Yours is not.")

    if tof > 10.5:
        raise ValueError("Timing not currently configured for times-of-flight larger than 10 ms")

    return [
            f"r0ms{experiment.subdoppler_duration}ms{experiment.MOT_form_power}V{experiment.subdoppler_power_min}V", #subdoppler PGC ramp
            f"j{experiment.subdoppler_duration}ms0.0V{experiment.PZT_creep_time}ms", #creep relaxation time before re-referencing
            f"j{experiment.subdoppler_duration+experiment.PZT_creep_time}ms{0.0}V{experiment.referencing_time}ms", #re-referencing time
            f"j{experiment.subdoppler_duration+experiment.PZT_creep_time + experiment.referencing_time}ms{0.0}V{tof - (experiment.PZT_creep_time + experiment.referencing_time)}ms",
            f"j{experiment.subdoppler_duration+tof+experiment.exposure_time}ms{0.0}V{0.5}ms",
    ]

def build_SL_TOF_sequence(
    rp,
    experiment,
    relative_voltage,
):
    rp.begin_sequence(trigger=1)

    tof_delay = rp.add_delay(
        hold_voltage=relative_voltage,
        duration_ms = 6,
        en_sin = False,
    )

    mot_form = rp.add_delay(
        relative_voltage,
        duration_ms=(
            experiment.MOT_charge_time - experiment.subdoppler_duration
        ),
        en_sin = False,
    )

    subdoppler = rp.add_linear_ramp(
        initial_voltage=relative_voltage,
        final_voltage=relative_voltage*experiment.MOT_subdop_frequency_factor,
        duration_ms=experiment.subdoppler_duration,
        en_sin = False,
    )

    creep_delay = rp.add_delay(
        0.0,
        duration_ms=(
            experiment.PZT_creep_time
        ),
        en_sin = False,
    )

    return SL_TOF_Sequence(
        tof_delay=tof_delay,
        mot_form=mot_form,
        subdoppler=subdoppler,
        creep_delay=creep_delay,
    )

def linien_is_locked(rp):
    """True when linien's sweep is off and the PID is running.

    `parameters.lock` is synced to the client, so this is an ordinary RPC read
    from the PC -- no CSR access and nothing running on the board is needed.
    """
    client = rp._client
    if client is None:
        return False
    return bool(client.parameters.lock.value)

def wait_for_lock(rp, poll_interval=0.002):
    """Block until linien's PID is engaged. Returns False if the user cancels.

    Ctrl+C abandons the queued sequence and hands control back to the prompt
    rather than killing the session -- the pulsebox, camera and cooling-DAC
    setup done once in main() would have to be redone on a restart.
    """
    if rp._client is None:
        raise RuntimeError("Red Pitaya client is not connected.")

    if linien_is_locked(rp):
        return True

    print("  Linien not locked -- sequence queued, waiting for the PID.")
    print("  (Ctrl+C to cancel and return to the prompt.)")
    try:
        while not linien_is_locked(rp):
            time.sleep(poll_interval)
    except KeyboardInterrupt:
        print()
        return False

    print("  Lock acquired.")
    return True



def read_float(prompt, allowed):
    """Prompt until the user enters a valid float or one of the allowed
    keywords. Returns either a float or the matched keyword string."""
    while True:
        raw = input(prompt).strip()
        low = raw.lower()
        if low in allowed:
            return low
        try:
            return float(raw)
        except ValueError:
            allowed_str = ", ".join(f"'{a}'" for a in allowed)
            print(f"  Invalid input. Enter a number or {allowed_str}.")

def main():

    default_tof = 5 #default time-of-flight in ms

    experiment = experimental_params()
    lab = create_lab(config=SelfLock2Config())

    #enable the sinusoid generation:
    # Pure AC overlay: the sinusoid is summed on top of the en_sin block's
    # own voltage, and the gateware adds v_mid into the sinusoid output.
    # So v_mid must be 0 and the clamps symmetric about 0 -- otherwise every
    # en_sin segment is shifted by v_mid (this was the "sweep too negative"
    # bug: v_mid = MOT_form_frequency added -0.55 V to the sweep).
    v_amp = experiment.sinusoid_amp
    lab.red_pitaya.update_sinusoid(
        0.0,
        v_amp,
        -v_amp,
        +v_amp,
        experiment.sinusoid_freq,
    )

    #Camera settings initialization:
    lab.camera.configure(
        exposure_ms = experiment.exposure_time / 1000,
    )

    #Due DAC cooling power control setup:
    cooling_seq = build_power_sequence(experiment, default_tof)
    lab.cooling_power_awg.default_voltage=experiment.MOT_form_power
    lab.cooling_power_awg.update(cooling_seq, plot=False)

    #Pulsebox setup:
    program_pulsebox(
        lab.pulsebox,
        experiment,
        default_tof,
        )
    lab.pulsebox.print_channels()

    #The main loop:

    lab.red_pitaya.set_sweep(speed=0.1, amplitude=1, center=0.0)

    while True:

    
        print("Enter relative jump voltage. Recommended: 0.07-0.09 V. "
                "Type 'proceed' to begin the TOF sequence. "
                "Type 'quit' to end experiment")
         

        
        value = read_float("setup > ", allowed={"proceed", "quit"})

        if value == "quit":
            print("Quitting.")
            return

        if value == "proceed":
            raise RuntimeError("Did not add full auto_TOF yet")

        # A number: build the jump appropriate to the current phase, then hold
        # it until linien is locked before writing. Every block voltage is an
        # offset from v_lock -- the linien DAC value the gateware snapshots at
        # TTL time -- so the sequence only means anything once the PID holds.
        lab.red_pitaya.clear_sequence()
        self_lock = build_SL_TOF_sequence(
                lab.red_pitaya,
                experiment,
                value,
            )
        
        if not wait_for_lock(lab.red_pitaya):
            print(" Cancelled -- sequence not uploaded.")
            continue

        lab.red_pitaya.upload_sequence()


if __name__ == "__main__":
    main()
