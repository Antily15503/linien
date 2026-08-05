module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/rtl/sequence_top_tb.fst");
    $dumpvars(0, sequence_top_tb);
end
endmodule
