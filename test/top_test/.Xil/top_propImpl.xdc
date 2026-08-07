set_property SRC_FILE_INFO {cfile:/home/vedaant/school/quantum_work/linien/gateware/build/top.xdc rfile:../../../gateware/build/top.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/vedaant/school/quantum_work/linien/gateware/verilog/system_processing_system7_0_0.xdc rfile:../../../gateware/verilog/system_processing_system7_0_0.xdc id:2 scoped_inst:system_processing_system7_0_0/inst} [current_design]
set_property src_info {type:XDC file:1 line:368 export:INPUT save:INPUT read:READ} [current_design]
set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks clk125_p] -group [get_clocks -include_generated_clocks clk_fpga_0]
current_instance system_processing_system7_0_0/inst
set_property src_info {type:SCOPED_XDC file:2 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_3 0.15
set_property src_info {type:SCOPED_XDC file:2 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_0 0.24
set_property src_info {type:SCOPED_XDC file:2 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_1 0.12
set_property src_info {type:SCOPED_XDC file:2 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_2 0.6
