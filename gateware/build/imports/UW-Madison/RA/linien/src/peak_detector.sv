module peak_detector (
    input wire clk,
    input wire rst_n,
    input wire stg_rst,
    input wire signed [13:0] dac,
    input wire signed [13:0] adc,
    input wire mot_lock,
    input wire sequence_done,
    output wire [13:0] dac_max,
    output wire [13:0] adc_max
);

  reg signed [13:0] dac_max_r;
  reg signed [13:0] adc_max_r;

  always @(posedge clk) begin
    if (rst_n) begin
      dac_max_r <= 'b0;
      adc_max_r <= 'b0;
    end else if (stg_rst) begin
      dac_max_r <= 'b0;
      adc_max_r <= 'b0;
    end else begin
      if (mot_lock) begin
        if (adc > adc_max_r) begin
          adc_max_r <= adc;
          dac_max_r <= dac;
        end
      end
    end
  end

  assign dac_max = dac_max_r;
  assign adc_max = adc_max_r;

endmodule
