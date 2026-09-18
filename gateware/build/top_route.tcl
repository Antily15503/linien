create_project -force -name top -part xc7z020-clg400-1
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
add_files {imports\UW-Madison\RA\linien\gateware\verilog\axi_slave.v}
set_property library work [get_files {imports\UW-Madison\RA\linien\gateware\verilog\axi_slave.v}]
add_files {imports\UW-Madison\RA\linien\gateware\verilog\bus_clk_bridge.v}
set_property library work [get_files {imports\UW-Madison\RA\linien\gateware\verilog\bus_clk_bridge.v}]
add_files {imports\UW-Madison\RA\linien\gateware\verilog\processing_system7_v5_4_processing_system7.v}
set_property library work [get_files {imports\UW-Madison\RA\linien\gateware\verilog\processing_system7_v5_4_processing_system7.v}]
add_files {imports\UW-Madison\RA\linien\gateware\verilog\red_pitaya_scope.v}
set_property library work [get_files {imports\UW-Madison\RA\linien\gateware\verilog\red_pitaya_scope.v}]
add_files {imports\UW-Madison\RA\linien\gateware\verilog\system_processing_system7_0_0.v}
set_property library work [get_files {imports\UW-Madison\RA\linien\gateware\verilog\system_processing_system7_0_0.v}]
add_files {imports\UW-Madison\RA\linien\src\ROM.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\ROM.sv}]
add_files {imports\UW-Madison\RA\linien\src\arb_wave.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\arb_wave.sv}]
add_files {imports\UW-Madison\RA\linien\src\bram.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\bram.sv}]
add_files {imports\UW-Madison\RA\linien\src\chirp_gen.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\chirp_gen.sv}]
add_files {imports\UW-Madison\RA\linien\src\control.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\control.sv}]
add_files {imports\UW-Madison\RA\linien\src\delay.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\delay.sv}]
add_files {imports\UW-Madison\RA\linien\src\direct_jump.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\direct_jump.sv}]
add_files {imports\UW-Madison\RA\linien\src\linear_ramp.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\linear_ramp.sv}]
add_files {imports\UW-Madison\RA\linien\src\sequence_top.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\sequence_top.sv}]
add_files {imports\UW-Madison\RA\linien\src\sinusoid.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\sinusoid.sv}]
add_files {imports\UW-Madison\RA\linien\src\temp_pwm.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\temp_pwm.sv}]
add_files {imports\UW-Madison\RA\linien\src\temp_sampler.sv}
set_property library work [get_files {imports\UW-Madison\RA\linien\src\temp_sampler.sv}]
add_files {top.v}
set_property library work [get_files {top.v}]
read_xdc top.xdc
read_xdc -ref processing_system7_v5_4_processing_system7 ../verilog/system_processing_system7_0_0.xdc
add_files -norecurse ../../src/sin_lut.mem
synth_design -top top -part xc7z020-clg400-1
opt_design -directive ExploreWithRemap
report_timing_summary -file top_timing_synth.rpt
report_utilization -hierarchical -file top_utilization_hierarchical_synth.rpt
report_utilization -file top_utilization_synth.rpt
opt_design
place_design
phys_opt_design -directive AddRetime
report_utilization -hierarchical -file top_utilization_hierarchical_place.rpt
report_utilization -file top_utilization_place.rpt
report_io -file top_io.rpt
report_control_sets -verbose -file top_control_sets.rpt
report_clock_utilization -file top_clock_utilization.rpt
route_design
phys_opt_design
report_timing_summary -no_header -no_detailed_paths
write_checkpoint -force top_route.dcp
report_route_status -file top_route_status.rpt
report_drc -file top_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file top_timing.rpt
report_power -file top_power.rpt