/* Machine-generated using Migen */
module dummy_SweepCSR(
	input signed [13:0] x,
	output reg signed [13:0] y,
	input hold,
	input clear,
	input [29:0] step,
	input signed [13:0] min,
	input signed [13:0] max,
	input run,
	input pause,
	input sequence_stop,
	input sys_clk,
	input sys_rst
);

wire run1;
wire [37:0] step1;
reg turn = 1'd0;
wire hold1;
reg signed [38:0] y1 = 39'sd0;
reg trigger = 1'd0;
wire sequence_stop1;
reg sequence_stop_reg = 1'd0;
wire [38:0] max1;
wire [38:0] min1;
reg up;
reg turning = 1'd0;
reg dir = 1'd0;
wire signed [14:0] limit0;
reg signed [14:0] limit1;
reg signed [14:0] limit2 = 15'sd0;
reg signed [14:0] limit3 = 15'sd0;
reg limit4;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign run1 = ((~clear) & run);
assign hold1 = hold;
assign sequence_stop1 = sequence_stop;
assign limit0 = (y1 >>> 5'd24);
assign step1 = step;
assign max1 = (max <<< 5'd24);
assign min1 = (min <<< 5'd24);

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	up <= 1'd0;
	if ((run1 & (~sequence_stop1))) begin
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

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	limit1 <= 15'sd0;
	limit4 <= 1'd0;
	if ((limit0 >= limit2)) begin
		limit1 <= limit2;
		limit4 <= 1'd1;
	end else begin
		if ((limit0 <= limit3)) begin
			limit1 <= limit3;
			limit4 <= 1'd1;
		end else begin
			limit1 <= limit0;
			limit4 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	limit3 <= {min[13], min};
	limit2 <= {max[13], max};
	turn <= limit4;
	if (pause) begin
		y <= 1'd0;
	end else begin
		y <= limit1;
	end
	sequence_stop_reg <= sequence_stop1;
	trigger <= (turn & up);
	turning <= turn;
	if (sequence_stop1) begin
		dir <= 1'd0;
	end else begin
		dir <= up;
	end
	if (sequence_stop1) begin
		y1 <= max1;
	end else begin
		if ((~run1)) begin
			y1 <= 1'd0;
		end else begin
			if ((~hold1)) begin
				if (up) begin
					y1 <= (y1 + $signed({1'd0, step1}));
				end else begin
					y1 <= (y1 - $signed({1'd0, step1}));
				end
			end
		end
	end
	if (sys_rst) begin
		y <= 14'sd0;
		turn <= 1'd0;
		y1 <= 39'sd0;
		trigger <= 1'd0;
		sequence_stop_reg <= 1'd0;
		turning <= 1'd0;
		dir <= 1'd0;
		limit2 <= 15'sd0;
		limit3 <= 15'sd0;
	end
end

endmodule
