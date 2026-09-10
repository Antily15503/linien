// Temperature-control PWM generator.
//
// Fixed period of 4096 sys clocks: at 125 MHz that is 30.518 kHz, which puts
// the fundamental above the audio band and above typical PZT mechanical
// resonances, so switched heater currents are less likely to appear in the
// error signal. The period is a power of two, so the 12-bit duty maps 1:1 onto
// the counter -- no scaling, no truncation, no rounding to reason about.
//
//   duty_i == 0     -> output constantly low
//   duty_i == 4095  -> high for 4095 of 4096 clocks (99.98%)
//
// duty_i is latched at the period boundary, so a mid-period write cannot
// produce a runt pulse. pwm_o is registered for clean IO timing.

module temp_pwm (
    input  logic        clk_i,
    input  logic        rst_i,      // synchronous, ACTIVE HIGH
    input  logic [11:0] duty_i,
    output logic        pwm_o
);

  logic [11:0] cnt, cnt_next;
  logic [11:0] duty_q, duty_next;
  logic        wrap;

  assign wrap      = (cnt == 12'hFFF);
  assign cnt_next  = cnt + 1'b1;               // wraps naturally at 4096
  assign duty_next = wrap ? duty_i : duty_q;   // reload only at the boundary

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      cnt    <= '0;
      duty_q <= duty_i;                        // pre-load: first period correct
      pwm_o  <= 1'b0;
    end else begin
      cnt    <= cnt_next;
      duty_q <= duty_next;
      pwm_o  <= (cnt_next < duty_next);
    end
  end

endmodule
