
from __future__ import annotations

from dataclasses import dataclass, field, fields

from .due_awg import DueAWG, DueAWGConfig
from .camera import Camera, CameraConfig
from .red_pitaya import RedPitaya, RedPitayaConfig
from .pulsebox import Pulsebox, PulseboxConfig

#Update this registry with new equipment types :)
#Each experiment will also have its own config dataclass (below) which constructs all the equipment in one "Lab" class instance
DEVICE_REGISTRY = {

    DueAWGConfig: DueAWG,

    CameraConfig: Camera,

    RedPitayaConfig: RedPitaya,

    PulseboxConfig: Pulsebox,

}

@dataclass(slots=True)
class TOFLabConfig:
    """Hardware configuration for the current TOF laboratory."""

    cooling_power_awg: DueAWGConfig = field(
        default_factory=lambda: DueAWGConfig(
            port="/dev/ttyACM1",
            default_voltage=1.8,
        )
    )

    camera: CameraConfig = field(
        default_factory=lambda: CameraConfig(
            host="auto",
            port=18923,
            exposure_ms=0.5,
            roi=(0, 1280, 0, 1024),
        )
    )

    red_pitaya: RedPitayaConfig = field(
        default_factory=lambda: RedPitayaConfig(
            # host="rp-f0ed21.local",
            host = "rp-f0f7e4.local",
            gain=5.0,
        )
    )

    pulsebox: PulseboxConfig = field(
        default_factory=lambda: PulseboxConfig(
            port="/dev/ttyACM0",
            destination_ino="/mnt/c/msys64/home/Lab202/pulsebox/auto_TOF_inos/auto_TOF_inos.ino",
            channels={
                "spectrum_analyzer": 1,
                "placeholder": 2,
                "repump_switch": 3,
                "lock_in": 4,
                "camera": 5,
                "red_pitaya_trigger": 7,
                "inner_coil": 11,
                "outer_coil": 12,
                "soa_dac": 14,
            },
        )
    )

@dataclass(slots=True)
class SelfLock1Config:
    """Hardware configuration for the initial self-lock laboratory."""

    cooling_power_awg: DueAWGConfig = field(
        default_factory=lambda: DueAWGConfig(
            port="/dev/ttyACM1",
            default_voltage=0.0
        )
    )

    camera: CameraConfig = field(
        default_factory=lambda: CameraConfig(
            host="auto",
            port=18923,
            exposure_ms=0.5,
            roi=(0, 1280, 0, 1024),
        )
    )

    red_pitaya: RedPitayaConfig = field(
        default_factory=lambda: RedPitayaConfig(
            # host="rp-f0ed21.local",
            host = "rp-f0f7e4.local",
            gain=5.0,
        )
    )

    pulsebox: PulseboxConfig = field(
        default_factory=lambda: PulseboxConfig(
            port="/dev/ttyACM0",
            destination_ino="/mnt/c/msys64/home/Lab202/pulsebox/auto_TOF_inos/auto_TOF_inos.ino",
            channels={
                "repump_switch": 3,
                "placeholder": 4,
                "camera": 5,
                "red_pitaya_trigger": 7,
                "inner_coil": 11,
                "outer_coil": 12,
                "soa_dac": 14,
            },
        )
    )

@dataclass(slots=True)
class SelfLock2Config:
    """Hardware configuration for the initial self-lock laboratory."""

    cooling_power_awg: DueAWGConfig = field(
        default_factory=lambda: DueAWGConfig(
            port="/dev/ttyACM1",
            default_voltage=0.0
        )
    )

    camera: CameraConfig = field(
        default_factory=lambda: CameraConfig(
            host="auto",
            port=18923,
            exposure_ms=0.5,
            roi=(0, 1280, 0, 1024),
        )
    )

    red_pitaya: RedPitayaConfig = field(
        default_factory=lambda: RedPitayaConfig(
            # host="rp-f0ed21.local",
            host = "rp-f0f7e4.local",
            gain=5.0,
        )
    )

    pulsebox: PulseboxConfig = field(
        default_factory=lambda: PulseboxConfig(
            port="/dev/ttyACM0",
            destination_ino="/mnt/c/msys64/home/Lab202/pulsebox/auto_TOF_inos/auto_TOF_inos.ino",
            channels={
                "repump_switch": 3,
                "placeholder": 4,
                "camera": 5,
                "red_pitaya_trigger": 7,
                "inner_coil": 11,
                "outer_coil": 12,
                "soa_dac": 14,
            },
        )
    )

class Lab:

    def __init__(self, config):

        self.config = config

        # First construct every device.
        for field in fields(config):

            cfg = getattr(config, field.name)

            device_class = DEVICE_REGISTRY.get(type(cfg))

            if device_class is None:
                continue

            setattr(
                self,
                field.name,
                device_class(cfg),
            )

        # Then initialize every device.
        for value in vars(self).values():

            initialize = getattr(value, "initialize", None)

            if callable(initialize):
                initialize()

def create_lab(config=None):

    if config is None:

        config = TOFLabConfig()

    return Lab(config)
