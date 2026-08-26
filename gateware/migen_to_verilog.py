import sys
import importlib
from migen.fhdl.verilog import convert
from migen.fhdl import verilog

MODULE_REGISTRY = {
    "sweep": (
        "gateware.logic.sweep",
        "Sweep",
        {"width": 14},
        {"run", "step", "turn", "hold", "sequence_stop", "y", "trigger", "max", "min"},
    ),
    "sweep_csr": (
        "gateware.logic.sweep",
        "SweepCSR",
        {"width": 14, "step_width": 30, "step_shift": 24},
    ),
}

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("useage: python migen_to_verilog.py <module_name>")
        sys.exit(1)
    name = sys.argv[1]
    if name not in MODULE_REGISTRY:
        print(f"unknown module in '{name}'. known:{list(MODULE_REGISTRY)}")
        sys.exit(1)

    module_path, class_name, kwargs, ios = MODULE_REGISTRY[name]
    cls = getattr(importlib.import_module(module_path), class_name)
    instance = cls(**kwargs)

    io_list = {getattr(instance, io_name) for io_name in ios}

    # convert(instance).write(f"{name}.sv")
    verilog.convert(instance, ios=io_list, name="sweep").write(f"{name}.sv")

    pass
