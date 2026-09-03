/* Machine-generated using Migen */
module sweep (
    input run,
    input [12:0] step,
    input turn,
    input hold,
    output reg signed [13:0] y,
    output reg trigger,
    input sequence_stop,
    input [13:0] max,
    input [13:0] min,
    input sys_clk,
    input sys_rst
);

  reg sequence_stop_reg = 1'd0;
  reg up;
  reg turning = 1'd0;
  reg dir = 1'd0;

  // synthesis translate_off
  reg dummy_s;
  initial dummy_s <= 1'd0;
  // synthesis translate_on


  // synthesis translate_off
  reg dummy_d;
  // synthesis translate_on
  always @(*) begin
    up <= 1'd0;
    if (run) begin
      if ((turn & (~turning))) begin
        up <= (~dir);
      end else begin
        up <= dir;
      end
    end else begin
      up <= 1'd1;
    end
    // synthesis translate_off
    dummy_d <= dummy_s;
    // synthesis translate_on
  end

  always @(posedge sys_clk) begin
    sequence_stop_reg <= sequence_stop;
    trigger <= ((turn & up) | ((~sequence_stop) & sequence_stop_reg));
    turning <= turn;
    if (sequence_stop) begin
      dir <= 1'd1;
    end else begin
      dir <= up;
    end
    if (sequence_stop) begin
      y <= min;
    end else begin
      if ((~run)) begin
        y <= 1'd0;
      end else begin
        if ((~hold)) begin
          if (up) begin
            y <= (y + $signed({1'd0, step}));
          end else begin
            y <= (y - $signed({1'd0, step}));
          end
        end
      end
    end
    if (sys_rst) begin
      y <= 14'sd0;
      trigger <= 1'd0;
      sequence_stop_reg <= 1'd0;
      turning <= 1'd0;
      dir <= 1'd0;
    end
  end

endmodule
