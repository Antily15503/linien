module sweep_tb ();

  logic run;
  logic signed [12:0] step;
  logic turn;
  logic hold;
  logic sequence_stop;
  logic clk;
  logic rst;
  logic signed [13:0] max;
  logic signed [13:0] min;

  logic signed [13:0] y;
  logic trigger;

  sweep iDUT (
      .run(run),
      .step(step),
      .turn(turn),
      .hold(hold),
      .sequence_stop(sequence_stop),
      .sys_clk(clk),
      .sys_rst(rst),
      .max(max),
      .min(min),

      .y(y),
      .trigger(trigger)
  );

  //external module to emulate RAILED logic of csrlimit module. 
  logic signed [13:0] y_lim;
  logic railed;

  assign turn = railed;

  limit #(
      .WIDTH(14)
  ) lim (
      .x(y),
      .max(max),
      .min(min),
      .y(y_lim),
      .railed(railed)
  );

  initial begin
    $dumpfile("sweep_tb.vcd");
    $dumpvars(0, sweep_tb);
  end

endmodule


module limit #(
    parameter WIDTH = 14
) (
    input wire signed [WIDTH-1:0] x,
    input wire signed [WIDTH-1:0] max,
    input wire signed [WIDTH-1:0] min,
    output logic signed [WIDTH-1:0] y,
    output logic railed
);

  always_comb begin
    if (x >= max) begin
      y = max;
      railed = 1;
    end else if (x <= min) begin
      y = min;
      railed = 1;
    end else begin
      y = x;
      railed = 0;
    end
  end
endmodule
