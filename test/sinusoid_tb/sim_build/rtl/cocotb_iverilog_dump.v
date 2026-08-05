module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/rtl/sinusoid_tb.fst");
    $dumpvars(0, sinusoid_tb);
end
endmodule
