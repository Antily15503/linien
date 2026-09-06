module sweep_tb ();

  logic run;
  logic pause;
  logic [29:0] step;
  logic hold;
  logic clear;
  logic clk;
  logic rst;
  logic signed [13:0] max;
  logic signed [13:0] min;
  logic sequence_stop;

  logic signed [13:0] x;
  logic signed [13:0] y;

  dummy_SweepCSR iDUT (
      .run(run),
      .pause(pause),
      .step(step),
      .hold(hold),
      .clear(clear),
      .sys_clk(clk),
      .sys_rst(rst),
      .max(max),
      .min(min),
      .sequence_stop(sequence_stop),

      .x(x),
      .y(y)
  );

  initial begin
    $dumpfile("sweep_tb.vcd");
    $dumpvars(0, sweep_tb);
  end

endmodule
