module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/rtl/linear_ramp_tb.fst");
    $dumpvars(0, linear_ramp_tb);
end
endmodule
