// Temperature-control sampler.
//
// Produces one averaged sample of the PZT control signal per entry into
// linien's PID state:
//
//   PID state rises
//   |
//   |<---- 250_000 clk (2 ms) ---->|<-- 65_536 clk (524.3 us) -->|
//   |      PZT relaxing, ignore    |         accumulate          | publish
//
// The 2 ms delay lets the PZT settle after the state transition. The window is
// a power of two so the mean is a shift, not a divide. Both fit inside the
// ~8 ms PID window with room to spare.
//
// FRACTIONAL BITS: the published value is (acc >>> 12), not (acc >>> 16).
// Dividing by 4096 instead of 65536 leaves the mean scaled by 16 -- i.e.
// expressed in 1/16 DAC counts, so the bottom 4 bits are fractional. Averaging
// 65536 noisy samples resolves well below one count, and shifting by 16 would
// throw exactly that away. The PS folds the factor of 16 into its gains.
//
// ONE SAMPLE PER ENTRY: the sequence is armed by a rising edge, so a state that
// stays high does not retrigger. There is deliberately no abort if the PID
// state ends before the window closes -- the state runs ~8 ms and the window
// closes at 2.52 ms.
//
// WIDTHS: control_i is signed 14-bit, so the sum over 65536 samples spans
// [-8192*65536, 8191*65536] = [-2**29, 2**29 - 65536], which fits signed 30-bit
// exactly. acc[29:12] then spans [-2**17, 2**17 - 16], which fits signed 18-bit
// exactly. Both operands of the accumulate MUST be declared signed -- if either
// is unsigned, SystemVerilog makes the whole expression unsigned and negative
// control values accumulate as large positives.

module temp_sampler #(
    parameter int DELAY_CLKS  = 250_000,  // 2 ms at 125 MHz
    parameter int WINDOW_LOG2 = 16,       // 65_536 clk = 524.3 us
    parameter int FRAC_BITS   = 4         // fractional bits kept in sample_o
) (
    input  logic               clk_i,
    input  logic               rst_i,         // synchronous, ACTIVE HIGH
    input  logic               pid_active_i,  // linien is in the PID state
    input  logic signed [13:0] control_i,     // PZT control signal
    output logic signed [17:0] sample_o,      // 14 integer + 4 fractional bits
    output logic        [ 7:0] count_o        // ++ on every published sample
);

  localparam int DELAY_W = $clog2(DELAY_CLKS);
  localparam int SHIFT   = WINDOW_LOG2 - FRAC_BITS;  // 12

  typedef enum logic [1:0] {S_IDLE, S_DELAY, S_ACCUM, S_PUBLISH} state_t;
  state_t state;

  logic                   pid_active_q;
  logic                   pid_rise;
  logic [DELAY_W-1:0]     delay_cnt;
  logic [WINDOW_LOG2-1:0] win_cnt;
  logic signed [29:0]     acc;

  assign pid_rise = pid_active_i & ~pid_active_q;

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state        <= S_IDLE;
      pid_active_q <= 1'b0;
      delay_cnt    <= '0;
      win_cnt      <= '0;
      acc          <= '0;
      sample_o     <= '0;
      count_o      <= '0;
    end else begin
      pid_active_q <= pid_active_i;

      case (state)
        S_IDLE:
          if (pid_rise) begin
            delay_cnt <= '0;
            state     <= S_DELAY;
          end

        S_DELAY:
          if (delay_cnt == DELAY_W'(DELAY_CLKS - 1)) begin
            acc     <= '0;
            win_cnt <= '0;
            state   <= S_ACCUM;
          end else begin
            delay_cnt <= delay_cnt + 1'b1;
          end

        S_ACCUM: begin
          acc     <= acc + control_i;          // both signed -> sign-extends
          win_cnt <= win_cnt + 1'b1;           // wraps at 2**WINDOW_LOG2
          if (win_cnt == {WINDOW_LOG2{1'b1}}) state <= S_PUBLISH;
        end

        S_PUBLISH: begin
          sample_o <= acc[SHIFT+:18];          // == acc >>> 12, truncated to 18
          count_o  <= count_o + 1'b1;
          state    <= S_IDLE;
        end

        default: state <= S_IDLE;
      endcase
    end
  end

endmodule
