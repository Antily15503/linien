/* Machine-generated using Migen */
module top(
	inout [53:0] cpu_mio,
	inout cpu_ps_clk,
	inout cpu_ps_porb,
	inout cpu_ps_srstb,
	inout cpu_ddr_vrn,
	inout cpu_ddr_vrp,
	inout [14:0] cpu_DDR_addr,
	inout [2:0] cpu_DDR_ba,
	inout cpu_DDR_cas_n,
	inout cpu_DDR_ck_n,
	inout cpu_DDR_ck_p,
	inout cpu_DDR_cke,
	inout cpu_DDR_cs_n,
	inout [3:0] cpu_DDR_dm,
	inout [31:0] cpu_DDR_dq,
	inout [3:0] cpu_DDR_dqs_n,
	inout [3:0] cpu_DDR_dqs_p,
	inout cpu_DDR_odt,
	inout cpu_DDR_ras_n,
	inout cpu_DDR_reset_n,
	inout cpu_DDR_we_n,
	input clk125_p,
	input clk125_n,
	output [1:0] adc_clk,
	output adc_cdcs,
	input [15:0] adc_data_a,
	input [15:0] adc_data_b,
	output [13:0] dac_data,
	output dac_wrt,
	output dac_sel,
	output dac_rst,
	output dac_clk,
	input [4:0] xadc_p,
	input [4:0] xadc_n,
	output pwm,
	output pwm_1,
	output pwm_2,
	output pwm_3,
	inout [7:0] exp_p,
	inout [7:0] exp_n,
	output user_led,
	output user_led_1,
	output user_led_2,
	output user_led_3,
	output user_led_4,
	output user_led_5,
	output user_led_6,
	output user_led_7
);

wire [3:0] ps_fclk;
wire [3:0] ps_frstn;
wire ps_sys_rstn;
wire ps_sys_clk;
wire [31:0] ps_sys_addr;
wire [31:0] ps_sys_wdata;
wire [3:0] ps_sys_sel;
wire ps_sys_wen;
wire ps_sys_ren;
wire [31:0] ps_sys_rdata;
wire ps_sys_err;
wire ps_sys_ack;
wire ps_axi_arvalid;
wire ps_axi_awvalid;
wire ps_axi_bready;
wire ps_axi_rready;
wire ps_axi_wlast;
wire ps_axi_wvalid;
wire [11:0] ps_axi_arid;
wire [11:0] ps_axi_awid;
wire [11:0] ps_axi_wid;
wire [1:0] ps_axi_arburst;
wire [1:0] ps_axi_arlock;
wire [2:0] ps_axi_arsize;
wire [1:0] ps_axi_awburst;
wire [1:0] ps_axi_awlock;
wire [2:0] ps_axi_awsize;
wire [2:0] ps_axi_arprot;
wire [2:0] ps_axi_awprot;
wire [31:0] ps_axi_araddr;
wire [31:0] ps_axi_awaddr;
wire [31:0] ps_axi_wdata;
wire [3:0] ps_axi_arcache;
wire [3:0] ps_axi_arlen;
wire [3:0] ps_axi_arqos;
wire [3:0] ps_axi_awcache;
wire [3:0] ps_axi_awlen;
wire [3:0] ps_axi_awqos;
wire [3:0] ps_axi_wstrb;
wire ps_axi_aclk;
wire ps_axi_arready;
wire ps_axi_awready;
wire ps_axi_bvalid;
wire ps_axi_rlast;
wire ps_axi_rvalid;
wire ps_axi_wready;
wire [11:0] ps_axi_bid;
wire [11:0] ps_axi_rid;
wire [1:0] ps_axi_bresp;
wire [1:0] ps_axi_rresp;
wire [31:0] ps_axi_rdata;
wire ps_axi_arstn;
wire sys_quad_clk;
wire sys_double_clk;
wire sys_clk;
wire sys_rst;
wire sys_slow_clk;
wire sys_ps_clk;
wire sys_ps_rst;
wire clk_adci;
wire clk_adcb;
wire [5:0] clk;
wire clk_fb;
wire clk_fbb;
wire locked;
reg linienmodule_dual_channel_storage_full = 1'd0;
wire linienmodule_dual_channel_storage;
reg linienmodule_dual_channel_re = 1'd0;
reg linienmodule_mod_channel_storage_full = 1'd0;
wire linienmodule_mod_channel_storage;
reg linienmodule_mod_channel_re = 1'd0;
reg linienmodule_control_channel_storage_full = 1'd0;
wire linienmodule_control_channel_storage;
reg linienmodule_control_channel_re = 1'd0;
reg [1:0] linienmodule_sweep_channel_storage_full = 2'd0;
wire [1:0] linienmodule_sweep_channel_storage;
reg linienmodule_sweep_channel_re = 1'd0;
reg [1:0] linienmodule_slow_control_channel_storage_full = 2'd0;
wire [1:0] linienmodule_slow_control_channel_storage;
reg linienmodule_slow_control_channel_re = 1'd0;
reg linienmodule_pid_only_mode_storage_full = 1'd0;
wire linienmodule_pid_only_mode_storage;
reg linienmodule_pid_only_mode_re = 1'd0;
reg [8:0] linienmodule_chain_a_factor_storage_full = 9'd128;
wire [8:0] linienmodule_chain_a_factor_storage;
reg linienmodule_chain_a_factor_re = 1'd0;
reg [8:0] linienmodule_chain_b_factor_storage_full = 9'd128;
wire [8:0] linienmodule_chain_b_factor_storage;
reg linienmodule_chain_b_factor_re = 1'd0;
reg [13:0] linienmodule_chain_a_offset_storage_full = 14'd0;
wire [13:0] linienmodule_chain_a_offset_storage;
reg linienmodule_chain_a_offset_re = 1'd0;
reg [13:0] linienmodule_chain_b_offset_storage_full = 14'd0;
wire [13:0] linienmodule_chain_b_offset_storage;
reg linienmodule_chain_b_offset_re = 1'd0;
reg [13:0] linienmodule_combined_offset_storage_full = 14'd0;
wire [13:0] linienmodule_combined_offset_storage;
reg linienmodule_combined_offset_re = 1'd0;
reg signed [13:0] linienmodule_combined_offset_signed = 14'sd0;
reg [13:0] linienmodule_out_offset_storage_full = 14'd0;
wire [13:0] linienmodule_out_offset_storage;
reg linienmodule_out_offset_re = 1'd0;
reg [4:0] linienmodule_slow_decimation_storage_full = 5'd0;
wire [4:0] linienmodule_slow_decimation_storage;
reg linienmodule_slow_decimation_re = 1'd0;
reg [14:0] linienmodule_csrstorage0_storage_full0 = 15'd0;
wire [14:0] linienmodule_csrstorage0_storage0;
reg linienmodule_csrstorage0_re0 = 1'd0;
reg [14:0] linienmodule_csrstorage1_storage_full0 = 15'd0;
wire [14:0] linienmodule_csrstorage1_storage0;
reg linienmodule_csrstorage1_re0 = 1'd0;
reg [14:0] linienmodule_csrstorage2_storage_full0 = 15'd0;
wire [14:0] linienmodule_csrstorage2_storage0;
reg linienmodule_csrstorage2_re0 = 1'd0;
wire [13:0] linienmodule_slow_value_status;
reg signed [13:0] linienmodule_chain_a_offset_signed = 14'sd0;
reg signed [13:0] linienmodule_chain_b_offset_signed = 14'sd0;
reg signed [13:0] linienmodule_out_offset_signed = 14'sd0;
reg signed [13:0] linienmodule_mod_x = 14'sd0;
wire signed [13:0] linienmodule_mod_y;
reg [13:0] linienmodule_mod_amp_storage_full = 14'd0;
wire [13:0] linienmodule_mod_amp_storage;
reg linienmodule_mod_amp_re = 1'd0;
reg [31:0] linienmodule_mod_freq_storage_full = 32'd0;
wire [31:0] linienmodule_mod_freq_storage;
reg linienmodule_mod_freq_re = 1'd0;
wire [13:0] linienmodule_mod_phase;
reg linienmodule_mod_sync_phase = 1'd0;
reg [31:0] linienmodule_mod_z = 32'd0;
reg linienmodule_mod_stop = 1'd0;
reg signed [14:0] linienmodule_mod_cordic_xi;
reg signed [14:0] linienmodule_mod_cordic_yi;
reg signed [14:0] linienmodule_mod_cordic_zi;
wire signed [14:0] linienmodule_mod_cordic_xo;
wire signed [14:0] linienmodule_mod_cordic_yo;
wire signed [14:0] linienmodule_mod_cordic_zo;
wire linienmodule_mod_cordic_new_in;
wire linienmodule_mod_cordic_new_out;
wire signed [16:0] linienmodule_mod_cordic0;
reg signed [16:0] linienmodule_mod_cordic1 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic2 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic3 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic4 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic5 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic6 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic7 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic8 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic9 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic10 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic11 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic12 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic13 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic14 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic15 = 17'sd0;
wire signed [16:0] linienmodule_mod_cordic16;
reg signed [16:0] linienmodule_mod_cordic17 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic18 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic19 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic20 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic21 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic22 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic23 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic24 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic25 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic26 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic27 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic28 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic29 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic30 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic31 = 17'sd0;
wire signed [16:0] linienmodule_mod_cordic32;
reg signed [16:0] linienmodule_mod_cordic33 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic34 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic35 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic36 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic37 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic38 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic39 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic40 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic41 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic42 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic43 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic44 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic45 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic46 = 17'sd0;
reg signed [16:0] linienmodule_mod_cordic47 = 17'sd0;
wire linienmodule_mod_cordic_dir0;
wire linienmodule_mod_cordic_dir1;
wire linienmodule_mod_cordic_dir2;
wire linienmodule_mod_cordic_dir3;
wire linienmodule_mod_cordic_dir4;
wire linienmodule_mod_cordic_dir5;
wire linienmodule_mod_cordic_dir6;
wire linienmodule_mod_cordic_dir7;
wire linienmodule_mod_cordic_dir8;
wire linienmodule_mod_cordic_dir9;
wire linienmodule_mod_cordic_dir10;
wire linienmodule_mod_cordic_dir11;
wire linienmodule_mod_cordic_dir12;
wire linienmodule_mod_cordic_dir13;
wire linienmodule_mod_cordic_dir14;
wire signed [14:0] linienmodule_mod_xi;
reg signed [14:0] linienmodule_mod_yi = 15'sd0;
wire signed [14:0] linienmodule_mod_zi;
wire linienmodule_mod_q;
reg signed [13:0] linienmodule_sweep_y = 14'sd0;
wire linienmodule_sweep_hold;
reg linienmodule_sweep_clear = 1'd0;
reg [29:0] linienmodule_sweep_step_storage_full = 30'd0;
wire [29:0] linienmodule_sweep_step_storage;
reg linienmodule_sweep_step_re = 1'd0;
reg [13:0] linienmodule_sweep_min_storage_full = 14'd8192;
wire [13:0] linienmodule_sweep_min_storage;
reg linienmodule_sweep_min_re = 1'd0;
reg [13:0] linienmodule_sweep_max_storage_full = 14'd8191;
wire [13:0] linienmodule_sweep_max_storage;
reg linienmodule_sweep_max_re = 1'd0;
reg linienmodule_sweep_run_storage_full = 1'd0;
wire linienmodule_sweep_run_storage;
reg linienmodule_sweep_run_re = 1'd0;
reg linienmodule_sweep_pause_storage_full = 1'd0;
wire linienmodule_sweep_pause_storage;
reg linienmodule_sweep_pause_re = 1'd0;
wire linienmodule_sweep_sweep_run;
wire [37:0] linienmodule_sweep_sweep_step;
reg linienmodule_sweep_sweep_turn = 1'd0;
wire linienmodule_sweep_sweep_hold;
reg signed [38:0] linienmodule_sweep_sweep_y = 39'sd0;
reg linienmodule_sweep_sweep_trigger = 1'd0;
reg linienmodule_sweep_sweep_up;
reg linienmodule_sweep_sweep_turning = 1'd0;
reg linienmodule_sweep_sweep_dir = 1'd0;
wire signed [14:0] linienmodule_sweep_limit_x;
reg signed [14:0] linienmodule_sweep_limit_y;
reg signed [14:0] linienmodule_sweep_limit_max = 15'sd0;
reg signed [14:0] linienmodule_sweep_limit_min = 15'sd0;
reg linienmodule_sweep_limit_railed;
reg signed [24:0] linienmodule_limit_error_signal_limitcsr_y = 25'sd0;
reg linienmodule_limit_error_signal_limitcsr_error = 1'd0;
wire signed [28:0] linienmodule_limit_error_signal_x;
reg [24:0] linienmodule_limit_error_signal_min_storage_full = 25'd16777216;
wire [24:0] linienmodule_limit_error_signal_min_storage;
reg linienmodule_limit_error_signal_min_re = 1'd0;
reg [24:0] linienmodule_limit_error_signal_max_storage_full = 25'd16777215;
wire [24:0] linienmodule_limit_error_signal_max_storage;
reg linienmodule_limit_error_signal_max_re = 1'd0;
wire signed [28:0] linienmodule_limit_error_signal_limit_x;
reg signed [28:0] linienmodule_limit_error_signal_limit_y;
reg signed [28:0] linienmodule_limit_error_signal_limit_max = 29'sd0;
reg signed [28:0] linienmodule_limit_error_signal_limit_min = 29'sd0;
reg linienmodule_limit_error_signal_limit_railed;
reg signed [13:0] linienmodule_limit_fast1_limitcsr_y = 14'sd0;
reg linienmodule_limit_fast1_limitcsr_error = 1'd0;
reg signed [18:0] linienmodule_limit_fast1_x = 19'sd0;
reg [13:0] linienmodule_limit_fast1_min_storage_full = 14'd8192;
wire [13:0] linienmodule_limit_fast1_min_storage;
reg linienmodule_limit_fast1_min_re = 1'd0;
reg [13:0] linienmodule_limit_fast1_max_storage_full = 14'd8191;
wire [13:0] linienmodule_limit_fast1_max_storage;
reg linienmodule_limit_fast1_max_re = 1'd0;
wire signed [18:0] linienmodule_limit_fast1_limit_x;
reg signed [18:0] linienmodule_limit_fast1_limit_y;
reg signed [18:0] linienmodule_limit_fast1_limit_max = 19'sd0;
reg signed [18:0] linienmodule_limit_fast1_limit_min = 19'sd0;
reg linienmodule_limit_fast1_limit_railed;
reg signed [13:0] linienmodule_limit_fast2_limitcsr_y = 14'sd0;
reg linienmodule_limit_fast2_limitcsr_error = 1'd0;
reg signed [18:0] linienmodule_limit_fast2_x = 19'sd0;
reg [13:0] linienmodule_limit_fast2_min_storage_full = 14'd8192;
wire [13:0] linienmodule_limit_fast2_min_storage;
reg linienmodule_limit_fast2_min_re = 1'd0;
reg [13:0] linienmodule_limit_fast2_max_storage_full = 14'd8191;
wire [13:0] linienmodule_limit_fast2_max_storage;
reg linienmodule_limit_fast2_max_re = 1'd0;
wire signed [18:0] linienmodule_limit_fast2_limit_x;
reg signed [18:0] linienmodule_limit_fast2_limit_y;
reg signed [18:0] linienmodule_limit_fast2_limit_max = 19'sd0;
reg signed [18:0] linienmodule_limit_fast2_limit_min = 19'sd0;
reg linienmodule_limit_fast2_limit_railed;
reg signed [24:0] linienmodule_pid_input;
wire linienmodule_pid_running;
reg [24:0] linienmodule_pid_setpoint_storage_full = 25'd0;
wire [24:0] linienmodule_pid_setpoint_storage;
reg linienmodule_pid_setpoint_re = 1'd0;
wire signed [24:0] linienmodule_pid_setpoint_signed;
reg signed [25:0] linienmodule_pid_error;
reg [13:0] linienmodule_pid_kp_storage_full = 14'd0;
wire [13:0] linienmodule_pid_kp_storage;
reg linienmodule_pid_kp_re = 1'd0;
wire signed [13:0] linienmodule_pid_kp_signed;
wire signed [38:0] linienmodule_pid_kp_mult;
wire signed [24:0] linienmodule_pid_output_p;
reg [13:0] linienmodule_pid_ki_storage_full = 14'd0;
wire [13:0] linienmodule_pid_ki_storage;
reg linienmodule_pid_ki_re = 1'd0;
reg linienmodule_pid_reset_storage_full = 1'd0;
wire linienmodule_pid_reset_storage;
reg linienmodule_pid_reset_re = 1'd0;
wire signed [13:0] linienmodule_pid_ki_signed;
wire signed [39:0] linienmodule_pid_ki_mult;
reg signed [42:0] linienmodule_pid_int_reg = 43'sd0;
wire signed [43:0] linienmodule_pid_int_sum;
wire signed [24:0] linienmodule_pid_int_out;
wire [3:0] linienmodule_pid_i_ttl_active;
reg [13:0] linienmodule_pid_kd_storage_full = 14'd0;
wire [13:0] linienmodule_pid_kd_storage;
reg linienmodule_pid_kd_re = 1'd0;
wire signed [13:0] linienmodule_pid_kd_signed;
wire signed [40:0] linienmodule_pid_kd_mult;
reg signed [33:0] linienmodule_pid_kd_reg = 34'sd0;
reg signed [33:0] linienmodule_pid_kd_reg_r = 34'sd0;
reg signed [33:0] linienmodule_pid_output_d = 34'sd0;
reg signed [83:0] linienmodule_pid_pid_sum = 84'sd0;
reg signed [24:0] linienmodule_pid_pid_out;
wire linienmodule_autolock_fast_request_lock;
reg linienmodule_autolock_fast_turn_on_lock = 1'd0;
wire signed [13:0] linienmodule_autolock_fast_sweep_value;
wire [13:0] linienmodule_autolock_fast_sweep_step;
wire linienmodule_autolock_fast_sweep_up;
reg [13:0] linienmodule_autolock_fast_storage_full = 14'd0;
wire [13:0] linienmodule_autolock_fast_storage;
reg linienmodule_autolock_fast_re = 1'd0;
wire signed [13:0] linienmodule_autolock_fast_target_position_signed;
reg linienmodule_autolock_request_lock_storage_full = 1'd0;
wire linienmodule_autolock_request_lock_storage;
reg linienmodule_autolock_request_lock_re = 1'd0;
reg [1:0] linienmodule_autolock_autolock_mode_storage_full = 2'd0;
wire [1:0] linienmodule_autolock_autolock_mode_storage;
reg linienmodule_autolock_autolock_mode_re = 1'd0;
reg linienmodule_autolock_status = 1'd0;
reg linienmodule_sequenceexecutor_reset_seq_storage_full = 1'd0;
wire linienmodule_sequenceexecutor_reset_seq_storage;
reg linienmodule_sequenceexecutor_reset_seq_re = 1'd0;
reg [3:0] linienmodule_sequenceexecutor_arm_storage_full = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_arm_storage;
reg linienmodule_sequenceexecutor_arm_re = 1'd0;
wire [1:0] linienmodule_sequenceexecutor_status_1_status;
wire [1:0] linienmodule_sequenceexecutor_status_2_status;
wire [1:0] linienmodule_sequenceexecutor_status_3_status;
wire [1:0] linienmodule_sequenceexecutor_status_4_status;
wire [13:0] linienmodule_sequenceexecutor_saved_pid_out_status;
wire [24:0] linienmodule_sequenceexecutor_saved_integrator_status;
wire [13:0] linienmodule_sequenceexecutor_saved_sweep_pos_status;
wire [13:0] linienmodule_sequenceexecutor_saved_dac_out_status;
reg [8:0] linienmodule_sequenceexecutor_fsm_reg_addr_storage_full = 9'd0;
wire [8:0] linienmodule_sequenceexecutor_fsm_reg_addr_storage;
reg linienmodule_sequenceexecutor_fsm_reg_addr_re = 1'd0;
reg [31:0] linienmodule_sequenceexecutor_fsm_reg_data_storage_full = 32'd0;
wire [31:0] linienmodule_sequenceexecutor_fsm_reg_data_storage;
reg linienmodule_sequenceexecutor_fsm_reg_data_re = 1'd0;
reg linienmodule_sequenceexecutor_fsm_reg_wen_storage_full = 1'd0;
wire linienmodule_sequenceexecutor_fsm_reg_wen_storage;
reg linienmodule_sequenceexecutor_fsm_reg_wen_re = 1'd0;
reg [9:0] linienmodule_sequenceexecutor_awg_reg_addr_storage_full = 10'd0;
wire [9:0] linienmodule_sequenceexecutor_awg_reg_addr_storage;
reg linienmodule_sequenceexecutor_awg_reg_addr_re = 1'd0;
reg [13:0] linienmodule_sequenceexecutor_awg_reg_data_storage_full = 14'd0;
wire [13:0] linienmodule_sequenceexecutor_awg_reg_data_storage;
reg linienmodule_sequenceexecutor_awg_reg_data_re = 1'd0;
reg linienmodule_sequenceexecutor_awg_reg_wen_storage_full = 1'd0;
wire linienmodule_sequenceexecutor_awg_reg_wen_storage;
reg linienmodule_sequenceexecutor_awg_reg_wen_re = 1'd0;
reg [3:0] linienmodule_sequenceexecutor_num_blocks_1_storage_full = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_num_blocks_1_storage;
reg linienmodule_sequenceexecutor_num_blocks_1_re = 1'd0;
reg [3:0] linienmodule_sequenceexecutor_num_blocks_2_storage_full = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_num_blocks_2_storage;
reg linienmodule_sequenceexecutor_num_blocks_2_re = 1'd0;
reg [3:0] linienmodule_sequenceexecutor_num_blocks_3_storage_full = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_num_blocks_3_storage;
reg linienmodule_sequenceexecutor_num_blocks_3_re = 1'd0;
reg [3:0] linienmodule_sequenceexecutor_num_blocks_4_storage_full = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_num_blocks_4_storage;
reg linienmodule_sequenceexecutor_num_blocks_4_re = 1'd0;
reg [13:0] linienmodule_sequenceexecutor_init_v_storage_full = 14'd0;
wire [13:0] linienmodule_sequenceexecutor_init_v_storage;
reg linienmodule_sequenceexecutor_init_v_re = 1'd0;
wire signed [13:0] linienmodule_sequenceexecutor_dac_out;
wire [3:0] linienmodule_sequenceexecutor_ttl_in;
wire linienmodule_sequenceexecutor_pid_pause;
wire [3:0] linienmodule_sequenceexecutor_active;
wire linienmodule_sequenceexecutor_seq_done;
wire signed [13:0] linienmodule_sequenceexecutor_linien_pid_out;
wire signed [24:0] linienmodule_sequenceexecutor_linien_integrator;
wire signed [13:0] linienmodule_sequenceexecutor_linien_sweep_pos;
wire signed [13:0] linienmodule_sequenceexecutor_linien_dac_out;
wire [3:0] linienmodule_sequenceexecutor_i_ttl;
wire [3:0] linienmodule_sequenceexecutor_i_enable;
wire signed [13:0] linienmodule_sequenceexecutor_i_linien_pid_out;
wire signed [24:0] linienmodule_sequenceexecutor_i_linien_integrator;
wire signed [13:0] linienmodule_sequenceexecutor_i_linien_sweep_pos;
wire signed [13:0] linienmodule_sequenceexecutor_i_linien_dac_out;
wire linienmodule_sequenceexecutor_i_seq_done;
reg linienmodule_sequenceexecutor_o_fsm_start;
reg [3:0] linienmodule_sequenceexecutor_o_active;
wire [1:0] linienmodule_sequenceexecutor_o_status0;
wire [1:0] linienmodule_sequenceexecutor_o_status1;
wire [1:0] linienmodule_sequenceexecutor_o_status2;
wire [1:0] linienmodule_sequenceexecutor_o_status3;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_pid_out = 14'sd0;
reg signed [24:0] linienmodule_sequenceexecutor_o_saved_integrator = 25'sd0;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_sweep_pos = 14'sd0;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_dac_out = 14'sd0;
reg [3:0] linienmodule_sequenceexecutor_ttl_sync0 = 4'd0;
reg [3:0] linienmodule_sequenceexecutor_ttl_sync1 = 4'd0;
reg [3:0] linienmodule_sequenceexecutor_ttl_prev = 4'd0;
wire [3:0] linienmodule_sequenceexecutor_rising_edge;
wire [3:0] linienmodule_sequenceexecutor_armed;
reg [3:0] linienmodule_sequenceexecutor_priority_rising_edge;
reg [3:0] linienmodule_sequenceexecutor_o_active_offset = 4'd0;
wire [13:0] linienmodule_sequenceexecutor_o_dac_drive;
reg [3:0] linienmodule_sequenceexecutor_num_blocks;
wire linienmodule_sequenceexecutor;
wire signed [24:0] linienmodule_combined_error_signal;
wire signed [24:0] linienmodule_control_signal;
wire signed [24:0] linienmodule_raw_acquisition_iir_x;
reg signed [24:0] linienmodule_raw_acquisition_iir_y0 = 25'sd0;
wire linienmodule_raw_acquisition_iir_hold;
wire linienmodule_raw_acquisition_iir_clear;
reg linienmodule_raw_acquisition_iir_error = 1'd0;
reg [26:0] linienmodule_raw_acquisition_iir_storage_full = 27'd0;
wire [26:0] linienmodule_raw_acquisition_iir_storage;
reg linienmodule_raw_acquisition_iir_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_a1 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage0_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage0_storage;
reg linienmodule_raw_acquisition_iir_csrstorage0_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_a2 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage1_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage1_storage;
reg linienmodule_raw_acquisition_iir_csrstorage1_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_a3 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage2_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage2_storage;
reg linienmodule_raw_acquisition_iir_csrstorage2_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_a4 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage3_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage3_storage;
reg linienmodule_raw_acquisition_iir_csrstorage3_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_a5 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage4_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage4_storage;
reg linienmodule_raw_acquisition_iir_csrstorage4_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b0 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage5_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage5_storage;
reg linienmodule_raw_acquisition_iir_csrstorage5_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b1 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage6_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage6_storage;
reg linienmodule_raw_acquisition_iir_csrstorage6_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b2 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage7_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage7_storage;
reg linienmodule_raw_acquisition_iir_csrstorage7_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b3 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage8_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage8_storage;
reg linienmodule_raw_acquisition_iir_csrstorage8_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b4 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage9_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage9_storage;
reg linienmodule_raw_acquisition_iir_csrstorage9_re = 1'd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_b5 = 25'sd0;
reg [24:0] linienmodule_raw_acquisition_iir_csrstorage10_storage_full = 25'd0;
wire [24:0] linienmodule_raw_acquisition_iir_csrstorage10_storage;
reg linienmodule_raw_acquisition_iir_csrstorage10_re = 1'd0;
reg signed [49:0] linienmodule_raw_acquisition_iir_z0r = 50'sd0;
reg signed [24:0] linienmodule_raw_acquisition_iir_y_lim;
wire signed [49:0] linienmodule_raw_acquisition_iir_y_next;
reg [2:0] linienmodule_raw_acquisition_iir_y_pat = 3'd7;
reg signed [24:0] linienmodule_raw_acquisition_iir_y1 = 25'sd0;
wire linienmodule_raw_acquisition_iir_railed;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr0 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z0;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr1 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z1;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr2 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z2;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr3 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z3;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr4 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z4;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr5 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z5;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr6 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z6;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr7 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z7;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr8 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z8;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr9 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z9;
reg signed [49:0] linienmodule_raw_acquisition_iir_zr10 = 50'sd0;
wire signed [49:0] linienmodule_raw_acquisition_iir_z10;
wire signed [24:0] linienmodule_combined_error_signal_filtered;
wire signed [13:0] linienmodule_analog_adc_a;
wire signed [13:0] linienmodule_analog_adc_b;
wire signed [13:0] linienmodule_analog_dac_a;
reg signed [13:0] linienmodule_analog_dac_b;
reg [15:0] linienmodule_analog_adca = 16'd0;
reg [15:0] linienmodule_analog_adcb = 16'd0;
reg [13:0] linienmodule_analog_daca = 14'd0;
reg [13:0] linienmodule_analog_dacb = 14'd0;
wire [7:0] linienmodule_xadc_alarm;
wire linienmodule_xadc_ot;
wire signed [11:0] linienmodule_xadc0;
wire signed [11:0] linienmodule_xadc1;
wire signed [11:0] linienmodule_xadc2;
wire signed [11:0] linienmodule_xadc3;
reg [11:0] linienmodule_xadc_temp_status = 12'd0;
reg [11:0] linienmodule_xadc_v_status = 12'd0;
reg [11:0] linienmodule_xadc_a_status = 12'd0;
reg [11:0] linienmodule_xadc_b_status = 12'd0;
reg [11:0] linienmodule_xadc_c_status = 12'd0;
reg [11:0] linienmodule_xadc_d_status = 12'd0;
wire linienmodule_xadc_busy;
wire [6:0] linienmodule_xadc_channel;
wire linienmodule_xadc_eoc;
wire linienmodule_xadc_eos;
wire [15:0] linienmodule_xadc_data;
wire linienmodule_xadc_drdy;
wire [14:0] linienmodule_deltasigma0_data;
wire linienmodule_deltasigma0_out;
wire [15:0] linienmodule_deltasigma0_delta;
reg [15:0] linienmodule_deltasigma0_sigma = 16'd0;
wire [14:0] linienmodule_deltasigma1_data;
wire linienmodule_deltasigma1_out;
wire [15:0] linienmodule_deltasigma1_delta;
reg [15:0] linienmodule_deltasigma1_sigma = 16'd0;
wire [14:0] linienmodule_deltasigma2_data;
wire linienmodule_deltasigma2_out;
wire [15:0] linienmodule_deltasigma2_delta;
reg [15:0] linienmodule_deltasigma2_sigma = 16'd0;
wire [14:0] linienmodule_deltasigma3_data;
wire linienmodule_deltasigma3_out;
wire [15:0] linienmodule_deltasigma3_delta;
reg [15:0] linienmodule_deltasigma3_sigma = 16'd0;
wire [7:0] linienmodule_gpio_n_i;
reg [7:0] linienmodule_gpio_n_o = 8'd0;
wire [7:0] linienmodule_gpio_n_status;
reg [7:0] linienmodule_gpio_n_outs_storage_full = 8'd0;
wire [7:0] linienmodule_gpio_n_outs_storage;
reg linienmodule_gpio_n_outs_re = 1'd0;
reg [7:0] linienmodule_gpio_n_oes_storage_full = 8'd0;
wire [7:0] linienmodule_gpio_n_oes_storage;
reg linienmodule_gpio_n_oes_re = 1'd0;
wire linienmodule_gpio_n_tstriple0_o;
wire linienmodule_gpio_n_tstriple0_oe;
wire linienmodule_gpio_n_tstriple0_i;
wire linienmodule_gpio_n_tstriple1_o;
wire linienmodule_gpio_n_tstriple1_oe;
wire linienmodule_gpio_n_tstriple1_i;
wire linienmodule_gpio_n_tstriple2_o;
wire linienmodule_gpio_n_tstriple2_oe;
wire linienmodule_gpio_n_tstriple2_i;
wire linienmodule_gpio_n_tstriple3_o;
wire linienmodule_gpio_n_tstriple3_oe;
wire linienmodule_gpio_n_tstriple3_i;
wire linienmodule_gpio_n_tstriple4_o;
wire linienmodule_gpio_n_tstriple4_oe;
wire linienmodule_gpio_n_tstriple4_i;
wire linienmodule_gpio_n_tstriple5_o;
wire linienmodule_gpio_n_tstriple5_oe;
wire linienmodule_gpio_n_tstriple5_i;
wire linienmodule_gpio_n_tstriple6_o;
wire linienmodule_gpio_n_tstriple6_oe;
wire linienmodule_gpio_n_tstriple6_i;
wire linienmodule_gpio_n_tstriple7_o;
wire linienmodule_gpio_n_tstriple7_oe;
wire linienmodule_gpio_n_tstriple7_i;
wire [7:0] linienmodule_gpio_p_i;
reg [7:0] linienmodule_gpio_p_o = 8'd0;
wire [7:0] linienmodule_gpio_p_status;
reg [7:0] linienmodule_gpio_p_outs_storage_full = 8'd0;
wire [7:0] linienmodule_gpio_p_outs_storage;
reg linienmodule_gpio_p_outs_re = 1'd0;
reg [7:0] linienmodule_gpio_p_oes_storage_full = 8'd0;
wire [7:0] linienmodule_gpio_p_oes_storage;
reg linienmodule_gpio_p_oes_re = 1'd0;
wire linienmodule_gpio_p_tstriple0_o;
wire linienmodule_gpio_p_tstriple0_oe;
wire linienmodule_gpio_p_tstriple0_i;
wire linienmodule_gpio_p_tstriple1_o;
wire linienmodule_gpio_p_tstriple1_oe;
wire linienmodule_gpio_p_tstriple1_i;
wire linienmodule_gpio_p_tstriple2_o;
wire linienmodule_gpio_p_tstriple2_oe;
wire linienmodule_gpio_p_tstriple2_i;
wire linienmodule_gpio_p_tstriple3_o;
wire linienmodule_gpio_p_tstriple3_oe;
wire linienmodule_gpio_p_tstriple3_i;
wire linienmodule_gpio_p_tstriple4_o;
wire linienmodule_gpio_p_tstriple4_oe;
wire linienmodule_gpio_p_tstriple4_i;
wire linienmodule_gpio_p_tstriple5_o;
wire linienmodule_gpio_p_tstriple5_oe;
wire linienmodule_gpio_p_tstriple5_i;
wire linienmodule_gpio_p_tstriple6_o;
wire linienmodule_gpio_p_tstriple6_oe;
wire linienmodule_gpio_p_tstriple6_i;
wire linienmodule_gpio_p_tstriple7_o;
wire linienmodule_gpio_p_tstriple7_oe;
wire linienmodule_gpio_p_tstriple7_i;
reg [7:0] linienmodule_led_val;
reg [63:0] linienmodule_dna_status = 64'd288230376151711744;
wire linienmodule_dna_do;
reg [7:0] linienmodule_dna_cnt = 8'd0;
wire signed [13:0] linienmodule_fast_a_adc;
wire signed [24:0] linienmodule_fast_a_out_i;
wire signed [24:0] linienmodule_fast_a_out_q;
reg [1:0] linienmodule_fast_a_y_tap_storage_full = 2'd0;
wire [1:0] linienmodule_fast_a_y_tap_storage;
reg linienmodule_fast_a_y_tap_re = 1'd0;
reg linienmodule_fast_a_invert_storage_full = 1'd0;
wire linienmodule_fast_a_invert_storage;
reg linienmodule_fast_a_invert_re = 1'd0;
wire signed [24:0] linienmodule_fast_a_x0;
reg signed [24:0] linienmodule_fast_a_dx = 25'sd0;
reg signed [24:0] linienmodule_fast_a_dy = 25'sd0;
wire signed [13:0] linienmodule_fast_a_x1;
wire signed [13:0] linienmodule_fast_a_i;
wire signed [13:0] linienmodule_fast_a_q0;
reg [31:0] linienmodule_fast_a_delay_storage_full = 32'd0;
wire [31:0] linienmodule_fast_a_delay_storage;
reg linienmodule_fast_a_delay_re = 1'd0;
reg [3:0] linienmodule_fast_a_multiplier_storage_full = 4'd1;
wire [3:0] linienmodule_fast_a_multiplier_storage;
reg linienmodule_fast_a_multiplier_re = 1'd0;
wire [13:0] linienmodule_fast_a_phase;
reg signed [14:0] linienmodule_fast_a_cordic_xi;
reg signed [14:0] linienmodule_fast_a_cordic_yi;
reg signed [14:0] linienmodule_fast_a_cordic_zi;
wire signed [14:0] linienmodule_fast_a_cordic_xo;
wire signed [14:0] linienmodule_fast_a_cordic_yo;
wire signed [14:0] linienmodule_fast_a_cordic_zo;
wire linienmodule_fast_a_cordic_new_in;
wire linienmodule_fast_a_cordic_new_out;
wire signed [16:0] linienmodule_fast_a_cordic0;
reg signed [16:0] linienmodule_fast_a_cordic1 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic2 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic3 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic4 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic5 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic6 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic7 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic8 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic9 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic10 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic11 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic12 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic13 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic14 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic15 = 17'sd0;
wire signed [16:0] linienmodule_fast_a_cordic16;
reg signed [16:0] linienmodule_fast_a_cordic17 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic18 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic19 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic20 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic21 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic22 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic23 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic24 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic25 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic26 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic27 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic28 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic29 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic30 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic31 = 17'sd0;
wire signed [16:0] linienmodule_fast_a_cordic32;
reg signed [16:0] linienmodule_fast_a_cordic33 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic34 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic35 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic36 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic37 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic38 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic39 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic40 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic41 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic42 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic43 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic44 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic45 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic46 = 17'sd0;
reg signed [16:0] linienmodule_fast_a_cordic47 = 17'sd0;
wire linienmodule_fast_a_cordic_dir0;
wire linienmodule_fast_a_cordic_dir1;
wire linienmodule_fast_a_cordic_dir2;
wire linienmodule_fast_a_cordic_dir3;
wire linienmodule_fast_a_cordic_dir4;
wire linienmodule_fast_a_cordic_dir5;
wire linienmodule_fast_a_cordic_dir6;
wire linienmodule_fast_a_cordic_dir7;
wire linienmodule_fast_a_cordic_dir8;
wire linienmodule_fast_a_cordic_dir9;
wire linienmodule_fast_a_cordic_dir10;
wire linienmodule_fast_a_cordic_dir11;
wire linienmodule_fast_a_cordic_dir12;
wire linienmodule_fast_a_cordic_dir13;
wire linienmodule_fast_a_cordic_dir14;
wire signed [14:0] linienmodule_fast_a_xi;
reg signed [14:0] linienmodule_fast_a_yi = 15'sd0;
wire signed [14:0] linienmodule_fast_a_zi;
wire linienmodule_fast_a_q1;
reg signed [16:0] linienmodule_fast_a_ya = 17'sd0;
reg signed [24:0] linienmodule_fast_a_limitcsr0_limitcsr0_y0 = 25'sd0;
reg linienmodule_fast_a_limitcsr0_limitcsr0_error0 = 1'd0;
wire signed [25:0] linienmodule_fast_a_limitcsr0_x0;
reg [24:0] linienmodule_fast_a_limitcsr0_min_storage_full0 = 25'd16777216;
wire [24:0] linienmodule_fast_a_limitcsr0_min_storage0;
reg linienmodule_fast_a_limitcsr0_min_re0 = 1'd0;
reg [24:0] linienmodule_fast_a_limitcsr0_max_storage_full0 = 25'd16777215;
wire [24:0] linienmodule_fast_a_limitcsr0_max_storage0;
reg linienmodule_fast_a_limitcsr0_max_re0 = 1'd0;
wire signed [25:0] linienmodule_fast_a_limitcsr0_limit_x0;
reg signed [25:0] linienmodule_fast_a_limitcsr0_limit_y0;
reg signed [25:0] linienmodule_fast_a_limitcsr0_limit_max0 = 26'sd0;
reg signed [25:0] linienmodule_fast_a_limitcsr0_limit_min0 = 26'sd0;
reg linienmodule_fast_a_limitcsr0_limit_railed0;
wire signed [24:0] linienmodule_fast_a_iir0_x0;
reg signed [24:0] linienmodule_fast_a_iir0_y0 = 25'sd0;
wire linienmodule_fast_a_iir0_hold0;
wire linienmodule_fast_a_iir0_clear0;
reg linienmodule_fast_a_iir0_error0 = 1'd0;
reg [26:0] linienmodule_fast_a_iir0_storage_full0 = 27'd0;
wire [26:0] linienmodule_fast_a_iir0_storage0;
reg linienmodule_fast_a_iir0_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_a10 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage0_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage0_storage0;
reg linienmodule_fast_a_iir0_csrstorage0_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_b00 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage1_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage1_storage0;
reg linienmodule_fast_a_iir0_csrstorage1_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_b10 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage2_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage2_storage0;
reg linienmodule_fast_a_iir0_csrstorage2_re0 = 1'd0;
reg signed [49:0] linienmodule_fast_a_iir0_z0r0 = 50'sd0;
reg signed [24:0] linienmodule_fast_a_iir0_y_lim0;
wire signed [49:0] linienmodule_fast_a_iir0_y_next0;
reg [2:0] linienmodule_fast_a_iir0_y_pat0 = 3'd7;
reg signed [24:0] linienmodule_fast_a_iir0_y1 = 25'sd0;
wire linienmodule_fast_a_iir0_railed0;
reg signed [49:0] linienmodule_fast_a_iir0_zr0 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z0;
reg signed [49:0] linienmodule_fast_a_iir0_zr1 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z1;
reg signed [49:0] linienmodule_fast_a_iir0_zr2 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z2;
wire signed [24:0] linienmodule_fast_a_iir0_x1;
reg signed [24:0] linienmodule_fast_a_iir0_y2 = 25'sd0;
wire linienmodule_fast_a_iir0_hold1;
wire linienmodule_fast_a_iir0_clear1;
reg linienmodule_fast_a_iir0_error1 = 1'd0;
reg [26:0] linienmodule_fast_a_iir0_storage_full1 = 27'd0;
wire [26:0] linienmodule_fast_a_iir0_storage1;
reg linienmodule_fast_a_iir0_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_a11 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage0_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage0_storage1;
reg linienmodule_fast_a_iir0_csrstorage0_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_a2 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage1_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage1_storage1;
reg linienmodule_fast_a_iir0_csrstorage1_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_b01 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage2_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage2_storage1;
reg linienmodule_fast_a_iir0_csrstorage2_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_b11 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage3_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage3_storage;
reg linienmodule_fast_a_iir0_csrstorage3_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir0_b2 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir0_csrstorage4_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir0_csrstorage4_storage;
reg linienmodule_fast_a_iir0_csrstorage4_re = 1'd0;
reg signed [49:0] linienmodule_fast_a_iir0_z0r1 = 50'sd0;
reg signed [24:0] linienmodule_fast_a_iir0_y_lim1;
wire signed [49:0] linienmodule_fast_a_iir0_y_next1;
reg [2:0] linienmodule_fast_a_iir0_y_pat1 = 3'd7;
reg signed [24:0] linienmodule_fast_a_iir0_y3 = 25'sd0;
wire linienmodule_fast_a_iir0_railed1;
reg signed [49:0] linienmodule_fast_a_iir0_zr3 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z3;
reg signed [49:0] linienmodule_fast_a_iir0_zr4 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z4;
reg signed [49:0] linienmodule_fast_a_iir0_zr5 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z5;
reg signed [49:0] linienmodule_fast_a_iir0_zr6 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z6;
reg signed [49:0] linienmodule_fast_a_iir0_zr7 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir0_z7;
reg signed [24:0] linienmodule_fast_a_limitcsr0_limitcsr0_y1 = 25'sd0;
reg linienmodule_fast_a_limitcsr0_limitcsr0_error1 = 1'd0;
wire signed [27:0] linienmodule_fast_a_limitcsr0_x1;
reg [24:0] linienmodule_fast_a_limitcsr0_min_storage_full1 = 25'd16777216;
wire [24:0] linienmodule_fast_a_limitcsr0_min_storage1;
reg linienmodule_fast_a_limitcsr0_min_re1 = 1'd0;
reg [24:0] linienmodule_fast_a_limitcsr0_max_storage_full1 = 25'd16777215;
wire [24:0] linienmodule_fast_a_limitcsr0_max_storage1;
reg linienmodule_fast_a_limitcsr0_max_re1 = 1'd0;
wire signed [27:0] linienmodule_fast_a_limitcsr0_limit_x1;
reg signed [27:0] linienmodule_fast_a_limitcsr0_limit_y1;
reg signed [27:0] linienmodule_fast_a_limitcsr0_limit_max1 = 28'sd0;
reg signed [27:0] linienmodule_fast_a_limitcsr0_limit_min1 = 28'sd0;
reg linienmodule_fast_a_limitcsr0_limit_railed1;
reg signed [24:0] linienmodule_fast_a_limitcsr1_limitcsr1_y0 = 25'sd0;
reg linienmodule_fast_a_limitcsr1_limitcsr1_error0 = 1'd0;
wire signed [25:0] linienmodule_fast_a_limitcsr1_x0;
reg [24:0] linienmodule_fast_a_limitcsr1_min_storage_full0 = 25'd16777216;
wire [24:0] linienmodule_fast_a_limitcsr1_min_storage0;
reg linienmodule_fast_a_limitcsr1_min_re0 = 1'd0;
reg [24:0] linienmodule_fast_a_limitcsr1_max_storage_full0 = 25'd16777215;
wire [24:0] linienmodule_fast_a_limitcsr1_max_storage0;
reg linienmodule_fast_a_limitcsr1_max_re0 = 1'd0;
wire signed [25:0] linienmodule_fast_a_limitcsr1_limit_x0;
reg signed [25:0] linienmodule_fast_a_limitcsr1_limit_y0;
reg signed [25:0] linienmodule_fast_a_limitcsr1_limit_max0 = 26'sd0;
reg signed [25:0] linienmodule_fast_a_limitcsr1_limit_min0 = 26'sd0;
reg linienmodule_fast_a_limitcsr1_limit_railed0;
wire signed [24:0] linienmodule_fast_a_iir1_x0;
reg signed [24:0] linienmodule_fast_a_iir1_y0 = 25'sd0;
wire linienmodule_fast_a_iir1_hold0;
wire linienmodule_fast_a_iir1_clear0;
reg linienmodule_fast_a_iir1_error0 = 1'd0;
reg [26:0] linienmodule_fast_a_iir1_storage_full0 = 27'd0;
wire [26:0] linienmodule_fast_a_iir1_storage0;
reg linienmodule_fast_a_iir1_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_a10 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage3_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage3_storage;
reg linienmodule_fast_a_iir1_csrstorage3_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_b00 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage4_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage4_storage;
reg linienmodule_fast_a_iir1_csrstorage4_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_b10 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage5_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage5_storage0;
reg linienmodule_fast_a_iir1_csrstorage5_re0 = 1'd0;
reg signed [49:0] linienmodule_fast_a_iir1_z0r0 = 50'sd0;
reg signed [24:0] linienmodule_fast_a_iir1_y_lim0;
wire signed [49:0] linienmodule_fast_a_iir1_y_next0;
reg [2:0] linienmodule_fast_a_iir1_y_pat0 = 3'd7;
reg signed [24:0] linienmodule_fast_a_iir1_y1 = 25'sd0;
wire linienmodule_fast_a_iir1_railed0;
reg signed [49:0] linienmodule_fast_a_iir1_zr0 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z0;
reg signed [49:0] linienmodule_fast_a_iir1_zr1 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z1;
reg signed [49:0] linienmodule_fast_a_iir1_zr2 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z2;
wire signed [24:0] linienmodule_fast_a_iir1_x1;
reg signed [24:0] linienmodule_fast_a_iir1_y2 = 25'sd0;
wire linienmodule_fast_a_iir1_hold1;
wire linienmodule_fast_a_iir1_clear1;
reg linienmodule_fast_a_iir1_error1 = 1'd0;
reg [26:0] linienmodule_fast_a_iir1_storage_full1 = 27'd0;
wire [26:0] linienmodule_fast_a_iir1_storage1;
reg linienmodule_fast_a_iir1_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_a11 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage5_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage5_storage1;
reg linienmodule_fast_a_iir1_csrstorage5_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_a2 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage6_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage6_storage;
reg linienmodule_fast_a_iir1_csrstorage6_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_b01 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage7_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage7_storage;
reg linienmodule_fast_a_iir1_csrstorage7_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_b11 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage8_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage8_storage;
reg linienmodule_fast_a_iir1_csrstorage8_re = 1'd0;
reg signed [24:0] linienmodule_fast_a_iir1_b2 = 25'sd0;
reg [24:0] linienmodule_fast_a_iir1_csrstorage9_storage_full = 25'd0;
wire [24:0] linienmodule_fast_a_iir1_csrstorage9_storage;
reg linienmodule_fast_a_iir1_csrstorage9_re = 1'd0;
reg signed [49:0] linienmodule_fast_a_iir1_z0r1 = 50'sd0;
reg signed [24:0] linienmodule_fast_a_iir1_y_lim1;
wire signed [49:0] linienmodule_fast_a_iir1_y_next1;
reg [2:0] linienmodule_fast_a_iir1_y_pat1 = 3'd7;
reg signed [24:0] linienmodule_fast_a_iir1_y3 = 25'sd0;
wire linienmodule_fast_a_iir1_railed1;
reg signed [49:0] linienmodule_fast_a_iir1_zr3 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z3;
reg signed [49:0] linienmodule_fast_a_iir1_zr4 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z4;
reg signed [49:0] linienmodule_fast_a_iir1_zr5 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z5;
reg signed [49:0] linienmodule_fast_a_iir1_zr6 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z6;
reg signed [49:0] linienmodule_fast_a_iir1_zr7 = 50'sd0;
wire signed [49:0] linienmodule_fast_a_iir1_z7;
reg signed [24:0] linienmodule_fast_a_limitcsr1_limitcsr1_y1 = 25'sd0;
reg linienmodule_fast_a_limitcsr1_limitcsr1_error1 = 1'd0;
wire signed [27:0] linienmodule_fast_a_limitcsr1_x1;
reg [24:0] linienmodule_fast_a_limitcsr1_min_storage_full1 = 25'd16777216;
wire [24:0] linienmodule_fast_a_limitcsr1_min_storage1;
reg linienmodule_fast_a_limitcsr1_min_re1 = 1'd0;
reg [24:0] linienmodule_fast_a_limitcsr1_max_storage_full1 = 25'd16777215;
wire [24:0] linienmodule_fast_a_limitcsr1_max_storage1;
reg linienmodule_fast_a_limitcsr1_max_re1 = 1'd0;
wire signed [27:0] linienmodule_fast_a_limitcsr1_limit_x1;
reg signed [27:0] linienmodule_fast_a_limitcsr1_limit_y1;
reg signed [27:0] linienmodule_fast_a_limitcsr1_limit_max1 = 28'sd0;
reg signed [27:0] linienmodule_fast_a_limitcsr1_limit_min1 = 28'sd0;
reg linienmodule_fast_a_limitcsr1_limit_railed1;
wire signed [13:0] linienmodule_fast_b_adc;
wire signed [24:0] linienmodule_fast_b_out_i;
wire signed [24:0] linienmodule_fast_b_out_q;
reg [1:0] linienmodule_fast_b_y_tap_storage_full = 2'd0;
wire [1:0] linienmodule_fast_b_y_tap_storage;
reg linienmodule_fast_b_y_tap_re = 1'd0;
reg linienmodule_fast_b_invert_storage_full = 1'd0;
wire linienmodule_fast_b_invert_storage;
reg linienmodule_fast_b_invert_re = 1'd0;
wire signed [24:0] linienmodule_fast_b_x0;
reg signed [24:0] linienmodule_fast_b_dx = 25'sd0;
reg signed [24:0] linienmodule_fast_b_dy = 25'sd0;
wire signed [13:0] linienmodule_fast_b_x1;
wire signed [13:0] linienmodule_fast_b_i;
wire signed [13:0] linienmodule_fast_b_q0;
reg [31:0] linienmodule_fast_b_delay_storage_full = 32'd0;
wire [31:0] linienmodule_fast_b_delay_storage;
reg linienmodule_fast_b_delay_re = 1'd0;
reg [3:0] linienmodule_fast_b_multiplier_storage_full = 4'd1;
wire [3:0] linienmodule_fast_b_multiplier_storage;
reg linienmodule_fast_b_multiplier_re = 1'd0;
wire [13:0] linienmodule_fast_b_phase;
reg signed [14:0] linienmodule_fast_b_cordic_xi;
reg signed [14:0] linienmodule_fast_b_cordic_yi;
reg signed [14:0] linienmodule_fast_b_cordic_zi;
wire signed [14:0] linienmodule_fast_b_cordic_xo;
wire signed [14:0] linienmodule_fast_b_cordic_yo;
wire signed [14:0] linienmodule_fast_b_cordic_zo;
wire linienmodule_fast_b_cordic_new_in;
wire linienmodule_fast_b_cordic_new_out;
wire signed [16:0] linienmodule_fast_b_cordic0;
reg signed [16:0] linienmodule_fast_b_cordic1 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic2 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic3 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic4 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic5 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic6 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic7 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic8 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic9 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic10 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic11 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic12 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic13 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic14 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic15 = 17'sd0;
wire signed [16:0] linienmodule_fast_b_cordic16;
reg signed [16:0] linienmodule_fast_b_cordic17 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic18 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic19 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic20 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic21 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic22 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic23 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic24 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic25 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic26 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic27 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic28 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic29 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic30 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic31 = 17'sd0;
wire signed [16:0] linienmodule_fast_b_cordic32;
reg signed [16:0] linienmodule_fast_b_cordic33 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic34 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic35 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic36 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic37 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic38 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic39 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic40 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic41 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic42 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic43 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic44 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic45 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic46 = 17'sd0;
reg signed [16:0] linienmodule_fast_b_cordic47 = 17'sd0;
wire linienmodule_fast_b_cordic_dir0;
wire linienmodule_fast_b_cordic_dir1;
wire linienmodule_fast_b_cordic_dir2;
wire linienmodule_fast_b_cordic_dir3;
wire linienmodule_fast_b_cordic_dir4;
wire linienmodule_fast_b_cordic_dir5;
wire linienmodule_fast_b_cordic_dir6;
wire linienmodule_fast_b_cordic_dir7;
wire linienmodule_fast_b_cordic_dir8;
wire linienmodule_fast_b_cordic_dir9;
wire linienmodule_fast_b_cordic_dir10;
wire linienmodule_fast_b_cordic_dir11;
wire linienmodule_fast_b_cordic_dir12;
wire linienmodule_fast_b_cordic_dir13;
wire linienmodule_fast_b_cordic_dir14;
wire signed [14:0] linienmodule_fast_b_xi;
reg signed [14:0] linienmodule_fast_b_yi = 15'sd0;
wire signed [14:0] linienmodule_fast_b_zi;
wire linienmodule_fast_b_q1;
reg signed [16:0] linienmodule_fast_b_ya = 17'sd0;
reg signed [24:0] linienmodule_fast_b_limitcsr0_limitcsr0_y0 = 25'sd0;
reg linienmodule_fast_b_limitcsr0_limitcsr0_error0 = 1'd0;
wire signed [25:0] linienmodule_fast_b_limitcsr0_x0;
reg [24:0] linienmodule_fast_b_limitcsr0_min_storage_full0 = 25'd16777216;
wire [24:0] linienmodule_fast_b_limitcsr0_min_storage0;
reg linienmodule_fast_b_limitcsr0_min_re0 = 1'd0;
reg [24:0] linienmodule_fast_b_limitcsr0_max_storage_full0 = 25'd16777215;
wire [24:0] linienmodule_fast_b_limitcsr0_max_storage0;
reg linienmodule_fast_b_limitcsr0_max_re0 = 1'd0;
wire signed [25:0] linienmodule_fast_b_limitcsr0_limit_x0;
reg signed [25:0] linienmodule_fast_b_limitcsr0_limit_y0;
reg signed [25:0] linienmodule_fast_b_limitcsr0_limit_max0 = 26'sd0;
reg signed [25:0] linienmodule_fast_b_limitcsr0_limit_min0 = 26'sd0;
reg linienmodule_fast_b_limitcsr0_limit_railed0;
wire signed [24:0] linienmodule_fast_b_iir0_x0;
reg signed [24:0] linienmodule_fast_b_iir0_y0 = 25'sd0;
wire linienmodule_fast_b_iir0_hold0;
wire linienmodule_fast_b_iir0_clear0;
reg linienmodule_fast_b_iir0_error0 = 1'd0;
reg [26:0] linienmodule_fast_b_iir0_storage_full0 = 27'd0;
wire [26:0] linienmodule_fast_b_iir0_storage0;
reg linienmodule_fast_b_iir0_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_a10 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage0_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage0_storage0;
reg linienmodule_fast_b_iir0_csrstorage0_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_b00 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage1_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage1_storage0;
reg linienmodule_fast_b_iir0_csrstorage1_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_b10 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage2_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage2_storage0;
reg linienmodule_fast_b_iir0_csrstorage2_re0 = 1'd0;
reg signed [49:0] linienmodule_fast_b_iir0_z0r0 = 50'sd0;
reg signed [24:0] linienmodule_fast_b_iir0_y_lim0;
wire signed [49:0] linienmodule_fast_b_iir0_y_next0;
reg [2:0] linienmodule_fast_b_iir0_y_pat0 = 3'd7;
reg signed [24:0] linienmodule_fast_b_iir0_y1 = 25'sd0;
wire linienmodule_fast_b_iir0_railed0;
reg signed [49:0] linienmodule_fast_b_iir0_zr0 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z0;
reg signed [49:0] linienmodule_fast_b_iir0_zr1 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z1;
reg signed [49:0] linienmodule_fast_b_iir0_zr2 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z2;
wire signed [24:0] linienmodule_fast_b_iir0_x1;
reg signed [24:0] linienmodule_fast_b_iir0_y2 = 25'sd0;
wire linienmodule_fast_b_iir0_hold1;
wire linienmodule_fast_b_iir0_clear1;
reg linienmodule_fast_b_iir0_error1 = 1'd0;
reg [26:0] linienmodule_fast_b_iir0_storage_full1 = 27'd0;
wire [26:0] linienmodule_fast_b_iir0_storage1;
reg linienmodule_fast_b_iir0_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_a11 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage0_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage0_storage1;
reg linienmodule_fast_b_iir0_csrstorage0_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_a2 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage1_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage1_storage1;
reg linienmodule_fast_b_iir0_csrstorage1_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_b01 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage2_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage2_storage1;
reg linienmodule_fast_b_iir0_csrstorage2_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_b11 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage3_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage3_storage;
reg linienmodule_fast_b_iir0_csrstorage3_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir0_b2 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir0_csrstorage4_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir0_csrstorage4_storage;
reg linienmodule_fast_b_iir0_csrstorage4_re = 1'd0;
reg signed [49:0] linienmodule_fast_b_iir0_z0r1 = 50'sd0;
reg signed [24:0] linienmodule_fast_b_iir0_y_lim1;
wire signed [49:0] linienmodule_fast_b_iir0_y_next1;
reg [2:0] linienmodule_fast_b_iir0_y_pat1 = 3'd7;
reg signed [24:0] linienmodule_fast_b_iir0_y3 = 25'sd0;
wire linienmodule_fast_b_iir0_railed1;
reg signed [49:0] linienmodule_fast_b_iir0_zr3 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z3;
reg signed [49:0] linienmodule_fast_b_iir0_zr4 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z4;
reg signed [49:0] linienmodule_fast_b_iir0_zr5 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z5;
reg signed [49:0] linienmodule_fast_b_iir0_zr6 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z6;
reg signed [49:0] linienmodule_fast_b_iir0_zr7 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir0_z7;
reg signed [24:0] linienmodule_fast_b_limitcsr0_limitcsr0_y1 = 25'sd0;
reg linienmodule_fast_b_limitcsr0_limitcsr0_error1 = 1'd0;
wire signed [27:0] linienmodule_fast_b_limitcsr0_x1;
reg [24:0] linienmodule_fast_b_limitcsr0_min_storage_full1 = 25'd16777216;
wire [24:0] linienmodule_fast_b_limitcsr0_min_storage1;
reg linienmodule_fast_b_limitcsr0_min_re1 = 1'd0;
reg [24:0] linienmodule_fast_b_limitcsr0_max_storage_full1 = 25'd16777215;
wire [24:0] linienmodule_fast_b_limitcsr0_max_storage1;
reg linienmodule_fast_b_limitcsr0_max_re1 = 1'd0;
wire signed [27:0] linienmodule_fast_b_limitcsr0_limit_x1;
reg signed [27:0] linienmodule_fast_b_limitcsr0_limit_y1;
reg signed [27:0] linienmodule_fast_b_limitcsr0_limit_max1 = 28'sd0;
reg signed [27:0] linienmodule_fast_b_limitcsr0_limit_min1 = 28'sd0;
reg linienmodule_fast_b_limitcsr0_limit_railed1;
reg signed [24:0] linienmodule_fast_b_limitcsr1_limitcsr1_y0 = 25'sd0;
reg linienmodule_fast_b_limitcsr1_limitcsr1_error0 = 1'd0;
wire signed [25:0] linienmodule_fast_b_limitcsr1_x0;
reg [24:0] linienmodule_fast_b_limitcsr1_min_storage_full0 = 25'd16777216;
wire [24:0] linienmodule_fast_b_limitcsr1_min_storage0;
reg linienmodule_fast_b_limitcsr1_min_re0 = 1'd0;
reg [24:0] linienmodule_fast_b_limitcsr1_max_storage_full0 = 25'd16777215;
wire [24:0] linienmodule_fast_b_limitcsr1_max_storage0;
reg linienmodule_fast_b_limitcsr1_max_re0 = 1'd0;
wire signed [25:0] linienmodule_fast_b_limitcsr1_limit_x0;
reg signed [25:0] linienmodule_fast_b_limitcsr1_limit_y0;
reg signed [25:0] linienmodule_fast_b_limitcsr1_limit_max0 = 26'sd0;
reg signed [25:0] linienmodule_fast_b_limitcsr1_limit_min0 = 26'sd0;
reg linienmodule_fast_b_limitcsr1_limit_railed0;
wire signed [24:0] linienmodule_fast_b_iir1_x0;
reg signed [24:0] linienmodule_fast_b_iir1_y0 = 25'sd0;
wire linienmodule_fast_b_iir1_hold0;
wire linienmodule_fast_b_iir1_clear0;
reg linienmodule_fast_b_iir1_error0 = 1'd0;
reg [26:0] linienmodule_fast_b_iir1_storage_full0 = 27'd0;
wire [26:0] linienmodule_fast_b_iir1_storage0;
reg linienmodule_fast_b_iir1_re0 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_a10 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage3_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage3_storage;
reg linienmodule_fast_b_iir1_csrstorage3_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_b00 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage4_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage4_storage;
reg linienmodule_fast_b_iir1_csrstorage4_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_b10 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage5_storage_full0 = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage5_storage0;
reg linienmodule_fast_b_iir1_csrstorage5_re0 = 1'd0;
reg signed [49:0] linienmodule_fast_b_iir1_z0r0 = 50'sd0;
reg signed [24:0] linienmodule_fast_b_iir1_y_lim0;
wire signed [49:0] linienmodule_fast_b_iir1_y_next0;
reg [2:0] linienmodule_fast_b_iir1_y_pat0 = 3'd7;
reg signed [24:0] linienmodule_fast_b_iir1_y1 = 25'sd0;
wire linienmodule_fast_b_iir1_railed0;
reg signed [49:0] linienmodule_fast_b_iir1_zr0 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z0;
reg signed [49:0] linienmodule_fast_b_iir1_zr1 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z1;
reg signed [49:0] linienmodule_fast_b_iir1_zr2 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z2;
wire signed [24:0] linienmodule_fast_b_iir1_x1;
reg signed [24:0] linienmodule_fast_b_iir1_y2 = 25'sd0;
wire linienmodule_fast_b_iir1_hold1;
wire linienmodule_fast_b_iir1_clear1;
reg linienmodule_fast_b_iir1_error1 = 1'd0;
reg [26:0] linienmodule_fast_b_iir1_storage_full1 = 27'd0;
wire [26:0] linienmodule_fast_b_iir1_storage1;
reg linienmodule_fast_b_iir1_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_a11 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage5_storage_full1 = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage5_storage1;
reg linienmodule_fast_b_iir1_csrstorage5_re1 = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_a2 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage6_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage6_storage;
reg linienmodule_fast_b_iir1_csrstorage6_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_b01 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage7_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage7_storage;
reg linienmodule_fast_b_iir1_csrstorage7_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_b11 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage8_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage8_storage;
reg linienmodule_fast_b_iir1_csrstorage8_re = 1'd0;
reg signed [24:0] linienmodule_fast_b_iir1_b2 = 25'sd0;
reg [24:0] linienmodule_fast_b_iir1_csrstorage9_storage_full = 25'd0;
wire [24:0] linienmodule_fast_b_iir1_csrstorage9_storage;
reg linienmodule_fast_b_iir1_csrstorage9_re = 1'd0;
reg signed [49:0] linienmodule_fast_b_iir1_z0r1 = 50'sd0;
reg signed [24:0] linienmodule_fast_b_iir1_y_lim1;
wire signed [49:0] linienmodule_fast_b_iir1_y_next1;
reg [2:0] linienmodule_fast_b_iir1_y_pat1 = 3'd7;
reg signed [24:0] linienmodule_fast_b_iir1_y3 = 25'sd0;
wire linienmodule_fast_b_iir1_railed1;
reg signed [49:0] linienmodule_fast_b_iir1_zr3 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z3;
reg signed [49:0] linienmodule_fast_b_iir1_zr4 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z4;
reg signed [49:0] linienmodule_fast_b_iir1_zr5 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z5;
reg signed [49:0] linienmodule_fast_b_iir1_zr6 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z6;
reg signed [49:0] linienmodule_fast_b_iir1_zr7 = 50'sd0;
wire signed [49:0] linienmodule_fast_b_iir1_z7;
reg signed [24:0] linienmodule_fast_b_limitcsr1_limitcsr1_y1 = 25'sd0;
reg linienmodule_fast_b_limitcsr1_limitcsr1_error1 = 1'd0;
wire signed [27:0] linienmodule_fast_b_limitcsr1_x1;
reg [24:0] linienmodule_fast_b_limitcsr1_min_storage_full1 = 25'd16777216;
wire [24:0] linienmodule_fast_b_limitcsr1_min_storage1;
reg linienmodule_fast_b_limitcsr1_min_re1 = 1'd0;
reg [24:0] linienmodule_fast_b_limitcsr1_max_storage_full1 = 25'd16777215;
wire [24:0] linienmodule_fast_b_limitcsr1_max_storage1;
reg linienmodule_fast_b_limitcsr1_max_re1 = 1'd0;
wire signed [27:0] linienmodule_fast_b_limitcsr1_limit_x1;
reg signed [27:0] linienmodule_fast_b_limitcsr1_limit_y1;
reg signed [27:0] linienmodule_fast_b_limitcsr1_limit_max1 = 28'sd0;
reg signed [27:0] linienmodule_fast_b_limitcsr1_limit_min1 = 28'sd0;
reg linienmodule_fast_b_limitcsr1_limit_railed1;
wire [15:0] linienmodule_decimate_decimation;
reg [15:0] linienmodule_decimate_decimation_counter = 16'd0;
reg linienmodule_decimate_output = 1'd0;
wire decimated_clock_clk;
reg decimated_clock_rst = 1'd0;
wire signed [13:0] linienmodule_slowchain_input0;
wire signed [13:0] linienmodule_slowchain_output;
wire signed [24:0] linienmodule_slowchain_out;
wire signed [13:0] linienmodule_slowchain_input1;
wire linienmodule_slowchain_running;
reg [13:0] linienmodule_slowchain_setpoint_storage_full = 14'd0;
wire [13:0] linienmodule_slowchain_setpoint_storage;
reg linienmodule_slowchain_setpoint_re = 1'd0;
wire signed [13:0] linienmodule_slowchain_setpoint_signed;
reg signed [14:0] linienmodule_slowchain_error;
reg [13:0] linienmodule_slowchain_kp_storage_full = 14'd0;
wire [13:0] linienmodule_slowchain_kp_storage;
reg linienmodule_slowchain_kp_re = 1'd0;
wire signed [13:0] linienmodule_slowchain_kp_signed;
wire signed [27:0] linienmodule_slowchain_kp_mult;
wire signed [13:0] linienmodule_slowchain_output_p;
reg [13:0] linienmodule_slowchain_ki_storage_full = 14'd0;
wire [13:0] linienmodule_slowchain_ki_storage;
reg linienmodule_slowchain_ki_re = 1'd0;
reg linienmodule_slowchain_reset_storage_full = 1'd0;
wire linienmodule_slowchain_reset_storage;
reg linienmodule_slowchain_reset_re = 1'd0;
wire signed [13:0] linienmodule_slowchain_ki_signed;
wire signed [28:0] linienmodule_slowchain_ki_mult;
reg signed [31:0] linienmodule_slowchain_int_reg = 32'sd0;
wire signed [32:0] linienmodule_slowchain_int_sum;
wire signed [13:0] linienmodule_slowchain_int_out;
reg [3:0] linienmodule_slowchain_i_ttl_active = 4'd0;
reg [13:0] linienmodule_slowchain_kd_storage_full = 14'd0;
wire [13:0] linienmodule_slowchain_kd_storage;
reg linienmodule_slowchain_kd_re = 1'd0;
wire signed [13:0] linienmodule_slowchain_kd_signed;
wire signed [29:0] linienmodule_slowchain_kd_mult;
reg signed [22:0] linienmodule_slowchain_kd_reg = 23'sd0;
reg signed [22:0] linienmodule_slowchain_kd_reg_r = 23'sd0;
reg signed [22:0] linienmodule_slowchain_output_d = 23'sd0;
reg signed [50:0] linienmodule_slowchain_pid_sum = 51'sd0;
reg signed [13:0] linienmodule_slowchain_pid_out;
reg signed [13:0] linienmodule_slowchain_limitcsr_y = 14'sd0;
reg linienmodule_slowchain_limitcsr_error = 1'd0;
wire signed [18:0] linienmodule_slowchain_x;
reg [13:0] linienmodule_slowchain_min_storage_full = 14'd8192;
wire [13:0] linienmodule_slowchain_min_storage;
reg linienmodule_slowchain_min_re = 1'd0;
reg [13:0] linienmodule_slowchain_max_storage_full = 14'd8191;
wire [13:0] linienmodule_slowchain_max_storage;
reg linienmodule_slowchain_max_re = 1'd0;
wire signed [18:0] linienmodule_slowchain_limit_x;
reg signed [18:0] linienmodule_slowchain_limit_y;
reg signed [18:0] linienmodule_slowchain_limit_max = 19'sd0;
reg signed [18:0] linienmodule_slowchain_limit_min = 19'sd0;
reg linienmodule_slowchain_limit_railed;
wire linienmodule_scopegen_gpio_trigger;
wire linienmodule_scopegen_sweep_trigger;
wire linienmodule_scopegen_automatically_rearm;
wire linienmodule_scopegen_automatically_trigger;
reg linienmodule_scopegen_automatic_trigger_signal = 1'd0;
reg linienmodule_scopegen_storage_full = 1'd0;
wire linienmodule_scopegen_storage;
reg linienmodule_scopegen_re = 1'd0;
wire linienmodule_scopegen_scope_sys_rstn;
wire linienmodule_scopegen_scope_sys_clk;
wire [31:0] linienmodule_scopegen_scope_sys_addr;
wire [31:0] linienmodule_scopegen_scope_sys_wdata;
wire [3:0] linienmodule_scopegen_scope_sys_sel;
wire linienmodule_scopegen_scope_sys_wen;
wire linienmodule_scopegen_scope_sys_ren;
wire [31:0] linienmodule_scopegen_scope_sys_rdata;
wire linienmodule_scopegen_scope_sys_err;
wire linienmodule_scopegen_scope_sys_ack;
wire linienmodule_scopegen_asg_sys_rstn;
wire linienmodule_scopegen_asg_sys_clk;
wire [31:0] linienmodule_scopegen_asg_sys_addr;
wire [31:0] linienmodule_scopegen_asg_sys_wdata;
wire [3:0] linienmodule_scopegen_asg_sys_sel;
wire linienmodule_scopegen_asg_sys_wen;
wire linienmodule_scopegen_asg_sys_ren;
reg [31:0] linienmodule_scopegen_asg_sys_rdata = 32'd0;
reg linienmodule_scopegen_asg_sys_err = 1'd0;
reg linienmodule_scopegen_asg_sys_ack = 1'd0;
reg signed [24:0] linienmodule_scopegen_adc_a = 25'sd0;
reg signed [24:0] linienmodule_scopegen_adc_a_q = 25'sd0;
reg signed [24:0] linienmodule_scopegen_adc_b = 25'sd0;
reg signed [24:0] linienmodule_scopegen_adc_b_q = 25'sd0;
wire signed [24:0] linienmodule_scopegen_dac_a;
wire signed [24:0] linienmodule_scopegen_dac_b;
reg signed [13:0] linienmodule_scopegen_asg_a = 14'sd0;
reg signed [13:0] linienmodule_scopegen_asg_b = 14'sd0;
reg linienmodule_scopegen_asg_trig = 1'd0;
wire linienmodule_scopegen_writing_data_now;
wire signed [13:0] linienmodule_scopegen_scope_written_data;
wire [13:0] linienmodule_scopegen_scope_position;
wire [24:0] linienmodule_sig_status0;
wire linienmodule_csr0_x_clr_re;
wire linienmodule_csr0_x_clr_r;
reg linienmodule_csr0_x_clr_w = 1'd0;
reg [24:0] linienmodule_max_status0 = 25'd0;
reg [24:0] linienmodule_min_status0 = 25'd0;
wire [24:0] linienmodule_sig_status1;
wire linienmodule_csr1_out_i_clr_re;
wire linienmodule_csr1_out_i_clr_r;
reg linienmodule_csr1_out_i_clr_w = 1'd0;
reg [24:0] linienmodule_max_status1 = 25'd0;
reg [24:0] linienmodule_min_status1 = 25'd0;
wire [24:0] linienmodule_sig_status2;
wire linienmodule_csr2_out_q_clr_re;
wire linienmodule_csr2_out_q_clr_r;
reg linienmodule_csr2_out_q_clr_w = 1'd0;
reg [24:0] linienmodule_max_status2 = 25'd0;
reg [24:0] linienmodule_min_status2 = 25'd0;
wire [24:0] linienmodule_sig_status3;
wire linienmodule_csr3_x_clr_re;
wire linienmodule_csr3_x_clr_r;
reg linienmodule_csr3_x_clr_w = 1'd0;
reg [24:0] linienmodule_max_status3 = 25'd0;
reg [24:0] linienmodule_min_status3 = 25'd0;
wire [24:0] linienmodule_sig_status4;
wire linienmodule_csr4_out_i_clr_re;
wire linienmodule_csr4_out_i_clr_r;
reg linienmodule_csr4_out_i_clr_w = 1'd0;
reg [24:0] linienmodule_max_status4 = 25'd0;
reg [24:0] linienmodule_min_status4 = 25'd0;
wire [24:0] linienmodule_sig_status5;
wire linienmodule_csr5_out_q_clr_re;
wire linienmodule_csr5_out_q_clr_r;
reg linienmodule_csr5_out_q_clr_w = 1'd0;
reg [24:0] linienmodule_max_status5 = 25'd0;
reg [24:0] linienmodule_min_status5 = 25'd0;
wire [24:0] linienmodule_sig_status6;
wire linienmodule_out_clr_re;
wire linienmodule_out_clr_r;
reg linienmodule_out_clr_w = 1'd0;
reg [24:0] linienmodule_max_status6 = 25'd0;
reg [24:0] linienmodule_min_status6 = 25'd0;
wire [24:0] linienmodule_sig_status7;
wire linienmodule_dac_a_clr_re;
wire linienmodule_dac_a_clr_r;
reg linienmodule_dac_a_clr_w = 1'd0;
reg [24:0] linienmodule_max_status7 = 25'd0;
reg [24:0] linienmodule_min_status7 = 25'd0;
wire [24:0] linienmodule_sig_status8;
wire linienmodule_dac_b_clr_re;
wire linienmodule_dac_b_clr_r;
reg linienmodule_dac_b_clr_w = 1'd0;
reg [24:0] linienmodule_max_status8 = 25'd0;
reg [24:0] linienmodule_min_status8 = 25'd0;
wire [24:0] linienmodule_sig_status9;
wire linienmodule_control_signal_clr_re;
wire linienmodule_control_signal_clr_r;
reg linienmodule_control_signal_clr_w = 1'd0;
reg [24:0] linienmodule_max_status9 = 25'd0;
reg [24:0] linienmodule_min_status9 = 25'd0;
wire [24:0] linienmodule_sig_status10;
wire linienmodule_combined_error_signal_clr_re;
wire linienmodule_combined_error_signal_clr_r;
reg linienmodule_combined_error_signal_clr_w = 1'd0;
reg [24:0] linienmodule_max_status10 = 25'd0;
reg [24:0] linienmodule_min_status10 = 25'd0;
wire [24:0] linienmodule_sig_status11;
wire linienmodule_combined_error_signal_filtered_clr_re;
wire linienmodule_combined_error_signal_filtered_clr_r;
reg linienmodule_combined_error_signal_filtered_clr_w = 1'd0;
reg [24:0] linienmodule_max_status11 = 25'd0;
reg [24:0] linienmodule_min_status11 = 25'd0;
wire [8:0] linienmodule_state;
reg [8:0] linienmodule_state_status = 9'd0;
wire linienmodule_state_clr_re;
wire linienmodule_state_clr_r;
reg linienmodule_state_clr_w = 1'd0;
reg [8:0] linienmodule_csrstorage0_storage_full1 = 9'd0;
wire [8:0] linienmodule_csrstorage0_storage1;
reg linienmodule_csrstorage0_re1 = 1'd0;
reg [8:0] linienmodule_csrstorage1_storage_full1 = 9'd0;
wire [8:0] linienmodule_csrstorage1_storage1;
reg linienmodule_csrstorage1_re1 = 1'd0;
reg [8:0] linienmodule_csrstorage2_storage_full1 = 9'd0;
wire [8:0] linienmodule_csrstorage2_storage1;
reg linienmodule_csrstorage2_re1 = 1'd0;
reg [8:0] linienmodule_csrstorage3_storage_full = 9'd0;
wire [8:0] linienmodule_csrstorage3_storage;
reg linienmodule_csrstorage3_re = 1'd0;
reg [8:0] linienmodule_csrstorage4_storage_full = 9'd0;
wire [8:0] linienmodule_csrstorage4_storage;
reg linienmodule_csrstorage4_re = 1'd0;
reg [8:0] linienmodule_csrstorage5_storage_full = 9'd0;
wire [8:0] linienmodule_csrstorage5_storage;
reg linienmodule_csrstorage5_re = 1'd0;
reg [8:0] linienmodule_csrstorage6_storage_full = 9'd0;
wire [8:0] linienmodule_csrstorage6_storage;
reg linienmodule_csrstorage6_re = 1'd0;
reg [8:0] linienmodule_csrstorage7_storage_full = 9'd0;
wire [8:0] linienmodule_csrstorage7_storage;
reg linienmodule_csrstorage7_re = 1'd0;
reg [3:0] linienmodule_csrstorage8_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage8_storage;
reg linienmodule_csrstorage8_re = 1'd0;
reg [3:0] linienmodule_csrstorage9_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage9_storage;
reg linienmodule_csrstorage9_re = 1'd0;
reg [3:0] linienmodule_csrstorage10_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage10_storage;
reg linienmodule_csrstorage10_re = 1'd0;
reg [3:0] linienmodule_csrstorage11_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage11_storage;
reg linienmodule_csrstorage11_re = 1'd0;
reg [3:0] linienmodule_csrstorage12_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage12_storage;
reg linienmodule_csrstorage12_re = 1'd0;
reg [3:0] linienmodule_csrstorage13_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage13_storage;
reg linienmodule_csrstorage13_re = 1'd0;
reg [3:0] linienmodule_csrstorage14_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage14_storage;
reg linienmodule_csrstorage14_re = 1'd0;
reg [3:0] linienmodule_csrstorage15_storage_full = 4'd0;
wire [3:0] linienmodule_csrstorage15_storage;
reg linienmodule_csrstorage15_re = 1'd0;
wire [13:0] linienmodule_interface0_bank_bus_adr;
wire linienmodule_interface0_bank_bus_we;
wire [7:0] linienmodule_interface0_bank_bus_dat_w;
reg [7:0] linienmodule_interface0_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank0_dna7_re;
wire [7:0] linienmodule_csrbank0_dna7_r;
wire [7:0] linienmodule_csrbank0_dna7_w;
wire linienmodule_csrbank0_dna6_re;
wire [7:0] linienmodule_csrbank0_dna6_r;
wire [7:0] linienmodule_csrbank0_dna6_w;
wire linienmodule_csrbank0_dna5_re;
wire [7:0] linienmodule_csrbank0_dna5_r;
wire [7:0] linienmodule_csrbank0_dna5_w;
wire linienmodule_csrbank0_dna4_re;
wire [7:0] linienmodule_csrbank0_dna4_r;
wire [7:0] linienmodule_csrbank0_dna4_w;
wire linienmodule_csrbank0_dna3_re;
wire [7:0] linienmodule_csrbank0_dna3_r;
wire [7:0] linienmodule_csrbank0_dna3_w;
wire linienmodule_csrbank0_dna2_re;
wire [7:0] linienmodule_csrbank0_dna2_r;
wire [7:0] linienmodule_csrbank0_dna2_w;
wire linienmodule_csrbank0_dna1_re;
wire [7:0] linienmodule_csrbank0_dna1_r;
wire [7:0] linienmodule_csrbank0_dna1_w;
wire linienmodule_csrbank0_dna0_re;
wire [7:0] linienmodule_csrbank0_dna0_r;
wire [7:0] linienmodule_csrbank0_dna0_w;
wire linienmodule_csrbank0_sel;
wire [13:0] linienmodule_interface1_bank_bus_adr;
wire linienmodule_interface1_bank_bus_we;
wire [7:0] linienmodule_interface1_bank_bus_dat_w;
reg [7:0] linienmodule_interface1_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank1_y_tap0_re;
wire [1:0] linienmodule_csrbank1_y_tap0_r;
wire [1:0] linienmodule_csrbank1_y_tap0_w;
wire linienmodule_csrbank1_invert0_re;
wire linienmodule_csrbank1_invert0_r;
wire linienmodule_csrbank1_invert0_w;
wire linienmodule_csrbank1_demod_delay3_re;
wire [7:0] linienmodule_csrbank1_demod_delay3_r;
wire [7:0] linienmodule_csrbank1_demod_delay3_w;
wire linienmodule_csrbank1_demod_delay2_re;
wire [7:0] linienmodule_csrbank1_demod_delay2_r;
wire [7:0] linienmodule_csrbank1_demod_delay2_w;
wire linienmodule_csrbank1_demod_delay1_re;
wire [7:0] linienmodule_csrbank1_demod_delay1_r;
wire [7:0] linienmodule_csrbank1_demod_delay1_w;
wire linienmodule_csrbank1_demod_delay0_re;
wire [7:0] linienmodule_csrbank1_demod_delay0_r;
wire [7:0] linienmodule_csrbank1_demod_delay0_w;
wire linienmodule_csrbank1_demod_multiplier0_re;
wire [3:0] linienmodule_csrbank1_demod_multiplier0_r;
wire [3:0] linienmodule_csrbank1_demod_multiplier0_w;
wire linienmodule_csrbank1_x_limit_1_min3_re;
wire linienmodule_csrbank1_x_limit_1_min3_r;
wire linienmodule_csrbank1_x_limit_1_min3_w;
wire linienmodule_csrbank1_x_limit_1_min2_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_min2_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_min2_w;
wire linienmodule_csrbank1_x_limit_1_min1_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_min1_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_min1_w;
wire linienmodule_csrbank1_x_limit_1_min0_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_min0_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_min0_w;
wire linienmodule_csrbank1_x_limit_1_max3_re;
wire linienmodule_csrbank1_x_limit_1_max3_r;
wire linienmodule_csrbank1_x_limit_1_max3_w;
wire linienmodule_csrbank1_x_limit_1_max2_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_max2_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_max2_w;
wire linienmodule_csrbank1_x_limit_1_max1_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_max1_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_max1_w;
wire linienmodule_csrbank1_x_limit_1_max0_re;
wire [7:0] linienmodule_csrbank1_x_limit_1_max0_r;
wire [7:0] linienmodule_csrbank1_x_limit_1_max0_w;
wire linienmodule_csrbank1_iir_c_1_z03_re;
wire [2:0] linienmodule_csrbank1_iir_c_1_z03_r;
wire [2:0] linienmodule_csrbank1_iir_c_1_z03_w;
wire linienmodule_csrbank1_iir_c_1_z02_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_z02_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_z02_w;
wire linienmodule_csrbank1_iir_c_1_z01_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_z01_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_z01_w;
wire linienmodule_csrbank1_iir_c_1_z00_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_z00_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_z00_w;
wire linienmodule_csrbank1_iir_c_1_a13_re;
wire linienmodule_csrbank1_iir_c_1_a13_r;
wire linienmodule_csrbank1_iir_c_1_a13_w;
wire linienmodule_csrbank1_iir_c_1_a12_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_a12_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_a12_w;
wire linienmodule_csrbank1_iir_c_1_a11_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_a11_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_a11_w;
wire linienmodule_csrbank1_iir_c_1_a10_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_a10_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_a10_w;
wire linienmodule_csrbank1_iir_c_1_b03_re;
wire linienmodule_csrbank1_iir_c_1_b03_r;
wire linienmodule_csrbank1_iir_c_1_b03_w;
wire linienmodule_csrbank1_iir_c_1_b02_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b02_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b02_w;
wire linienmodule_csrbank1_iir_c_1_b01_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b01_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b01_w;
wire linienmodule_csrbank1_iir_c_1_b00_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b00_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b00_w;
wire linienmodule_csrbank1_iir_c_1_b13_re;
wire linienmodule_csrbank1_iir_c_1_b13_r;
wire linienmodule_csrbank1_iir_c_1_b13_w;
wire linienmodule_csrbank1_iir_c_1_b12_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b12_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b12_w;
wire linienmodule_csrbank1_iir_c_1_b11_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b11_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b11_w;
wire linienmodule_csrbank1_iir_c_1_b10_re;
wire [7:0] linienmodule_csrbank1_iir_c_1_b10_r;
wire [7:0] linienmodule_csrbank1_iir_c_1_b10_w;
wire linienmodule_csrbank1_iir_d_1_z03_re;
wire [2:0] linienmodule_csrbank1_iir_d_1_z03_r;
wire [2:0] linienmodule_csrbank1_iir_d_1_z03_w;
wire linienmodule_csrbank1_iir_d_1_z02_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_z02_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_z02_w;
wire linienmodule_csrbank1_iir_d_1_z01_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_z01_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_z01_w;
wire linienmodule_csrbank1_iir_d_1_z00_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_z00_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_z00_w;
wire linienmodule_csrbank1_iir_d_1_a13_re;
wire linienmodule_csrbank1_iir_d_1_a13_r;
wire linienmodule_csrbank1_iir_d_1_a13_w;
wire linienmodule_csrbank1_iir_d_1_a12_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a12_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a12_w;
wire linienmodule_csrbank1_iir_d_1_a11_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a11_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a11_w;
wire linienmodule_csrbank1_iir_d_1_a10_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a10_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a10_w;
wire linienmodule_csrbank1_iir_d_1_a23_re;
wire linienmodule_csrbank1_iir_d_1_a23_r;
wire linienmodule_csrbank1_iir_d_1_a23_w;
wire linienmodule_csrbank1_iir_d_1_a22_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a22_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a22_w;
wire linienmodule_csrbank1_iir_d_1_a21_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a21_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a21_w;
wire linienmodule_csrbank1_iir_d_1_a20_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_a20_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_a20_w;
wire linienmodule_csrbank1_iir_d_1_b03_re;
wire linienmodule_csrbank1_iir_d_1_b03_r;
wire linienmodule_csrbank1_iir_d_1_b03_w;
wire linienmodule_csrbank1_iir_d_1_b02_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b02_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b02_w;
wire linienmodule_csrbank1_iir_d_1_b01_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b01_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b01_w;
wire linienmodule_csrbank1_iir_d_1_b00_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b00_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b00_w;
wire linienmodule_csrbank1_iir_d_1_b13_re;
wire linienmodule_csrbank1_iir_d_1_b13_r;
wire linienmodule_csrbank1_iir_d_1_b13_w;
wire linienmodule_csrbank1_iir_d_1_b12_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b12_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b12_w;
wire linienmodule_csrbank1_iir_d_1_b11_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b11_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b11_w;
wire linienmodule_csrbank1_iir_d_1_b10_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b10_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b10_w;
wire linienmodule_csrbank1_iir_d_1_b23_re;
wire linienmodule_csrbank1_iir_d_1_b23_r;
wire linienmodule_csrbank1_iir_d_1_b23_w;
wire linienmodule_csrbank1_iir_d_1_b22_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b22_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b22_w;
wire linienmodule_csrbank1_iir_d_1_b21_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b21_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b21_w;
wire linienmodule_csrbank1_iir_d_1_b20_re;
wire [7:0] linienmodule_csrbank1_iir_d_1_b20_r;
wire [7:0] linienmodule_csrbank1_iir_d_1_b20_w;
wire linienmodule_csrbank1_y_limit_1_min3_re;
wire linienmodule_csrbank1_y_limit_1_min3_r;
wire linienmodule_csrbank1_y_limit_1_min3_w;
wire linienmodule_csrbank1_y_limit_1_min2_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_min2_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_min2_w;
wire linienmodule_csrbank1_y_limit_1_min1_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_min1_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_min1_w;
wire linienmodule_csrbank1_y_limit_1_min0_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_min0_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_min0_w;
wire linienmodule_csrbank1_y_limit_1_max3_re;
wire linienmodule_csrbank1_y_limit_1_max3_r;
wire linienmodule_csrbank1_y_limit_1_max3_w;
wire linienmodule_csrbank1_y_limit_1_max2_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_max2_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_max2_w;
wire linienmodule_csrbank1_y_limit_1_max1_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_max1_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_max1_w;
wire linienmodule_csrbank1_y_limit_1_max0_re;
wire [7:0] linienmodule_csrbank1_y_limit_1_max0_r;
wire [7:0] linienmodule_csrbank1_y_limit_1_max0_w;
wire linienmodule_csrbank1_x_limit_2_min3_re;
wire linienmodule_csrbank1_x_limit_2_min3_r;
wire linienmodule_csrbank1_x_limit_2_min3_w;
wire linienmodule_csrbank1_x_limit_2_min2_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_min2_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_min2_w;
wire linienmodule_csrbank1_x_limit_2_min1_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_min1_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_min1_w;
wire linienmodule_csrbank1_x_limit_2_min0_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_min0_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_min0_w;
wire linienmodule_csrbank1_x_limit_2_max3_re;
wire linienmodule_csrbank1_x_limit_2_max3_r;
wire linienmodule_csrbank1_x_limit_2_max3_w;
wire linienmodule_csrbank1_x_limit_2_max2_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_max2_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_max2_w;
wire linienmodule_csrbank1_x_limit_2_max1_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_max1_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_max1_w;
wire linienmodule_csrbank1_x_limit_2_max0_re;
wire [7:0] linienmodule_csrbank1_x_limit_2_max0_r;
wire [7:0] linienmodule_csrbank1_x_limit_2_max0_w;
wire linienmodule_csrbank1_iir_c_2_z03_re;
wire [2:0] linienmodule_csrbank1_iir_c_2_z03_r;
wire [2:0] linienmodule_csrbank1_iir_c_2_z03_w;
wire linienmodule_csrbank1_iir_c_2_z02_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_z02_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_z02_w;
wire linienmodule_csrbank1_iir_c_2_z01_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_z01_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_z01_w;
wire linienmodule_csrbank1_iir_c_2_z00_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_z00_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_z00_w;
wire linienmodule_csrbank1_iir_c_2_a13_re;
wire linienmodule_csrbank1_iir_c_2_a13_r;
wire linienmodule_csrbank1_iir_c_2_a13_w;
wire linienmodule_csrbank1_iir_c_2_a12_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_a12_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_a12_w;
wire linienmodule_csrbank1_iir_c_2_a11_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_a11_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_a11_w;
wire linienmodule_csrbank1_iir_c_2_a10_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_a10_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_a10_w;
wire linienmodule_csrbank1_iir_c_2_b03_re;
wire linienmodule_csrbank1_iir_c_2_b03_r;
wire linienmodule_csrbank1_iir_c_2_b03_w;
wire linienmodule_csrbank1_iir_c_2_b02_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b02_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b02_w;
wire linienmodule_csrbank1_iir_c_2_b01_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b01_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b01_w;
wire linienmodule_csrbank1_iir_c_2_b00_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b00_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b00_w;
wire linienmodule_csrbank1_iir_c_2_b13_re;
wire linienmodule_csrbank1_iir_c_2_b13_r;
wire linienmodule_csrbank1_iir_c_2_b13_w;
wire linienmodule_csrbank1_iir_c_2_b12_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b12_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b12_w;
wire linienmodule_csrbank1_iir_c_2_b11_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b11_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b11_w;
wire linienmodule_csrbank1_iir_c_2_b10_re;
wire [7:0] linienmodule_csrbank1_iir_c_2_b10_r;
wire [7:0] linienmodule_csrbank1_iir_c_2_b10_w;
wire linienmodule_csrbank1_iir_d_2_z03_re;
wire [2:0] linienmodule_csrbank1_iir_d_2_z03_r;
wire [2:0] linienmodule_csrbank1_iir_d_2_z03_w;
wire linienmodule_csrbank1_iir_d_2_z02_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_z02_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_z02_w;
wire linienmodule_csrbank1_iir_d_2_z01_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_z01_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_z01_w;
wire linienmodule_csrbank1_iir_d_2_z00_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_z00_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_z00_w;
wire linienmodule_csrbank1_iir_d_2_a13_re;
wire linienmodule_csrbank1_iir_d_2_a13_r;
wire linienmodule_csrbank1_iir_d_2_a13_w;
wire linienmodule_csrbank1_iir_d_2_a12_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a12_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a12_w;
wire linienmodule_csrbank1_iir_d_2_a11_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a11_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a11_w;
wire linienmodule_csrbank1_iir_d_2_a10_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a10_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a10_w;
wire linienmodule_csrbank1_iir_d_2_a23_re;
wire linienmodule_csrbank1_iir_d_2_a23_r;
wire linienmodule_csrbank1_iir_d_2_a23_w;
wire linienmodule_csrbank1_iir_d_2_a22_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a22_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a22_w;
wire linienmodule_csrbank1_iir_d_2_a21_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a21_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a21_w;
wire linienmodule_csrbank1_iir_d_2_a20_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_a20_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_a20_w;
wire linienmodule_csrbank1_iir_d_2_b03_re;
wire linienmodule_csrbank1_iir_d_2_b03_r;
wire linienmodule_csrbank1_iir_d_2_b03_w;
wire linienmodule_csrbank1_iir_d_2_b02_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b02_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b02_w;
wire linienmodule_csrbank1_iir_d_2_b01_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b01_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b01_w;
wire linienmodule_csrbank1_iir_d_2_b00_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b00_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b00_w;
wire linienmodule_csrbank1_iir_d_2_b13_re;
wire linienmodule_csrbank1_iir_d_2_b13_r;
wire linienmodule_csrbank1_iir_d_2_b13_w;
wire linienmodule_csrbank1_iir_d_2_b12_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b12_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b12_w;
wire linienmodule_csrbank1_iir_d_2_b11_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b11_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b11_w;
wire linienmodule_csrbank1_iir_d_2_b10_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b10_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b10_w;
wire linienmodule_csrbank1_iir_d_2_b23_re;
wire linienmodule_csrbank1_iir_d_2_b23_r;
wire linienmodule_csrbank1_iir_d_2_b23_w;
wire linienmodule_csrbank1_iir_d_2_b22_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b22_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b22_w;
wire linienmodule_csrbank1_iir_d_2_b21_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b21_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b21_w;
wire linienmodule_csrbank1_iir_d_2_b20_re;
wire [7:0] linienmodule_csrbank1_iir_d_2_b20_r;
wire [7:0] linienmodule_csrbank1_iir_d_2_b20_w;
wire linienmodule_csrbank1_y_limit_2_min3_re;
wire linienmodule_csrbank1_y_limit_2_min3_r;
wire linienmodule_csrbank1_y_limit_2_min3_w;
wire linienmodule_csrbank1_y_limit_2_min2_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_min2_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_min2_w;
wire linienmodule_csrbank1_y_limit_2_min1_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_min1_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_min1_w;
wire linienmodule_csrbank1_y_limit_2_min0_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_min0_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_min0_w;
wire linienmodule_csrbank1_y_limit_2_max3_re;
wire linienmodule_csrbank1_y_limit_2_max3_r;
wire linienmodule_csrbank1_y_limit_2_max3_w;
wire linienmodule_csrbank1_y_limit_2_max2_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_max2_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_max2_w;
wire linienmodule_csrbank1_y_limit_2_max1_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_max1_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_max1_w;
wire linienmodule_csrbank1_y_limit_2_max0_re;
wire [7:0] linienmodule_csrbank1_y_limit_2_max0_r;
wire [7:0] linienmodule_csrbank1_y_limit_2_max0_w;
wire linienmodule_csrbank1_x_max3_re;
wire linienmodule_csrbank1_x_max3_r;
wire linienmodule_csrbank1_x_max3_w;
wire linienmodule_csrbank1_x_max2_re;
wire [7:0] linienmodule_csrbank1_x_max2_r;
wire [7:0] linienmodule_csrbank1_x_max2_w;
wire linienmodule_csrbank1_x_max1_re;
wire [7:0] linienmodule_csrbank1_x_max1_r;
wire [7:0] linienmodule_csrbank1_x_max1_w;
wire linienmodule_csrbank1_x_max0_re;
wire [7:0] linienmodule_csrbank1_x_max0_r;
wire [7:0] linienmodule_csrbank1_x_max0_w;
wire linienmodule_csrbank1_x_min3_re;
wire linienmodule_csrbank1_x_min3_r;
wire linienmodule_csrbank1_x_min3_w;
wire linienmodule_csrbank1_x_min2_re;
wire [7:0] linienmodule_csrbank1_x_min2_r;
wire [7:0] linienmodule_csrbank1_x_min2_w;
wire linienmodule_csrbank1_x_min1_re;
wire [7:0] linienmodule_csrbank1_x_min1_r;
wire [7:0] linienmodule_csrbank1_x_min1_w;
wire linienmodule_csrbank1_x_min0_re;
wire [7:0] linienmodule_csrbank1_x_min0_r;
wire [7:0] linienmodule_csrbank1_x_min0_w;
wire linienmodule_csrbank1_out_i_max3_re;
wire linienmodule_csrbank1_out_i_max3_r;
wire linienmodule_csrbank1_out_i_max3_w;
wire linienmodule_csrbank1_out_i_max2_re;
wire [7:0] linienmodule_csrbank1_out_i_max2_r;
wire [7:0] linienmodule_csrbank1_out_i_max2_w;
wire linienmodule_csrbank1_out_i_max1_re;
wire [7:0] linienmodule_csrbank1_out_i_max1_r;
wire [7:0] linienmodule_csrbank1_out_i_max1_w;
wire linienmodule_csrbank1_out_i_max0_re;
wire [7:0] linienmodule_csrbank1_out_i_max0_r;
wire [7:0] linienmodule_csrbank1_out_i_max0_w;
wire linienmodule_csrbank1_out_i_min3_re;
wire linienmodule_csrbank1_out_i_min3_r;
wire linienmodule_csrbank1_out_i_min3_w;
wire linienmodule_csrbank1_out_i_min2_re;
wire [7:0] linienmodule_csrbank1_out_i_min2_r;
wire [7:0] linienmodule_csrbank1_out_i_min2_w;
wire linienmodule_csrbank1_out_i_min1_re;
wire [7:0] linienmodule_csrbank1_out_i_min1_r;
wire [7:0] linienmodule_csrbank1_out_i_min1_w;
wire linienmodule_csrbank1_out_i_min0_re;
wire [7:0] linienmodule_csrbank1_out_i_min0_r;
wire [7:0] linienmodule_csrbank1_out_i_min0_w;
wire linienmodule_csrbank1_out_q_max3_re;
wire linienmodule_csrbank1_out_q_max3_r;
wire linienmodule_csrbank1_out_q_max3_w;
wire linienmodule_csrbank1_out_q_max2_re;
wire [7:0] linienmodule_csrbank1_out_q_max2_r;
wire [7:0] linienmodule_csrbank1_out_q_max2_w;
wire linienmodule_csrbank1_out_q_max1_re;
wire [7:0] linienmodule_csrbank1_out_q_max1_r;
wire [7:0] linienmodule_csrbank1_out_q_max1_w;
wire linienmodule_csrbank1_out_q_max0_re;
wire [7:0] linienmodule_csrbank1_out_q_max0_r;
wire [7:0] linienmodule_csrbank1_out_q_max0_w;
wire linienmodule_csrbank1_out_q_min3_re;
wire linienmodule_csrbank1_out_q_min3_r;
wire linienmodule_csrbank1_out_q_min3_w;
wire linienmodule_csrbank1_out_q_min2_re;
wire [7:0] linienmodule_csrbank1_out_q_min2_r;
wire [7:0] linienmodule_csrbank1_out_q_min2_w;
wire linienmodule_csrbank1_out_q_min1_re;
wire [7:0] linienmodule_csrbank1_out_q_min1_r;
wire [7:0] linienmodule_csrbank1_out_q_min1_w;
wire linienmodule_csrbank1_out_q_min0_re;
wire [7:0] linienmodule_csrbank1_out_q_min0_r;
wire [7:0] linienmodule_csrbank1_out_q_min0_w;
wire linienmodule_csrbank1_dx_sel0_re;
wire [3:0] linienmodule_csrbank1_dx_sel0_r;
wire [3:0] linienmodule_csrbank1_dx_sel0_w;
wire linienmodule_csrbank1_dy_sel0_re;
wire [3:0] linienmodule_csrbank1_dy_sel0_r;
wire [3:0] linienmodule_csrbank1_dy_sel0_w;
wire linienmodule_csrbank1_sel;
wire [13:0] linienmodule_interface2_bank_bus_adr;
wire linienmodule_interface2_bank_bus_we;
wire [7:0] linienmodule_interface2_bank_bus_dat_w;
reg [7:0] linienmodule_interface2_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank2_y_tap0_re;
wire [1:0] linienmodule_csrbank2_y_tap0_r;
wire [1:0] linienmodule_csrbank2_y_tap0_w;
wire linienmodule_csrbank2_invert0_re;
wire linienmodule_csrbank2_invert0_r;
wire linienmodule_csrbank2_invert0_w;
wire linienmodule_csrbank2_demod_delay3_re;
wire [7:0] linienmodule_csrbank2_demod_delay3_r;
wire [7:0] linienmodule_csrbank2_demod_delay3_w;
wire linienmodule_csrbank2_demod_delay2_re;
wire [7:0] linienmodule_csrbank2_demod_delay2_r;
wire [7:0] linienmodule_csrbank2_demod_delay2_w;
wire linienmodule_csrbank2_demod_delay1_re;
wire [7:0] linienmodule_csrbank2_demod_delay1_r;
wire [7:0] linienmodule_csrbank2_demod_delay1_w;
wire linienmodule_csrbank2_demod_delay0_re;
wire [7:0] linienmodule_csrbank2_demod_delay0_r;
wire [7:0] linienmodule_csrbank2_demod_delay0_w;
wire linienmodule_csrbank2_demod_multiplier0_re;
wire [3:0] linienmodule_csrbank2_demod_multiplier0_r;
wire [3:0] linienmodule_csrbank2_demod_multiplier0_w;
wire linienmodule_csrbank2_x_limit_1_min3_re;
wire linienmodule_csrbank2_x_limit_1_min3_r;
wire linienmodule_csrbank2_x_limit_1_min3_w;
wire linienmodule_csrbank2_x_limit_1_min2_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_min2_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_min2_w;
wire linienmodule_csrbank2_x_limit_1_min1_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_min1_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_min1_w;
wire linienmodule_csrbank2_x_limit_1_min0_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_min0_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_min0_w;
wire linienmodule_csrbank2_x_limit_1_max3_re;
wire linienmodule_csrbank2_x_limit_1_max3_r;
wire linienmodule_csrbank2_x_limit_1_max3_w;
wire linienmodule_csrbank2_x_limit_1_max2_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_max2_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_max2_w;
wire linienmodule_csrbank2_x_limit_1_max1_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_max1_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_max1_w;
wire linienmodule_csrbank2_x_limit_1_max0_re;
wire [7:0] linienmodule_csrbank2_x_limit_1_max0_r;
wire [7:0] linienmodule_csrbank2_x_limit_1_max0_w;
wire linienmodule_csrbank2_iir_c_1_z03_re;
wire [2:0] linienmodule_csrbank2_iir_c_1_z03_r;
wire [2:0] linienmodule_csrbank2_iir_c_1_z03_w;
wire linienmodule_csrbank2_iir_c_1_z02_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_z02_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_z02_w;
wire linienmodule_csrbank2_iir_c_1_z01_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_z01_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_z01_w;
wire linienmodule_csrbank2_iir_c_1_z00_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_z00_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_z00_w;
wire linienmodule_csrbank2_iir_c_1_a13_re;
wire linienmodule_csrbank2_iir_c_1_a13_r;
wire linienmodule_csrbank2_iir_c_1_a13_w;
wire linienmodule_csrbank2_iir_c_1_a12_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_a12_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_a12_w;
wire linienmodule_csrbank2_iir_c_1_a11_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_a11_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_a11_w;
wire linienmodule_csrbank2_iir_c_1_a10_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_a10_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_a10_w;
wire linienmodule_csrbank2_iir_c_1_b03_re;
wire linienmodule_csrbank2_iir_c_1_b03_r;
wire linienmodule_csrbank2_iir_c_1_b03_w;
wire linienmodule_csrbank2_iir_c_1_b02_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b02_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b02_w;
wire linienmodule_csrbank2_iir_c_1_b01_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b01_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b01_w;
wire linienmodule_csrbank2_iir_c_1_b00_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b00_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b00_w;
wire linienmodule_csrbank2_iir_c_1_b13_re;
wire linienmodule_csrbank2_iir_c_1_b13_r;
wire linienmodule_csrbank2_iir_c_1_b13_w;
wire linienmodule_csrbank2_iir_c_1_b12_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b12_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b12_w;
wire linienmodule_csrbank2_iir_c_1_b11_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b11_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b11_w;
wire linienmodule_csrbank2_iir_c_1_b10_re;
wire [7:0] linienmodule_csrbank2_iir_c_1_b10_r;
wire [7:0] linienmodule_csrbank2_iir_c_1_b10_w;
wire linienmodule_csrbank2_iir_d_1_z03_re;
wire [2:0] linienmodule_csrbank2_iir_d_1_z03_r;
wire [2:0] linienmodule_csrbank2_iir_d_1_z03_w;
wire linienmodule_csrbank2_iir_d_1_z02_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_z02_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_z02_w;
wire linienmodule_csrbank2_iir_d_1_z01_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_z01_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_z01_w;
wire linienmodule_csrbank2_iir_d_1_z00_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_z00_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_z00_w;
wire linienmodule_csrbank2_iir_d_1_a13_re;
wire linienmodule_csrbank2_iir_d_1_a13_r;
wire linienmodule_csrbank2_iir_d_1_a13_w;
wire linienmodule_csrbank2_iir_d_1_a12_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a12_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a12_w;
wire linienmodule_csrbank2_iir_d_1_a11_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a11_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a11_w;
wire linienmodule_csrbank2_iir_d_1_a10_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a10_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a10_w;
wire linienmodule_csrbank2_iir_d_1_a23_re;
wire linienmodule_csrbank2_iir_d_1_a23_r;
wire linienmodule_csrbank2_iir_d_1_a23_w;
wire linienmodule_csrbank2_iir_d_1_a22_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a22_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a22_w;
wire linienmodule_csrbank2_iir_d_1_a21_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a21_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a21_w;
wire linienmodule_csrbank2_iir_d_1_a20_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_a20_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_a20_w;
wire linienmodule_csrbank2_iir_d_1_b03_re;
wire linienmodule_csrbank2_iir_d_1_b03_r;
wire linienmodule_csrbank2_iir_d_1_b03_w;
wire linienmodule_csrbank2_iir_d_1_b02_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b02_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b02_w;
wire linienmodule_csrbank2_iir_d_1_b01_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b01_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b01_w;
wire linienmodule_csrbank2_iir_d_1_b00_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b00_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b00_w;
wire linienmodule_csrbank2_iir_d_1_b13_re;
wire linienmodule_csrbank2_iir_d_1_b13_r;
wire linienmodule_csrbank2_iir_d_1_b13_w;
wire linienmodule_csrbank2_iir_d_1_b12_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b12_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b12_w;
wire linienmodule_csrbank2_iir_d_1_b11_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b11_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b11_w;
wire linienmodule_csrbank2_iir_d_1_b10_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b10_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b10_w;
wire linienmodule_csrbank2_iir_d_1_b23_re;
wire linienmodule_csrbank2_iir_d_1_b23_r;
wire linienmodule_csrbank2_iir_d_1_b23_w;
wire linienmodule_csrbank2_iir_d_1_b22_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b22_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b22_w;
wire linienmodule_csrbank2_iir_d_1_b21_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b21_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b21_w;
wire linienmodule_csrbank2_iir_d_1_b20_re;
wire [7:0] linienmodule_csrbank2_iir_d_1_b20_r;
wire [7:0] linienmodule_csrbank2_iir_d_1_b20_w;
wire linienmodule_csrbank2_y_limit_1_min3_re;
wire linienmodule_csrbank2_y_limit_1_min3_r;
wire linienmodule_csrbank2_y_limit_1_min3_w;
wire linienmodule_csrbank2_y_limit_1_min2_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_min2_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_min2_w;
wire linienmodule_csrbank2_y_limit_1_min1_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_min1_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_min1_w;
wire linienmodule_csrbank2_y_limit_1_min0_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_min0_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_min0_w;
wire linienmodule_csrbank2_y_limit_1_max3_re;
wire linienmodule_csrbank2_y_limit_1_max3_r;
wire linienmodule_csrbank2_y_limit_1_max3_w;
wire linienmodule_csrbank2_y_limit_1_max2_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_max2_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_max2_w;
wire linienmodule_csrbank2_y_limit_1_max1_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_max1_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_max1_w;
wire linienmodule_csrbank2_y_limit_1_max0_re;
wire [7:0] linienmodule_csrbank2_y_limit_1_max0_r;
wire [7:0] linienmodule_csrbank2_y_limit_1_max0_w;
wire linienmodule_csrbank2_x_limit_2_min3_re;
wire linienmodule_csrbank2_x_limit_2_min3_r;
wire linienmodule_csrbank2_x_limit_2_min3_w;
wire linienmodule_csrbank2_x_limit_2_min2_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_min2_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_min2_w;
wire linienmodule_csrbank2_x_limit_2_min1_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_min1_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_min1_w;
wire linienmodule_csrbank2_x_limit_2_min0_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_min0_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_min0_w;
wire linienmodule_csrbank2_x_limit_2_max3_re;
wire linienmodule_csrbank2_x_limit_2_max3_r;
wire linienmodule_csrbank2_x_limit_2_max3_w;
wire linienmodule_csrbank2_x_limit_2_max2_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_max2_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_max2_w;
wire linienmodule_csrbank2_x_limit_2_max1_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_max1_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_max1_w;
wire linienmodule_csrbank2_x_limit_2_max0_re;
wire [7:0] linienmodule_csrbank2_x_limit_2_max0_r;
wire [7:0] linienmodule_csrbank2_x_limit_2_max0_w;
wire linienmodule_csrbank2_iir_c_2_z03_re;
wire [2:0] linienmodule_csrbank2_iir_c_2_z03_r;
wire [2:0] linienmodule_csrbank2_iir_c_2_z03_w;
wire linienmodule_csrbank2_iir_c_2_z02_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_z02_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_z02_w;
wire linienmodule_csrbank2_iir_c_2_z01_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_z01_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_z01_w;
wire linienmodule_csrbank2_iir_c_2_z00_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_z00_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_z00_w;
wire linienmodule_csrbank2_iir_c_2_a13_re;
wire linienmodule_csrbank2_iir_c_2_a13_r;
wire linienmodule_csrbank2_iir_c_2_a13_w;
wire linienmodule_csrbank2_iir_c_2_a12_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_a12_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_a12_w;
wire linienmodule_csrbank2_iir_c_2_a11_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_a11_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_a11_w;
wire linienmodule_csrbank2_iir_c_2_a10_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_a10_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_a10_w;
wire linienmodule_csrbank2_iir_c_2_b03_re;
wire linienmodule_csrbank2_iir_c_2_b03_r;
wire linienmodule_csrbank2_iir_c_2_b03_w;
wire linienmodule_csrbank2_iir_c_2_b02_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b02_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b02_w;
wire linienmodule_csrbank2_iir_c_2_b01_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b01_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b01_w;
wire linienmodule_csrbank2_iir_c_2_b00_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b00_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b00_w;
wire linienmodule_csrbank2_iir_c_2_b13_re;
wire linienmodule_csrbank2_iir_c_2_b13_r;
wire linienmodule_csrbank2_iir_c_2_b13_w;
wire linienmodule_csrbank2_iir_c_2_b12_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b12_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b12_w;
wire linienmodule_csrbank2_iir_c_2_b11_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b11_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b11_w;
wire linienmodule_csrbank2_iir_c_2_b10_re;
wire [7:0] linienmodule_csrbank2_iir_c_2_b10_r;
wire [7:0] linienmodule_csrbank2_iir_c_2_b10_w;
wire linienmodule_csrbank2_iir_d_2_z03_re;
wire [2:0] linienmodule_csrbank2_iir_d_2_z03_r;
wire [2:0] linienmodule_csrbank2_iir_d_2_z03_w;
wire linienmodule_csrbank2_iir_d_2_z02_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_z02_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_z02_w;
wire linienmodule_csrbank2_iir_d_2_z01_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_z01_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_z01_w;
wire linienmodule_csrbank2_iir_d_2_z00_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_z00_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_z00_w;
wire linienmodule_csrbank2_iir_d_2_a13_re;
wire linienmodule_csrbank2_iir_d_2_a13_r;
wire linienmodule_csrbank2_iir_d_2_a13_w;
wire linienmodule_csrbank2_iir_d_2_a12_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a12_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a12_w;
wire linienmodule_csrbank2_iir_d_2_a11_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a11_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a11_w;
wire linienmodule_csrbank2_iir_d_2_a10_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a10_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a10_w;
wire linienmodule_csrbank2_iir_d_2_a23_re;
wire linienmodule_csrbank2_iir_d_2_a23_r;
wire linienmodule_csrbank2_iir_d_2_a23_w;
wire linienmodule_csrbank2_iir_d_2_a22_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a22_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a22_w;
wire linienmodule_csrbank2_iir_d_2_a21_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a21_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a21_w;
wire linienmodule_csrbank2_iir_d_2_a20_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_a20_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_a20_w;
wire linienmodule_csrbank2_iir_d_2_b03_re;
wire linienmodule_csrbank2_iir_d_2_b03_r;
wire linienmodule_csrbank2_iir_d_2_b03_w;
wire linienmodule_csrbank2_iir_d_2_b02_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b02_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b02_w;
wire linienmodule_csrbank2_iir_d_2_b01_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b01_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b01_w;
wire linienmodule_csrbank2_iir_d_2_b00_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b00_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b00_w;
wire linienmodule_csrbank2_iir_d_2_b13_re;
wire linienmodule_csrbank2_iir_d_2_b13_r;
wire linienmodule_csrbank2_iir_d_2_b13_w;
wire linienmodule_csrbank2_iir_d_2_b12_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b12_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b12_w;
wire linienmodule_csrbank2_iir_d_2_b11_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b11_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b11_w;
wire linienmodule_csrbank2_iir_d_2_b10_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b10_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b10_w;
wire linienmodule_csrbank2_iir_d_2_b23_re;
wire linienmodule_csrbank2_iir_d_2_b23_r;
wire linienmodule_csrbank2_iir_d_2_b23_w;
wire linienmodule_csrbank2_iir_d_2_b22_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b22_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b22_w;
wire linienmodule_csrbank2_iir_d_2_b21_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b21_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b21_w;
wire linienmodule_csrbank2_iir_d_2_b20_re;
wire [7:0] linienmodule_csrbank2_iir_d_2_b20_r;
wire [7:0] linienmodule_csrbank2_iir_d_2_b20_w;
wire linienmodule_csrbank2_y_limit_2_min3_re;
wire linienmodule_csrbank2_y_limit_2_min3_r;
wire linienmodule_csrbank2_y_limit_2_min3_w;
wire linienmodule_csrbank2_y_limit_2_min2_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_min2_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_min2_w;
wire linienmodule_csrbank2_y_limit_2_min1_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_min1_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_min1_w;
wire linienmodule_csrbank2_y_limit_2_min0_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_min0_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_min0_w;
wire linienmodule_csrbank2_y_limit_2_max3_re;
wire linienmodule_csrbank2_y_limit_2_max3_r;
wire linienmodule_csrbank2_y_limit_2_max3_w;
wire linienmodule_csrbank2_y_limit_2_max2_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_max2_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_max2_w;
wire linienmodule_csrbank2_y_limit_2_max1_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_max1_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_max1_w;
wire linienmodule_csrbank2_y_limit_2_max0_re;
wire [7:0] linienmodule_csrbank2_y_limit_2_max0_r;
wire [7:0] linienmodule_csrbank2_y_limit_2_max0_w;
wire linienmodule_csrbank2_x_max3_re;
wire linienmodule_csrbank2_x_max3_r;
wire linienmodule_csrbank2_x_max3_w;
wire linienmodule_csrbank2_x_max2_re;
wire [7:0] linienmodule_csrbank2_x_max2_r;
wire [7:0] linienmodule_csrbank2_x_max2_w;
wire linienmodule_csrbank2_x_max1_re;
wire [7:0] linienmodule_csrbank2_x_max1_r;
wire [7:0] linienmodule_csrbank2_x_max1_w;
wire linienmodule_csrbank2_x_max0_re;
wire [7:0] linienmodule_csrbank2_x_max0_r;
wire [7:0] linienmodule_csrbank2_x_max0_w;
wire linienmodule_csrbank2_x_min3_re;
wire linienmodule_csrbank2_x_min3_r;
wire linienmodule_csrbank2_x_min3_w;
wire linienmodule_csrbank2_x_min2_re;
wire [7:0] linienmodule_csrbank2_x_min2_r;
wire [7:0] linienmodule_csrbank2_x_min2_w;
wire linienmodule_csrbank2_x_min1_re;
wire [7:0] linienmodule_csrbank2_x_min1_r;
wire [7:0] linienmodule_csrbank2_x_min1_w;
wire linienmodule_csrbank2_x_min0_re;
wire [7:0] linienmodule_csrbank2_x_min0_r;
wire [7:0] linienmodule_csrbank2_x_min0_w;
wire linienmodule_csrbank2_out_i_max3_re;
wire linienmodule_csrbank2_out_i_max3_r;
wire linienmodule_csrbank2_out_i_max3_w;
wire linienmodule_csrbank2_out_i_max2_re;
wire [7:0] linienmodule_csrbank2_out_i_max2_r;
wire [7:0] linienmodule_csrbank2_out_i_max2_w;
wire linienmodule_csrbank2_out_i_max1_re;
wire [7:0] linienmodule_csrbank2_out_i_max1_r;
wire [7:0] linienmodule_csrbank2_out_i_max1_w;
wire linienmodule_csrbank2_out_i_max0_re;
wire [7:0] linienmodule_csrbank2_out_i_max0_r;
wire [7:0] linienmodule_csrbank2_out_i_max0_w;
wire linienmodule_csrbank2_out_i_min3_re;
wire linienmodule_csrbank2_out_i_min3_r;
wire linienmodule_csrbank2_out_i_min3_w;
wire linienmodule_csrbank2_out_i_min2_re;
wire [7:0] linienmodule_csrbank2_out_i_min2_r;
wire [7:0] linienmodule_csrbank2_out_i_min2_w;
wire linienmodule_csrbank2_out_i_min1_re;
wire [7:0] linienmodule_csrbank2_out_i_min1_r;
wire [7:0] linienmodule_csrbank2_out_i_min1_w;
wire linienmodule_csrbank2_out_i_min0_re;
wire [7:0] linienmodule_csrbank2_out_i_min0_r;
wire [7:0] linienmodule_csrbank2_out_i_min0_w;
wire linienmodule_csrbank2_out_q_max3_re;
wire linienmodule_csrbank2_out_q_max3_r;
wire linienmodule_csrbank2_out_q_max3_w;
wire linienmodule_csrbank2_out_q_max2_re;
wire [7:0] linienmodule_csrbank2_out_q_max2_r;
wire [7:0] linienmodule_csrbank2_out_q_max2_w;
wire linienmodule_csrbank2_out_q_max1_re;
wire [7:0] linienmodule_csrbank2_out_q_max1_r;
wire [7:0] linienmodule_csrbank2_out_q_max1_w;
wire linienmodule_csrbank2_out_q_max0_re;
wire [7:0] linienmodule_csrbank2_out_q_max0_r;
wire [7:0] linienmodule_csrbank2_out_q_max0_w;
wire linienmodule_csrbank2_out_q_min3_re;
wire linienmodule_csrbank2_out_q_min3_r;
wire linienmodule_csrbank2_out_q_min3_w;
wire linienmodule_csrbank2_out_q_min2_re;
wire [7:0] linienmodule_csrbank2_out_q_min2_r;
wire [7:0] linienmodule_csrbank2_out_q_min2_w;
wire linienmodule_csrbank2_out_q_min1_re;
wire [7:0] linienmodule_csrbank2_out_q_min1_r;
wire [7:0] linienmodule_csrbank2_out_q_min1_w;
wire linienmodule_csrbank2_out_q_min0_re;
wire [7:0] linienmodule_csrbank2_out_q_min0_r;
wire [7:0] linienmodule_csrbank2_out_q_min0_w;
wire linienmodule_csrbank2_dx_sel0_re;
wire [3:0] linienmodule_csrbank2_dx_sel0_r;
wire [3:0] linienmodule_csrbank2_dx_sel0_w;
wire linienmodule_csrbank2_dy_sel0_re;
wire [3:0] linienmodule_csrbank2_dy_sel0_r;
wire [3:0] linienmodule_csrbank2_dy_sel0_w;
wire linienmodule_csrbank2_sel;
wire [13:0] linienmodule_interface3_bank_bus_adr;
wire linienmodule_interface3_bank_bus_we;
wire [7:0] linienmodule_interface3_bank_bus_dat_w;
reg [7:0] linienmodule_interface3_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank3_ins_re;
wire [7:0] linienmodule_csrbank3_ins_r;
wire [7:0] linienmodule_csrbank3_ins_w;
wire linienmodule_csrbank3_outs0_re;
wire [7:0] linienmodule_csrbank3_outs0_r;
wire [7:0] linienmodule_csrbank3_outs0_w;
wire linienmodule_csrbank3_oes0_re;
wire [7:0] linienmodule_csrbank3_oes0_r;
wire [7:0] linienmodule_csrbank3_oes0_w;
wire linienmodule_csrbank3_state1_re;
wire linienmodule_csrbank3_state1_r;
wire linienmodule_csrbank3_state1_w;
wire linienmodule_csrbank3_state0_re;
wire [7:0] linienmodule_csrbank3_state0_r;
wire [7:0] linienmodule_csrbank3_state0_w;
wire linienmodule_csrbank3_do0_en1_re;
wire linienmodule_csrbank3_do0_en1_r;
wire linienmodule_csrbank3_do0_en1_w;
wire linienmodule_csrbank3_do0_en0_re;
wire [7:0] linienmodule_csrbank3_do0_en0_r;
wire [7:0] linienmodule_csrbank3_do0_en0_w;
wire linienmodule_csrbank3_do1_en1_re;
wire linienmodule_csrbank3_do1_en1_r;
wire linienmodule_csrbank3_do1_en1_w;
wire linienmodule_csrbank3_do1_en0_re;
wire [7:0] linienmodule_csrbank3_do1_en0_r;
wire [7:0] linienmodule_csrbank3_do1_en0_w;
wire linienmodule_csrbank3_do2_en1_re;
wire linienmodule_csrbank3_do2_en1_r;
wire linienmodule_csrbank3_do2_en1_w;
wire linienmodule_csrbank3_do2_en0_re;
wire [7:0] linienmodule_csrbank3_do2_en0_r;
wire [7:0] linienmodule_csrbank3_do2_en0_w;
wire linienmodule_csrbank3_do3_en1_re;
wire linienmodule_csrbank3_do3_en1_r;
wire linienmodule_csrbank3_do3_en1_w;
wire linienmodule_csrbank3_do3_en0_re;
wire [7:0] linienmodule_csrbank3_do3_en0_r;
wire [7:0] linienmodule_csrbank3_do3_en0_w;
wire linienmodule_csrbank3_do4_en1_re;
wire linienmodule_csrbank3_do4_en1_r;
wire linienmodule_csrbank3_do4_en1_w;
wire linienmodule_csrbank3_do4_en0_re;
wire [7:0] linienmodule_csrbank3_do4_en0_r;
wire [7:0] linienmodule_csrbank3_do4_en0_w;
wire linienmodule_csrbank3_do5_en1_re;
wire linienmodule_csrbank3_do5_en1_r;
wire linienmodule_csrbank3_do5_en1_w;
wire linienmodule_csrbank3_do5_en0_re;
wire [7:0] linienmodule_csrbank3_do5_en0_r;
wire [7:0] linienmodule_csrbank3_do5_en0_w;
wire linienmodule_csrbank3_do6_en1_re;
wire linienmodule_csrbank3_do6_en1_r;
wire linienmodule_csrbank3_do6_en1_w;
wire linienmodule_csrbank3_do6_en0_re;
wire [7:0] linienmodule_csrbank3_do6_en0_r;
wire [7:0] linienmodule_csrbank3_do6_en0_w;
wire linienmodule_csrbank3_do7_en1_re;
wire linienmodule_csrbank3_do7_en1_r;
wire linienmodule_csrbank3_do7_en1_w;
wire linienmodule_csrbank3_do7_en0_re;
wire [7:0] linienmodule_csrbank3_do7_en0_r;
wire [7:0] linienmodule_csrbank3_do7_en0_w;
wire linienmodule_csrbank3_sel;
wire [13:0] linienmodule_interface4_bank_bus_adr;
wire linienmodule_interface4_bank_bus_we;
wire [7:0] linienmodule_interface4_bank_bus_dat_w;
reg [7:0] linienmodule_interface4_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank4_ins_re;
wire [7:0] linienmodule_csrbank4_ins_r;
wire [7:0] linienmodule_csrbank4_ins_w;
wire linienmodule_csrbank4_outs0_re;
wire [7:0] linienmodule_csrbank4_outs0_r;
wire [7:0] linienmodule_csrbank4_outs0_w;
wire linienmodule_csrbank4_oes0_re;
wire [7:0] linienmodule_csrbank4_oes0_r;
wire [7:0] linienmodule_csrbank4_oes0_w;
wire linienmodule_csrbank4_sel;
wire [13:0] linienmodule_interface5_bank_bus_adr;
wire linienmodule_interface5_bank_bus_we;
wire [7:0] linienmodule_interface5_bank_bus_dat_w;
reg [7:0] linienmodule_interface5_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank5_dual_channel0_re;
wire linienmodule_csrbank5_dual_channel0_r;
wire linienmodule_csrbank5_dual_channel0_w;
wire linienmodule_csrbank5_mod_channel0_re;
wire linienmodule_csrbank5_mod_channel0_r;
wire linienmodule_csrbank5_mod_channel0_w;
wire linienmodule_csrbank5_control_channel0_re;
wire linienmodule_csrbank5_control_channel0_r;
wire linienmodule_csrbank5_control_channel0_w;
wire linienmodule_csrbank5_sweep_channel0_re;
wire [1:0] linienmodule_csrbank5_sweep_channel0_r;
wire [1:0] linienmodule_csrbank5_sweep_channel0_w;
wire linienmodule_csrbank5_slow_control_channel0_re;
wire [1:0] linienmodule_csrbank5_slow_control_channel0_r;
wire [1:0] linienmodule_csrbank5_slow_control_channel0_w;
wire linienmodule_csrbank5_pid_only_mode0_re;
wire linienmodule_csrbank5_pid_only_mode0_r;
wire linienmodule_csrbank5_pid_only_mode0_w;
wire linienmodule_csrbank5_chain_a_factor1_re;
wire linienmodule_csrbank5_chain_a_factor1_r;
wire linienmodule_csrbank5_chain_a_factor1_w;
wire linienmodule_csrbank5_chain_a_factor0_re;
wire [7:0] linienmodule_csrbank5_chain_a_factor0_r;
wire [7:0] linienmodule_csrbank5_chain_a_factor0_w;
wire linienmodule_csrbank5_chain_b_factor1_re;
wire linienmodule_csrbank5_chain_b_factor1_r;
wire linienmodule_csrbank5_chain_b_factor1_w;
wire linienmodule_csrbank5_chain_b_factor0_re;
wire [7:0] linienmodule_csrbank5_chain_b_factor0_r;
wire [7:0] linienmodule_csrbank5_chain_b_factor0_w;
wire linienmodule_csrbank5_chain_a_offset1_re;
wire [5:0] linienmodule_csrbank5_chain_a_offset1_r;
wire [5:0] linienmodule_csrbank5_chain_a_offset1_w;
wire linienmodule_csrbank5_chain_a_offset0_re;
wire [7:0] linienmodule_csrbank5_chain_a_offset0_r;
wire [7:0] linienmodule_csrbank5_chain_a_offset0_w;
wire linienmodule_csrbank5_chain_b_offset1_re;
wire [5:0] linienmodule_csrbank5_chain_b_offset1_r;
wire [5:0] linienmodule_csrbank5_chain_b_offset1_w;
wire linienmodule_csrbank5_chain_b_offset0_re;
wire [7:0] linienmodule_csrbank5_chain_b_offset0_r;
wire [7:0] linienmodule_csrbank5_chain_b_offset0_w;
wire linienmodule_csrbank5_combined_offset1_re;
wire [5:0] linienmodule_csrbank5_combined_offset1_r;
wire [5:0] linienmodule_csrbank5_combined_offset1_w;
wire linienmodule_csrbank5_combined_offset0_re;
wire [7:0] linienmodule_csrbank5_combined_offset0_r;
wire [7:0] linienmodule_csrbank5_combined_offset0_w;
wire linienmodule_csrbank5_out_offset1_re;
wire [5:0] linienmodule_csrbank5_out_offset1_r;
wire [5:0] linienmodule_csrbank5_out_offset1_w;
wire linienmodule_csrbank5_out_offset0_re;
wire [7:0] linienmodule_csrbank5_out_offset0_r;
wire [7:0] linienmodule_csrbank5_out_offset0_w;
wire linienmodule_csrbank5_slow_decimation0_re;
wire [4:0] linienmodule_csrbank5_slow_decimation0_r;
wire [4:0] linienmodule_csrbank5_slow_decimation0_w;
wire linienmodule_csrbank5_analog_out_11_re;
wire [6:0] linienmodule_csrbank5_analog_out_11_r;
wire [6:0] linienmodule_csrbank5_analog_out_11_w;
wire linienmodule_csrbank5_analog_out_10_re;
wire [7:0] linienmodule_csrbank5_analog_out_10_r;
wire [7:0] linienmodule_csrbank5_analog_out_10_w;
wire linienmodule_csrbank5_analog_out_21_re;
wire [6:0] linienmodule_csrbank5_analog_out_21_r;
wire [6:0] linienmodule_csrbank5_analog_out_21_w;
wire linienmodule_csrbank5_analog_out_20_re;
wire [7:0] linienmodule_csrbank5_analog_out_20_r;
wire [7:0] linienmodule_csrbank5_analog_out_20_w;
wire linienmodule_csrbank5_analog_out_31_re;
wire [6:0] linienmodule_csrbank5_analog_out_31_r;
wire [6:0] linienmodule_csrbank5_analog_out_31_w;
wire linienmodule_csrbank5_analog_out_30_re;
wire [7:0] linienmodule_csrbank5_analog_out_30_r;
wire [7:0] linienmodule_csrbank5_analog_out_30_w;
wire linienmodule_csrbank5_slow_value1_re;
wire [5:0] linienmodule_csrbank5_slow_value1_r;
wire [5:0] linienmodule_csrbank5_slow_value1_w;
wire linienmodule_csrbank5_slow_value0_re;
wire [7:0] linienmodule_csrbank5_slow_value0_r;
wire [7:0] linienmodule_csrbank5_slow_value0_w;
wire linienmodule_csrbank5_mod_amp1_re;
wire [5:0] linienmodule_csrbank5_mod_amp1_r;
wire [5:0] linienmodule_csrbank5_mod_amp1_w;
wire linienmodule_csrbank5_mod_amp0_re;
wire [7:0] linienmodule_csrbank5_mod_amp0_r;
wire [7:0] linienmodule_csrbank5_mod_amp0_w;
wire linienmodule_csrbank5_mod_freq3_re;
wire [7:0] linienmodule_csrbank5_mod_freq3_r;
wire [7:0] linienmodule_csrbank5_mod_freq3_w;
wire linienmodule_csrbank5_mod_freq2_re;
wire [7:0] linienmodule_csrbank5_mod_freq2_r;
wire [7:0] linienmodule_csrbank5_mod_freq2_w;
wire linienmodule_csrbank5_mod_freq1_re;
wire [7:0] linienmodule_csrbank5_mod_freq1_r;
wire [7:0] linienmodule_csrbank5_mod_freq1_w;
wire linienmodule_csrbank5_mod_freq0_re;
wire [7:0] linienmodule_csrbank5_mod_freq0_r;
wire [7:0] linienmodule_csrbank5_mod_freq0_w;
wire linienmodule_csrbank5_sweep_step3_re;
wire [5:0] linienmodule_csrbank5_sweep_step3_r;
wire [5:0] linienmodule_csrbank5_sweep_step3_w;
wire linienmodule_csrbank5_sweep_step2_re;
wire [7:0] linienmodule_csrbank5_sweep_step2_r;
wire [7:0] linienmodule_csrbank5_sweep_step2_w;
wire linienmodule_csrbank5_sweep_step1_re;
wire [7:0] linienmodule_csrbank5_sweep_step1_r;
wire [7:0] linienmodule_csrbank5_sweep_step1_w;
wire linienmodule_csrbank5_sweep_step0_re;
wire [7:0] linienmodule_csrbank5_sweep_step0_r;
wire [7:0] linienmodule_csrbank5_sweep_step0_w;
wire linienmodule_csrbank5_sweep_min1_re;
wire [5:0] linienmodule_csrbank5_sweep_min1_r;
wire [5:0] linienmodule_csrbank5_sweep_min1_w;
wire linienmodule_csrbank5_sweep_min0_re;
wire [7:0] linienmodule_csrbank5_sweep_min0_r;
wire [7:0] linienmodule_csrbank5_sweep_min0_w;
wire linienmodule_csrbank5_sweep_max1_re;
wire [5:0] linienmodule_csrbank5_sweep_max1_r;
wire [5:0] linienmodule_csrbank5_sweep_max1_w;
wire linienmodule_csrbank5_sweep_max0_re;
wire [7:0] linienmodule_csrbank5_sweep_max0_r;
wire [7:0] linienmodule_csrbank5_sweep_max0_w;
wire linienmodule_csrbank5_sweep_run0_re;
wire linienmodule_csrbank5_sweep_run0_r;
wire linienmodule_csrbank5_sweep_run0_w;
wire linienmodule_csrbank5_sweep_pause0_re;
wire linienmodule_csrbank5_sweep_pause0_r;
wire linienmodule_csrbank5_sweep_pause0_w;
wire linienmodule_csrbank5_limit_error_signal_min3_re;
wire linienmodule_csrbank5_limit_error_signal_min3_r;
wire linienmodule_csrbank5_limit_error_signal_min3_w;
wire linienmodule_csrbank5_limit_error_signal_min2_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min2_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min2_w;
wire linienmodule_csrbank5_limit_error_signal_min1_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min1_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min1_w;
wire linienmodule_csrbank5_limit_error_signal_min0_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min0_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_min0_w;
wire linienmodule_csrbank5_limit_error_signal_max3_re;
wire linienmodule_csrbank5_limit_error_signal_max3_r;
wire linienmodule_csrbank5_limit_error_signal_max3_w;
wire linienmodule_csrbank5_limit_error_signal_max2_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max2_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max2_w;
wire linienmodule_csrbank5_limit_error_signal_max1_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max1_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max1_w;
wire linienmodule_csrbank5_limit_error_signal_max0_re;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max0_r;
wire [7:0] linienmodule_csrbank5_limit_error_signal_max0_w;
wire linienmodule_csrbank5_limit_fast1_min1_re;
wire [5:0] linienmodule_csrbank5_limit_fast1_min1_r;
wire [5:0] linienmodule_csrbank5_limit_fast1_min1_w;
wire linienmodule_csrbank5_limit_fast1_min0_re;
wire [7:0] linienmodule_csrbank5_limit_fast1_min0_r;
wire [7:0] linienmodule_csrbank5_limit_fast1_min0_w;
wire linienmodule_csrbank5_limit_fast1_max1_re;
wire [5:0] linienmodule_csrbank5_limit_fast1_max1_r;
wire [5:0] linienmodule_csrbank5_limit_fast1_max1_w;
wire linienmodule_csrbank5_limit_fast1_max0_re;
wire [7:0] linienmodule_csrbank5_limit_fast1_max0_r;
wire [7:0] linienmodule_csrbank5_limit_fast1_max0_w;
wire linienmodule_csrbank5_limit_fast2_min1_re;
wire [5:0] linienmodule_csrbank5_limit_fast2_min1_r;
wire [5:0] linienmodule_csrbank5_limit_fast2_min1_w;
wire linienmodule_csrbank5_limit_fast2_min0_re;
wire [7:0] linienmodule_csrbank5_limit_fast2_min0_r;
wire [7:0] linienmodule_csrbank5_limit_fast2_min0_w;
wire linienmodule_csrbank5_limit_fast2_max1_re;
wire [5:0] linienmodule_csrbank5_limit_fast2_max1_r;
wire [5:0] linienmodule_csrbank5_limit_fast2_max1_w;
wire linienmodule_csrbank5_limit_fast2_max0_re;
wire [7:0] linienmodule_csrbank5_limit_fast2_max0_r;
wire [7:0] linienmodule_csrbank5_limit_fast2_max0_w;
wire linienmodule_csrbank5_pid_setpoint3_re;
wire linienmodule_csrbank5_pid_setpoint3_r;
wire linienmodule_csrbank5_pid_setpoint3_w;
wire linienmodule_csrbank5_pid_setpoint2_re;
wire [7:0] linienmodule_csrbank5_pid_setpoint2_r;
wire [7:0] linienmodule_csrbank5_pid_setpoint2_w;
wire linienmodule_csrbank5_pid_setpoint1_re;
wire [7:0] linienmodule_csrbank5_pid_setpoint1_r;
wire [7:0] linienmodule_csrbank5_pid_setpoint1_w;
wire linienmodule_csrbank5_pid_setpoint0_re;
wire [7:0] linienmodule_csrbank5_pid_setpoint0_r;
wire [7:0] linienmodule_csrbank5_pid_setpoint0_w;
wire linienmodule_csrbank5_pid_kp1_re;
wire [5:0] linienmodule_csrbank5_pid_kp1_r;
wire [5:0] linienmodule_csrbank5_pid_kp1_w;
wire linienmodule_csrbank5_pid_kp0_re;
wire [7:0] linienmodule_csrbank5_pid_kp0_r;
wire [7:0] linienmodule_csrbank5_pid_kp0_w;
wire linienmodule_csrbank5_pid_ki1_re;
wire [5:0] linienmodule_csrbank5_pid_ki1_r;
wire [5:0] linienmodule_csrbank5_pid_ki1_w;
wire linienmodule_csrbank5_pid_ki0_re;
wire [7:0] linienmodule_csrbank5_pid_ki0_r;
wire [7:0] linienmodule_csrbank5_pid_ki0_w;
wire linienmodule_csrbank5_pid_reset0_re;
wire linienmodule_csrbank5_pid_reset0_r;
wire linienmodule_csrbank5_pid_reset0_w;
wire linienmodule_csrbank5_pid_kd1_re;
wire [5:0] linienmodule_csrbank5_pid_kd1_r;
wire [5:0] linienmodule_csrbank5_pid_kd1_w;
wire linienmodule_csrbank5_pid_kd0_re;
wire [7:0] linienmodule_csrbank5_pid_kd0_r;
wire [7:0] linienmodule_csrbank5_pid_kd0_w;
wire linienmodule_csrbank5_autolock_fast_target_position1_re;
wire [5:0] linienmodule_csrbank5_autolock_fast_target_position1_r;
wire [5:0] linienmodule_csrbank5_autolock_fast_target_position1_w;
wire linienmodule_csrbank5_autolock_fast_target_position0_re;
wire [7:0] linienmodule_csrbank5_autolock_fast_target_position0_r;
wire [7:0] linienmodule_csrbank5_autolock_fast_target_position0_w;
wire linienmodule_csrbank5_autolock_request_lock0_re;
wire linienmodule_csrbank5_autolock_request_lock0_r;
wire linienmodule_csrbank5_autolock_request_lock0_w;
wire linienmodule_csrbank5_autolock_autolock_mode0_re;
wire [1:0] linienmodule_csrbank5_autolock_autolock_mode0_r;
wire [1:0] linienmodule_csrbank5_autolock_autolock_mode0_w;
wire linienmodule_csrbank5_autolock_lock_running_re;
wire linienmodule_csrbank5_autolock_lock_running_r;
wire linienmodule_csrbank5_autolock_lock_running_w;
wire linienmodule_csrbank5_sequence_reset_seq0_re;
wire linienmodule_csrbank5_sequence_reset_seq0_r;
wire linienmodule_csrbank5_sequence_reset_seq0_w;
wire linienmodule_csrbank5_sequence_arm0_re;
wire [3:0] linienmodule_csrbank5_sequence_arm0_r;
wire [3:0] linienmodule_csrbank5_sequence_arm0_w;
wire linienmodule_csrbank5_sequence_status_1_re;
wire [1:0] linienmodule_csrbank5_sequence_status_1_r;
wire [1:0] linienmodule_csrbank5_sequence_status_1_w;
wire linienmodule_csrbank5_sequence_status_2_re;
wire [1:0] linienmodule_csrbank5_sequence_status_2_r;
wire [1:0] linienmodule_csrbank5_sequence_status_2_w;
wire linienmodule_csrbank5_sequence_status_3_re;
wire [1:0] linienmodule_csrbank5_sequence_status_3_r;
wire [1:0] linienmodule_csrbank5_sequence_status_3_w;
wire linienmodule_csrbank5_sequence_status_4_re;
wire [1:0] linienmodule_csrbank5_sequence_status_4_r;
wire [1:0] linienmodule_csrbank5_sequence_status_4_w;
wire linienmodule_csrbank5_sequence_saved_pid_out1_re;
wire [5:0] linienmodule_csrbank5_sequence_saved_pid_out1_r;
wire [5:0] linienmodule_csrbank5_sequence_saved_pid_out1_w;
wire linienmodule_csrbank5_sequence_saved_pid_out0_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_pid_out0_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_pid_out0_w;
wire linienmodule_csrbank5_sequence_saved_integrator3_re;
wire linienmodule_csrbank5_sequence_saved_integrator3_r;
wire linienmodule_csrbank5_sequence_saved_integrator3_w;
wire linienmodule_csrbank5_sequence_saved_integrator2_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator2_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator2_w;
wire linienmodule_csrbank5_sequence_saved_integrator1_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator1_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator1_w;
wire linienmodule_csrbank5_sequence_saved_integrator0_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator0_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_integrator0_w;
wire linienmodule_csrbank5_sequence_saved_sweep_pos1_re;
wire [5:0] linienmodule_csrbank5_sequence_saved_sweep_pos1_r;
wire [5:0] linienmodule_csrbank5_sequence_saved_sweep_pos1_w;
wire linienmodule_csrbank5_sequence_saved_sweep_pos0_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_sweep_pos0_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_sweep_pos0_w;
wire linienmodule_csrbank5_sequence_saved_dac_out1_re;
wire [5:0] linienmodule_csrbank5_sequence_saved_dac_out1_r;
wire [5:0] linienmodule_csrbank5_sequence_saved_dac_out1_w;
wire linienmodule_csrbank5_sequence_saved_dac_out0_re;
wire [7:0] linienmodule_csrbank5_sequence_saved_dac_out0_r;
wire [7:0] linienmodule_csrbank5_sequence_saved_dac_out0_w;
wire linienmodule_csrbank5_sequence_fsm_reg_addr1_re;
wire linienmodule_csrbank5_sequence_fsm_reg_addr1_r;
wire linienmodule_csrbank5_sequence_fsm_reg_addr1_w;
wire linienmodule_csrbank5_sequence_fsm_reg_addr0_re;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_addr0_r;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_addr0_w;
wire linienmodule_csrbank5_sequence_fsm_reg_data3_re;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data3_r;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data3_w;
wire linienmodule_csrbank5_sequence_fsm_reg_data2_re;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data2_r;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data2_w;
wire linienmodule_csrbank5_sequence_fsm_reg_data1_re;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data1_r;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data1_w;
wire linienmodule_csrbank5_sequence_fsm_reg_data0_re;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data0_r;
wire [7:0] linienmodule_csrbank5_sequence_fsm_reg_data0_w;
wire linienmodule_csrbank5_sequence_fsm_reg_wen0_re;
wire linienmodule_csrbank5_sequence_fsm_reg_wen0_r;
wire linienmodule_csrbank5_sequence_fsm_reg_wen0_w;
wire linienmodule_csrbank5_sequence_awg_reg_addr1_re;
wire [1:0] linienmodule_csrbank5_sequence_awg_reg_addr1_r;
wire [1:0] linienmodule_csrbank5_sequence_awg_reg_addr1_w;
wire linienmodule_csrbank5_sequence_awg_reg_addr0_re;
wire [7:0] linienmodule_csrbank5_sequence_awg_reg_addr0_r;
wire [7:0] linienmodule_csrbank5_sequence_awg_reg_addr0_w;
wire linienmodule_csrbank5_sequence_awg_reg_data1_re;
wire [5:0] linienmodule_csrbank5_sequence_awg_reg_data1_r;
wire [5:0] linienmodule_csrbank5_sequence_awg_reg_data1_w;
wire linienmodule_csrbank5_sequence_awg_reg_data0_re;
wire [7:0] linienmodule_csrbank5_sequence_awg_reg_data0_r;
wire [7:0] linienmodule_csrbank5_sequence_awg_reg_data0_w;
wire linienmodule_csrbank5_sequence_awg_reg_wen0_re;
wire linienmodule_csrbank5_sequence_awg_reg_wen0_r;
wire linienmodule_csrbank5_sequence_awg_reg_wen0_w;
wire linienmodule_csrbank5_sequence_num_blocks_10_re;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_10_r;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_10_w;
wire linienmodule_csrbank5_sequence_num_blocks_20_re;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_20_r;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_20_w;
wire linienmodule_csrbank5_sequence_num_blocks_30_re;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_30_r;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_30_w;
wire linienmodule_csrbank5_sequence_num_blocks_40_re;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_40_r;
wire [3:0] linienmodule_csrbank5_sequence_num_blocks_40_w;
wire linienmodule_csrbank5_sequence_init_v1_re;
wire [5:0] linienmodule_csrbank5_sequence_init_v1_r;
wire [5:0] linienmodule_csrbank5_sequence_init_v1_w;
wire linienmodule_csrbank5_sequence_init_v0_re;
wire [7:0] linienmodule_csrbank5_sequence_init_v0_r;
wire [7:0] linienmodule_csrbank5_sequence_init_v0_w;
wire linienmodule_csrbank5_raw_acquisition_iir_z03_re;
wire [2:0] linienmodule_csrbank5_raw_acquisition_iir_z03_r;
wire [2:0] linienmodule_csrbank5_raw_acquisition_iir_z03_w;
wire linienmodule_csrbank5_raw_acquisition_iir_z02_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z02_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z02_w;
wire linienmodule_csrbank5_raw_acquisition_iir_z01_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z01_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z01_w;
wire linienmodule_csrbank5_raw_acquisition_iir_z00_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z00_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_z00_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a13_re;
wire linienmodule_csrbank5_raw_acquisition_iir_a13_r;
wire linienmodule_csrbank5_raw_acquisition_iir_a13_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a12_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a12_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a12_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a11_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a11_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a11_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a10_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a10_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a10_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a23_re;
wire linienmodule_csrbank5_raw_acquisition_iir_a23_r;
wire linienmodule_csrbank5_raw_acquisition_iir_a23_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a22_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a22_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a22_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a21_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a21_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a21_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a20_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a20_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a20_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a33_re;
wire linienmodule_csrbank5_raw_acquisition_iir_a33_r;
wire linienmodule_csrbank5_raw_acquisition_iir_a33_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a32_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a32_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a32_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a31_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a31_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a31_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a30_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a30_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a30_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a43_re;
wire linienmodule_csrbank5_raw_acquisition_iir_a43_r;
wire linienmodule_csrbank5_raw_acquisition_iir_a43_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a42_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a42_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a42_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a41_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a41_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a41_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a40_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a40_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a40_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a53_re;
wire linienmodule_csrbank5_raw_acquisition_iir_a53_r;
wire linienmodule_csrbank5_raw_acquisition_iir_a53_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a52_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a52_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a52_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a51_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a51_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a51_w;
wire linienmodule_csrbank5_raw_acquisition_iir_a50_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a50_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_a50_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b03_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b03_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b03_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b02_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b02_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b02_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b01_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b01_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b01_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b00_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b00_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b00_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b13_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b13_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b13_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b12_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b12_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b12_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b11_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b11_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b11_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b10_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b10_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b10_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b23_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b23_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b23_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b22_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b22_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b22_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b21_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b21_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b21_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b20_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b20_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b20_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b33_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b33_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b33_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b32_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b32_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b32_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b31_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b31_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b31_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b30_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b30_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b30_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b43_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b43_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b43_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b42_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b42_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b42_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b41_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b41_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b41_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b40_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b40_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b40_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b53_re;
wire linienmodule_csrbank5_raw_acquisition_iir_b53_r;
wire linienmodule_csrbank5_raw_acquisition_iir_b53_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b52_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b52_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b52_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b51_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b51_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b51_w;
wire linienmodule_csrbank5_raw_acquisition_iir_b50_re;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b50_r;
wire [7:0] linienmodule_csrbank5_raw_acquisition_iir_b50_w;
wire linienmodule_csrbank5_control_signal_max3_re;
wire linienmodule_csrbank5_control_signal_max3_r;
wire linienmodule_csrbank5_control_signal_max3_w;
wire linienmodule_csrbank5_control_signal_max2_re;
wire [7:0] linienmodule_csrbank5_control_signal_max2_r;
wire [7:0] linienmodule_csrbank5_control_signal_max2_w;
wire linienmodule_csrbank5_control_signal_max1_re;
wire [7:0] linienmodule_csrbank5_control_signal_max1_r;
wire [7:0] linienmodule_csrbank5_control_signal_max1_w;
wire linienmodule_csrbank5_control_signal_max0_re;
wire [7:0] linienmodule_csrbank5_control_signal_max0_r;
wire [7:0] linienmodule_csrbank5_control_signal_max0_w;
wire linienmodule_csrbank5_control_signal_min3_re;
wire linienmodule_csrbank5_control_signal_min3_r;
wire linienmodule_csrbank5_control_signal_min3_w;
wire linienmodule_csrbank5_control_signal_min2_re;
wire [7:0] linienmodule_csrbank5_control_signal_min2_r;
wire [7:0] linienmodule_csrbank5_control_signal_min2_w;
wire linienmodule_csrbank5_control_signal_min1_re;
wire [7:0] linienmodule_csrbank5_control_signal_min1_r;
wire [7:0] linienmodule_csrbank5_control_signal_min1_w;
wire linienmodule_csrbank5_control_signal_min0_re;
wire [7:0] linienmodule_csrbank5_control_signal_min0_r;
wire [7:0] linienmodule_csrbank5_control_signal_min0_w;
wire linienmodule_csrbank5_combined_error_signal_max3_re;
wire linienmodule_csrbank5_combined_error_signal_max3_r;
wire linienmodule_csrbank5_combined_error_signal_max3_w;
wire linienmodule_csrbank5_combined_error_signal_max2_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max2_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max2_w;
wire linienmodule_csrbank5_combined_error_signal_max1_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max1_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max1_w;
wire linienmodule_csrbank5_combined_error_signal_max0_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max0_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_max0_w;
wire linienmodule_csrbank5_combined_error_signal_min3_re;
wire linienmodule_csrbank5_combined_error_signal_min3_r;
wire linienmodule_csrbank5_combined_error_signal_min3_w;
wire linienmodule_csrbank5_combined_error_signal_min2_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min2_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min2_w;
wire linienmodule_csrbank5_combined_error_signal_min1_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min1_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min1_w;
wire linienmodule_csrbank5_combined_error_signal_min0_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min0_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_min0_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_max3_re;
wire linienmodule_csrbank5_combined_error_signal_filtered_max3_r;
wire linienmodule_csrbank5_combined_error_signal_filtered_max3_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_max2_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max2_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max2_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_max1_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max1_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max1_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_max0_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max0_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_max0_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_min3_re;
wire linienmodule_csrbank5_combined_error_signal_filtered_min3_r;
wire linienmodule_csrbank5_combined_error_signal_filtered_min3_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_min2_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min2_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min2_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_min1_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min1_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min1_w;
wire linienmodule_csrbank5_combined_error_signal_filtered_min0_re;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min0_r;
wire [7:0] linienmodule_csrbank5_combined_error_signal_filtered_min0_w;
wire linienmodule_csrbank5_sel;
wire [13:0] linienmodule_interface6_bank_bus_adr;
wire linienmodule_interface6_bank_bus_we;
wire [7:0] linienmodule_interface6_bank_bus_dat_w;
reg [7:0] linienmodule_interface6_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank6_external_trigger0_re;
wire linienmodule_csrbank6_external_trigger0_r;
wire linienmodule_csrbank6_external_trigger0_w;
wire linienmodule_csrbank6_dac_a_max3_re;
wire linienmodule_csrbank6_dac_a_max3_r;
wire linienmodule_csrbank6_dac_a_max3_w;
wire linienmodule_csrbank6_dac_a_max2_re;
wire [7:0] linienmodule_csrbank6_dac_a_max2_r;
wire [7:0] linienmodule_csrbank6_dac_a_max2_w;
wire linienmodule_csrbank6_dac_a_max1_re;
wire [7:0] linienmodule_csrbank6_dac_a_max1_r;
wire [7:0] linienmodule_csrbank6_dac_a_max1_w;
wire linienmodule_csrbank6_dac_a_max0_re;
wire [7:0] linienmodule_csrbank6_dac_a_max0_r;
wire [7:0] linienmodule_csrbank6_dac_a_max0_w;
wire linienmodule_csrbank6_dac_a_min3_re;
wire linienmodule_csrbank6_dac_a_min3_r;
wire linienmodule_csrbank6_dac_a_min3_w;
wire linienmodule_csrbank6_dac_a_min2_re;
wire [7:0] linienmodule_csrbank6_dac_a_min2_r;
wire [7:0] linienmodule_csrbank6_dac_a_min2_w;
wire linienmodule_csrbank6_dac_a_min1_re;
wire [7:0] linienmodule_csrbank6_dac_a_min1_r;
wire [7:0] linienmodule_csrbank6_dac_a_min1_w;
wire linienmodule_csrbank6_dac_a_min0_re;
wire [7:0] linienmodule_csrbank6_dac_a_min0_r;
wire [7:0] linienmodule_csrbank6_dac_a_min0_w;
wire linienmodule_csrbank6_dac_b_max3_re;
wire linienmodule_csrbank6_dac_b_max3_r;
wire linienmodule_csrbank6_dac_b_max3_w;
wire linienmodule_csrbank6_dac_b_max2_re;
wire [7:0] linienmodule_csrbank6_dac_b_max2_r;
wire [7:0] linienmodule_csrbank6_dac_b_max2_w;
wire linienmodule_csrbank6_dac_b_max1_re;
wire [7:0] linienmodule_csrbank6_dac_b_max1_r;
wire [7:0] linienmodule_csrbank6_dac_b_max1_w;
wire linienmodule_csrbank6_dac_b_max0_re;
wire [7:0] linienmodule_csrbank6_dac_b_max0_r;
wire [7:0] linienmodule_csrbank6_dac_b_max0_w;
wire linienmodule_csrbank6_dac_b_min3_re;
wire linienmodule_csrbank6_dac_b_min3_r;
wire linienmodule_csrbank6_dac_b_min3_w;
wire linienmodule_csrbank6_dac_b_min2_re;
wire [7:0] linienmodule_csrbank6_dac_b_min2_r;
wire [7:0] linienmodule_csrbank6_dac_b_min2_w;
wire linienmodule_csrbank6_dac_b_min1_re;
wire [7:0] linienmodule_csrbank6_dac_b_min1_r;
wire [7:0] linienmodule_csrbank6_dac_b_min1_w;
wire linienmodule_csrbank6_dac_b_min0_re;
wire [7:0] linienmodule_csrbank6_dac_b_min0_r;
wire [7:0] linienmodule_csrbank6_dac_b_min0_w;
wire linienmodule_csrbank6_adc_a_sel0_re;
wire [3:0] linienmodule_csrbank6_adc_a_sel0_r;
wire [3:0] linienmodule_csrbank6_adc_a_sel0_w;
wire linienmodule_csrbank6_adc_b_sel0_re;
wire [3:0] linienmodule_csrbank6_adc_b_sel0_r;
wire [3:0] linienmodule_csrbank6_adc_b_sel0_w;
wire linienmodule_csrbank6_adc_a_q_sel0_re;
wire [3:0] linienmodule_csrbank6_adc_a_q_sel0_r;
wire [3:0] linienmodule_csrbank6_adc_a_q_sel0_w;
wire linienmodule_csrbank6_adc_b_q_sel0_re;
wire [3:0] linienmodule_csrbank6_adc_b_q_sel0_r;
wire [3:0] linienmodule_csrbank6_adc_b_q_sel0_w;
wire linienmodule_csrbank6_sel;
wire [13:0] linienmodule_interface7_bank_bus_adr;
wire linienmodule_interface7_bank_bus_we;
wire [7:0] linienmodule_interface7_bank_bus_dat_w;
reg [7:0] linienmodule_interface7_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank7_pid_setpoint1_re;
wire [5:0] linienmodule_csrbank7_pid_setpoint1_r;
wire [5:0] linienmodule_csrbank7_pid_setpoint1_w;
wire linienmodule_csrbank7_pid_setpoint0_re;
wire [7:0] linienmodule_csrbank7_pid_setpoint0_r;
wire [7:0] linienmodule_csrbank7_pid_setpoint0_w;
wire linienmodule_csrbank7_pid_kp1_re;
wire [5:0] linienmodule_csrbank7_pid_kp1_r;
wire [5:0] linienmodule_csrbank7_pid_kp1_w;
wire linienmodule_csrbank7_pid_kp0_re;
wire [7:0] linienmodule_csrbank7_pid_kp0_r;
wire [7:0] linienmodule_csrbank7_pid_kp0_w;
wire linienmodule_csrbank7_pid_ki1_re;
wire [5:0] linienmodule_csrbank7_pid_ki1_r;
wire [5:0] linienmodule_csrbank7_pid_ki1_w;
wire linienmodule_csrbank7_pid_ki0_re;
wire [7:0] linienmodule_csrbank7_pid_ki0_r;
wire [7:0] linienmodule_csrbank7_pid_ki0_w;
wire linienmodule_csrbank7_pid_reset0_re;
wire linienmodule_csrbank7_pid_reset0_r;
wire linienmodule_csrbank7_pid_reset0_w;
wire linienmodule_csrbank7_pid_kd1_re;
wire [5:0] linienmodule_csrbank7_pid_kd1_r;
wire [5:0] linienmodule_csrbank7_pid_kd1_w;
wire linienmodule_csrbank7_pid_kd0_re;
wire [7:0] linienmodule_csrbank7_pid_kd0_r;
wire [7:0] linienmodule_csrbank7_pid_kd0_w;
wire linienmodule_csrbank7_limit_min1_re;
wire [5:0] linienmodule_csrbank7_limit_min1_r;
wire [5:0] linienmodule_csrbank7_limit_min1_w;
wire linienmodule_csrbank7_limit_min0_re;
wire [7:0] linienmodule_csrbank7_limit_min0_r;
wire [7:0] linienmodule_csrbank7_limit_min0_w;
wire linienmodule_csrbank7_limit_max1_re;
wire [5:0] linienmodule_csrbank7_limit_max1_r;
wire [5:0] linienmodule_csrbank7_limit_max1_w;
wire linienmodule_csrbank7_limit_max0_re;
wire [7:0] linienmodule_csrbank7_limit_max0_r;
wire [7:0] linienmodule_csrbank7_limit_max0_w;
wire linienmodule_csrbank7_out_max3_re;
wire linienmodule_csrbank7_out_max3_r;
wire linienmodule_csrbank7_out_max3_w;
wire linienmodule_csrbank7_out_max2_re;
wire [7:0] linienmodule_csrbank7_out_max2_r;
wire [7:0] linienmodule_csrbank7_out_max2_w;
wire linienmodule_csrbank7_out_max1_re;
wire [7:0] linienmodule_csrbank7_out_max1_r;
wire [7:0] linienmodule_csrbank7_out_max1_w;
wire linienmodule_csrbank7_out_max0_re;
wire [7:0] linienmodule_csrbank7_out_max0_r;
wire [7:0] linienmodule_csrbank7_out_max0_w;
wire linienmodule_csrbank7_out_min3_re;
wire linienmodule_csrbank7_out_min3_r;
wire linienmodule_csrbank7_out_min3_w;
wire linienmodule_csrbank7_out_min2_re;
wire [7:0] linienmodule_csrbank7_out_min2_r;
wire [7:0] linienmodule_csrbank7_out_min2_w;
wire linienmodule_csrbank7_out_min1_re;
wire [7:0] linienmodule_csrbank7_out_min1_r;
wire [7:0] linienmodule_csrbank7_out_min1_w;
wire linienmodule_csrbank7_out_min0_re;
wire [7:0] linienmodule_csrbank7_out_min0_r;
wire [7:0] linienmodule_csrbank7_out_min0_w;
wire linienmodule_csrbank7_sel;
wire [13:0] linienmodule_interface8_bank_bus_adr;
wire linienmodule_interface8_bank_bus_we;
wire [7:0] linienmodule_interface8_bank_bus_dat_w;
reg [7:0] linienmodule_interface8_bank_bus_dat_r = 8'd0;
wire linienmodule_csrbank8_temp1_re;
wire [3:0] linienmodule_csrbank8_temp1_r;
wire [3:0] linienmodule_csrbank8_temp1_w;
wire linienmodule_csrbank8_temp0_re;
wire [7:0] linienmodule_csrbank8_temp0_r;
wire [7:0] linienmodule_csrbank8_temp0_w;
wire linienmodule_csrbank8_v1_re;
wire [3:0] linienmodule_csrbank8_v1_r;
wire [3:0] linienmodule_csrbank8_v1_w;
wire linienmodule_csrbank8_v0_re;
wire [7:0] linienmodule_csrbank8_v0_r;
wire [7:0] linienmodule_csrbank8_v0_w;
wire linienmodule_csrbank8_a1_re;
wire [3:0] linienmodule_csrbank8_a1_r;
wire [3:0] linienmodule_csrbank8_a1_w;
wire linienmodule_csrbank8_a0_re;
wire [7:0] linienmodule_csrbank8_a0_r;
wire [7:0] linienmodule_csrbank8_a0_w;
wire linienmodule_csrbank8_b1_re;
wire [3:0] linienmodule_csrbank8_b1_r;
wire [3:0] linienmodule_csrbank8_b1_w;
wire linienmodule_csrbank8_b0_re;
wire [7:0] linienmodule_csrbank8_b0_r;
wire [7:0] linienmodule_csrbank8_b0_w;
wire linienmodule_csrbank8_c1_re;
wire [3:0] linienmodule_csrbank8_c1_r;
wire [3:0] linienmodule_csrbank8_c1_w;
wire linienmodule_csrbank8_c0_re;
wire [7:0] linienmodule_csrbank8_c0_r;
wire [7:0] linienmodule_csrbank8_c0_w;
wire linienmodule_csrbank8_d1_re;
wire [3:0] linienmodule_csrbank8_d1_r;
wire [3:0] linienmodule_csrbank8_d1_w;
wire linienmodule_csrbank8_d0_re;
wire [7:0] linienmodule_csrbank8_d0_r;
wire [7:0] linienmodule_csrbank8_d0_w;
wire linienmodule_csrbank8_sel;
reg [13:0] linienmodule_csr_adr = 14'd0;
reg linienmodule_csr_we = 1'd0;
reg [7:0] linienmodule_csr_dat_w = 8'd0;
wire [7:0] linienmodule_csr_dat_r;
wire linienmodule_sys_rstn;
wire linienmodule_sys_clk;
wire [31:0] linienmodule_sys_addr;
wire [31:0] linienmodule_sys_wdata;
wire [3:0] linienmodule_sys_sel;
wire linienmodule_sys_wen;
wire linienmodule_sys_ren;
reg [31:0] linienmodule_sys_rdata = 32'd0;
reg linienmodule_sys_err = 1'd0;
reg linienmodule_sys_ack = 1'd0;
reg linienmodule_stb = 1'd0;
wire linienmodule_source_rstn;
wire linienmodule_source_clk;
wire [31:0] linienmodule_source_addr;
wire [31:0] linienmodule_source_wdata;
wire [3:0] linienmodule_source_sel;
wire linienmodule_source_wen;
wire linienmodule_source_ren;
wire [31:0] linienmodule_source_rdata;
wire linienmodule_source_err;
wire linienmodule_source_ack;
wire linienmodule_target_rstn;
wire linienmodule_target_clk;
wire [31:0] linienmodule_target_addr;
wire [31:0] linienmodule_target_wdata;
reg [3:0] linienmodule_target_sel = 4'd0;
wire linienmodule_target_wen;
wire linienmodule_target_ren;
wire [31:0] linienmodule_target_rdata;
wire linienmodule_target_err;
wire linienmodule_target_ack;
reg signed [36:0] linienmodule_mixed;
wire signed [24:0] linienmodule_mixed_limited;
wire signed [13:0] linienmodule_pid_out;
wire signed [17:0] linienmodule;
wire signed [17:0] linienmodule_fast_outs;
wire signed [16:0] linienmodule_analog_out;
reg [14:0] linienmodule_slow_out_shifted = 15'd0;
reg [3:0] linienmodule_ttl_pins;
reg dummyhk_status = 1'd1;
wire [13:0] dummyhk_bank_bus_adr;
wire dummyhk_bank_bus_we;
wire [7:0] dummyhk_bank_bus_dat_w;
reg [7:0] dummyhk_bank_bus_dat_r = 8'd0;
wire dummyhk_id_re;
wire dummyhk_id_r;
wire dummyhk_id_w;
wire dummyhk_sel;
reg [13:0] dummyhk_csr_adr = 14'd0;
reg dummyhk_csr_we = 1'd0;
reg [7:0] dummyhk_csr_dat_w = 8'd0;
wire [7:0] dummyhk_csr_dat_r;
wire dummyhk_sys_rstn;
wire dummyhk_sys_clk;
wire [31:0] dummyhk_sys_addr;
wire [31:0] dummyhk_sys_wdata;
wire [3:0] dummyhk_sys_sel;
wire dummyhk_sys_wen;
wire dummyhk_sys_ren;
reg [31:0] dummyhk_sys_rdata = 32'd0;
reg dummyhk_sys_err = 1'd0;
reg dummyhk_sys_ack = 1'd0;
reg dummyhk_stb = 1'd0;
wire [1:0] ic_cs;
wire ic_sel0;
wire ic_sel1;
wire ic_sel2;
wire ic_sel3;
reg [1:0] state = 2'd0;
reg [1:0] next_state;
reg [3:0] linienmodule_sequenceexecutor_o_active_offset_next_value0;
reg linienmodule_sequenceexecutor_o_active_offset_next_value_ce0;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_pid_out_next_value1;
reg linienmodule_sequenceexecutor_o_saved_pid_out_next_value_ce1;
reg signed [24:0] linienmodule_sequenceexecutor_o_saved_integrator_next_value2;
reg linienmodule_sequenceexecutor_o_saved_integrator_next_value_ce2;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value3;
reg linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value_ce3;
reg signed [13:0] linienmodule_sequenceexecutor_o_saved_dac_out_next_value4;
reg linienmodule_sequenceexecutor_o_saved_dac_out_next_value_ce4;
wire [16:0] slice_proxy0;
wire [16:0] slice_proxy1;
wire [16:0] slice_proxy2;
wire [16:0] slice_proxy3;
reg signed [13:0] comb_self0;
reg signed [24:0] comb_self1;
reg signed [24:0] comb_self2;
reg signed [24:0] comb_self3;
reg signed [24:0] comb_self4;
reg signed [24:0] sync_self0;
reg signed [24:0] sync_self1;
reg signed [24:0] sync_self2;
reg signed [24:0] sync_self3;
reg signed [24:0] sync_self4;
reg signed [24:0] sync_self5;
reg signed [24:0] sync_self6;
reg signed [24:0] sync_self7;
reg sync_self8;
reg self;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [7:0] xilinxmultiregimpl0_xilinxmultiregimpl00 = 8'd0;
(* async_reg = "true", dont_touch = "true" *) reg [7:0] xilinxmultiregimpl0_xilinxmultiregimpl01 = 8'd0;
wire xilinxmultiregimpl0_i;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [7:0] xilinxmultiregimpl1_xilinxmultiregimpl10 = 8'd0;
(* async_reg = "true", dont_touch = "true" *) reg [7:0] xilinxmultiregimpl1_xilinxmultiregimpl11 = 8'd0;
wire xilinxmultiregimpl1_i;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign ps_axi_aclk = ps_fclk[0];
assign ps_axi_arstn = ps_frstn[0];
assign ps_sys_clk = ps_axi_aclk;
assign ps_sys_rstn = ps_axi_arstn;
assign sys_ps_clk = ps_fclk[0];
assign sys_ps_rst = (~ps_frstn[0]);
assign pwm = linienmodule_deltasigma0_out;
assign pwm_1 = linienmodule_deltasigma1_out;
assign pwm_2 = linienmodule_deltasigma2_out;
assign pwm_3 = linienmodule_deltasigma3_out;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	linienmodule_led_val <= 8'd0;
	linienmodule_led_val[0] <= linienmodule_sequenceexecutor_arm_storage[0];
	linienmodule_led_val[2] <= linienmodule_sequenceexecutor_arm_storage[1];
	linienmodule_led_val[4] <= linienmodule_sequenceexecutor_arm_storage[2];
	linienmodule_led_val[6] <= linienmodule_sequenceexecutor_arm_storage[3];
	linienmodule_led_val[1] <= linienmodule_sequenceexecutor_active[0];
	linienmodule_led_val[3] <= linienmodule_sequenceexecutor_active[1];
	linienmodule_led_val[5] <= linienmodule_sequenceexecutor_active[2];
	linienmodule_led_val[7] <= linienmodule_sequenceexecutor_active[3];
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign {user_led_7, user_led_6, user_led_5, user_led_4, user_led_3, user_led_2, user_led_1, user_led} = linienmodule_led_val;
assign linienmodule_sys_rstn = linienmodule_target_rstn;
assign linienmodule_sys_clk = linienmodule_target_clk;
assign linienmodule_sys_addr = linienmodule_target_addr;
assign linienmodule_sys_wdata = linienmodule_target_wdata;
assign linienmodule_sys_sel = linienmodule_target_sel;
assign linienmodule_sys_wen = linienmodule_target_wen;
assign linienmodule_sys_ren = linienmodule_target_ren;
assign linienmodule_target_rdata = linienmodule_sys_rdata;
assign linienmodule_target_err = linienmodule_sys_err;
assign linienmodule_target_ack = linienmodule_sys_ack;
assign linienmodule_fast_a_adc = linienmodule_analog_adc_a;
assign linienmodule_fast_b_adc = linienmodule_analog_adc_b;

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	linienmodule_mixed <= 37'sd0;
	if (linienmodule_dual_channel_storage) begin
		linienmodule_mixed <= ((($signed({1'd0, linienmodule_chain_a_factor_storage}) * linienmodule_fast_a_out_i) + ($signed({1'd0, linienmodule_chain_b_factor_storage}) * linienmodule_fast_b_out_i)) + (linienmodule_combined_offset_signed <<< 5'd19));
	end else begin
		linienmodule_mixed <= ((linienmodule_fast_a_out_i <<< 4'd8) + (linienmodule_combined_offset_signed <<< 5'd19));
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_limit_error_signal_x = (linienmodule_mixed >>> 4'd8);
assign linienmodule_mixed_limited = linienmodule_limit_error_signal_limitcsr_y;

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	linienmodule_pid_input <= 25'sd0;
	if (linienmodule_pid_only_mode_storage) begin
		linienmodule_pid_input <= (linienmodule_analog_adc_a <<< 4'd11);
	end else begin
		linienmodule_pid_input <= linienmodule_mixed_limited;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_pid_out = (linienmodule_pid_pid_out >>> 4'd11);
assign linienmodule_slowchain_running = linienmodule_autolock_status;
assign linienmodule_slowchain_input0 = (linienmodule_control_signal >>> 4'd11);
assign linienmodule_decimate_decimation = linienmodule_slow_decimation_storage;
assign decimated_clock_clk = linienmodule_decimate_output;
assign linienmodule_slow_value_status = linienmodule_slowchain_output;
assign linienmodule = ((((((linienmodule_control_channel_storage == 1'd0) ? linienmodule_pid_out : $signed({1'd0, 1'd0})) + ((linienmodule_mod_channel_storage == 1'd0) ? linienmodule_mod_y : $signed({1'd0, 1'd0}))) + ((linienmodule_sweep_channel_storage == 1'd0) ? linienmodule_sweep_y : $signed({1'd0, 1'd0}))) + ((linienmodule_sweep_channel_storage == 1'd0) ? linienmodule_out_offset_signed : $signed({1'd0, 1'd0}))) + ((linienmodule_slow_control_channel_storage == 1'd0) ? linienmodule_slowchain_output : $signed({1'd0, 1'd0})));
assign linienmodule_fast_outs = ((((((linienmodule_control_channel_storage == 1'd1) ? linienmodule_pid_out : $signed({1'd0, 1'd0})) + ((linienmodule_mod_channel_storage == 1'd1) ? linienmodule_mod_y : $signed({1'd0, 1'd0}))) + ((linienmodule_sweep_channel_storage == 1'd1) ? linienmodule_sweep_y : $signed({1'd0, 1'd0}))) + ((linienmodule_sweep_channel_storage == 1'd1) ? linienmodule_out_offset_signed : $signed({1'd0, 1'd0}))) + ((linienmodule_slow_control_channel_storage == 1'd1) ? linienmodule_slowchain_output : $signed({1'd0, 1'd0})));
assign linienmodule_analog_out = ((((linienmodule_sweep_channel_storage == 2'd2) ? linienmodule_sweep_y : $signed({1'd0, 1'd0})) + ((linienmodule_sweep_channel_storage == 2'd2) ? linienmodule_out_offset_signed : $signed({1'd0, 1'd0}))) + ((linienmodule_slow_control_channel_storage == 2'd2) ? linienmodule_slowchain_output : $signed({1'd0, 1'd0})));
assign linienmodule_slowchain_x = linienmodule_analog_out;
assign linienmodule_deltasigma0_data = linienmodule_slow_out_shifted;
assign linienmodule_deltasigma1_data = linienmodule_csrstorage0_storage0;
assign linienmodule_deltasigma2_data = linienmodule_csrstorage1_storage0;
assign linienmodule_deltasigma3_data = linienmodule_csrstorage2_storage0;
assign linienmodule_scopegen_gpio_trigger = linienmodule_gpio_p_i[0];
assign linienmodule_scopegen_sweep_trigger = linienmodule_sweep_sweep_trigger;
assign linienmodule_scopegen_automatically_rearm = (linienmodule_autolock_request_lock_storage & (~linienmodule_autolock_status));
assign linienmodule_scopegen_automatically_trigger = linienmodule_autolock_status;

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	linienmodule_analog_dac_b <= 14'sd0;
	if (linienmodule_sequenceexecutor_active) begin
		linienmodule_analog_dac_b <= linienmodule_sequenceexecutor_dac_out;
	end else begin
		linienmodule_analog_dac_b <= linienmodule_limit_fast2_limitcsr_y;
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_analog_dac_a = linienmodule_limit_fast1_limitcsr_y;

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	linienmodule_ttl_pins <= 4'd0;
	linienmodule_ttl_pins[0] <= linienmodule_gpio_p_i[1];
	linienmodule_ttl_pins[1] <= linienmodule_gpio_p_i[2];
	linienmodule_ttl_pins[2] <= linienmodule_gpio_p_i[3];
	linienmodule_ttl_pins[3] <= linienmodule_gpio_p_i[4];
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_sequenceexecutor_ttl_in = linienmodule_ttl_pins;
assign linienmodule_sequenceexecutor_linien_pid_out = linienmodule_pid_out;
assign linienmodule_sequenceexecutor_linien_integrator = linienmodule_pid_int_out;
assign linienmodule_sequenceexecutor_linien_sweep_pos = linienmodule_sweep_y;
assign linienmodule_sequenceexecutor_linien_dac_out = linienmodule_limit_fast2_limitcsr_y;
assign linienmodule_pid_i_ttl_active = linienmodule_sequenceexecutor_active;
assign linienmodule_pid_running = (linienmodule_autolock_status & (~linienmodule_sequenceexecutor_pid_pause));
assign linienmodule_sweep_hold = (linienmodule_autolock_status | linienmodule_sequenceexecutor_pid_pause);
assign linienmodule_autolock_fast_sweep_value = linienmodule_sweep_y;
assign linienmodule_autolock_fast_sweep_up = linienmodule_sweep_sweep_up;
assign linienmodule_autolock_fast_sweep_step = (linienmodule_sweep_step_storage >>> 5'd24);
assign linienmodule_raw_acquisition_iir_x = linienmodule_combined_error_signal;
assign linienmodule_raw_acquisition_iir_hold = 1'd0;
assign linienmodule_raw_acquisition_iir_clear = 1'd0;
assign linienmodule_combined_error_signal_filtered = linienmodule_raw_acquisition_iir_y0;
assign linienmodule_combined_error_signal = linienmodule_limit_error_signal_limitcsr_y;
assign linienmodule_control_signal = (comb_self0 <<< 4'd11);
assign linienmodule_sig_status9 = linienmodule_control_signal;
assign linienmodule_sig_status10 = linienmodule_combined_error_signal;
assign linienmodule_sig_status11 = linienmodule_combined_error_signal_filtered;
assign linienmodule_mod_phase = linienmodule_mod_z[31:18];
assign linienmodule_mod_xi = ($signed({1'd0, linienmodule_mod_amp_storage}) + linienmodule_mod_x);
assign linienmodule_mod_zi = (linienmodule_mod_phase <<< 1'd1);
assign linienmodule_mod_y = (linienmodule_mod_cordic_xo >>> 1'd1);
assign linienmodule_mod_cordic0 = (linienmodule_mod_cordic_xi <<< 2'd2);
assign linienmodule_mod_cordic16 = (linienmodule_mod_cordic_yi <<< 2'd2);
assign linienmodule_mod_cordic32 = (linienmodule_mod_cordic_zi <<< 2'd2);
assign linienmodule_mod_cordic_xo = (linienmodule_mod_cordic15 >>> 2'd2);
assign linienmodule_mod_cordic_yo = (linienmodule_mod_cordic31 >>> 2'd2);
assign linienmodule_mod_cordic_zo = (linienmodule_mod_cordic47 >>> 2'd2);
assign linienmodule_mod_cordic_new_out = 1'd1;
assign linienmodule_mod_cordic_new_in = 1'd1;
assign linienmodule_mod_cordic_dir0 = (linienmodule_mod_cordic32 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir1 = (linienmodule_mod_cordic33 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir2 = (linienmodule_mod_cordic34 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir3 = (linienmodule_mod_cordic35 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir4 = (linienmodule_mod_cordic36 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir5 = (linienmodule_mod_cordic37 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir6 = (linienmodule_mod_cordic38 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir7 = (linienmodule_mod_cordic39 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir8 = (linienmodule_mod_cordic40 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir9 = (linienmodule_mod_cordic41 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir10 = (linienmodule_mod_cordic42 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir11 = (linienmodule_mod_cordic43 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir12 = (linienmodule_mod_cordic44 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir13 = (linienmodule_mod_cordic45 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_cordic_dir14 = (linienmodule_mod_cordic46 < $signed({1'd0, 1'd0}));
assign linienmodule_mod_q = (linienmodule_mod_zi[13] ^ linienmodule_mod_zi[14]);

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	linienmodule_mod_cordic_xi <= 15'sd0;
	linienmodule_mod_cordic_yi <= 15'sd0;
	linienmodule_mod_cordic_zi <= 15'sd0;
	if (linienmodule_mod_q) begin
		{linienmodule_mod_cordic_zi, linienmodule_mod_cordic_yi, linienmodule_mod_cordic_xi} <= {(linienmodule_mod_zi + $signed({1'd0, 15'd16384})), (-linienmodule_mod_yi), (-linienmodule_mod_xi)};
	end else begin
		{linienmodule_mod_cordic_zi, linienmodule_mod_cordic_yi, linienmodule_mod_cordic_xi} <= {linienmodule_mod_zi, linienmodule_mod_yi, linienmodule_mod_xi};
	end
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_sweep_sweep_run = ((~linienmodule_sweep_clear) & linienmodule_sweep_run_storage);
assign linienmodule_sweep_sweep_hold = linienmodule_sweep_hold;
assign linienmodule_sweep_limit_x = (linienmodule_sweep_sweep_y >>> 5'd24);
assign linienmodule_sweep_sweep_step = linienmodule_sweep_step_storage;

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	linienmodule_sweep_sweep_up <= 1'd0;
	if (linienmodule_sweep_sweep_run) begin
		if ((linienmodule_sweep_sweep_turn & (~linienmodule_sweep_sweep_turning))) begin
			linienmodule_sweep_sweep_up <= (~linienmodule_sweep_sweep_dir);
		end else begin
			linienmodule_sweep_sweep_up <= linienmodule_sweep_sweep_dir;
		end
	end else begin
		linienmodule_sweep_sweep_up <= 1'd1;
	end
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	linienmodule_sweep_limit_y <= 15'sd0;
	linienmodule_sweep_limit_railed <= 1'd0;
	if ((linienmodule_sweep_limit_x >= linienmodule_sweep_limit_max)) begin
		linienmodule_sweep_limit_y <= linienmodule_sweep_limit_max;
		linienmodule_sweep_limit_railed <= 1'd1;
	end else begin
		if ((linienmodule_sweep_limit_x <= linienmodule_sweep_limit_min)) begin
			linienmodule_sweep_limit_y <= linienmodule_sweep_limit_min;
			linienmodule_sweep_limit_railed <= 1'd1;
		end else begin
			linienmodule_sweep_limit_y <= linienmodule_sweep_limit_x;
			linienmodule_sweep_limit_railed <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_limit_error_signal_limit_x = linienmodule_limit_error_signal_x;

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	linienmodule_limit_error_signal_limit_y <= 29'sd0;
	linienmodule_limit_error_signal_limit_railed <= 1'd0;
	if ((linienmodule_limit_error_signal_limit_x >= linienmodule_limit_error_signal_limit_max)) begin
		linienmodule_limit_error_signal_limit_y <= linienmodule_limit_error_signal_limit_max;
		linienmodule_limit_error_signal_limit_railed <= 1'd1;
	end else begin
		if ((linienmodule_limit_error_signal_limit_x <= linienmodule_limit_error_signal_limit_min)) begin
			linienmodule_limit_error_signal_limit_y <= linienmodule_limit_error_signal_limit_min;
			linienmodule_limit_error_signal_limit_railed <= 1'd1;
		end else begin
			linienmodule_limit_error_signal_limit_y <= linienmodule_limit_error_signal_limit_x;
			linienmodule_limit_error_signal_limit_railed <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_limit_fast1_limit_x = linienmodule_limit_fast1_x;

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	linienmodule_limit_fast1_limit_y <= 19'sd0;
	linienmodule_limit_fast1_limit_railed <= 1'd0;
	if ((linienmodule_limit_fast1_limit_x >= linienmodule_limit_fast1_limit_max)) begin
		linienmodule_limit_fast1_limit_y <= linienmodule_limit_fast1_limit_max;
		linienmodule_limit_fast1_limit_railed <= 1'd1;
	end else begin
		if ((linienmodule_limit_fast1_limit_x <= linienmodule_limit_fast1_limit_min)) begin
			linienmodule_limit_fast1_limit_y <= linienmodule_limit_fast1_limit_min;
			linienmodule_limit_fast1_limit_railed <= 1'd1;
		end else begin
			linienmodule_limit_fast1_limit_y <= linienmodule_limit_fast1_limit_x;
			linienmodule_limit_fast1_limit_railed <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_limit_fast2_limit_x = linienmodule_limit_fast2_x;

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	linienmodule_limit_fast2_limit_y <= 19'sd0;
	linienmodule_limit_fast2_limit_railed <= 1'd0;
	if ((linienmodule_limit_fast2_limit_x >= linienmodule_limit_fast2_limit_max)) begin
		linienmodule_limit_fast2_limit_y <= linienmodule_limit_fast2_limit_max;
		linienmodule_limit_fast2_limit_railed <= 1'd1;
	end else begin
		if ((linienmodule_limit_fast2_limit_x <= linienmodule_limit_fast2_limit_min)) begin
			linienmodule_limit_fast2_limit_y <= linienmodule_limit_fast2_limit_min;
			linienmodule_limit_fast2_limit_railed <= 1'd1;
		end else begin
			linienmodule_limit_fast2_limit_y <= linienmodule_limit_fast2_limit_x;
			linienmodule_limit_fast2_limit_railed <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_pid_setpoint_signed = linienmodule_pid_setpoint_storage;

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	linienmodule_pid_error <= 26'sd0;
	if (linienmodule_pid_running) begin
		linienmodule_pid_error <= (linienmodule_pid_input - $signed({1'd0, linienmodule_pid_setpoint_storage}));
	end else begin
		linienmodule_pid_error <= 1'd0;
	end
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_pid_kp_signed = linienmodule_pid_kp_storage;
assign linienmodule_pid_kp_mult = (linienmodule_pid_error * linienmodule_pid_kp_signed);
assign linienmodule_pid_output_p = (linienmodule_pid_kp_mult >>> 4'd12);
assign linienmodule_pid_ki_signed = linienmodule_pid_ki_storage;
assign linienmodule_pid_ki_mult = ((linienmodule_pid_error * linienmodule_pid_ki_signed) >>> 3'd4);
assign linienmodule_pid_int_sum = (linienmodule_pid_ki_mult + linienmodule_pid_int_reg);
assign linienmodule_pid_int_out = (linienmodule_pid_int_reg >>> 5'd18);
assign linienmodule_pid_kd_signed = linienmodule_pid_kd_storage;
assign linienmodule_pid_kd_mult = (linienmodule_pid_error * linienmodule_pid_kd_signed);

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	linienmodule_pid_pid_out <= 25'sd0;
	if ((linienmodule_pid_pid_sum > $signed({1'd0, 24'd16777215}))) begin
		linienmodule_pid_pid_out <= 24'd16777215;
	end else begin
		if ((linienmodule_pid_pid_sum < 25'sd16777216)) begin
			linienmodule_pid_pid_out <= 25'sd16777216;
		end else begin
			linienmodule_pid_pid_out <= linienmodule_pid_pid_sum[24:0];
		end
	end
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_autolock_fast_request_lock = linienmodule_autolock_request_lock_storage;
assign linienmodule_autolock_fast_target_position_signed = linienmodule_autolock_fast_storage;
assign linienmodule_sequenceexecutor_i_ttl = linienmodule_sequenceexecutor_ttl_in;
assign linienmodule_sequenceexecutor_i_enable = linienmodule_sequenceexecutor_arm_storage;
assign linienmodule_sequenceexecutor_i_seq_done = linienmodule_sequenceexecutor_seq_done;
assign linienmodule_sequenceexecutor_i_linien_pid_out = linienmodule_sequenceexecutor_linien_pid_out;
assign linienmodule_sequenceexecutor_i_linien_integrator = linienmodule_sequenceexecutor_linien_integrator;
assign linienmodule_sequenceexecutor_i_linien_sweep_pos = linienmodule_sequenceexecutor_linien_sweep_pos;
assign linienmodule_sequenceexecutor_i_linien_dac_out = linienmodule_sequenceexecutor_linien_dac_out;
assign linienmodule_sequenceexecutor_status_1_status = linienmodule_sequenceexecutor_o_status0;
assign linienmodule_sequenceexecutor_status_2_status = linienmodule_sequenceexecutor_o_status1;
assign linienmodule_sequenceexecutor_status_3_status = linienmodule_sequenceexecutor_o_status2;
assign linienmodule_sequenceexecutor_status_4_status = linienmodule_sequenceexecutor_o_status3;
assign linienmodule_sequenceexecutor_active = linienmodule_sequenceexecutor_o_active;
assign linienmodule_sequenceexecutor_pid_pause = (linienmodule_sequenceexecutor_o_active != 1'd0);
assign linienmodule_sequenceexecutor_dac_out = linienmodule_sequenceexecutor_o_dac_drive;
assign linienmodule_sequenceexecutor_saved_pid_out_status = linienmodule_sequenceexecutor_o_saved_pid_out;
assign linienmodule_sequenceexecutor_saved_integrator_status = linienmodule_sequenceexecutor_o_saved_integrator;
assign linienmodule_sequenceexecutor_saved_sweep_pos_status = linienmodule_sequenceexecutor_o_saved_sweep_pos;
assign linienmodule_sequenceexecutor_saved_dac_out_status = linienmodule_sequenceexecutor_o_saved_dac_out;

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	linienmodule_sequenceexecutor_num_blocks <= 4'd0;
	case (linienmodule_sequenceexecutor_active)
		1'd1: begin
			linienmodule_sequenceexecutor_num_blocks <= linienmodule_sequenceexecutor_num_blocks_1_storage;
		end
		2'd2: begin
			linienmodule_sequenceexecutor_num_blocks <= linienmodule_sequenceexecutor_num_blocks_2_storage;
		end
		3'd4: begin
			linienmodule_sequenceexecutor_num_blocks <= linienmodule_sequenceexecutor_num_blocks_3_storage;
		end
		4'd8: begin
			linienmodule_sequenceexecutor_num_blocks <= linienmodule_sequenceexecutor_num_blocks_4_storage;
		end
		default: begin
			linienmodule_sequenceexecutor_num_blocks <= linienmodule_sequenceexecutor_num_blocks_1_storage;
		end
	endcase
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_sequenceexecutor_rising_edge = (linienmodule_sequenceexecutor_ttl_sync1 & (~linienmodule_sequenceexecutor_ttl_prev));
assign linienmodule_sequenceexecutor_armed = (linienmodule_sequenceexecutor_i_enable & (~linienmodule_sequenceexecutor_o_active));

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	linienmodule_sequenceexecutor_priority_rising_edge <= 4'd0;
	linienmodule_sequenceexecutor_priority_rising_edge <= 1'd0;
	if (linienmodule_sequenceexecutor_rising_edge[0]) begin
		linienmodule_sequenceexecutor_priority_rising_edge <= 1'd1;
	end else begin
		if (linienmodule_sequenceexecutor_rising_edge[1]) begin
			linienmodule_sequenceexecutor_priority_rising_edge <= 2'd2;
		end else begin
			if (linienmodule_sequenceexecutor_rising_edge[2]) begin
				linienmodule_sequenceexecutor_priority_rising_edge <= 3'd4;
			end else begin
				if (linienmodule_sequenceexecutor_rising_edge[3]) begin
					linienmodule_sequenceexecutor_priority_rising_edge <= 4'd8;
				end
			end
		end
	end
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_sequenceexecutor_o_status0 = {linienmodule_sequenceexecutor_armed[0], linienmodule_sequenceexecutor_o_active_offset[0]};
assign linienmodule_sequenceexecutor_o_status1 = {linienmodule_sequenceexecutor_armed[1], linienmodule_sequenceexecutor_o_active_offset[1]};
assign linienmodule_sequenceexecutor_o_status2 = {linienmodule_sequenceexecutor_armed[2], linienmodule_sequenceexecutor_o_active_offset[2]};
assign linienmodule_sequenceexecutor_o_status3 = {linienmodule_sequenceexecutor_armed[3], linienmodule_sequenceexecutor_o_active_offset[3]};

// synthesis translate_off
reg dummy_d_15;
// synthesis translate_on
always @(*) begin
	linienmodule_sequenceexecutor_o_fsm_start <= 1'd0;
	linienmodule_sequenceexecutor_o_active <= 4'd0;
	next_state <= 2'd0;
	linienmodule_sequenceexecutor_o_active_offset_next_value0 <= 4'd0;
	linienmodule_sequenceexecutor_o_active_offset_next_value_ce0 <= 1'd0;
	linienmodule_sequenceexecutor_o_saved_pid_out_next_value1 <= 14'sd0;
	linienmodule_sequenceexecutor_o_saved_pid_out_next_value_ce1 <= 1'd0;
	linienmodule_sequenceexecutor_o_saved_integrator_next_value2 <= 25'sd0;
	linienmodule_sequenceexecutor_o_saved_integrator_next_value_ce2 <= 1'd0;
	linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value3 <= 14'sd0;
	linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value_ce3 <= 1'd0;
	linienmodule_sequenceexecutor_o_saved_dac_out_next_value4 <= 14'sd0;
	linienmodule_sequenceexecutor_o_saved_dac_out_next_value_ce4 <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			linienmodule_sequenceexecutor_o_active <= 1'd0;
			linienmodule_sequenceexecutor_o_fsm_start <= 1'd0;
			linienmodule_sequenceexecutor_o_saved_pid_out_next_value1 <= linienmodule_sequenceexecutor_i_linien_pid_out;
			linienmodule_sequenceexecutor_o_saved_pid_out_next_value_ce1 <= 1'd1;
			linienmodule_sequenceexecutor_o_saved_integrator_next_value2 <= linienmodule_sequenceexecutor_i_linien_integrator;
			linienmodule_sequenceexecutor_o_saved_integrator_next_value_ce2 <= 1'd1;
			linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value3 <= linienmodule_sequenceexecutor_i_linien_sweep_pos;
			linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value_ce3 <= 1'd1;
			linienmodule_sequenceexecutor_o_saved_dac_out_next_value4 <= linienmodule_sequenceexecutor_i_linien_dac_out;
			linienmodule_sequenceexecutor_o_saved_dac_out_next_value_ce4 <= 1'd1;
			next_state <= 2'd2;
		end
		2'd2: begin
			linienmodule_sequenceexecutor_o_active <= linienmodule_sequenceexecutor_o_active_offset;
			linienmodule_sequenceexecutor_o_fsm_start <= 1'd1;
			next_state <= 2'd3;
		end
		2'd3: begin
			linienmodule_sequenceexecutor_o_active <= linienmodule_sequenceexecutor_o_active_offset;
			linienmodule_sequenceexecutor_o_fsm_start <= 1'd0;
			if (linienmodule_sequenceexecutor_i_seq_done) begin
				next_state <= 1'd0;
				linienmodule_sequenceexecutor_o_active_offset_next_value0 <= 1'd0;
				linienmodule_sequenceexecutor_o_active_offset_next_value_ce0 <= 1'd1;
			end
		end
		default: begin
			linienmodule_sequenceexecutor_o_active <= 1'd0;
			linienmodule_sequenceexecutor_o_fsm_start <= 1'd0;
			if (((((linienmodule_sequenceexecutor_armed[0] & linienmodule_sequenceexecutor_priority_rising_edge[0]) | (linienmodule_sequenceexecutor_armed[1] & linienmodule_sequenceexecutor_priority_rising_edge[1])) | (linienmodule_sequenceexecutor_armed[2] & linienmodule_sequenceexecutor_priority_rising_edge[2])) | (linienmodule_sequenceexecutor_armed[3] & linienmodule_sequenceexecutor_priority_rising_edge[3]))) begin
				next_state <= 1'd1;
				linienmodule_sequenceexecutor_o_active_offset_next_value0 <= linienmodule_sequenceexecutor_priority_rising_edge;
				linienmodule_sequenceexecutor_o_active_offset_next_value_ce0 <= 1'd1;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_raw_acquisition_iir_railed = (~((linienmodule_raw_acquisition_iir_y_next[49:47] == $signed({1'd0, linienmodule_raw_acquisition_iir_y_pat})) | (linienmodule_raw_acquisition_iir_y_next[49:47] == $signed({1'd0, (~linienmodule_raw_acquisition_iir_y_pat)}))));

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	linienmodule_raw_acquisition_iir_y_lim <= 25'sd0;
	if (linienmodule_raw_acquisition_iir_railed) begin
		linienmodule_raw_acquisition_iir_y_lim <= linienmodule_raw_acquisition_iir_y0;
	end else begin
		linienmodule_raw_acquisition_iir_y_lim <= linienmodule_raw_acquisition_iir_y_next[49:23];
	end
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_raw_acquisition_iir_z0 = (linienmodule_raw_acquisition_iir_zr0 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b5));
assign linienmodule_raw_acquisition_iir_z1 = (linienmodule_raw_acquisition_iir_zr1 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b4));
assign linienmodule_raw_acquisition_iir_z2 = (linienmodule_raw_acquisition_iir_zr2 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b3));
assign linienmodule_raw_acquisition_iir_z3 = (linienmodule_raw_acquisition_iir_zr3 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b2));
assign linienmodule_raw_acquisition_iir_z4 = (linienmodule_raw_acquisition_iir_zr4 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b1));
assign linienmodule_raw_acquisition_iir_z5 = (linienmodule_raw_acquisition_iir_zr5 + (linienmodule_raw_acquisition_iir_x * linienmodule_raw_acquisition_iir_b0));
assign linienmodule_raw_acquisition_iir_z6 = (linienmodule_raw_acquisition_iir_zr6 + (linienmodule_raw_acquisition_iir_y1 * linienmodule_raw_acquisition_iir_a5));
assign linienmodule_raw_acquisition_iir_z7 = (linienmodule_raw_acquisition_iir_zr7 + (linienmodule_raw_acquisition_iir_y1 * linienmodule_raw_acquisition_iir_a4));
assign linienmodule_raw_acquisition_iir_z8 = (linienmodule_raw_acquisition_iir_zr8 + (linienmodule_raw_acquisition_iir_y1 * linienmodule_raw_acquisition_iir_a3));
assign linienmodule_raw_acquisition_iir_z9 = (linienmodule_raw_acquisition_iir_zr9 + (linienmodule_raw_acquisition_iir_y1 * linienmodule_raw_acquisition_iir_a2));
assign linienmodule_raw_acquisition_iir_z10 = (linienmodule_raw_acquisition_iir_zr10 + (linienmodule_raw_acquisition_iir_y1 * linienmodule_raw_acquisition_iir_a1));
assign linienmodule_raw_acquisition_iir_y_next = linienmodule_raw_acquisition_iir_z10;
assign adc_cdcs = 1'd1;
assign adc_clk = 2'd2;
assign linienmodule_analog_adc_a = {linienmodule_analog_adca[15], (~linienmodule_analog_adca[14:2])};
assign linienmodule_analog_adc_b = {linienmodule_analog_adcb[15], (~linienmodule_analog_adcb[14:2])};
assign dac_rst = sys_rst;
assign linienmodule_xadc0 = linienmodule_xadc_a_status;
assign linienmodule_xadc1 = linienmodule_xadc_b_status;
assign linienmodule_xadc2 = linienmodule_xadc_c_status;
assign linienmodule_xadc3 = linienmodule_xadc_d_status;
assign linienmodule_deltasigma0_delta = (linienmodule_deltasigma0_out <<< 4'd15);
assign linienmodule_deltasigma0_out = linienmodule_deltasigma0_sigma[15];
assign linienmodule_deltasigma1_delta = (linienmodule_deltasigma1_out <<< 4'd15);
assign linienmodule_deltasigma1_out = linienmodule_deltasigma1_sigma[15];
assign linienmodule_deltasigma2_delta = (linienmodule_deltasigma2_out <<< 4'd15);
assign linienmodule_deltasigma2_out = linienmodule_deltasigma2_sigma[15];
assign linienmodule_deltasigma3_delta = (linienmodule_deltasigma3_out <<< 4'd15);
assign linienmodule_deltasigma3_out = linienmodule_deltasigma3_sigma[15];
assign {linienmodule_gpio_n_tstriple7_o, linienmodule_gpio_n_tstriple6_o, linienmodule_gpio_n_tstriple5_o, linienmodule_gpio_n_tstriple4_o, linienmodule_gpio_n_tstriple3_o, linienmodule_gpio_n_tstriple2_o, linienmodule_gpio_n_tstriple1_o, linienmodule_gpio_n_tstriple0_o} = (linienmodule_gpio_n_outs_storage | linienmodule_gpio_n_o);
assign {linienmodule_gpio_n_tstriple7_oe, linienmodule_gpio_n_tstriple6_oe, linienmodule_gpio_n_tstriple5_oe, linienmodule_gpio_n_tstriple4_oe, linienmodule_gpio_n_tstriple3_oe, linienmodule_gpio_n_tstriple2_oe, linienmodule_gpio_n_tstriple1_oe, linienmodule_gpio_n_tstriple0_oe} = linienmodule_gpio_n_oes_storage;
assign linienmodule_gpio_n_status = linienmodule_gpio_n_i;
assign linienmodule_state = {linienmodule_gpio_n_i, 1'd1};
assign {linienmodule_gpio_p_tstriple7_o, linienmodule_gpio_p_tstriple6_o, linienmodule_gpio_p_tstriple5_o, linienmodule_gpio_p_tstriple4_o, linienmodule_gpio_p_tstriple3_o, linienmodule_gpio_p_tstriple2_o, linienmodule_gpio_p_tstriple1_o, linienmodule_gpio_p_tstriple0_o} = (linienmodule_gpio_p_outs_storage | linienmodule_gpio_p_o);
assign {linienmodule_gpio_p_tstriple7_oe, linienmodule_gpio_p_tstriple6_oe, linienmodule_gpio_p_tstriple5_oe, linienmodule_gpio_p_tstriple4_oe, linienmodule_gpio_p_tstriple3_oe, linienmodule_gpio_p_tstriple2_oe, linienmodule_gpio_p_tstriple1_oe, linienmodule_gpio_p_tstriple0_oe} = linienmodule_gpio_p_oes_storage;
assign linienmodule_gpio_p_status = linienmodule_gpio_p_i;
assign linienmodule_fast_a_x0 = (linienmodule_fast_a_adc <<< 4'd11);
assign linienmodule_fast_a_x1 = linienmodule_fast_a_adc;
assign linienmodule_fast_a_phase = linienmodule_mod_phase;
assign linienmodule_fast_a_limitcsr0_x0 = ((linienmodule_fast_a_i <<< 4'd11) + linienmodule_fast_a_dx);
assign linienmodule_fast_a_iir0_x0 = linienmodule_fast_a_limitcsr0_limitcsr0_y0;
assign linienmodule_fast_a_iir0_hold0 = 1'd0;
assign linienmodule_fast_a_iir0_clear0 = 1'd0;
assign linienmodule_fast_a_iir0_x1 = linienmodule_fast_a_iir0_y0;
assign linienmodule_fast_a_iir0_hold1 = 1'd0;
assign linienmodule_fast_a_iir0_clear1 = 1'd0;
assign linienmodule_fast_a_limitcsr0_x1 = ((linienmodule_fast_a_invert_storage ? 1'sd1 : $signed({1'd0, 1'd1})) * ((comb_self1 + (linienmodule_fast_a_ya <<< 4'd11)) + (linienmodule_chain_a_offset_signed <<< 4'd11)));
assign linienmodule_fast_a_out_i = linienmodule_fast_a_limitcsr0_limitcsr0_y1;
assign linienmodule_fast_a_limitcsr1_x0 = ((linienmodule_fast_a_q0 <<< 4'd11) + linienmodule_fast_a_dx);
assign linienmodule_fast_a_iir1_x0 = linienmodule_fast_a_limitcsr1_limitcsr1_y0;
assign linienmodule_fast_a_iir1_hold0 = 1'd0;
assign linienmodule_fast_a_iir1_clear0 = 1'd0;
assign linienmodule_fast_a_iir1_x1 = linienmodule_fast_a_iir1_y0;
assign linienmodule_fast_a_iir1_hold1 = 1'd0;
assign linienmodule_fast_a_iir1_clear1 = 1'd0;
assign linienmodule_fast_a_limitcsr1_x1 = ((linienmodule_fast_a_invert_storage ? 1'sd1 : $signed({1'd0, 1'd1})) * ((comb_self2 + (linienmodule_fast_a_ya <<< 4'd11)) + (linienmodule_chain_a_offset_signed <<< 4'd11)));
assign linienmodule_fast_a_out_q = linienmodule_fast_a_limitcsr1_limitcsr1_y1;
assign linienmodule_sig_status0 = linienmodule_fast_a_x0;
assign linienmodule_sig_status1 = linienmodule_fast_a_out_i;
assign linienmodule_sig_status2 = linienmodule_fast_a_out_q;
assign linienmodule_fast_a_xi = linienmodule_fast_a_x1;
assign linienmodule_fast_a_zi = (((linienmodule_fast_a_phase * linienmodule_fast_a_multiplier_storage) + linienmodule_fast_a_delay_storage) <<< 1'd1);
assign linienmodule_fast_a_i = (linienmodule_fast_a_cordic_xo >>> 1'd1);
assign linienmodule_fast_a_q0 = (linienmodule_fast_a_cordic_yo >>> 1'd1);
assign linienmodule_fast_a_cordic0 = (linienmodule_fast_a_cordic_xi <<< 2'd2);
assign linienmodule_fast_a_cordic16 = (linienmodule_fast_a_cordic_yi <<< 2'd2);
assign linienmodule_fast_a_cordic32 = (linienmodule_fast_a_cordic_zi <<< 2'd2);
assign linienmodule_fast_a_cordic_xo = (linienmodule_fast_a_cordic15 >>> 2'd2);
assign linienmodule_fast_a_cordic_yo = (linienmodule_fast_a_cordic31 >>> 2'd2);
assign linienmodule_fast_a_cordic_zo = (linienmodule_fast_a_cordic47 >>> 2'd2);
assign linienmodule_fast_a_cordic_new_out = 1'd1;
assign linienmodule_fast_a_cordic_new_in = 1'd1;
assign linienmodule_fast_a_cordic_dir0 = (linienmodule_fast_a_cordic32 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir1 = (linienmodule_fast_a_cordic33 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir2 = (linienmodule_fast_a_cordic34 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir3 = (linienmodule_fast_a_cordic35 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir4 = (linienmodule_fast_a_cordic36 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir5 = (linienmodule_fast_a_cordic37 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir6 = (linienmodule_fast_a_cordic38 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir7 = (linienmodule_fast_a_cordic39 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir8 = (linienmodule_fast_a_cordic40 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir9 = (linienmodule_fast_a_cordic41 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir10 = (linienmodule_fast_a_cordic42 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir11 = (linienmodule_fast_a_cordic43 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir12 = (linienmodule_fast_a_cordic44 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir13 = (linienmodule_fast_a_cordic45 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_cordic_dir14 = (linienmodule_fast_a_cordic46 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_a_q1 = (linienmodule_fast_a_zi[13] ^ linienmodule_fast_a_zi[14]);

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_cordic_xi <= 15'sd0;
	linienmodule_fast_a_cordic_yi <= 15'sd0;
	linienmodule_fast_a_cordic_zi <= 15'sd0;
	if (linienmodule_fast_a_q1) begin
		{linienmodule_fast_a_cordic_zi, linienmodule_fast_a_cordic_yi, linienmodule_fast_a_cordic_xi} <= {(linienmodule_fast_a_zi + $signed({1'd0, 15'd16384})), (-linienmodule_fast_a_yi), (-linienmodule_fast_a_xi)};
	end else begin
		{linienmodule_fast_a_cordic_zi, linienmodule_fast_a_cordic_yi, linienmodule_fast_a_cordic_xi} <= {linienmodule_fast_a_zi, linienmodule_fast_a_yi, linienmodule_fast_a_xi};
	end
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_limitcsr0_limit_x0 = linienmodule_fast_a_limitcsr0_x0;

// synthesis translate_off
reg dummy_d_18;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_limitcsr0_limit_y0 <= 26'sd0;
	linienmodule_fast_a_limitcsr0_limit_railed0 <= 1'd0;
	if ((linienmodule_fast_a_limitcsr0_limit_x0 >= linienmodule_fast_a_limitcsr0_limit_max0)) begin
		linienmodule_fast_a_limitcsr0_limit_y0 <= linienmodule_fast_a_limitcsr0_limit_max0;
		linienmodule_fast_a_limitcsr0_limit_railed0 <= 1'd1;
	end else begin
		if ((linienmodule_fast_a_limitcsr0_limit_x0 <= linienmodule_fast_a_limitcsr0_limit_min0)) begin
			linienmodule_fast_a_limitcsr0_limit_y0 <= linienmodule_fast_a_limitcsr0_limit_min0;
			linienmodule_fast_a_limitcsr0_limit_railed0 <= 1'd1;
		end else begin
			linienmodule_fast_a_limitcsr0_limit_y0 <= linienmodule_fast_a_limitcsr0_limit_x0;
			linienmodule_fast_a_limitcsr0_limit_railed0 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_18 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir0_railed0 = (~((linienmodule_fast_a_iir0_y_next0[49:47] == $signed({1'd0, linienmodule_fast_a_iir0_y_pat0})) | (linienmodule_fast_a_iir0_y_next0[49:47] == $signed({1'd0, (~linienmodule_fast_a_iir0_y_pat0)}))));

// synthesis translate_off
reg dummy_d_19;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_iir0_y_lim0 <= 25'sd0;
	if (linienmodule_fast_a_iir0_railed0) begin
		linienmodule_fast_a_iir0_y_lim0 <= linienmodule_fast_a_iir0_y0;
	end else begin
		linienmodule_fast_a_iir0_y_lim0 <= linienmodule_fast_a_iir0_y_next0[49:23];
	end
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir0_z0 = (linienmodule_fast_a_iir0_zr0 + (linienmodule_fast_a_iir0_x0 * linienmodule_fast_a_iir0_b10));
assign linienmodule_fast_a_iir0_z1 = (linienmodule_fast_a_iir0_zr1 + (linienmodule_fast_a_iir0_x0 * linienmodule_fast_a_iir0_b00));
assign linienmodule_fast_a_iir0_z2 = (linienmodule_fast_a_iir0_zr2 + (linienmodule_fast_a_iir0_y1 * linienmodule_fast_a_iir0_a10));
assign linienmodule_fast_a_iir0_y_next0 = linienmodule_fast_a_iir0_z2;
assign linienmodule_fast_a_iir0_railed1 = (~((linienmodule_fast_a_iir0_y_next1[49:47] == $signed({1'd0, linienmodule_fast_a_iir0_y_pat1})) | (linienmodule_fast_a_iir0_y_next1[49:47] == $signed({1'd0, (~linienmodule_fast_a_iir0_y_pat1)}))));

// synthesis translate_off
reg dummy_d_20;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_iir0_y_lim1 <= 25'sd0;
	if (linienmodule_fast_a_iir0_railed1) begin
		linienmodule_fast_a_iir0_y_lim1 <= linienmodule_fast_a_iir0_y2;
	end else begin
		linienmodule_fast_a_iir0_y_lim1 <= linienmodule_fast_a_iir0_y_next1[49:23];
	end
// synthesis translate_off
	dummy_d_20 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir0_z3 = (linienmodule_fast_a_iir0_zr3 + (linienmodule_fast_a_iir0_x1 * linienmodule_fast_a_iir0_b2));
assign linienmodule_fast_a_iir0_z4 = (linienmodule_fast_a_iir0_zr4 + (linienmodule_fast_a_iir0_x1 * linienmodule_fast_a_iir0_b11));
assign linienmodule_fast_a_iir0_z5 = (linienmodule_fast_a_iir0_zr5 + (linienmodule_fast_a_iir0_x1 * linienmodule_fast_a_iir0_b01));
assign linienmodule_fast_a_iir0_z6 = (linienmodule_fast_a_iir0_zr6 + (linienmodule_fast_a_iir0_y3 * linienmodule_fast_a_iir0_a2));
assign linienmodule_fast_a_iir0_z7 = (linienmodule_fast_a_iir0_zr7 + (linienmodule_fast_a_iir0_y3 * linienmodule_fast_a_iir0_a11));
assign linienmodule_fast_a_iir0_y_next1 = linienmodule_fast_a_iir0_z7;
assign linienmodule_fast_a_limitcsr0_limit_x1 = linienmodule_fast_a_limitcsr0_x1;

// synthesis translate_off
reg dummy_d_21;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_limitcsr0_limit_y1 <= 28'sd0;
	linienmodule_fast_a_limitcsr0_limit_railed1 <= 1'd0;
	if ((linienmodule_fast_a_limitcsr0_limit_x1 >= linienmodule_fast_a_limitcsr0_limit_max1)) begin
		linienmodule_fast_a_limitcsr0_limit_y1 <= linienmodule_fast_a_limitcsr0_limit_max1;
		linienmodule_fast_a_limitcsr0_limit_railed1 <= 1'd1;
	end else begin
		if ((linienmodule_fast_a_limitcsr0_limit_x1 <= linienmodule_fast_a_limitcsr0_limit_min1)) begin
			linienmodule_fast_a_limitcsr0_limit_y1 <= linienmodule_fast_a_limitcsr0_limit_min1;
			linienmodule_fast_a_limitcsr0_limit_railed1 <= 1'd1;
		end else begin
			linienmodule_fast_a_limitcsr0_limit_y1 <= linienmodule_fast_a_limitcsr0_limit_x1;
			linienmodule_fast_a_limitcsr0_limit_railed1 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_21 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_limitcsr1_limit_x0 = linienmodule_fast_a_limitcsr1_x0;

// synthesis translate_off
reg dummy_d_22;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_limitcsr1_limit_y0 <= 26'sd0;
	linienmodule_fast_a_limitcsr1_limit_railed0 <= 1'd0;
	if ((linienmodule_fast_a_limitcsr1_limit_x0 >= linienmodule_fast_a_limitcsr1_limit_max0)) begin
		linienmodule_fast_a_limitcsr1_limit_y0 <= linienmodule_fast_a_limitcsr1_limit_max0;
		linienmodule_fast_a_limitcsr1_limit_railed0 <= 1'd1;
	end else begin
		if ((linienmodule_fast_a_limitcsr1_limit_x0 <= linienmodule_fast_a_limitcsr1_limit_min0)) begin
			linienmodule_fast_a_limitcsr1_limit_y0 <= linienmodule_fast_a_limitcsr1_limit_min0;
			linienmodule_fast_a_limitcsr1_limit_railed0 <= 1'd1;
		end else begin
			linienmodule_fast_a_limitcsr1_limit_y0 <= linienmodule_fast_a_limitcsr1_limit_x0;
			linienmodule_fast_a_limitcsr1_limit_railed0 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_22 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir1_railed0 = (~((linienmodule_fast_a_iir1_y_next0[49:47] == $signed({1'd0, linienmodule_fast_a_iir1_y_pat0})) | (linienmodule_fast_a_iir1_y_next0[49:47] == $signed({1'd0, (~linienmodule_fast_a_iir1_y_pat0)}))));

// synthesis translate_off
reg dummy_d_23;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_iir1_y_lim0 <= 25'sd0;
	if (linienmodule_fast_a_iir1_railed0) begin
		linienmodule_fast_a_iir1_y_lim0 <= linienmodule_fast_a_iir1_y0;
	end else begin
		linienmodule_fast_a_iir1_y_lim0 <= linienmodule_fast_a_iir1_y_next0[49:23];
	end
// synthesis translate_off
	dummy_d_23 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir1_z0 = (linienmodule_fast_a_iir1_zr0 + (linienmodule_fast_a_iir1_x0 * linienmodule_fast_a_iir1_b10));
assign linienmodule_fast_a_iir1_z1 = (linienmodule_fast_a_iir1_zr1 + (linienmodule_fast_a_iir1_x0 * linienmodule_fast_a_iir1_b00));
assign linienmodule_fast_a_iir1_z2 = (linienmodule_fast_a_iir1_zr2 + (linienmodule_fast_a_iir1_y1 * linienmodule_fast_a_iir1_a10));
assign linienmodule_fast_a_iir1_y_next0 = linienmodule_fast_a_iir1_z2;
assign linienmodule_fast_a_iir1_railed1 = (~((linienmodule_fast_a_iir1_y_next1[49:47] == $signed({1'd0, linienmodule_fast_a_iir1_y_pat1})) | (linienmodule_fast_a_iir1_y_next1[49:47] == $signed({1'd0, (~linienmodule_fast_a_iir1_y_pat1)}))));

// synthesis translate_off
reg dummy_d_24;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_iir1_y_lim1 <= 25'sd0;
	if (linienmodule_fast_a_iir1_railed1) begin
		linienmodule_fast_a_iir1_y_lim1 <= linienmodule_fast_a_iir1_y2;
	end else begin
		linienmodule_fast_a_iir1_y_lim1 <= linienmodule_fast_a_iir1_y_next1[49:23];
	end
// synthesis translate_off
	dummy_d_24 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_a_iir1_z3 = (linienmodule_fast_a_iir1_zr3 + (linienmodule_fast_a_iir1_x1 * linienmodule_fast_a_iir1_b2));
assign linienmodule_fast_a_iir1_z4 = (linienmodule_fast_a_iir1_zr4 + (linienmodule_fast_a_iir1_x1 * linienmodule_fast_a_iir1_b11));
assign linienmodule_fast_a_iir1_z5 = (linienmodule_fast_a_iir1_zr5 + (linienmodule_fast_a_iir1_x1 * linienmodule_fast_a_iir1_b01));
assign linienmodule_fast_a_iir1_z6 = (linienmodule_fast_a_iir1_zr6 + (linienmodule_fast_a_iir1_y3 * linienmodule_fast_a_iir1_a2));
assign linienmodule_fast_a_iir1_z7 = (linienmodule_fast_a_iir1_zr7 + (linienmodule_fast_a_iir1_y3 * linienmodule_fast_a_iir1_a11));
assign linienmodule_fast_a_iir1_y_next1 = linienmodule_fast_a_iir1_z7;
assign linienmodule_fast_a_limitcsr1_limit_x1 = linienmodule_fast_a_limitcsr1_x1;

// synthesis translate_off
reg dummy_d_25;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_a_limitcsr1_limit_y1 <= 28'sd0;
	linienmodule_fast_a_limitcsr1_limit_railed1 <= 1'd0;
	if ((linienmodule_fast_a_limitcsr1_limit_x1 >= linienmodule_fast_a_limitcsr1_limit_max1)) begin
		linienmodule_fast_a_limitcsr1_limit_y1 <= linienmodule_fast_a_limitcsr1_limit_max1;
		linienmodule_fast_a_limitcsr1_limit_railed1 <= 1'd1;
	end else begin
		if ((linienmodule_fast_a_limitcsr1_limit_x1 <= linienmodule_fast_a_limitcsr1_limit_min1)) begin
			linienmodule_fast_a_limitcsr1_limit_y1 <= linienmodule_fast_a_limitcsr1_limit_min1;
			linienmodule_fast_a_limitcsr1_limit_railed1 <= 1'd1;
		end else begin
			linienmodule_fast_a_limitcsr1_limit_y1 <= linienmodule_fast_a_limitcsr1_limit_x1;
			linienmodule_fast_a_limitcsr1_limit_railed1 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_25 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_x0 = (linienmodule_fast_b_adc <<< 4'd11);
assign linienmodule_fast_b_x1 = linienmodule_fast_b_adc;
assign linienmodule_fast_b_phase = linienmodule_mod_phase;
assign linienmodule_fast_b_limitcsr0_x0 = ((linienmodule_fast_b_i <<< 4'd11) + linienmodule_fast_b_dx);
assign linienmodule_fast_b_iir0_x0 = linienmodule_fast_b_limitcsr0_limitcsr0_y0;
assign linienmodule_fast_b_iir0_hold0 = 1'd0;
assign linienmodule_fast_b_iir0_clear0 = 1'd0;
assign linienmodule_fast_b_iir0_x1 = linienmodule_fast_b_iir0_y0;
assign linienmodule_fast_b_iir0_hold1 = 1'd0;
assign linienmodule_fast_b_iir0_clear1 = 1'd0;
assign linienmodule_fast_b_limitcsr0_x1 = ((linienmodule_fast_b_invert_storage ? 1'sd1 : $signed({1'd0, 1'd1})) * ((comb_self3 + (linienmodule_fast_b_ya <<< 4'd11)) + (linienmodule_chain_b_offset_signed <<< 4'd11)));
assign linienmodule_fast_b_out_i = linienmodule_fast_b_limitcsr0_limitcsr0_y1;
assign linienmodule_fast_b_limitcsr1_x0 = ((linienmodule_fast_b_q0 <<< 4'd11) + linienmodule_fast_b_dx);
assign linienmodule_fast_b_iir1_x0 = linienmodule_fast_b_limitcsr1_limitcsr1_y0;
assign linienmodule_fast_b_iir1_hold0 = 1'd0;
assign linienmodule_fast_b_iir1_clear0 = 1'd0;
assign linienmodule_fast_b_iir1_x1 = linienmodule_fast_b_iir1_y0;
assign linienmodule_fast_b_iir1_hold1 = 1'd0;
assign linienmodule_fast_b_iir1_clear1 = 1'd0;
assign linienmodule_fast_b_limitcsr1_x1 = ((linienmodule_fast_b_invert_storage ? 1'sd1 : $signed({1'd0, 1'd1})) * ((comb_self4 + (linienmodule_fast_b_ya <<< 4'd11)) + (linienmodule_chain_b_offset_signed <<< 4'd11)));
assign linienmodule_fast_b_out_q = linienmodule_fast_b_limitcsr1_limitcsr1_y1;
assign linienmodule_sig_status3 = linienmodule_fast_b_x0;
assign linienmodule_sig_status4 = linienmodule_fast_b_out_i;
assign linienmodule_sig_status5 = linienmodule_fast_b_out_q;
assign linienmodule_fast_b_xi = linienmodule_fast_b_x1;
assign linienmodule_fast_b_zi = (((linienmodule_fast_b_phase * linienmodule_fast_b_multiplier_storage) + linienmodule_fast_b_delay_storage) <<< 1'd1);
assign linienmodule_fast_b_i = (linienmodule_fast_b_cordic_xo >>> 1'd1);
assign linienmodule_fast_b_q0 = (linienmodule_fast_b_cordic_yo >>> 1'd1);
assign linienmodule_fast_b_cordic0 = (linienmodule_fast_b_cordic_xi <<< 2'd2);
assign linienmodule_fast_b_cordic16 = (linienmodule_fast_b_cordic_yi <<< 2'd2);
assign linienmodule_fast_b_cordic32 = (linienmodule_fast_b_cordic_zi <<< 2'd2);
assign linienmodule_fast_b_cordic_xo = (linienmodule_fast_b_cordic15 >>> 2'd2);
assign linienmodule_fast_b_cordic_yo = (linienmodule_fast_b_cordic31 >>> 2'd2);
assign linienmodule_fast_b_cordic_zo = (linienmodule_fast_b_cordic47 >>> 2'd2);
assign linienmodule_fast_b_cordic_new_out = 1'd1;
assign linienmodule_fast_b_cordic_new_in = 1'd1;
assign linienmodule_fast_b_cordic_dir0 = (linienmodule_fast_b_cordic32 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir1 = (linienmodule_fast_b_cordic33 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir2 = (linienmodule_fast_b_cordic34 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir3 = (linienmodule_fast_b_cordic35 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir4 = (linienmodule_fast_b_cordic36 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir5 = (linienmodule_fast_b_cordic37 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir6 = (linienmodule_fast_b_cordic38 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir7 = (linienmodule_fast_b_cordic39 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir8 = (linienmodule_fast_b_cordic40 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir9 = (linienmodule_fast_b_cordic41 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir10 = (linienmodule_fast_b_cordic42 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir11 = (linienmodule_fast_b_cordic43 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir12 = (linienmodule_fast_b_cordic44 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir13 = (linienmodule_fast_b_cordic45 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_cordic_dir14 = (linienmodule_fast_b_cordic46 < $signed({1'd0, 1'd0}));
assign linienmodule_fast_b_q1 = (linienmodule_fast_b_zi[13] ^ linienmodule_fast_b_zi[14]);

// synthesis translate_off
reg dummy_d_26;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_cordic_xi <= 15'sd0;
	linienmodule_fast_b_cordic_yi <= 15'sd0;
	linienmodule_fast_b_cordic_zi <= 15'sd0;
	if (linienmodule_fast_b_q1) begin
		{linienmodule_fast_b_cordic_zi, linienmodule_fast_b_cordic_yi, linienmodule_fast_b_cordic_xi} <= {(linienmodule_fast_b_zi + $signed({1'd0, 15'd16384})), (-linienmodule_fast_b_yi), (-linienmodule_fast_b_xi)};
	end else begin
		{linienmodule_fast_b_cordic_zi, linienmodule_fast_b_cordic_yi, linienmodule_fast_b_cordic_xi} <= {linienmodule_fast_b_zi, linienmodule_fast_b_yi, linienmodule_fast_b_xi};
	end
// synthesis translate_off
	dummy_d_26 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_limitcsr0_limit_x0 = linienmodule_fast_b_limitcsr0_x0;

// synthesis translate_off
reg dummy_d_27;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_limitcsr0_limit_y0 <= 26'sd0;
	linienmodule_fast_b_limitcsr0_limit_railed0 <= 1'd0;
	if ((linienmodule_fast_b_limitcsr0_limit_x0 >= linienmodule_fast_b_limitcsr0_limit_max0)) begin
		linienmodule_fast_b_limitcsr0_limit_y0 <= linienmodule_fast_b_limitcsr0_limit_max0;
		linienmodule_fast_b_limitcsr0_limit_railed0 <= 1'd1;
	end else begin
		if ((linienmodule_fast_b_limitcsr0_limit_x0 <= linienmodule_fast_b_limitcsr0_limit_min0)) begin
			linienmodule_fast_b_limitcsr0_limit_y0 <= linienmodule_fast_b_limitcsr0_limit_min0;
			linienmodule_fast_b_limitcsr0_limit_railed0 <= 1'd1;
		end else begin
			linienmodule_fast_b_limitcsr0_limit_y0 <= linienmodule_fast_b_limitcsr0_limit_x0;
			linienmodule_fast_b_limitcsr0_limit_railed0 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_27 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir0_railed0 = (~((linienmodule_fast_b_iir0_y_next0[49:47] == $signed({1'd0, linienmodule_fast_b_iir0_y_pat0})) | (linienmodule_fast_b_iir0_y_next0[49:47] == $signed({1'd0, (~linienmodule_fast_b_iir0_y_pat0)}))));

// synthesis translate_off
reg dummy_d_28;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_iir0_y_lim0 <= 25'sd0;
	if (linienmodule_fast_b_iir0_railed0) begin
		linienmodule_fast_b_iir0_y_lim0 <= linienmodule_fast_b_iir0_y0;
	end else begin
		linienmodule_fast_b_iir0_y_lim0 <= linienmodule_fast_b_iir0_y_next0[49:23];
	end
// synthesis translate_off
	dummy_d_28 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir0_z0 = (linienmodule_fast_b_iir0_zr0 + (linienmodule_fast_b_iir0_x0 * linienmodule_fast_b_iir0_b10));
assign linienmodule_fast_b_iir0_z1 = (linienmodule_fast_b_iir0_zr1 + (linienmodule_fast_b_iir0_x0 * linienmodule_fast_b_iir0_b00));
assign linienmodule_fast_b_iir0_z2 = (linienmodule_fast_b_iir0_zr2 + (linienmodule_fast_b_iir0_y1 * linienmodule_fast_b_iir0_a10));
assign linienmodule_fast_b_iir0_y_next0 = linienmodule_fast_b_iir0_z2;
assign linienmodule_fast_b_iir0_railed1 = (~((linienmodule_fast_b_iir0_y_next1[49:47] == $signed({1'd0, linienmodule_fast_b_iir0_y_pat1})) | (linienmodule_fast_b_iir0_y_next1[49:47] == $signed({1'd0, (~linienmodule_fast_b_iir0_y_pat1)}))));

// synthesis translate_off
reg dummy_d_29;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_iir0_y_lim1 <= 25'sd0;
	if (linienmodule_fast_b_iir0_railed1) begin
		linienmodule_fast_b_iir0_y_lim1 <= linienmodule_fast_b_iir0_y2;
	end else begin
		linienmodule_fast_b_iir0_y_lim1 <= linienmodule_fast_b_iir0_y_next1[49:23];
	end
// synthesis translate_off
	dummy_d_29 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir0_z3 = (linienmodule_fast_b_iir0_zr3 + (linienmodule_fast_b_iir0_x1 * linienmodule_fast_b_iir0_b2));
assign linienmodule_fast_b_iir0_z4 = (linienmodule_fast_b_iir0_zr4 + (linienmodule_fast_b_iir0_x1 * linienmodule_fast_b_iir0_b11));
assign linienmodule_fast_b_iir0_z5 = (linienmodule_fast_b_iir0_zr5 + (linienmodule_fast_b_iir0_x1 * linienmodule_fast_b_iir0_b01));
assign linienmodule_fast_b_iir0_z6 = (linienmodule_fast_b_iir0_zr6 + (linienmodule_fast_b_iir0_y3 * linienmodule_fast_b_iir0_a2));
assign linienmodule_fast_b_iir0_z7 = (linienmodule_fast_b_iir0_zr7 + (linienmodule_fast_b_iir0_y3 * linienmodule_fast_b_iir0_a11));
assign linienmodule_fast_b_iir0_y_next1 = linienmodule_fast_b_iir0_z7;
assign linienmodule_fast_b_limitcsr0_limit_x1 = linienmodule_fast_b_limitcsr0_x1;

// synthesis translate_off
reg dummy_d_30;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_limitcsr0_limit_y1 <= 28'sd0;
	linienmodule_fast_b_limitcsr0_limit_railed1 <= 1'd0;
	if ((linienmodule_fast_b_limitcsr0_limit_x1 >= linienmodule_fast_b_limitcsr0_limit_max1)) begin
		linienmodule_fast_b_limitcsr0_limit_y1 <= linienmodule_fast_b_limitcsr0_limit_max1;
		linienmodule_fast_b_limitcsr0_limit_railed1 <= 1'd1;
	end else begin
		if ((linienmodule_fast_b_limitcsr0_limit_x1 <= linienmodule_fast_b_limitcsr0_limit_min1)) begin
			linienmodule_fast_b_limitcsr0_limit_y1 <= linienmodule_fast_b_limitcsr0_limit_min1;
			linienmodule_fast_b_limitcsr0_limit_railed1 <= 1'd1;
		end else begin
			linienmodule_fast_b_limitcsr0_limit_y1 <= linienmodule_fast_b_limitcsr0_limit_x1;
			linienmodule_fast_b_limitcsr0_limit_railed1 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_30 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_limitcsr1_limit_x0 = linienmodule_fast_b_limitcsr1_x0;

// synthesis translate_off
reg dummy_d_31;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_limitcsr1_limit_y0 <= 26'sd0;
	linienmodule_fast_b_limitcsr1_limit_railed0 <= 1'd0;
	if ((linienmodule_fast_b_limitcsr1_limit_x0 >= linienmodule_fast_b_limitcsr1_limit_max0)) begin
		linienmodule_fast_b_limitcsr1_limit_y0 <= linienmodule_fast_b_limitcsr1_limit_max0;
		linienmodule_fast_b_limitcsr1_limit_railed0 <= 1'd1;
	end else begin
		if ((linienmodule_fast_b_limitcsr1_limit_x0 <= linienmodule_fast_b_limitcsr1_limit_min0)) begin
			linienmodule_fast_b_limitcsr1_limit_y0 <= linienmodule_fast_b_limitcsr1_limit_min0;
			linienmodule_fast_b_limitcsr1_limit_railed0 <= 1'd1;
		end else begin
			linienmodule_fast_b_limitcsr1_limit_y0 <= linienmodule_fast_b_limitcsr1_limit_x0;
			linienmodule_fast_b_limitcsr1_limit_railed0 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_31 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir1_railed0 = (~((linienmodule_fast_b_iir1_y_next0[49:47] == $signed({1'd0, linienmodule_fast_b_iir1_y_pat0})) | (linienmodule_fast_b_iir1_y_next0[49:47] == $signed({1'd0, (~linienmodule_fast_b_iir1_y_pat0)}))));

// synthesis translate_off
reg dummy_d_32;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_iir1_y_lim0 <= 25'sd0;
	if (linienmodule_fast_b_iir1_railed0) begin
		linienmodule_fast_b_iir1_y_lim0 <= linienmodule_fast_b_iir1_y0;
	end else begin
		linienmodule_fast_b_iir1_y_lim0 <= linienmodule_fast_b_iir1_y_next0[49:23];
	end
// synthesis translate_off
	dummy_d_32 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir1_z0 = (linienmodule_fast_b_iir1_zr0 + (linienmodule_fast_b_iir1_x0 * linienmodule_fast_b_iir1_b10));
assign linienmodule_fast_b_iir1_z1 = (linienmodule_fast_b_iir1_zr1 + (linienmodule_fast_b_iir1_x0 * linienmodule_fast_b_iir1_b00));
assign linienmodule_fast_b_iir1_z2 = (linienmodule_fast_b_iir1_zr2 + (linienmodule_fast_b_iir1_y1 * linienmodule_fast_b_iir1_a10));
assign linienmodule_fast_b_iir1_y_next0 = linienmodule_fast_b_iir1_z2;
assign linienmodule_fast_b_iir1_railed1 = (~((linienmodule_fast_b_iir1_y_next1[49:47] == $signed({1'd0, linienmodule_fast_b_iir1_y_pat1})) | (linienmodule_fast_b_iir1_y_next1[49:47] == $signed({1'd0, (~linienmodule_fast_b_iir1_y_pat1)}))));

// synthesis translate_off
reg dummy_d_33;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_iir1_y_lim1 <= 25'sd0;
	if (linienmodule_fast_b_iir1_railed1) begin
		linienmodule_fast_b_iir1_y_lim1 <= linienmodule_fast_b_iir1_y2;
	end else begin
		linienmodule_fast_b_iir1_y_lim1 <= linienmodule_fast_b_iir1_y_next1[49:23];
	end
// synthesis translate_off
	dummy_d_33 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_fast_b_iir1_z3 = (linienmodule_fast_b_iir1_zr3 + (linienmodule_fast_b_iir1_x1 * linienmodule_fast_b_iir1_b2));
assign linienmodule_fast_b_iir1_z4 = (linienmodule_fast_b_iir1_zr4 + (linienmodule_fast_b_iir1_x1 * linienmodule_fast_b_iir1_b11));
assign linienmodule_fast_b_iir1_z5 = (linienmodule_fast_b_iir1_zr5 + (linienmodule_fast_b_iir1_x1 * linienmodule_fast_b_iir1_b01));
assign linienmodule_fast_b_iir1_z6 = (linienmodule_fast_b_iir1_zr6 + (linienmodule_fast_b_iir1_y3 * linienmodule_fast_b_iir1_a2));
assign linienmodule_fast_b_iir1_z7 = (linienmodule_fast_b_iir1_zr7 + (linienmodule_fast_b_iir1_y3 * linienmodule_fast_b_iir1_a11));
assign linienmodule_fast_b_iir1_y_next1 = linienmodule_fast_b_iir1_z7;
assign linienmodule_fast_b_limitcsr1_limit_x1 = linienmodule_fast_b_limitcsr1_x1;

// synthesis translate_off
reg dummy_d_34;
// synthesis translate_on
always @(*) begin
	linienmodule_fast_b_limitcsr1_limit_y1 <= 28'sd0;
	linienmodule_fast_b_limitcsr1_limit_railed1 <= 1'd0;
	if ((linienmodule_fast_b_limitcsr1_limit_x1 >= linienmodule_fast_b_limitcsr1_limit_max1)) begin
		linienmodule_fast_b_limitcsr1_limit_y1 <= linienmodule_fast_b_limitcsr1_limit_max1;
		linienmodule_fast_b_limitcsr1_limit_railed1 <= 1'd1;
	end else begin
		if ((linienmodule_fast_b_limitcsr1_limit_x1 <= linienmodule_fast_b_limitcsr1_limit_min1)) begin
			linienmodule_fast_b_limitcsr1_limit_y1 <= linienmodule_fast_b_limitcsr1_limit_min1;
			linienmodule_fast_b_limitcsr1_limit_railed1 <= 1'd1;
		end else begin
			linienmodule_fast_b_limitcsr1_limit_y1 <= linienmodule_fast_b_limitcsr1_limit_x1;
			linienmodule_fast_b_limitcsr1_limit_railed1 <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_34 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_slowchain_input1 = linienmodule_slowchain_input0;
assign linienmodule_slowchain_output = linienmodule_slowchain_pid_out;
assign linienmodule_slowchain_out = (linienmodule_slowchain_limitcsr_y <<< 4'd11);
assign linienmodule_sig_status6 = linienmodule_slowchain_out;
assign linienmodule_slowchain_setpoint_signed = linienmodule_slowchain_setpoint_storage;

// synthesis translate_off
reg dummy_d_35;
// synthesis translate_on
always @(*) begin
	linienmodule_slowchain_error <= 15'sd0;
	if (linienmodule_slowchain_running) begin
		linienmodule_slowchain_error <= (linienmodule_slowchain_input1 - $signed({1'd0, linienmodule_slowchain_setpoint_storage}));
	end else begin
		linienmodule_slowchain_error <= 1'd0;
	end
// synthesis translate_off
	dummy_d_35 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_slowchain_kp_signed = linienmodule_slowchain_kp_storage;
assign linienmodule_slowchain_kp_mult = (linienmodule_slowchain_error * linienmodule_slowchain_kp_signed);
assign linienmodule_slowchain_output_p = (linienmodule_slowchain_kp_mult >>> 4'd12);
assign linienmodule_slowchain_ki_signed = linienmodule_slowchain_ki_storage;
assign linienmodule_slowchain_ki_mult = ((linienmodule_slowchain_error * linienmodule_slowchain_ki_signed) >>> 3'd4);
assign linienmodule_slowchain_int_sum = (linienmodule_slowchain_ki_mult + linienmodule_slowchain_int_reg);
assign linienmodule_slowchain_int_out = (linienmodule_slowchain_int_reg >>> 5'd18);
assign linienmodule_slowchain_kd_signed = linienmodule_slowchain_kd_storage;
assign linienmodule_slowchain_kd_mult = (linienmodule_slowchain_error * linienmodule_slowchain_kd_signed);

// synthesis translate_off
reg dummy_d_36;
// synthesis translate_on
always @(*) begin
	linienmodule_slowchain_pid_out <= 14'sd0;
	if ((linienmodule_slowchain_pid_sum > $signed({1'd0, 13'd8191}))) begin
		linienmodule_slowchain_pid_out <= 13'd8191;
	end else begin
		if ((linienmodule_slowchain_pid_sum < 14'sd8192)) begin
			linienmodule_slowchain_pid_out <= 14'sd8192;
		end else begin
			linienmodule_slowchain_pid_out <= linienmodule_slowchain_pid_sum[13:0];
		end
	end
// synthesis translate_off
	dummy_d_36 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_slowchain_limit_x = linienmodule_slowchain_x;

// synthesis translate_off
reg dummy_d_37;
// synthesis translate_on
always @(*) begin
	linienmodule_slowchain_limit_y <= 19'sd0;
	linienmodule_slowchain_limit_railed <= 1'd0;
	if ((linienmodule_slowchain_limit_x >= linienmodule_slowchain_limit_max)) begin
		linienmodule_slowchain_limit_y <= linienmodule_slowchain_limit_max;
		linienmodule_slowchain_limit_railed <= 1'd1;
	end else begin
		if ((linienmodule_slowchain_limit_x <= linienmodule_slowchain_limit_min)) begin
			linienmodule_slowchain_limit_y <= linienmodule_slowchain_limit_min;
			linienmodule_slowchain_limit_railed <= 1'd1;
		end else begin
			linienmodule_slowchain_limit_y <= linienmodule_slowchain_limit_x;
			linienmodule_slowchain_limit_railed <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_37 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_scopegen_dac_a = (linienmodule_scopegen_asg_a <<< 4'd11);
assign linienmodule_scopegen_dac_b = (linienmodule_scopegen_asg_b <<< 4'd11);
assign linienmodule_sig_status7 = linienmodule_scopegen_dac_a;
assign linienmodule_sig_status8 = linienmodule_scopegen_dac_b;
assign linienmodule_csrbank0_sel = (linienmodule_interface0_bank_bus_adr[13:9] == 5'd28);
assign linienmodule_csrbank0_dna7_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna7_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 1'd0));
assign linienmodule_csrbank0_dna6_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna6_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 1'd1));
assign linienmodule_csrbank0_dna5_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna5_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 2'd2));
assign linienmodule_csrbank0_dna4_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna4_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 2'd3));
assign linienmodule_csrbank0_dna3_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna3_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 3'd4));
assign linienmodule_csrbank0_dna2_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna2_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 3'd5));
assign linienmodule_csrbank0_dna1_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna1_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 3'd6));
assign linienmodule_csrbank0_dna0_r = linienmodule_interface0_bank_bus_dat_w[7:0];
assign linienmodule_csrbank0_dna0_re = ((linienmodule_csrbank0_sel & linienmodule_interface0_bank_bus_we) & (linienmodule_interface0_bank_bus_adr[2:0] == 3'd7));
assign linienmodule_csrbank0_dna7_w = linienmodule_dna_status[63:56];
assign linienmodule_csrbank0_dna6_w = linienmodule_dna_status[55:48];
assign linienmodule_csrbank0_dna5_w = linienmodule_dna_status[47:40];
assign linienmodule_csrbank0_dna4_w = linienmodule_dna_status[39:32];
assign linienmodule_csrbank0_dna3_w = linienmodule_dna_status[31:24];
assign linienmodule_csrbank0_dna2_w = linienmodule_dna_status[23:16];
assign linienmodule_csrbank0_dna1_w = linienmodule_dna_status[15:8];
assign linienmodule_csrbank0_dna0_w = linienmodule_dna_status[7:0];
assign linienmodule_csrbank1_sel = (linienmodule_interface1_bank_bus_adr[13:9] == 1'd0);
assign linienmodule_csrbank1_y_tap0_r = linienmodule_interface1_bank_bus_dat_w[1:0];
assign linienmodule_csrbank1_y_tap0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 1'd0));
assign linienmodule_csrbank1_invert0_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_invert0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 1'd1));
assign linienmodule_csrbank1_demod_delay3_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_demod_delay3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 2'd2));
assign linienmodule_csrbank1_demod_delay2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_demod_delay2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 2'd3));
assign linienmodule_csrbank1_demod_delay1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_demod_delay1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 3'd4));
assign linienmodule_csrbank1_demod_delay0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_demod_delay0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 3'd5));
assign linienmodule_csrbank1_demod_multiplier0_r = linienmodule_interface1_bank_bus_dat_w[3:0];
assign linienmodule_csrbank1_demod_multiplier0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 3'd6));
assign linienmodule_csrbank1_x_limit_1_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_limit_1_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 3'd7));
assign linienmodule_csrbank1_x_limit_1_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd8));
assign linienmodule_csrbank1_x_limit_1_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd9));
assign linienmodule_csrbank1_x_limit_1_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd10));
assign linienmodule_csrbank1_x_limit_1_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_limit_1_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd11));
assign linienmodule_csrbank1_x_limit_1_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd12));
assign linienmodule_csrbank1_x_limit_1_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd13));
assign linienmodule_csrbank1_x_limit_1_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_1_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd14));
assign linienmodule_csrbank1_iir_c_1_z03_r = linienmodule_interface1_bank_bus_dat_w[2:0];
assign linienmodule_csrbank1_iir_c_1_z03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 4'd15));
assign linienmodule_csrbank1_iir_c_1_z02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_z02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd16));
assign linienmodule_csrbank1_iir_c_1_z01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_z01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd17));
assign linienmodule_csrbank1_iir_c_1_z00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_z00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd18));
assign linienmodule_csrbank1_iir_c_1_a13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_1_a13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd19));
assign linienmodule_csrbank1_iir_c_1_a12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_a12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd20));
assign linienmodule_csrbank1_iir_c_1_a11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_a11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd21));
assign linienmodule_csrbank1_iir_c_1_a10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_a10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd22));
assign linienmodule_csrbank1_iir_c_1_b03_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_1_b03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd23));
assign linienmodule_csrbank1_iir_c_1_b02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd24));
assign linienmodule_csrbank1_iir_c_1_b01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd25));
assign linienmodule_csrbank1_iir_c_1_b00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd26));
assign linienmodule_csrbank1_iir_c_1_b13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_1_b13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd27));
assign linienmodule_csrbank1_iir_c_1_b12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd28));
assign linienmodule_csrbank1_iir_c_1_b11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd29));
assign linienmodule_csrbank1_iir_c_1_b10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_1_b10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd30));
assign linienmodule_csrbank1_iir_d_1_z03_r = linienmodule_interface1_bank_bus_dat_w[2:0];
assign linienmodule_csrbank1_iir_d_1_z03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 5'd31));
assign linienmodule_csrbank1_iir_d_1_z02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_z02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd32));
assign linienmodule_csrbank1_iir_d_1_z01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_z01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd33));
assign linienmodule_csrbank1_iir_d_1_z00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_z00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd34));
assign linienmodule_csrbank1_iir_d_1_a13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_1_a13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd35));
assign linienmodule_csrbank1_iir_d_1_a12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd36));
assign linienmodule_csrbank1_iir_d_1_a11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd37));
assign linienmodule_csrbank1_iir_d_1_a10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd38));
assign linienmodule_csrbank1_iir_d_1_a23_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_1_a23_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd39));
assign linienmodule_csrbank1_iir_d_1_a22_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a22_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd40));
assign linienmodule_csrbank1_iir_d_1_a21_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a21_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd41));
assign linienmodule_csrbank1_iir_d_1_a20_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_a20_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd42));
assign linienmodule_csrbank1_iir_d_1_b03_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_1_b03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd43));
assign linienmodule_csrbank1_iir_d_1_b02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd44));
assign linienmodule_csrbank1_iir_d_1_b01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd45));
assign linienmodule_csrbank1_iir_d_1_b00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd46));
assign linienmodule_csrbank1_iir_d_1_b13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_1_b13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd47));
assign linienmodule_csrbank1_iir_d_1_b12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd48));
assign linienmodule_csrbank1_iir_d_1_b11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd49));
assign linienmodule_csrbank1_iir_d_1_b10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd50));
assign linienmodule_csrbank1_iir_d_1_b23_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_1_b23_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd51));
assign linienmodule_csrbank1_iir_d_1_b22_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b22_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd52));
assign linienmodule_csrbank1_iir_d_1_b21_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b21_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd53));
assign linienmodule_csrbank1_iir_d_1_b20_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_1_b20_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd54));
assign linienmodule_csrbank1_y_limit_1_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_y_limit_1_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd55));
assign linienmodule_csrbank1_y_limit_1_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd56));
assign linienmodule_csrbank1_y_limit_1_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd57));
assign linienmodule_csrbank1_y_limit_1_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd58));
assign linienmodule_csrbank1_y_limit_1_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_y_limit_1_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd59));
assign linienmodule_csrbank1_y_limit_1_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd60));
assign linienmodule_csrbank1_y_limit_1_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd61));
assign linienmodule_csrbank1_y_limit_1_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_1_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd62));
assign linienmodule_csrbank1_x_limit_2_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_limit_2_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 6'd63));
assign linienmodule_csrbank1_x_limit_2_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd64));
assign linienmodule_csrbank1_x_limit_2_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd65));
assign linienmodule_csrbank1_x_limit_2_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd66));
assign linienmodule_csrbank1_x_limit_2_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_limit_2_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd67));
assign linienmodule_csrbank1_x_limit_2_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd68));
assign linienmodule_csrbank1_x_limit_2_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd69));
assign linienmodule_csrbank1_x_limit_2_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_limit_2_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd70));
assign linienmodule_csrbank1_iir_c_2_z03_r = linienmodule_interface1_bank_bus_dat_w[2:0];
assign linienmodule_csrbank1_iir_c_2_z03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd71));
assign linienmodule_csrbank1_iir_c_2_z02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_z02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd72));
assign linienmodule_csrbank1_iir_c_2_z01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_z01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd73));
assign linienmodule_csrbank1_iir_c_2_z00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_z00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd74));
assign linienmodule_csrbank1_iir_c_2_a13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_2_a13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd75));
assign linienmodule_csrbank1_iir_c_2_a12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_a12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd76));
assign linienmodule_csrbank1_iir_c_2_a11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_a11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd77));
assign linienmodule_csrbank1_iir_c_2_a10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_a10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd78));
assign linienmodule_csrbank1_iir_c_2_b03_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_2_b03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd79));
assign linienmodule_csrbank1_iir_c_2_b02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd80));
assign linienmodule_csrbank1_iir_c_2_b01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd81));
assign linienmodule_csrbank1_iir_c_2_b00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd82));
assign linienmodule_csrbank1_iir_c_2_b13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_c_2_b13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd83));
assign linienmodule_csrbank1_iir_c_2_b12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd84));
assign linienmodule_csrbank1_iir_c_2_b11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd85));
assign linienmodule_csrbank1_iir_c_2_b10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_c_2_b10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd86));
assign linienmodule_csrbank1_iir_d_2_z03_r = linienmodule_interface1_bank_bus_dat_w[2:0];
assign linienmodule_csrbank1_iir_d_2_z03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd87));
assign linienmodule_csrbank1_iir_d_2_z02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_z02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd88));
assign linienmodule_csrbank1_iir_d_2_z01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_z01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd89));
assign linienmodule_csrbank1_iir_d_2_z00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_z00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd90));
assign linienmodule_csrbank1_iir_d_2_a13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_2_a13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd91));
assign linienmodule_csrbank1_iir_d_2_a12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd92));
assign linienmodule_csrbank1_iir_d_2_a11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd93));
assign linienmodule_csrbank1_iir_d_2_a10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd94));
assign linienmodule_csrbank1_iir_d_2_a23_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_2_a23_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd95));
assign linienmodule_csrbank1_iir_d_2_a22_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a22_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd96));
assign linienmodule_csrbank1_iir_d_2_a21_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a21_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd97));
assign linienmodule_csrbank1_iir_d_2_a20_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_a20_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd98));
assign linienmodule_csrbank1_iir_d_2_b03_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_2_b03_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd99));
assign linienmodule_csrbank1_iir_d_2_b02_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b02_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd100));
assign linienmodule_csrbank1_iir_d_2_b01_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b01_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd101));
assign linienmodule_csrbank1_iir_d_2_b00_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b00_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd102));
assign linienmodule_csrbank1_iir_d_2_b13_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_2_b13_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd103));
assign linienmodule_csrbank1_iir_d_2_b12_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b12_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd104));
assign linienmodule_csrbank1_iir_d_2_b11_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b11_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd105));
assign linienmodule_csrbank1_iir_d_2_b10_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b10_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd106));
assign linienmodule_csrbank1_iir_d_2_b23_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_iir_d_2_b23_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd107));
assign linienmodule_csrbank1_iir_d_2_b22_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b22_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd108));
assign linienmodule_csrbank1_iir_d_2_b21_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b21_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd109));
assign linienmodule_csrbank1_iir_d_2_b20_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_iir_d_2_b20_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd110));
assign linienmodule_csrbank1_y_limit_2_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_y_limit_2_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd111));
assign linienmodule_csrbank1_y_limit_2_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd112));
assign linienmodule_csrbank1_y_limit_2_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd113));
assign linienmodule_csrbank1_y_limit_2_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd114));
assign linienmodule_csrbank1_y_limit_2_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_y_limit_2_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd115));
assign linienmodule_csrbank1_y_limit_2_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd116));
assign linienmodule_csrbank1_y_limit_2_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd117));
assign linienmodule_csrbank1_y_limit_2_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_y_limit_2_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd118));
assign linienmodule_csr0_x_clr_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csr0_x_clr_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd119));
assign linienmodule_csrbank1_x_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd120));
assign linienmodule_csrbank1_x_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd121));
assign linienmodule_csrbank1_x_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd122));
assign linienmodule_csrbank1_x_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd123));
assign linienmodule_csrbank1_x_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_x_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd124));
assign linienmodule_csrbank1_x_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd125));
assign linienmodule_csrbank1_x_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd126));
assign linienmodule_csrbank1_x_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_x_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 7'd127));
assign linienmodule_csr1_out_i_clr_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csr1_out_i_clr_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd128));
assign linienmodule_csrbank1_out_i_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_out_i_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd129));
assign linienmodule_csrbank1_out_i_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd130));
assign linienmodule_csrbank1_out_i_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd131));
assign linienmodule_csrbank1_out_i_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd132));
assign linienmodule_csrbank1_out_i_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_out_i_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd133));
assign linienmodule_csrbank1_out_i_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd134));
assign linienmodule_csrbank1_out_i_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd135));
assign linienmodule_csrbank1_out_i_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_i_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd136));
assign linienmodule_csr2_out_q_clr_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csr2_out_q_clr_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd137));
assign linienmodule_csrbank1_out_q_max3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_out_q_max3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd138));
assign linienmodule_csrbank1_out_q_max2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_max2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd139));
assign linienmodule_csrbank1_out_q_max1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_max1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd140));
assign linienmodule_csrbank1_out_q_max0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_max0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd141));
assign linienmodule_csrbank1_out_q_min3_r = linienmodule_interface1_bank_bus_dat_w[0];
assign linienmodule_csrbank1_out_q_min3_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd142));
assign linienmodule_csrbank1_out_q_min2_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_min2_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd143));
assign linienmodule_csrbank1_out_q_min1_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_min1_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd144));
assign linienmodule_csrbank1_out_q_min0_r = linienmodule_interface1_bank_bus_dat_w[7:0];
assign linienmodule_csrbank1_out_q_min0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd145));
assign linienmodule_csrbank1_dx_sel0_r = linienmodule_interface1_bank_bus_dat_w[3:0];
assign linienmodule_csrbank1_dx_sel0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd146));
assign linienmodule_csrbank1_dy_sel0_r = linienmodule_interface1_bank_bus_dat_w[3:0];
assign linienmodule_csrbank1_dy_sel0_re = ((linienmodule_csrbank1_sel & linienmodule_interface1_bank_bus_we) & (linienmodule_interface1_bank_bus_adr[7:0] == 8'd147));
assign linienmodule_fast_a_y_tap_storage = linienmodule_fast_a_y_tap_storage_full[1:0];
assign linienmodule_csrbank1_y_tap0_w = linienmodule_fast_a_y_tap_storage_full[1:0];
assign linienmodule_fast_a_invert_storage = linienmodule_fast_a_invert_storage_full;
assign linienmodule_csrbank1_invert0_w = linienmodule_fast_a_invert_storage_full;
assign linienmodule_fast_a_delay_storage = linienmodule_fast_a_delay_storage_full[31:0];
assign linienmodule_csrbank1_demod_delay3_w = linienmodule_fast_a_delay_storage_full[31:24];
assign linienmodule_csrbank1_demod_delay2_w = linienmodule_fast_a_delay_storage_full[23:16];
assign linienmodule_csrbank1_demod_delay1_w = linienmodule_fast_a_delay_storage_full[15:8];
assign linienmodule_csrbank1_demod_delay0_w = linienmodule_fast_a_delay_storage_full[7:0];
assign linienmodule_fast_a_multiplier_storage = linienmodule_fast_a_multiplier_storage_full[3:0];
assign linienmodule_csrbank1_demod_multiplier0_w = linienmodule_fast_a_multiplier_storage_full[3:0];
assign linienmodule_fast_a_limitcsr0_min_storage0 = linienmodule_fast_a_limitcsr0_min_storage_full0[24:0];
assign linienmodule_csrbank1_x_limit_1_min3_w = linienmodule_fast_a_limitcsr0_min_storage_full0[24];
assign linienmodule_csrbank1_x_limit_1_min2_w = linienmodule_fast_a_limitcsr0_min_storage_full0[23:16];
assign linienmodule_csrbank1_x_limit_1_min1_w = linienmodule_fast_a_limitcsr0_min_storage_full0[15:8];
assign linienmodule_csrbank1_x_limit_1_min0_w = linienmodule_fast_a_limitcsr0_min_storage_full0[7:0];
assign linienmodule_fast_a_limitcsr0_max_storage0 = linienmodule_fast_a_limitcsr0_max_storage_full0[24:0];
assign linienmodule_csrbank1_x_limit_1_max3_w = linienmodule_fast_a_limitcsr0_max_storage_full0[24];
assign linienmodule_csrbank1_x_limit_1_max2_w = linienmodule_fast_a_limitcsr0_max_storage_full0[23:16];
assign linienmodule_csrbank1_x_limit_1_max1_w = linienmodule_fast_a_limitcsr0_max_storage_full0[15:8];
assign linienmodule_csrbank1_x_limit_1_max0_w = linienmodule_fast_a_limitcsr0_max_storage_full0[7:0];
assign linienmodule_fast_a_iir0_storage0 = linienmodule_fast_a_iir0_storage_full0[26:0];
assign linienmodule_csrbank1_iir_c_1_z03_w = linienmodule_fast_a_iir0_storage_full0[26:24];
assign linienmodule_csrbank1_iir_c_1_z02_w = linienmodule_fast_a_iir0_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_1_z01_w = linienmodule_fast_a_iir0_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_1_z00_w = linienmodule_fast_a_iir0_storage_full0[7:0];
assign linienmodule_fast_a_iir0_csrstorage0_storage0 = linienmodule_fast_a_iir0_csrstorage0_storage_full0[24:0];
assign linienmodule_csrbank1_iir_c_1_a13_w = linienmodule_fast_a_iir0_csrstorage0_storage_full0[24];
assign linienmodule_csrbank1_iir_c_1_a12_w = linienmodule_fast_a_iir0_csrstorage0_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_1_a11_w = linienmodule_fast_a_iir0_csrstorage0_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_1_a10_w = linienmodule_fast_a_iir0_csrstorage0_storage_full0[7:0];
assign linienmodule_fast_a_iir0_csrstorage1_storage0 = linienmodule_fast_a_iir0_csrstorage1_storage_full0[24:0];
assign linienmodule_csrbank1_iir_c_1_b03_w = linienmodule_fast_a_iir0_csrstorage1_storage_full0[24];
assign linienmodule_csrbank1_iir_c_1_b02_w = linienmodule_fast_a_iir0_csrstorage1_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_1_b01_w = linienmodule_fast_a_iir0_csrstorage1_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_1_b00_w = linienmodule_fast_a_iir0_csrstorage1_storage_full0[7:0];
assign linienmodule_fast_a_iir0_csrstorage2_storage0 = linienmodule_fast_a_iir0_csrstorage2_storage_full0[24:0];
assign linienmodule_csrbank1_iir_c_1_b13_w = linienmodule_fast_a_iir0_csrstorage2_storage_full0[24];
assign linienmodule_csrbank1_iir_c_1_b12_w = linienmodule_fast_a_iir0_csrstorage2_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_1_b11_w = linienmodule_fast_a_iir0_csrstorage2_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_1_b10_w = linienmodule_fast_a_iir0_csrstorage2_storage_full0[7:0];
assign linienmodule_fast_a_iir0_storage1 = linienmodule_fast_a_iir0_storage_full1[26:0];
assign linienmodule_csrbank1_iir_d_1_z03_w = linienmodule_fast_a_iir0_storage_full1[26:24];
assign linienmodule_csrbank1_iir_d_1_z02_w = linienmodule_fast_a_iir0_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_1_z01_w = linienmodule_fast_a_iir0_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_1_z00_w = linienmodule_fast_a_iir0_storage_full1[7:0];
assign linienmodule_fast_a_iir0_csrstorage0_storage1 = linienmodule_fast_a_iir0_csrstorage0_storage_full1[24:0];
assign linienmodule_csrbank1_iir_d_1_a13_w = linienmodule_fast_a_iir0_csrstorage0_storage_full1[24];
assign linienmodule_csrbank1_iir_d_1_a12_w = linienmodule_fast_a_iir0_csrstorage0_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_1_a11_w = linienmodule_fast_a_iir0_csrstorage0_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_1_a10_w = linienmodule_fast_a_iir0_csrstorage0_storage_full1[7:0];
assign linienmodule_fast_a_iir0_csrstorage1_storage1 = linienmodule_fast_a_iir0_csrstorage1_storage_full1[24:0];
assign linienmodule_csrbank1_iir_d_1_a23_w = linienmodule_fast_a_iir0_csrstorage1_storage_full1[24];
assign linienmodule_csrbank1_iir_d_1_a22_w = linienmodule_fast_a_iir0_csrstorage1_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_1_a21_w = linienmodule_fast_a_iir0_csrstorage1_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_1_a20_w = linienmodule_fast_a_iir0_csrstorage1_storage_full1[7:0];
assign linienmodule_fast_a_iir0_csrstorage2_storage1 = linienmodule_fast_a_iir0_csrstorage2_storage_full1[24:0];
assign linienmodule_csrbank1_iir_d_1_b03_w = linienmodule_fast_a_iir0_csrstorage2_storage_full1[24];
assign linienmodule_csrbank1_iir_d_1_b02_w = linienmodule_fast_a_iir0_csrstorage2_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_1_b01_w = linienmodule_fast_a_iir0_csrstorage2_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_1_b00_w = linienmodule_fast_a_iir0_csrstorage2_storage_full1[7:0];
assign linienmodule_fast_a_iir0_csrstorage3_storage = linienmodule_fast_a_iir0_csrstorage3_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_1_b13_w = linienmodule_fast_a_iir0_csrstorage3_storage_full[24];
assign linienmodule_csrbank1_iir_d_1_b12_w = linienmodule_fast_a_iir0_csrstorage3_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_1_b11_w = linienmodule_fast_a_iir0_csrstorage3_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_1_b10_w = linienmodule_fast_a_iir0_csrstorage3_storage_full[7:0];
assign linienmodule_fast_a_iir0_csrstorage4_storage = linienmodule_fast_a_iir0_csrstorage4_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_1_b23_w = linienmodule_fast_a_iir0_csrstorage4_storage_full[24];
assign linienmodule_csrbank1_iir_d_1_b22_w = linienmodule_fast_a_iir0_csrstorage4_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_1_b21_w = linienmodule_fast_a_iir0_csrstorage4_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_1_b20_w = linienmodule_fast_a_iir0_csrstorage4_storage_full[7:0];
assign linienmodule_fast_a_limitcsr0_min_storage1 = linienmodule_fast_a_limitcsr0_min_storage_full1[24:0];
assign linienmodule_csrbank1_y_limit_1_min3_w = linienmodule_fast_a_limitcsr0_min_storage_full1[24];
assign linienmodule_csrbank1_y_limit_1_min2_w = linienmodule_fast_a_limitcsr0_min_storage_full1[23:16];
assign linienmodule_csrbank1_y_limit_1_min1_w = linienmodule_fast_a_limitcsr0_min_storage_full1[15:8];
assign linienmodule_csrbank1_y_limit_1_min0_w = linienmodule_fast_a_limitcsr0_min_storage_full1[7:0];
assign linienmodule_fast_a_limitcsr0_max_storage1 = linienmodule_fast_a_limitcsr0_max_storage_full1[24:0];
assign linienmodule_csrbank1_y_limit_1_max3_w = linienmodule_fast_a_limitcsr0_max_storage_full1[24];
assign linienmodule_csrbank1_y_limit_1_max2_w = linienmodule_fast_a_limitcsr0_max_storage_full1[23:16];
assign linienmodule_csrbank1_y_limit_1_max1_w = linienmodule_fast_a_limitcsr0_max_storage_full1[15:8];
assign linienmodule_csrbank1_y_limit_1_max0_w = linienmodule_fast_a_limitcsr0_max_storage_full1[7:0];
assign linienmodule_fast_a_limitcsr1_min_storage0 = linienmodule_fast_a_limitcsr1_min_storage_full0[24:0];
assign linienmodule_csrbank1_x_limit_2_min3_w = linienmodule_fast_a_limitcsr1_min_storage_full0[24];
assign linienmodule_csrbank1_x_limit_2_min2_w = linienmodule_fast_a_limitcsr1_min_storage_full0[23:16];
assign linienmodule_csrbank1_x_limit_2_min1_w = linienmodule_fast_a_limitcsr1_min_storage_full0[15:8];
assign linienmodule_csrbank1_x_limit_2_min0_w = linienmodule_fast_a_limitcsr1_min_storage_full0[7:0];
assign linienmodule_fast_a_limitcsr1_max_storage0 = linienmodule_fast_a_limitcsr1_max_storage_full0[24:0];
assign linienmodule_csrbank1_x_limit_2_max3_w = linienmodule_fast_a_limitcsr1_max_storage_full0[24];
assign linienmodule_csrbank1_x_limit_2_max2_w = linienmodule_fast_a_limitcsr1_max_storage_full0[23:16];
assign linienmodule_csrbank1_x_limit_2_max1_w = linienmodule_fast_a_limitcsr1_max_storage_full0[15:8];
assign linienmodule_csrbank1_x_limit_2_max0_w = linienmodule_fast_a_limitcsr1_max_storage_full0[7:0];
assign linienmodule_fast_a_iir1_storage0 = linienmodule_fast_a_iir1_storage_full0[26:0];
assign linienmodule_csrbank1_iir_c_2_z03_w = linienmodule_fast_a_iir1_storage_full0[26:24];
assign linienmodule_csrbank1_iir_c_2_z02_w = linienmodule_fast_a_iir1_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_2_z01_w = linienmodule_fast_a_iir1_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_2_z00_w = linienmodule_fast_a_iir1_storage_full0[7:0];
assign linienmodule_fast_a_iir1_csrstorage3_storage = linienmodule_fast_a_iir1_csrstorage3_storage_full[24:0];
assign linienmodule_csrbank1_iir_c_2_a13_w = linienmodule_fast_a_iir1_csrstorage3_storage_full[24];
assign linienmodule_csrbank1_iir_c_2_a12_w = linienmodule_fast_a_iir1_csrstorage3_storage_full[23:16];
assign linienmodule_csrbank1_iir_c_2_a11_w = linienmodule_fast_a_iir1_csrstorage3_storage_full[15:8];
assign linienmodule_csrbank1_iir_c_2_a10_w = linienmodule_fast_a_iir1_csrstorage3_storage_full[7:0];
assign linienmodule_fast_a_iir1_csrstorage4_storage = linienmodule_fast_a_iir1_csrstorage4_storage_full[24:0];
assign linienmodule_csrbank1_iir_c_2_b03_w = linienmodule_fast_a_iir1_csrstorage4_storage_full[24];
assign linienmodule_csrbank1_iir_c_2_b02_w = linienmodule_fast_a_iir1_csrstorage4_storage_full[23:16];
assign linienmodule_csrbank1_iir_c_2_b01_w = linienmodule_fast_a_iir1_csrstorage4_storage_full[15:8];
assign linienmodule_csrbank1_iir_c_2_b00_w = linienmodule_fast_a_iir1_csrstorage4_storage_full[7:0];
assign linienmodule_fast_a_iir1_csrstorage5_storage0 = linienmodule_fast_a_iir1_csrstorage5_storage_full0[24:0];
assign linienmodule_csrbank1_iir_c_2_b13_w = linienmodule_fast_a_iir1_csrstorage5_storage_full0[24];
assign linienmodule_csrbank1_iir_c_2_b12_w = linienmodule_fast_a_iir1_csrstorage5_storage_full0[23:16];
assign linienmodule_csrbank1_iir_c_2_b11_w = linienmodule_fast_a_iir1_csrstorage5_storage_full0[15:8];
assign linienmodule_csrbank1_iir_c_2_b10_w = linienmodule_fast_a_iir1_csrstorage5_storage_full0[7:0];
assign linienmodule_fast_a_iir1_storage1 = linienmodule_fast_a_iir1_storage_full1[26:0];
assign linienmodule_csrbank1_iir_d_2_z03_w = linienmodule_fast_a_iir1_storage_full1[26:24];
assign linienmodule_csrbank1_iir_d_2_z02_w = linienmodule_fast_a_iir1_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_2_z01_w = linienmodule_fast_a_iir1_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_2_z00_w = linienmodule_fast_a_iir1_storage_full1[7:0];
assign linienmodule_fast_a_iir1_csrstorage5_storage1 = linienmodule_fast_a_iir1_csrstorage5_storage_full1[24:0];
assign linienmodule_csrbank1_iir_d_2_a13_w = linienmodule_fast_a_iir1_csrstorage5_storage_full1[24];
assign linienmodule_csrbank1_iir_d_2_a12_w = linienmodule_fast_a_iir1_csrstorage5_storage_full1[23:16];
assign linienmodule_csrbank1_iir_d_2_a11_w = linienmodule_fast_a_iir1_csrstorage5_storage_full1[15:8];
assign linienmodule_csrbank1_iir_d_2_a10_w = linienmodule_fast_a_iir1_csrstorage5_storage_full1[7:0];
assign linienmodule_fast_a_iir1_csrstorage6_storage = linienmodule_fast_a_iir1_csrstorage6_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_2_a23_w = linienmodule_fast_a_iir1_csrstorage6_storage_full[24];
assign linienmodule_csrbank1_iir_d_2_a22_w = linienmodule_fast_a_iir1_csrstorage6_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_2_a21_w = linienmodule_fast_a_iir1_csrstorage6_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_2_a20_w = linienmodule_fast_a_iir1_csrstorage6_storage_full[7:0];
assign linienmodule_fast_a_iir1_csrstorage7_storage = linienmodule_fast_a_iir1_csrstorage7_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_2_b03_w = linienmodule_fast_a_iir1_csrstorage7_storage_full[24];
assign linienmodule_csrbank1_iir_d_2_b02_w = linienmodule_fast_a_iir1_csrstorage7_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_2_b01_w = linienmodule_fast_a_iir1_csrstorage7_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_2_b00_w = linienmodule_fast_a_iir1_csrstorage7_storage_full[7:0];
assign linienmodule_fast_a_iir1_csrstorage8_storage = linienmodule_fast_a_iir1_csrstorage8_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_2_b13_w = linienmodule_fast_a_iir1_csrstorage8_storage_full[24];
assign linienmodule_csrbank1_iir_d_2_b12_w = linienmodule_fast_a_iir1_csrstorage8_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_2_b11_w = linienmodule_fast_a_iir1_csrstorage8_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_2_b10_w = linienmodule_fast_a_iir1_csrstorage8_storage_full[7:0];
assign linienmodule_fast_a_iir1_csrstorage9_storage = linienmodule_fast_a_iir1_csrstorage9_storage_full[24:0];
assign linienmodule_csrbank1_iir_d_2_b23_w = linienmodule_fast_a_iir1_csrstorage9_storage_full[24];
assign linienmodule_csrbank1_iir_d_2_b22_w = linienmodule_fast_a_iir1_csrstorage9_storage_full[23:16];
assign linienmodule_csrbank1_iir_d_2_b21_w = linienmodule_fast_a_iir1_csrstorage9_storage_full[15:8];
assign linienmodule_csrbank1_iir_d_2_b20_w = linienmodule_fast_a_iir1_csrstorage9_storage_full[7:0];
assign linienmodule_fast_a_limitcsr1_min_storage1 = linienmodule_fast_a_limitcsr1_min_storage_full1[24:0];
assign linienmodule_csrbank1_y_limit_2_min3_w = linienmodule_fast_a_limitcsr1_min_storage_full1[24];
assign linienmodule_csrbank1_y_limit_2_min2_w = linienmodule_fast_a_limitcsr1_min_storage_full1[23:16];
assign linienmodule_csrbank1_y_limit_2_min1_w = linienmodule_fast_a_limitcsr1_min_storage_full1[15:8];
assign linienmodule_csrbank1_y_limit_2_min0_w = linienmodule_fast_a_limitcsr1_min_storage_full1[7:0];
assign linienmodule_fast_a_limitcsr1_max_storage1 = linienmodule_fast_a_limitcsr1_max_storage_full1[24:0];
assign linienmodule_csrbank1_y_limit_2_max3_w = linienmodule_fast_a_limitcsr1_max_storage_full1[24];
assign linienmodule_csrbank1_y_limit_2_max2_w = linienmodule_fast_a_limitcsr1_max_storage_full1[23:16];
assign linienmodule_csrbank1_y_limit_2_max1_w = linienmodule_fast_a_limitcsr1_max_storage_full1[15:8];
assign linienmodule_csrbank1_y_limit_2_max0_w = linienmodule_fast_a_limitcsr1_max_storage_full1[7:0];
assign linienmodule_csrbank1_x_max3_w = linienmodule_max_status0[24];
assign linienmodule_csrbank1_x_max2_w = linienmodule_max_status0[23:16];
assign linienmodule_csrbank1_x_max1_w = linienmodule_max_status0[15:8];
assign linienmodule_csrbank1_x_max0_w = linienmodule_max_status0[7:0];
assign linienmodule_csrbank1_x_min3_w = linienmodule_min_status0[24];
assign linienmodule_csrbank1_x_min2_w = linienmodule_min_status0[23:16];
assign linienmodule_csrbank1_x_min1_w = linienmodule_min_status0[15:8];
assign linienmodule_csrbank1_x_min0_w = linienmodule_min_status0[7:0];
assign linienmodule_csrbank1_out_i_max3_w = linienmodule_max_status1[24];
assign linienmodule_csrbank1_out_i_max2_w = linienmodule_max_status1[23:16];
assign linienmodule_csrbank1_out_i_max1_w = linienmodule_max_status1[15:8];
assign linienmodule_csrbank1_out_i_max0_w = linienmodule_max_status1[7:0];
assign linienmodule_csrbank1_out_i_min3_w = linienmodule_min_status1[24];
assign linienmodule_csrbank1_out_i_min2_w = linienmodule_min_status1[23:16];
assign linienmodule_csrbank1_out_i_min1_w = linienmodule_min_status1[15:8];
assign linienmodule_csrbank1_out_i_min0_w = linienmodule_min_status1[7:0];
assign linienmodule_csrbank1_out_q_max3_w = linienmodule_max_status2[24];
assign linienmodule_csrbank1_out_q_max2_w = linienmodule_max_status2[23:16];
assign linienmodule_csrbank1_out_q_max1_w = linienmodule_max_status2[15:8];
assign linienmodule_csrbank1_out_q_max0_w = linienmodule_max_status2[7:0];
assign linienmodule_csrbank1_out_q_min3_w = linienmodule_min_status2[24];
assign linienmodule_csrbank1_out_q_min2_w = linienmodule_min_status2[23:16];
assign linienmodule_csrbank1_out_q_min1_w = linienmodule_min_status2[15:8];
assign linienmodule_csrbank1_out_q_min0_w = linienmodule_min_status2[7:0];
assign linienmodule_csrstorage8_storage = linienmodule_csrstorage8_storage_full[3:0];
assign linienmodule_csrbank1_dx_sel0_w = linienmodule_csrstorage8_storage_full[3:0];
assign linienmodule_csrstorage9_storage = linienmodule_csrstorage9_storage_full[3:0];
assign linienmodule_csrbank1_dy_sel0_w = linienmodule_csrstorage9_storage_full[3:0];
assign linienmodule_csrbank2_sel = (linienmodule_interface2_bank_bus_adr[13:9] == 1'd1);
assign linienmodule_csrbank2_y_tap0_r = linienmodule_interface2_bank_bus_dat_w[1:0];
assign linienmodule_csrbank2_y_tap0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 1'd0));
assign linienmodule_csrbank2_invert0_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_invert0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 1'd1));
assign linienmodule_csrbank2_demod_delay3_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_demod_delay3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 2'd2));
assign linienmodule_csrbank2_demod_delay2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_demod_delay2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 2'd3));
assign linienmodule_csrbank2_demod_delay1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_demod_delay1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 3'd4));
assign linienmodule_csrbank2_demod_delay0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_demod_delay0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 3'd5));
assign linienmodule_csrbank2_demod_multiplier0_r = linienmodule_interface2_bank_bus_dat_w[3:0];
assign linienmodule_csrbank2_demod_multiplier0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 3'd6));
assign linienmodule_csrbank2_x_limit_1_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_limit_1_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 3'd7));
assign linienmodule_csrbank2_x_limit_1_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd8));
assign linienmodule_csrbank2_x_limit_1_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd9));
assign linienmodule_csrbank2_x_limit_1_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd10));
assign linienmodule_csrbank2_x_limit_1_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_limit_1_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd11));
assign linienmodule_csrbank2_x_limit_1_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd12));
assign linienmodule_csrbank2_x_limit_1_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd13));
assign linienmodule_csrbank2_x_limit_1_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_1_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd14));
assign linienmodule_csrbank2_iir_c_1_z03_r = linienmodule_interface2_bank_bus_dat_w[2:0];
assign linienmodule_csrbank2_iir_c_1_z03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 4'd15));
assign linienmodule_csrbank2_iir_c_1_z02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_z02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd16));
assign linienmodule_csrbank2_iir_c_1_z01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_z01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd17));
assign linienmodule_csrbank2_iir_c_1_z00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_z00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd18));
assign linienmodule_csrbank2_iir_c_1_a13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_1_a13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd19));
assign linienmodule_csrbank2_iir_c_1_a12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_a12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd20));
assign linienmodule_csrbank2_iir_c_1_a11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_a11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd21));
assign linienmodule_csrbank2_iir_c_1_a10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_a10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd22));
assign linienmodule_csrbank2_iir_c_1_b03_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_1_b03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd23));
assign linienmodule_csrbank2_iir_c_1_b02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd24));
assign linienmodule_csrbank2_iir_c_1_b01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd25));
assign linienmodule_csrbank2_iir_c_1_b00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd26));
assign linienmodule_csrbank2_iir_c_1_b13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_1_b13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd27));
assign linienmodule_csrbank2_iir_c_1_b12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd28));
assign linienmodule_csrbank2_iir_c_1_b11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd29));
assign linienmodule_csrbank2_iir_c_1_b10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_1_b10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd30));
assign linienmodule_csrbank2_iir_d_1_z03_r = linienmodule_interface2_bank_bus_dat_w[2:0];
assign linienmodule_csrbank2_iir_d_1_z03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 5'd31));
assign linienmodule_csrbank2_iir_d_1_z02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_z02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd32));
assign linienmodule_csrbank2_iir_d_1_z01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_z01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd33));
assign linienmodule_csrbank2_iir_d_1_z00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_z00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd34));
assign linienmodule_csrbank2_iir_d_1_a13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_1_a13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd35));
assign linienmodule_csrbank2_iir_d_1_a12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd36));
assign linienmodule_csrbank2_iir_d_1_a11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd37));
assign linienmodule_csrbank2_iir_d_1_a10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd38));
assign linienmodule_csrbank2_iir_d_1_a23_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_1_a23_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd39));
assign linienmodule_csrbank2_iir_d_1_a22_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a22_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd40));
assign linienmodule_csrbank2_iir_d_1_a21_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a21_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd41));
assign linienmodule_csrbank2_iir_d_1_a20_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_a20_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd42));
assign linienmodule_csrbank2_iir_d_1_b03_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_1_b03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd43));
assign linienmodule_csrbank2_iir_d_1_b02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd44));
assign linienmodule_csrbank2_iir_d_1_b01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd45));
assign linienmodule_csrbank2_iir_d_1_b00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd46));
assign linienmodule_csrbank2_iir_d_1_b13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_1_b13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd47));
assign linienmodule_csrbank2_iir_d_1_b12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd48));
assign linienmodule_csrbank2_iir_d_1_b11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd49));
assign linienmodule_csrbank2_iir_d_1_b10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd50));
assign linienmodule_csrbank2_iir_d_1_b23_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_1_b23_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd51));
assign linienmodule_csrbank2_iir_d_1_b22_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b22_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd52));
assign linienmodule_csrbank2_iir_d_1_b21_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b21_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd53));
assign linienmodule_csrbank2_iir_d_1_b20_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_1_b20_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd54));
assign linienmodule_csrbank2_y_limit_1_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_y_limit_1_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd55));
assign linienmodule_csrbank2_y_limit_1_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd56));
assign linienmodule_csrbank2_y_limit_1_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd57));
assign linienmodule_csrbank2_y_limit_1_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd58));
assign linienmodule_csrbank2_y_limit_1_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_y_limit_1_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd59));
assign linienmodule_csrbank2_y_limit_1_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd60));
assign linienmodule_csrbank2_y_limit_1_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd61));
assign linienmodule_csrbank2_y_limit_1_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_1_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd62));
assign linienmodule_csrbank2_x_limit_2_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_limit_2_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 6'd63));
assign linienmodule_csrbank2_x_limit_2_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd64));
assign linienmodule_csrbank2_x_limit_2_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd65));
assign linienmodule_csrbank2_x_limit_2_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd66));
assign linienmodule_csrbank2_x_limit_2_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_limit_2_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd67));
assign linienmodule_csrbank2_x_limit_2_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd68));
assign linienmodule_csrbank2_x_limit_2_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd69));
assign linienmodule_csrbank2_x_limit_2_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_limit_2_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd70));
assign linienmodule_csrbank2_iir_c_2_z03_r = linienmodule_interface2_bank_bus_dat_w[2:0];
assign linienmodule_csrbank2_iir_c_2_z03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd71));
assign linienmodule_csrbank2_iir_c_2_z02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_z02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd72));
assign linienmodule_csrbank2_iir_c_2_z01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_z01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd73));
assign linienmodule_csrbank2_iir_c_2_z00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_z00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd74));
assign linienmodule_csrbank2_iir_c_2_a13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_2_a13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd75));
assign linienmodule_csrbank2_iir_c_2_a12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_a12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd76));
assign linienmodule_csrbank2_iir_c_2_a11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_a11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd77));
assign linienmodule_csrbank2_iir_c_2_a10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_a10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd78));
assign linienmodule_csrbank2_iir_c_2_b03_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_2_b03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd79));
assign linienmodule_csrbank2_iir_c_2_b02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd80));
assign linienmodule_csrbank2_iir_c_2_b01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd81));
assign linienmodule_csrbank2_iir_c_2_b00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd82));
assign linienmodule_csrbank2_iir_c_2_b13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_c_2_b13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd83));
assign linienmodule_csrbank2_iir_c_2_b12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd84));
assign linienmodule_csrbank2_iir_c_2_b11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd85));
assign linienmodule_csrbank2_iir_c_2_b10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_c_2_b10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd86));
assign linienmodule_csrbank2_iir_d_2_z03_r = linienmodule_interface2_bank_bus_dat_w[2:0];
assign linienmodule_csrbank2_iir_d_2_z03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd87));
assign linienmodule_csrbank2_iir_d_2_z02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_z02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd88));
assign linienmodule_csrbank2_iir_d_2_z01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_z01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd89));
assign linienmodule_csrbank2_iir_d_2_z00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_z00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd90));
assign linienmodule_csrbank2_iir_d_2_a13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_2_a13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd91));
assign linienmodule_csrbank2_iir_d_2_a12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd92));
assign linienmodule_csrbank2_iir_d_2_a11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd93));
assign linienmodule_csrbank2_iir_d_2_a10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd94));
assign linienmodule_csrbank2_iir_d_2_a23_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_2_a23_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd95));
assign linienmodule_csrbank2_iir_d_2_a22_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a22_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd96));
assign linienmodule_csrbank2_iir_d_2_a21_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a21_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd97));
assign linienmodule_csrbank2_iir_d_2_a20_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_a20_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd98));
assign linienmodule_csrbank2_iir_d_2_b03_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_2_b03_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd99));
assign linienmodule_csrbank2_iir_d_2_b02_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b02_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd100));
assign linienmodule_csrbank2_iir_d_2_b01_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b01_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd101));
assign linienmodule_csrbank2_iir_d_2_b00_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b00_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd102));
assign linienmodule_csrbank2_iir_d_2_b13_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_2_b13_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd103));
assign linienmodule_csrbank2_iir_d_2_b12_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b12_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd104));
assign linienmodule_csrbank2_iir_d_2_b11_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b11_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd105));
assign linienmodule_csrbank2_iir_d_2_b10_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b10_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd106));
assign linienmodule_csrbank2_iir_d_2_b23_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_iir_d_2_b23_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd107));
assign linienmodule_csrbank2_iir_d_2_b22_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b22_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd108));
assign linienmodule_csrbank2_iir_d_2_b21_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b21_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd109));
assign linienmodule_csrbank2_iir_d_2_b20_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_iir_d_2_b20_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd110));
assign linienmodule_csrbank2_y_limit_2_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_y_limit_2_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd111));
assign linienmodule_csrbank2_y_limit_2_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd112));
assign linienmodule_csrbank2_y_limit_2_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd113));
assign linienmodule_csrbank2_y_limit_2_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd114));
assign linienmodule_csrbank2_y_limit_2_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_y_limit_2_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd115));
assign linienmodule_csrbank2_y_limit_2_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd116));
assign linienmodule_csrbank2_y_limit_2_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd117));
assign linienmodule_csrbank2_y_limit_2_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_y_limit_2_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd118));
assign linienmodule_csr3_x_clr_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csr3_x_clr_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd119));
assign linienmodule_csrbank2_x_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd120));
assign linienmodule_csrbank2_x_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd121));
assign linienmodule_csrbank2_x_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd122));
assign linienmodule_csrbank2_x_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd123));
assign linienmodule_csrbank2_x_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_x_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd124));
assign linienmodule_csrbank2_x_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd125));
assign linienmodule_csrbank2_x_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd126));
assign linienmodule_csrbank2_x_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_x_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 7'd127));
assign linienmodule_csr4_out_i_clr_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csr4_out_i_clr_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd128));
assign linienmodule_csrbank2_out_i_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_out_i_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd129));
assign linienmodule_csrbank2_out_i_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd130));
assign linienmodule_csrbank2_out_i_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd131));
assign linienmodule_csrbank2_out_i_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd132));
assign linienmodule_csrbank2_out_i_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_out_i_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd133));
assign linienmodule_csrbank2_out_i_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd134));
assign linienmodule_csrbank2_out_i_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd135));
assign linienmodule_csrbank2_out_i_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_i_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd136));
assign linienmodule_csr5_out_q_clr_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csr5_out_q_clr_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd137));
assign linienmodule_csrbank2_out_q_max3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_out_q_max3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd138));
assign linienmodule_csrbank2_out_q_max2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_max2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd139));
assign linienmodule_csrbank2_out_q_max1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_max1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd140));
assign linienmodule_csrbank2_out_q_max0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_max0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd141));
assign linienmodule_csrbank2_out_q_min3_r = linienmodule_interface2_bank_bus_dat_w[0];
assign linienmodule_csrbank2_out_q_min3_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd142));
assign linienmodule_csrbank2_out_q_min2_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_min2_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd143));
assign linienmodule_csrbank2_out_q_min1_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_min1_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd144));
assign linienmodule_csrbank2_out_q_min0_r = linienmodule_interface2_bank_bus_dat_w[7:0];
assign linienmodule_csrbank2_out_q_min0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd145));
assign linienmodule_csrbank2_dx_sel0_r = linienmodule_interface2_bank_bus_dat_w[3:0];
assign linienmodule_csrbank2_dx_sel0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd146));
assign linienmodule_csrbank2_dy_sel0_r = linienmodule_interface2_bank_bus_dat_w[3:0];
assign linienmodule_csrbank2_dy_sel0_re = ((linienmodule_csrbank2_sel & linienmodule_interface2_bank_bus_we) & (linienmodule_interface2_bank_bus_adr[7:0] == 8'd147));
assign linienmodule_fast_b_y_tap_storage = linienmodule_fast_b_y_tap_storage_full[1:0];
assign linienmodule_csrbank2_y_tap0_w = linienmodule_fast_b_y_tap_storage_full[1:0];
assign linienmodule_fast_b_invert_storage = linienmodule_fast_b_invert_storage_full;
assign linienmodule_csrbank2_invert0_w = linienmodule_fast_b_invert_storage_full;
assign linienmodule_fast_b_delay_storage = linienmodule_fast_b_delay_storage_full[31:0];
assign linienmodule_csrbank2_demod_delay3_w = linienmodule_fast_b_delay_storage_full[31:24];
assign linienmodule_csrbank2_demod_delay2_w = linienmodule_fast_b_delay_storage_full[23:16];
assign linienmodule_csrbank2_demod_delay1_w = linienmodule_fast_b_delay_storage_full[15:8];
assign linienmodule_csrbank2_demod_delay0_w = linienmodule_fast_b_delay_storage_full[7:0];
assign linienmodule_fast_b_multiplier_storage = linienmodule_fast_b_multiplier_storage_full[3:0];
assign linienmodule_csrbank2_demod_multiplier0_w = linienmodule_fast_b_multiplier_storage_full[3:0];
assign linienmodule_fast_b_limitcsr0_min_storage0 = linienmodule_fast_b_limitcsr0_min_storage_full0[24:0];
assign linienmodule_csrbank2_x_limit_1_min3_w = linienmodule_fast_b_limitcsr0_min_storage_full0[24];
assign linienmodule_csrbank2_x_limit_1_min2_w = linienmodule_fast_b_limitcsr0_min_storage_full0[23:16];
assign linienmodule_csrbank2_x_limit_1_min1_w = linienmodule_fast_b_limitcsr0_min_storage_full0[15:8];
assign linienmodule_csrbank2_x_limit_1_min0_w = linienmodule_fast_b_limitcsr0_min_storage_full0[7:0];
assign linienmodule_fast_b_limitcsr0_max_storage0 = linienmodule_fast_b_limitcsr0_max_storage_full0[24:0];
assign linienmodule_csrbank2_x_limit_1_max3_w = linienmodule_fast_b_limitcsr0_max_storage_full0[24];
assign linienmodule_csrbank2_x_limit_1_max2_w = linienmodule_fast_b_limitcsr0_max_storage_full0[23:16];
assign linienmodule_csrbank2_x_limit_1_max1_w = linienmodule_fast_b_limitcsr0_max_storage_full0[15:8];
assign linienmodule_csrbank2_x_limit_1_max0_w = linienmodule_fast_b_limitcsr0_max_storage_full0[7:0];
assign linienmodule_fast_b_iir0_storage0 = linienmodule_fast_b_iir0_storage_full0[26:0];
assign linienmodule_csrbank2_iir_c_1_z03_w = linienmodule_fast_b_iir0_storage_full0[26:24];
assign linienmodule_csrbank2_iir_c_1_z02_w = linienmodule_fast_b_iir0_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_1_z01_w = linienmodule_fast_b_iir0_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_1_z00_w = linienmodule_fast_b_iir0_storage_full0[7:0];
assign linienmodule_fast_b_iir0_csrstorage0_storage0 = linienmodule_fast_b_iir0_csrstorage0_storage_full0[24:0];
assign linienmodule_csrbank2_iir_c_1_a13_w = linienmodule_fast_b_iir0_csrstorage0_storage_full0[24];
assign linienmodule_csrbank2_iir_c_1_a12_w = linienmodule_fast_b_iir0_csrstorage0_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_1_a11_w = linienmodule_fast_b_iir0_csrstorage0_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_1_a10_w = linienmodule_fast_b_iir0_csrstorage0_storage_full0[7:0];
assign linienmodule_fast_b_iir0_csrstorage1_storage0 = linienmodule_fast_b_iir0_csrstorage1_storage_full0[24:0];
assign linienmodule_csrbank2_iir_c_1_b03_w = linienmodule_fast_b_iir0_csrstorage1_storage_full0[24];
assign linienmodule_csrbank2_iir_c_1_b02_w = linienmodule_fast_b_iir0_csrstorage1_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_1_b01_w = linienmodule_fast_b_iir0_csrstorage1_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_1_b00_w = linienmodule_fast_b_iir0_csrstorage1_storage_full0[7:0];
assign linienmodule_fast_b_iir0_csrstorage2_storage0 = linienmodule_fast_b_iir0_csrstorage2_storage_full0[24:0];
assign linienmodule_csrbank2_iir_c_1_b13_w = linienmodule_fast_b_iir0_csrstorage2_storage_full0[24];
assign linienmodule_csrbank2_iir_c_1_b12_w = linienmodule_fast_b_iir0_csrstorage2_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_1_b11_w = linienmodule_fast_b_iir0_csrstorage2_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_1_b10_w = linienmodule_fast_b_iir0_csrstorage2_storage_full0[7:0];
assign linienmodule_fast_b_iir0_storage1 = linienmodule_fast_b_iir0_storage_full1[26:0];
assign linienmodule_csrbank2_iir_d_1_z03_w = linienmodule_fast_b_iir0_storage_full1[26:24];
assign linienmodule_csrbank2_iir_d_1_z02_w = linienmodule_fast_b_iir0_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_1_z01_w = linienmodule_fast_b_iir0_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_1_z00_w = linienmodule_fast_b_iir0_storage_full1[7:0];
assign linienmodule_fast_b_iir0_csrstorage0_storage1 = linienmodule_fast_b_iir0_csrstorage0_storage_full1[24:0];
assign linienmodule_csrbank2_iir_d_1_a13_w = linienmodule_fast_b_iir0_csrstorage0_storage_full1[24];
assign linienmodule_csrbank2_iir_d_1_a12_w = linienmodule_fast_b_iir0_csrstorage0_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_1_a11_w = linienmodule_fast_b_iir0_csrstorage0_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_1_a10_w = linienmodule_fast_b_iir0_csrstorage0_storage_full1[7:0];
assign linienmodule_fast_b_iir0_csrstorage1_storage1 = linienmodule_fast_b_iir0_csrstorage1_storage_full1[24:0];
assign linienmodule_csrbank2_iir_d_1_a23_w = linienmodule_fast_b_iir0_csrstorage1_storage_full1[24];
assign linienmodule_csrbank2_iir_d_1_a22_w = linienmodule_fast_b_iir0_csrstorage1_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_1_a21_w = linienmodule_fast_b_iir0_csrstorage1_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_1_a20_w = linienmodule_fast_b_iir0_csrstorage1_storage_full1[7:0];
assign linienmodule_fast_b_iir0_csrstorage2_storage1 = linienmodule_fast_b_iir0_csrstorage2_storage_full1[24:0];
assign linienmodule_csrbank2_iir_d_1_b03_w = linienmodule_fast_b_iir0_csrstorage2_storage_full1[24];
assign linienmodule_csrbank2_iir_d_1_b02_w = linienmodule_fast_b_iir0_csrstorage2_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_1_b01_w = linienmodule_fast_b_iir0_csrstorage2_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_1_b00_w = linienmodule_fast_b_iir0_csrstorage2_storage_full1[7:0];
assign linienmodule_fast_b_iir0_csrstorage3_storage = linienmodule_fast_b_iir0_csrstorage3_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_1_b13_w = linienmodule_fast_b_iir0_csrstorage3_storage_full[24];
assign linienmodule_csrbank2_iir_d_1_b12_w = linienmodule_fast_b_iir0_csrstorage3_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_1_b11_w = linienmodule_fast_b_iir0_csrstorage3_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_1_b10_w = linienmodule_fast_b_iir0_csrstorage3_storage_full[7:0];
assign linienmodule_fast_b_iir0_csrstorage4_storage = linienmodule_fast_b_iir0_csrstorage4_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_1_b23_w = linienmodule_fast_b_iir0_csrstorage4_storage_full[24];
assign linienmodule_csrbank2_iir_d_1_b22_w = linienmodule_fast_b_iir0_csrstorage4_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_1_b21_w = linienmodule_fast_b_iir0_csrstorage4_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_1_b20_w = linienmodule_fast_b_iir0_csrstorage4_storage_full[7:0];
assign linienmodule_fast_b_limitcsr0_min_storage1 = linienmodule_fast_b_limitcsr0_min_storage_full1[24:0];
assign linienmodule_csrbank2_y_limit_1_min3_w = linienmodule_fast_b_limitcsr0_min_storage_full1[24];
assign linienmodule_csrbank2_y_limit_1_min2_w = linienmodule_fast_b_limitcsr0_min_storage_full1[23:16];
assign linienmodule_csrbank2_y_limit_1_min1_w = linienmodule_fast_b_limitcsr0_min_storage_full1[15:8];
assign linienmodule_csrbank2_y_limit_1_min0_w = linienmodule_fast_b_limitcsr0_min_storage_full1[7:0];
assign linienmodule_fast_b_limitcsr0_max_storage1 = linienmodule_fast_b_limitcsr0_max_storage_full1[24:0];
assign linienmodule_csrbank2_y_limit_1_max3_w = linienmodule_fast_b_limitcsr0_max_storage_full1[24];
assign linienmodule_csrbank2_y_limit_1_max2_w = linienmodule_fast_b_limitcsr0_max_storage_full1[23:16];
assign linienmodule_csrbank2_y_limit_1_max1_w = linienmodule_fast_b_limitcsr0_max_storage_full1[15:8];
assign linienmodule_csrbank2_y_limit_1_max0_w = linienmodule_fast_b_limitcsr0_max_storage_full1[7:0];
assign linienmodule_fast_b_limitcsr1_min_storage0 = linienmodule_fast_b_limitcsr1_min_storage_full0[24:0];
assign linienmodule_csrbank2_x_limit_2_min3_w = linienmodule_fast_b_limitcsr1_min_storage_full0[24];
assign linienmodule_csrbank2_x_limit_2_min2_w = linienmodule_fast_b_limitcsr1_min_storage_full0[23:16];
assign linienmodule_csrbank2_x_limit_2_min1_w = linienmodule_fast_b_limitcsr1_min_storage_full0[15:8];
assign linienmodule_csrbank2_x_limit_2_min0_w = linienmodule_fast_b_limitcsr1_min_storage_full0[7:0];
assign linienmodule_fast_b_limitcsr1_max_storage0 = linienmodule_fast_b_limitcsr1_max_storage_full0[24:0];
assign linienmodule_csrbank2_x_limit_2_max3_w = linienmodule_fast_b_limitcsr1_max_storage_full0[24];
assign linienmodule_csrbank2_x_limit_2_max2_w = linienmodule_fast_b_limitcsr1_max_storage_full0[23:16];
assign linienmodule_csrbank2_x_limit_2_max1_w = linienmodule_fast_b_limitcsr1_max_storage_full0[15:8];
assign linienmodule_csrbank2_x_limit_2_max0_w = linienmodule_fast_b_limitcsr1_max_storage_full0[7:0];
assign linienmodule_fast_b_iir1_storage0 = linienmodule_fast_b_iir1_storage_full0[26:0];
assign linienmodule_csrbank2_iir_c_2_z03_w = linienmodule_fast_b_iir1_storage_full0[26:24];
assign linienmodule_csrbank2_iir_c_2_z02_w = linienmodule_fast_b_iir1_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_2_z01_w = linienmodule_fast_b_iir1_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_2_z00_w = linienmodule_fast_b_iir1_storage_full0[7:0];
assign linienmodule_fast_b_iir1_csrstorage3_storage = linienmodule_fast_b_iir1_csrstorage3_storage_full[24:0];
assign linienmodule_csrbank2_iir_c_2_a13_w = linienmodule_fast_b_iir1_csrstorage3_storage_full[24];
assign linienmodule_csrbank2_iir_c_2_a12_w = linienmodule_fast_b_iir1_csrstorage3_storage_full[23:16];
assign linienmodule_csrbank2_iir_c_2_a11_w = linienmodule_fast_b_iir1_csrstorage3_storage_full[15:8];
assign linienmodule_csrbank2_iir_c_2_a10_w = linienmodule_fast_b_iir1_csrstorage3_storage_full[7:0];
assign linienmodule_fast_b_iir1_csrstorage4_storage = linienmodule_fast_b_iir1_csrstorage4_storage_full[24:0];
assign linienmodule_csrbank2_iir_c_2_b03_w = linienmodule_fast_b_iir1_csrstorage4_storage_full[24];
assign linienmodule_csrbank2_iir_c_2_b02_w = linienmodule_fast_b_iir1_csrstorage4_storage_full[23:16];
assign linienmodule_csrbank2_iir_c_2_b01_w = linienmodule_fast_b_iir1_csrstorage4_storage_full[15:8];
assign linienmodule_csrbank2_iir_c_2_b00_w = linienmodule_fast_b_iir1_csrstorage4_storage_full[7:0];
assign linienmodule_fast_b_iir1_csrstorage5_storage0 = linienmodule_fast_b_iir1_csrstorage5_storage_full0[24:0];
assign linienmodule_csrbank2_iir_c_2_b13_w = linienmodule_fast_b_iir1_csrstorage5_storage_full0[24];
assign linienmodule_csrbank2_iir_c_2_b12_w = linienmodule_fast_b_iir1_csrstorage5_storage_full0[23:16];
assign linienmodule_csrbank2_iir_c_2_b11_w = linienmodule_fast_b_iir1_csrstorage5_storage_full0[15:8];
assign linienmodule_csrbank2_iir_c_2_b10_w = linienmodule_fast_b_iir1_csrstorage5_storage_full0[7:0];
assign linienmodule_fast_b_iir1_storage1 = linienmodule_fast_b_iir1_storage_full1[26:0];
assign linienmodule_csrbank2_iir_d_2_z03_w = linienmodule_fast_b_iir1_storage_full1[26:24];
assign linienmodule_csrbank2_iir_d_2_z02_w = linienmodule_fast_b_iir1_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_2_z01_w = linienmodule_fast_b_iir1_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_2_z00_w = linienmodule_fast_b_iir1_storage_full1[7:0];
assign linienmodule_fast_b_iir1_csrstorage5_storage1 = linienmodule_fast_b_iir1_csrstorage5_storage_full1[24:0];
assign linienmodule_csrbank2_iir_d_2_a13_w = linienmodule_fast_b_iir1_csrstorage5_storage_full1[24];
assign linienmodule_csrbank2_iir_d_2_a12_w = linienmodule_fast_b_iir1_csrstorage5_storage_full1[23:16];
assign linienmodule_csrbank2_iir_d_2_a11_w = linienmodule_fast_b_iir1_csrstorage5_storage_full1[15:8];
assign linienmodule_csrbank2_iir_d_2_a10_w = linienmodule_fast_b_iir1_csrstorage5_storage_full1[7:0];
assign linienmodule_fast_b_iir1_csrstorage6_storage = linienmodule_fast_b_iir1_csrstorage6_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_2_a23_w = linienmodule_fast_b_iir1_csrstorage6_storage_full[24];
assign linienmodule_csrbank2_iir_d_2_a22_w = linienmodule_fast_b_iir1_csrstorage6_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_2_a21_w = linienmodule_fast_b_iir1_csrstorage6_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_2_a20_w = linienmodule_fast_b_iir1_csrstorage6_storage_full[7:0];
assign linienmodule_fast_b_iir1_csrstorage7_storage = linienmodule_fast_b_iir1_csrstorage7_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_2_b03_w = linienmodule_fast_b_iir1_csrstorage7_storage_full[24];
assign linienmodule_csrbank2_iir_d_2_b02_w = linienmodule_fast_b_iir1_csrstorage7_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_2_b01_w = linienmodule_fast_b_iir1_csrstorage7_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_2_b00_w = linienmodule_fast_b_iir1_csrstorage7_storage_full[7:0];
assign linienmodule_fast_b_iir1_csrstorage8_storage = linienmodule_fast_b_iir1_csrstorage8_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_2_b13_w = linienmodule_fast_b_iir1_csrstorage8_storage_full[24];
assign linienmodule_csrbank2_iir_d_2_b12_w = linienmodule_fast_b_iir1_csrstorage8_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_2_b11_w = linienmodule_fast_b_iir1_csrstorage8_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_2_b10_w = linienmodule_fast_b_iir1_csrstorage8_storage_full[7:0];
assign linienmodule_fast_b_iir1_csrstorage9_storage = linienmodule_fast_b_iir1_csrstorage9_storage_full[24:0];
assign linienmodule_csrbank2_iir_d_2_b23_w = linienmodule_fast_b_iir1_csrstorage9_storage_full[24];
assign linienmodule_csrbank2_iir_d_2_b22_w = linienmodule_fast_b_iir1_csrstorage9_storage_full[23:16];
assign linienmodule_csrbank2_iir_d_2_b21_w = linienmodule_fast_b_iir1_csrstorage9_storage_full[15:8];
assign linienmodule_csrbank2_iir_d_2_b20_w = linienmodule_fast_b_iir1_csrstorage9_storage_full[7:0];
assign linienmodule_fast_b_limitcsr1_min_storage1 = linienmodule_fast_b_limitcsr1_min_storage_full1[24:0];
assign linienmodule_csrbank2_y_limit_2_min3_w = linienmodule_fast_b_limitcsr1_min_storage_full1[24];
assign linienmodule_csrbank2_y_limit_2_min2_w = linienmodule_fast_b_limitcsr1_min_storage_full1[23:16];
assign linienmodule_csrbank2_y_limit_2_min1_w = linienmodule_fast_b_limitcsr1_min_storage_full1[15:8];
assign linienmodule_csrbank2_y_limit_2_min0_w = linienmodule_fast_b_limitcsr1_min_storage_full1[7:0];
assign linienmodule_fast_b_limitcsr1_max_storage1 = linienmodule_fast_b_limitcsr1_max_storage_full1[24:0];
assign linienmodule_csrbank2_y_limit_2_max3_w = linienmodule_fast_b_limitcsr1_max_storage_full1[24];
assign linienmodule_csrbank2_y_limit_2_max2_w = linienmodule_fast_b_limitcsr1_max_storage_full1[23:16];
assign linienmodule_csrbank2_y_limit_2_max1_w = linienmodule_fast_b_limitcsr1_max_storage_full1[15:8];
assign linienmodule_csrbank2_y_limit_2_max0_w = linienmodule_fast_b_limitcsr1_max_storage_full1[7:0];
assign linienmodule_csrbank2_x_max3_w = linienmodule_max_status3[24];
assign linienmodule_csrbank2_x_max2_w = linienmodule_max_status3[23:16];
assign linienmodule_csrbank2_x_max1_w = linienmodule_max_status3[15:8];
assign linienmodule_csrbank2_x_max0_w = linienmodule_max_status3[7:0];
assign linienmodule_csrbank2_x_min3_w = linienmodule_min_status3[24];
assign linienmodule_csrbank2_x_min2_w = linienmodule_min_status3[23:16];
assign linienmodule_csrbank2_x_min1_w = linienmodule_min_status3[15:8];
assign linienmodule_csrbank2_x_min0_w = linienmodule_min_status3[7:0];
assign linienmodule_csrbank2_out_i_max3_w = linienmodule_max_status4[24];
assign linienmodule_csrbank2_out_i_max2_w = linienmodule_max_status4[23:16];
assign linienmodule_csrbank2_out_i_max1_w = linienmodule_max_status4[15:8];
assign linienmodule_csrbank2_out_i_max0_w = linienmodule_max_status4[7:0];
assign linienmodule_csrbank2_out_i_min3_w = linienmodule_min_status4[24];
assign linienmodule_csrbank2_out_i_min2_w = linienmodule_min_status4[23:16];
assign linienmodule_csrbank2_out_i_min1_w = linienmodule_min_status4[15:8];
assign linienmodule_csrbank2_out_i_min0_w = linienmodule_min_status4[7:0];
assign linienmodule_csrbank2_out_q_max3_w = linienmodule_max_status5[24];
assign linienmodule_csrbank2_out_q_max2_w = linienmodule_max_status5[23:16];
assign linienmodule_csrbank2_out_q_max1_w = linienmodule_max_status5[15:8];
assign linienmodule_csrbank2_out_q_max0_w = linienmodule_max_status5[7:0];
assign linienmodule_csrbank2_out_q_min3_w = linienmodule_min_status5[24];
assign linienmodule_csrbank2_out_q_min2_w = linienmodule_min_status5[23:16];
assign linienmodule_csrbank2_out_q_min1_w = linienmodule_min_status5[15:8];
assign linienmodule_csrbank2_out_q_min0_w = linienmodule_min_status5[7:0];
assign linienmodule_csrstorage10_storage = linienmodule_csrstorage10_storage_full[3:0];
assign linienmodule_csrbank2_dx_sel0_w = linienmodule_csrstorage10_storage_full[3:0];
assign linienmodule_csrstorage11_storage = linienmodule_csrstorage11_storage_full[3:0];
assign linienmodule_csrbank2_dy_sel0_w = linienmodule_csrstorage11_storage_full[3:0];
assign linienmodule_csrbank3_sel = (linienmodule_interface3_bank_bus_adr[13:9] == 5'd30);
assign linienmodule_csrbank3_ins_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_ins_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 1'd0));
assign linienmodule_csrbank3_outs0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_outs0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 1'd1));
assign linienmodule_csrbank3_oes0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_oes0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 2'd2));
assign linienmodule_csrbank3_state1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_state1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 2'd3));
assign linienmodule_csrbank3_state0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_state0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 3'd4));
assign linienmodule_state_clr_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_state_clr_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 3'd5));
assign linienmodule_csrbank3_do0_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do0_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 3'd6));
assign linienmodule_csrbank3_do0_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do0_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 3'd7));
assign linienmodule_csrbank3_do1_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do1_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd8));
assign linienmodule_csrbank3_do1_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do1_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd9));
assign linienmodule_csrbank3_do2_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do2_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd10));
assign linienmodule_csrbank3_do2_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do2_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd11));
assign linienmodule_csrbank3_do3_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do3_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd12));
assign linienmodule_csrbank3_do3_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do3_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd13));
assign linienmodule_csrbank3_do4_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do4_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd14));
assign linienmodule_csrbank3_do4_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do4_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 4'd15));
assign linienmodule_csrbank3_do5_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do5_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd16));
assign linienmodule_csrbank3_do5_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do5_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd17));
assign linienmodule_csrbank3_do6_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do6_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd18));
assign linienmodule_csrbank3_do6_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do6_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd19));
assign linienmodule_csrbank3_do7_en1_r = linienmodule_interface3_bank_bus_dat_w[0];
assign linienmodule_csrbank3_do7_en1_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd20));
assign linienmodule_csrbank3_do7_en0_r = linienmodule_interface3_bank_bus_dat_w[7:0];
assign linienmodule_csrbank3_do7_en0_re = ((linienmodule_csrbank3_sel & linienmodule_interface3_bank_bus_we) & (linienmodule_interface3_bank_bus_adr[4:0] == 5'd21));
assign linienmodule_csrbank3_ins_w = linienmodule_gpio_n_status[7:0];
assign linienmodule_gpio_n_outs_storage = linienmodule_gpio_n_outs_storage_full[7:0];
assign linienmodule_csrbank3_outs0_w = linienmodule_gpio_n_outs_storage_full[7:0];
assign linienmodule_gpio_n_oes_storage = linienmodule_gpio_n_oes_storage_full[7:0];
assign linienmodule_csrbank3_oes0_w = linienmodule_gpio_n_oes_storage_full[7:0];
assign linienmodule_csrbank3_state1_w = linienmodule_state_status[8];
assign linienmodule_csrbank3_state0_w = linienmodule_state_status[7:0];
assign linienmodule_csrstorage0_storage1 = linienmodule_csrstorage0_storage_full1[8:0];
assign linienmodule_csrbank3_do0_en1_w = linienmodule_csrstorage0_storage_full1[8];
assign linienmodule_csrbank3_do0_en0_w = linienmodule_csrstorage0_storage_full1[7:0];
assign linienmodule_csrstorage1_storage1 = linienmodule_csrstorage1_storage_full1[8:0];
assign linienmodule_csrbank3_do1_en1_w = linienmodule_csrstorage1_storage_full1[8];
assign linienmodule_csrbank3_do1_en0_w = linienmodule_csrstorage1_storage_full1[7:0];
assign linienmodule_csrstorage2_storage1 = linienmodule_csrstorage2_storage_full1[8:0];
assign linienmodule_csrbank3_do2_en1_w = linienmodule_csrstorage2_storage_full1[8];
assign linienmodule_csrbank3_do2_en0_w = linienmodule_csrstorage2_storage_full1[7:0];
assign linienmodule_csrstorage3_storage = linienmodule_csrstorage3_storage_full[8:0];
assign linienmodule_csrbank3_do3_en1_w = linienmodule_csrstorage3_storage_full[8];
assign linienmodule_csrbank3_do3_en0_w = linienmodule_csrstorage3_storage_full[7:0];
assign linienmodule_csrstorage4_storage = linienmodule_csrstorage4_storage_full[8:0];
assign linienmodule_csrbank3_do4_en1_w = linienmodule_csrstorage4_storage_full[8];
assign linienmodule_csrbank3_do4_en0_w = linienmodule_csrstorage4_storage_full[7:0];
assign linienmodule_csrstorage5_storage = linienmodule_csrstorage5_storage_full[8:0];
assign linienmodule_csrbank3_do5_en1_w = linienmodule_csrstorage5_storage_full[8];
assign linienmodule_csrbank3_do5_en0_w = linienmodule_csrstorage5_storage_full[7:0];
assign linienmodule_csrstorage6_storage = linienmodule_csrstorage6_storage_full[8:0];
assign linienmodule_csrbank3_do6_en1_w = linienmodule_csrstorage6_storage_full[8];
assign linienmodule_csrbank3_do6_en0_w = linienmodule_csrstorage6_storage_full[7:0];
assign linienmodule_csrstorage7_storage = linienmodule_csrstorage7_storage_full[8:0];
assign linienmodule_csrbank3_do7_en1_w = linienmodule_csrstorage7_storage_full[8];
assign linienmodule_csrbank3_do7_en0_w = linienmodule_csrstorage7_storage_full[7:0];
assign linienmodule_csrbank4_sel = (linienmodule_interface4_bank_bus_adr[13:9] == 5'd31);
assign linienmodule_csrbank4_ins_r = linienmodule_interface4_bank_bus_dat_w[7:0];
assign linienmodule_csrbank4_ins_re = ((linienmodule_csrbank4_sel & linienmodule_interface4_bank_bus_we) & (linienmodule_interface4_bank_bus_adr[1:0] == 1'd0));
assign linienmodule_csrbank4_outs0_r = linienmodule_interface4_bank_bus_dat_w[7:0];
assign linienmodule_csrbank4_outs0_re = ((linienmodule_csrbank4_sel & linienmodule_interface4_bank_bus_we) & (linienmodule_interface4_bank_bus_adr[1:0] == 1'd1));
assign linienmodule_csrbank4_oes0_r = linienmodule_interface4_bank_bus_dat_w[7:0];
assign linienmodule_csrbank4_oes0_re = ((linienmodule_csrbank4_sel & linienmodule_interface4_bank_bus_we) & (linienmodule_interface4_bank_bus_adr[1:0] == 2'd2));
assign linienmodule_csrbank4_ins_w = linienmodule_gpio_p_status[7:0];
assign linienmodule_gpio_p_outs_storage = linienmodule_gpio_p_outs_storage_full[7:0];
assign linienmodule_csrbank4_outs0_w = linienmodule_gpio_p_outs_storage_full[7:0];
assign linienmodule_gpio_p_oes_storage = linienmodule_gpio_p_oes_storage_full[7:0];
assign linienmodule_csrbank4_oes0_w = linienmodule_gpio_p_oes_storage_full[7:0];
assign linienmodule_csrbank5_sel = (linienmodule_interface5_bank_bus_adr[13:9] == 4'd8);
assign linienmodule_csrbank5_dual_channel0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_dual_channel0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 1'd0));
assign linienmodule_csrbank5_mod_channel0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_mod_channel0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 1'd1));
assign linienmodule_csrbank5_control_channel0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_control_channel0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 2'd2));
assign linienmodule_csrbank5_sweep_channel0_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sweep_channel0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 2'd3));
assign linienmodule_csrbank5_slow_control_channel0_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_slow_control_channel0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 3'd4));
assign linienmodule_csrbank5_pid_only_mode0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_pid_only_mode0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 3'd5));
assign linienmodule_csrbank5_chain_a_factor1_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_chain_a_factor1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 3'd6));
assign linienmodule_csrbank5_chain_a_factor0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_chain_a_factor0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 3'd7));
assign linienmodule_csrbank5_chain_b_factor1_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_chain_b_factor1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd8));
assign linienmodule_csrbank5_chain_b_factor0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_chain_b_factor0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd9));
assign linienmodule_csrbank5_chain_a_offset1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_chain_a_offset1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd10));
assign linienmodule_csrbank5_chain_a_offset0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_chain_a_offset0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd11));
assign linienmodule_csrbank5_chain_b_offset1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_chain_b_offset1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd12));
assign linienmodule_csrbank5_chain_b_offset0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_chain_b_offset0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd13));
assign linienmodule_csrbank5_combined_offset1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_combined_offset1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd14));
assign linienmodule_csrbank5_combined_offset0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_offset0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 4'd15));
assign linienmodule_csrbank5_out_offset1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_out_offset1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd16));
assign linienmodule_csrbank5_out_offset0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_out_offset0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd17));
assign linienmodule_csrbank5_slow_decimation0_r = linienmodule_interface5_bank_bus_dat_w[4:0];
assign linienmodule_csrbank5_slow_decimation0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd18));
assign linienmodule_csrbank5_analog_out_11_r = linienmodule_interface5_bank_bus_dat_w[6:0];
assign linienmodule_csrbank5_analog_out_11_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd19));
assign linienmodule_csrbank5_analog_out_10_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_analog_out_10_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd20));
assign linienmodule_csrbank5_analog_out_21_r = linienmodule_interface5_bank_bus_dat_w[6:0];
assign linienmodule_csrbank5_analog_out_21_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd21));
assign linienmodule_csrbank5_analog_out_20_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_analog_out_20_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd22));
assign linienmodule_csrbank5_analog_out_31_r = linienmodule_interface5_bank_bus_dat_w[6:0];
assign linienmodule_csrbank5_analog_out_31_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd23));
assign linienmodule_csrbank5_analog_out_30_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_analog_out_30_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd24));
assign linienmodule_csrbank5_slow_value1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_slow_value1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd25));
assign linienmodule_csrbank5_slow_value0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_slow_value0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd26));
assign linienmodule_csrbank5_mod_amp1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_mod_amp1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd27));
assign linienmodule_csrbank5_mod_amp0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_mod_amp0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd28));
assign linienmodule_csrbank5_mod_freq3_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_mod_freq3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd29));
assign linienmodule_csrbank5_mod_freq2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_mod_freq2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd30));
assign linienmodule_csrbank5_mod_freq1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_mod_freq1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 5'd31));
assign linienmodule_csrbank5_mod_freq0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_mod_freq0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd32));
assign linienmodule_csrbank5_sweep_step3_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sweep_step3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd33));
assign linienmodule_csrbank5_sweep_step2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sweep_step2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd34));
assign linienmodule_csrbank5_sweep_step1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sweep_step1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd35));
assign linienmodule_csrbank5_sweep_step0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sweep_step0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd36));
assign linienmodule_csrbank5_sweep_min1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sweep_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd37));
assign linienmodule_csrbank5_sweep_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sweep_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd38));
assign linienmodule_csrbank5_sweep_max1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sweep_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd39));
assign linienmodule_csrbank5_sweep_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sweep_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd40));
assign linienmodule_csrbank5_sweep_run0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sweep_run0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd41));
assign linienmodule_csrbank5_sweep_pause0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sweep_pause0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd42));
assign linienmodule_csrbank5_limit_error_signal_min3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_limit_error_signal_min3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd43));
assign linienmodule_csrbank5_limit_error_signal_min2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_min2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd44));
assign linienmodule_csrbank5_limit_error_signal_min1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd45));
assign linienmodule_csrbank5_limit_error_signal_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd46));
assign linienmodule_csrbank5_limit_error_signal_max3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_limit_error_signal_max3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd47));
assign linienmodule_csrbank5_limit_error_signal_max2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_max2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd48));
assign linienmodule_csrbank5_limit_error_signal_max1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd49));
assign linienmodule_csrbank5_limit_error_signal_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_error_signal_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd50));
assign linienmodule_csrbank5_limit_fast1_min1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_limit_fast1_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd51));
assign linienmodule_csrbank5_limit_fast1_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_fast1_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd52));
assign linienmodule_csrbank5_limit_fast1_max1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_limit_fast1_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd53));
assign linienmodule_csrbank5_limit_fast1_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_fast1_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd54));
assign linienmodule_csrbank5_limit_fast2_min1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_limit_fast2_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd55));
assign linienmodule_csrbank5_limit_fast2_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_fast2_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd56));
assign linienmodule_csrbank5_limit_fast2_max1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_limit_fast2_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd57));
assign linienmodule_csrbank5_limit_fast2_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_limit_fast2_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd58));
assign linienmodule_csrbank5_pid_setpoint3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_pid_setpoint3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd59));
assign linienmodule_csrbank5_pid_setpoint2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_setpoint2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd60));
assign linienmodule_csrbank5_pid_setpoint1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_setpoint1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd61));
assign linienmodule_csrbank5_pid_setpoint0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_setpoint0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd62));
assign linienmodule_csrbank5_pid_kp1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_pid_kp1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 6'd63));
assign linienmodule_csrbank5_pid_kp0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_kp0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd64));
assign linienmodule_csrbank5_pid_ki1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_pid_ki1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd65));
assign linienmodule_csrbank5_pid_ki0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_ki0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd66));
assign linienmodule_csrbank5_pid_reset0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_pid_reset0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd67));
assign linienmodule_csrbank5_pid_kd1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_pid_kd1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd68));
assign linienmodule_csrbank5_pid_kd0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_pid_kd0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd69));
assign linienmodule_csrbank5_autolock_fast_target_position1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_autolock_fast_target_position1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd70));
assign linienmodule_csrbank5_autolock_fast_target_position0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_autolock_fast_target_position0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd71));
assign linienmodule_csrbank5_autolock_request_lock0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_autolock_request_lock0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd72));
assign linienmodule_csrbank5_autolock_autolock_mode0_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_autolock_autolock_mode0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd73));
assign linienmodule_csrbank5_autolock_lock_running_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_autolock_lock_running_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd74));
assign linienmodule_csrbank5_sequence_reset_seq0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sequence_reset_seq0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd75));
assign linienmodule_csrbank5_sequence_arm0_r = linienmodule_interface5_bank_bus_dat_w[3:0];
assign linienmodule_csrbank5_sequence_arm0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd76));
assign linienmodule_csrbank5_sequence_status_1_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sequence_status_1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd77));
assign linienmodule_csrbank5_sequence_status_2_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sequence_status_2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd78));
assign linienmodule_csrbank5_sequence_status_3_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sequence_status_3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd79));
assign linienmodule_csrbank5_sequence_status_4_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sequence_status_4_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd80));
assign linienmodule_csrbank5_sequence_saved_pid_out1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sequence_saved_pid_out1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd81));
assign linienmodule_csrbank5_sequence_saved_pid_out0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_pid_out0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd82));
assign linienmodule_csrbank5_sequence_saved_integrator3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sequence_saved_integrator3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd83));
assign linienmodule_csrbank5_sequence_saved_integrator2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_integrator2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd84));
assign linienmodule_csrbank5_sequence_saved_integrator1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_integrator1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd85));
assign linienmodule_csrbank5_sequence_saved_integrator0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_integrator0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd86));
assign linienmodule_csrbank5_sequence_saved_sweep_pos1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sequence_saved_sweep_pos1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd87));
assign linienmodule_csrbank5_sequence_saved_sweep_pos0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_sweep_pos0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd88));
assign linienmodule_csrbank5_sequence_saved_dac_out1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sequence_saved_dac_out1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd89));
assign linienmodule_csrbank5_sequence_saved_dac_out0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_saved_dac_out0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd90));
assign linienmodule_csrbank5_sequence_fsm_reg_addr1_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sequence_fsm_reg_addr1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd91));
assign linienmodule_csrbank5_sequence_fsm_reg_addr0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_fsm_reg_addr0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd92));
assign linienmodule_csrbank5_sequence_fsm_reg_data3_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_fsm_reg_data3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd93));
assign linienmodule_csrbank5_sequence_fsm_reg_data2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_fsm_reg_data2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd94));
assign linienmodule_csrbank5_sequence_fsm_reg_data1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_fsm_reg_data1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd95));
assign linienmodule_csrbank5_sequence_fsm_reg_data0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_fsm_reg_data0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd96));
assign linienmodule_csrbank5_sequence_fsm_reg_wen0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sequence_fsm_reg_wen0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd97));
assign linienmodule_csrbank5_sequence_awg_reg_addr1_r = linienmodule_interface5_bank_bus_dat_w[1:0];
assign linienmodule_csrbank5_sequence_awg_reg_addr1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd98));
assign linienmodule_csrbank5_sequence_awg_reg_addr0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_awg_reg_addr0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd99));
assign linienmodule_csrbank5_sequence_awg_reg_data1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sequence_awg_reg_data1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd100));
assign linienmodule_csrbank5_sequence_awg_reg_data0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_awg_reg_data0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd101));
assign linienmodule_csrbank5_sequence_awg_reg_wen0_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_sequence_awg_reg_wen0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd102));
assign linienmodule_csrbank5_sequence_num_blocks_10_r = linienmodule_interface5_bank_bus_dat_w[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_10_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd103));
assign linienmodule_csrbank5_sequence_num_blocks_20_r = linienmodule_interface5_bank_bus_dat_w[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_20_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd104));
assign linienmodule_csrbank5_sequence_num_blocks_30_r = linienmodule_interface5_bank_bus_dat_w[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_30_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd105));
assign linienmodule_csrbank5_sequence_num_blocks_40_r = linienmodule_interface5_bank_bus_dat_w[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_40_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd106));
assign linienmodule_csrbank5_sequence_init_v1_r = linienmodule_interface5_bank_bus_dat_w[5:0];
assign linienmodule_csrbank5_sequence_init_v1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd107));
assign linienmodule_csrbank5_sequence_init_v0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_sequence_init_v0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd108));
assign linienmodule_csrbank5_raw_acquisition_iir_z03_r = linienmodule_interface5_bank_bus_dat_w[2:0];
assign linienmodule_csrbank5_raw_acquisition_iir_z03_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd109));
assign linienmodule_csrbank5_raw_acquisition_iir_z02_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_z02_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd110));
assign linienmodule_csrbank5_raw_acquisition_iir_z01_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_z01_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd111));
assign linienmodule_csrbank5_raw_acquisition_iir_z00_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_z00_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd112));
assign linienmodule_csrbank5_raw_acquisition_iir_a13_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_a13_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd113));
assign linienmodule_csrbank5_raw_acquisition_iir_a12_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a12_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd114));
assign linienmodule_csrbank5_raw_acquisition_iir_a11_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a11_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd115));
assign linienmodule_csrbank5_raw_acquisition_iir_a10_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a10_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd116));
assign linienmodule_csrbank5_raw_acquisition_iir_a23_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_a23_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd117));
assign linienmodule_csrbank5_raw_acquisition_iir_a22_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a22_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd118));
assign linienmodule_csrbank5_raw_acquisition_iir_a21_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a21_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd119));
assign linienmodule_csrbank5_raw_acquisition_iir_a20_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a20_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd120));
assign linienmodule_csrbank5_raw_acquisition_iir_a33_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_a33_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd121));
assign linienmodule_csrbank5_raw_acquisition_iir_a32_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a32_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd122));
assign linienmodule_csrbank5_raw_acquisition_iir_a31_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a31_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd123));
assign linienmodule_csrbank5_raw_acquisition_iir_a30_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a30_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd124));
assign linienmodule_csrbank5_raw_acquisition_iir_a43_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_a43_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd125));
assign linienmodule_csrbank5_raw_acquisition_iir_a42_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a42_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd126));
assign linienmodule_csrbank5_raw_acquisition_iir_a41_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a41_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 7'd127));
assign linienmodule_csrbank5_raw_acquisition_iir_a40_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a40_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd128));
assign linienmodule_csrbank5_raw_acquisition_iir_a53_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_a53_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd129));
assign linienmodule_csrbank5_raw_acquisition_iir_a52_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a52_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd130));
assign linienmodule_csrbank5_raw_acquisition_iir_a51_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a51_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd131));
assign linienmodule_csrbank5_raw_acquisition_iir_a50_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a50_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd132));
assign linienmodule_csrbank5_raw_acquisition_iir_b03_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b03_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd133));
assign linienmodule_csrbank5_raw_acquisition_iir_b02_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b02_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd134));
assign linienmodule_csrbank5_raw_acquisition_iir_b01_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b01_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd135));
assign linienmodule_csrbank5_raw_acquisition_iir_b00_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b00_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd136));
assign linienmodule_csrbank5_raw_acquisition_iir_b13_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b13_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd137));
assign linienmodule_csrbank5_raw_acquisition_iir_b12_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b12_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd138));
assign linienmodule_csrbank5_raw_acquisition_iir_b11_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b11_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd139));
assign linienmodule_csrbank5_raw_acquisition_iir_b10_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b10_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd140));
assign linienmodule_csrbank5_raw_acquisition_iir_b23_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b23_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd141));
assign linienmodule_csrbank5_raw_acquisition_iir_b22_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b22_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd142));
assign linienmodule_csrbank5_raw_acquisition_iir_b21_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b21_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd143));
assign linienmodule_csrbank5_raw_acquisition_iir_b20_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b20_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd144));
assign linienmodule_csrbank5_raw_acquisition_iir_b33_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b33_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd145));
assign linienmodule_csrbank5_raw_acquisition_iir_b32_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b32_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd146));
assign linienmodule_csrbank5_raw_acquisition_iir_b31_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b31_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd147));
assign linienmodule_csrbank5_raw_acquisition_iir_b30_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b30_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd148));
assign linienmodule_csrbank5_raw_acquisition_iir_b43_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b43_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd149));
assign linienmodule_csrbank5_raw_acquisition_iir_b42_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b42_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd150));
assign linienmodule_csrbank5_raw_acquisition_iir_b41_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b41_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd151));
assign linienmodule_csrbank5_raw_acquisition_iir_b40_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b40_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd152));
assign linienmodule_csrbank5_raw_acquisition_iir_b53_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_raw_acquisition_iir_b53_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd153));
assign linienmodule_csrbank5_raw_acquisition_iir_b52_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b52_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd154));
assign linienmodule_csrbank5_raw_acquisition_iir_b51_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b51_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd155));
assign linienmodule_csrbank5_raw_acquisition_iir_b50_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b50_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd156));
assign linienmodule_control_signal_clr_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_control_signal_clr_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd157));
assign linienmodule_csrbank5_control_signal_max3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_control_signal_max3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd158));
assign linienmodule_csrbank5_control_signal_max2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_max2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd159));
assign linienmodule_csrbank5_control_signal_max1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd160));
assign linienmodule_csrbank5_control_signal_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd161));
assign linienmodule_csrbank5_control_signal_min3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_control_signal_min3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd162));
assign linienmodule_csrbank5_control_signal_min2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_min2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd163));
assign linienmodule_csrbank5_control_signal_min1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd164));
assign linienmodule_csrbank5_control_signal_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_control_signal_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd165));
assign linienmodule_combined_error_signal_clr_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_combined_error_signal_clr_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd166));
assign linienmodule_csrbank5_combined_error_signal_max3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_combined_error_signal_max3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd167));
assign linienmodule_csrbank5_combined_error_signal_max2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_max2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd168));
assign linienmodule_csrbank5_combined_error_signal_max1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd169));
assign linienmodule_csrbank5_combined_error_signal_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd170));
assign linienmodule_csrbank5_combined_error_signal_min3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_combined_error_signal_min3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd171));
assign linienmodule_csrbank5_combined_error_signal_min2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_min2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd172));
assign linienmodule_csrbank5_combined_error_signal_min1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd173));
assign linienmodule_csrbank5_combined_error_signal_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd174));
assign linienmodule_combined_error_signal_filtered_clr_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_combined_error_signal_filtered_clr_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd175));
assign linienmodule_csrbank5_combined_error_signal_filtered_max3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_combined_error_signal_filtered_max3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd176));
assign linienmodule_csrbank5_combined_error_signal_filtered_max2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_max2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd177));
assign linienmodule_csrbank5_combined_error_signal_filtered_max1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_max1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd178));
assign linienmodule_csrbank5_combined_error_signal_filtered_max0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_max0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd179));
assign linienmodule_csrbank5_combined_error_signal_filtered_min3_r = linienmodule_interface5_bank_bus_dat_w[0];
assign linienmodule_csrbank5_combined_error_signal_filtered_min3_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd180));
assign linienmodule_csrbank5_combined_error_signal_filtered_min2_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_min2_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd181));
assign linienmodule_csrbank5_combined_error_signal_filtered_min1_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_min1_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd182));
assign linienmodule_csrbank5_combined_error_signal_filtered_min0_r = linienmodule_interface5_bank_bus_dat_w[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_min0_re = ((linienmodule_csrbank5_sel & linienmodule_interface5_bank_bus_we) & (linienmodule_interface5_bank_bus_adr[7:0] == 8'd183));
assign linienmodule_dual_channel_storage = linienmodule_dual_channel_storage_full;
assign linienmodule_csrbank5_dual_channel0_w = linienmodule_dual_channel_storage_full;
assign linienmodule_mod_channel_storage = linienmodule_mod_channel_storage_full;
assign linienmodule_csrbank5_mod_channel0_w = linienmodule_mod_channel_storage_full;
assign linienmodule_control_channel_storage = linienmodule_control_channel_storage_full;
assign linienmodule_csrbank5_control_channel0_w = linienmodule_control_channel_storage_full;
assign linienmodule_sweep_channel_storage = linienmodule_sweep_channel_storage_full[1:0];
assign linienmodule_csrbank5_sweep_channel0_w = linienmodule_sweep_channel_storage_full[1:0];
assign linienmodule_slow_control_channel_storage = linienmodule_slow_control_channel_storage_full[1:0];
assign linienmodule_csrbank5_slow_control_channel0_w = linienmodule_slow_control_channel_storage_full[1:0];
assign linienmodule_pid_only_mode_storage = linienmodule_pid_only_mode_storage_full;
assign linienmodule_csrbank5_pid_only_mode0_w = linienmodule_pid_only_mode_storage_full;
assign linienmodule_chain_a_factor_storage = linienmodule_chain_a_factor_storage_full[8:0];
assign linienmodule_csrbank5_chain_a_factor1_w = linienmodule_chain_a_factor_storage_full[8];
assign linienmodule_csrbank5_chain_a_factor0_w = linienmodule_chain_a_factor_storage_full[7:0];
assign linienmodule_chain_b_factor_storage = linienmodule_chain_b_factor_storage_full[8:0];
assign linienmodule_csrbank5_chain_b_factor1_w = linienmodule_chain_b_factor_storage_full[8];
assign linienmodule_csrbank5_chain_b_factor0_w = linienmodule_chain_b_factor_storage_full[7:0];
assign linienmodule_chain_a_offset_storage = linienmodule_chain_a_offset_storage_full[13:0];
assign linienmodule_csrbank5_chain_a_offset1_w = linienmodule_chain_a_offset_storage_full[13:8];
assign linienmodule_csrbank5_chain_a_offset0_w = linienmodule_chain_a_offset_storage_full[7:0];
assign linienmodule_chain_b_offset_storage = linienmodule_chain_b_offset_storage_full[13:0];
assign linienmodule_csrbank5_chain_b_offset1_w = linienmodule_chain_b_offset_storage_full[13:8];
assign linienmodule_csrbank5_chain_b_offset0_w = linienmodule_chain_b_offset_storage_full[7:0];
assign linienmodule_combined_offset_storage = linienmodule_combined_offset_storage_full[13:0];
assign linienmodule_csrbank5_combined_offset1_w = linienmodule_combined_offset_storage_full[13:8];
assign linienmodule_csrbank5_combined_offset0_w = linienmodule_combined_offset_storage_full[7:0];
assign linienmodule_out_offset_storage = linienmodule_out_offset_storage_full[13:0];
assign linienmodule_csrbank5_out_offset1_w = linienmodule_out_offset_storage_full[13:8];
assign linienmodule_csrbank5_out_offset0_w = linienmodule_out_offset_storage_full[7:0];
assign linienmodule_slow_decimation_storage = linienmodule_slow_decimation_storage_full[4:0];
assign linienmodule_csrbank5_slow_decimation0_w = linienmodule_slow_decimation_storage_full[4:0];
assign linienmodule_csrstorage0_storage0 = linienmodule_csrstorage0_storage_full0[14:0];
assign linienmodule_csrbank5_analog_out_11_w = linienmodule_csrstorage0_storage_full0[14:8];
assign linienmodule_csrbank5_analog_out_10_w = linienmodule_csrstorage0_storage_full0[7:0];
assign linienmodule_csrstorage1_storage0 = linienmodule_csrstorage1_storage_full0[14:0];
assign linienmodule_csrbank5_analog_out_21_w = linienmodule_csrstorage1_storage_full0[14:8];
assign linienmodule_csrbank5_analog_out_20_w = linienmodule_csrstorage1_storage_full0[7:0];
assign linienmodule_csrstorage2_storage0 = linienmodule_csrstorage2_storage_full0[14:0];
assign linienmodule_csrbank5_analog_out_31_w = linienmodule_csrstorage2_storage_full0[14:8];
assign linienmodule_csrbank5_analog_out_30_w = linienmodule_csrstorage2_storage_full0[7:0];
assign linienmodule_csrbank5_slow_value1_w = linienmodule_slow_value_status[13:8];
assign linienmodule_csrbank5_slow_value0_w = linienmodule_slow_value_status[7:0];
assign linienmodule_mod_amp_storage = linienmodule_mod_amp_storage_full[13:0];
assign linienmodule_csrbank5_mod_amp1_w = linienmodule_mod_amp_storage_full[13:8];
assign linienmodule_csrbank5_mod_amp0_w = linienmodule_mod_amp_storage_full[7:0];
assign linienmodule_mod_freq_storage = linienmodule_mod_freq_storage_full[31:0];
assign linienmodule_csrbank5_mod_freq3_w = linienmodule_mod_freq_storage_full[31:24];
assign linienmodule_csrbank5_mod_freq2_w = linienmodule_mod_freq_storage_full[23:16];
assign linienmodule_csrbank5_mod_freq1_w = linienmodule_mod_freq_storage_full[15:8];
assign linienmodule_csrbank5_mod_freq0_w = linienmodule_mod_freq_storage_full[7:0];
assign linienmodule_sweep_step_storage = linienmodule_sweep_step_storage_full[29:0];
assign linienmodule_csrbank5_sweep_step3_w = linienmodule_sweep_step_storage_full[29:24];
assign linienmodule_csrbank5_sweep_step2_w = linienmodule_sweep_step_storage_full[23:16];
assign linienmodule_csrbank5_sweep_step1_w = linienmodule_sweep_step_storage_full[15:8];
assign linienmodule_csrbank5_sweep_step0_w = linienmodule_sweep_step_storage_full[7:0];
assign linienmodule_sweep_min_storage = linienmodule_sweep_min_storage_full[13:0];
assign linienmodule_csrbank5_sweep_min1_w = linienmodule_sweep_min_storage_full[13:8];
assign linienmodule_csrbank5_sweep_min0_w = linienmodule_sweep_min_storage_full[7:0];
assign linienmodule_sweep_max_storage = linienmodule_sweep_max_storage_full[13:0];
assign linienmodule_csrbank5_sweep_max1_w = linienmodule_sweep_max_storage_full[13:8];
assign linienmodule_csrbank5_sweep_max0_w = linienmodule_sweep_max_storage_full[7:0];
assign linienmodule_sweep_run_storage = linienmodule_sweep_run_storage_full;
assign linienmodule_csrbank5_sweep_run0_w = linienmodule_sweep_run_storage_full;
assign linienmodule_sweep_pause_storage = linienmodule_sweep_pause_storage_full;
assign linienmodule_csrbank5_sweep_pause0_w = linienmodule_sweep_pause_storage_full;
assign linienmodule_limit_error_signal_min_storage = linienmodule_limit_error_signal_min_storage_full[24:0];
assign linienmodule_csrbank5_limit_error_signal_min3_w = linienmodule_limit_error_signal_min_storage_full[24];
assign linienmodule_csrbank5_limit_error_signal_min2_w = linienmodule_limit_error_signal_min_storage_full[23:16];
assign linienmodule_csrbank5_limit_error_signal_min1_w = linienmodule_limit_error_signal_min_storage_full[15:8];
assign linienmodule_csrbank5_limit_error_signal_min0_w = linienmodule_limit_error_signal_min_storage_full[7:0];
assign linienmodule_limit_error_signal_max_storage = linienmodule_limit_error_signal_max_storage_full[24:0];
assign linienmodule_csrbank5_limit_error_signal_max3_w = linienmodule_limit_error_signal_max_storage_full[24];
assign linienmodule_csrbank5_limit_error_signal_max2_w = linienmodule_limit_error_signal_max_storage_full[23:16];
assign linienmodule_csrbank5_limit_error_signal_max1_w = linienmodule_limit_error_signal_max_storage_full[15:8];
assign linienmodule_csrbank5_limit_error_signal_max0_w = linienmodule_limit_error_signal_max_storage_full[7:0];
assign linienmodule_limit_fast1_min_storage = linienmodule_limit_fast1_min_storage_full[13:0];
assign linienmodule_csrbank5_limit_fast1_min1_w = linienmodule_limit_fast1_min_storage_full[13:8];
assign linienmodule_csrbank5_limit_fast1_min0_w = linienmodule_limit_fast1_min_storage_full[7:0];
assign linienmodule_limit_fast1_max_storage = linienmodule_limit_fast1_max_storage_full[13:0];
assign linienmodule_csrbank5_limit_fast1_max1_w = linienmodule_limit_fast1_max_storage_full[13:8];
assign linienmodule_csrbank5_limit_fast1_max0_w = linienmodule_limit_fast1_max_storage_full[7:0];
assign linienmodule_limit_fast2_min_storage = linienmodule_limit_fast2_min_storage_full[13:0];
assign linienmodule_csrbank5_limit_fast2_min1_w = linienmodule_limit_fast2_min_storage_full[13:8];
assign linienmodule_csrbank5_limit_fast2_min0_w = linienmodule_limit_fast2_min_storage_full[7:0];
assign linienmodule_limit_fast2_max_storage = linienmodule_limit_fast2_max_storage_full[13:0];
assign linienmodule_csrbank5_limit_fast2_max1_w = linienmodule_limit_fast2_max_storage_full[13:8];
assign linienmodule_csrbank5_limit_fast2_max0_w = linienmodule_limit_fast2_max_storage_full[7:0];
assign linienmodule_pid_setpoint_storage = linienmodule_pid_setpoint_storage_full[24:0];
assign linienmodule_csrbank5_pid_setpoint3_w = linienmodule_pid_setpoint_storage_full[24];
assign linienmodule_csrbank5_pid_setpoint2_w = linienmodule_pid_setpoint_storage_full[23:16];
assign linienmodule_csrbank5_pid_setpoint1_w = linienmodule_pid_setpoint_storage_full[15:8];
assign linienmodule_csrbank5_pid_setpoint0_w = linienmodule_pid_setpoint_storage_full[7:0];
assign linienmodule_pid_kp_storage = linienmodule_pid_kp_storage_full[13:0];
assign linienmodule_csrbank5_pid_kp1_w = linienmodule_pid_kp_storage_full[13:8];
assign linienmodule_csrbank5_pid_kp0_w = linienmodule_pid_kp_storage_full[7:0];
assign linienmodule_pid_ki_storage = linienmodule_pid_ki_storage_full[13:0];
assign linienmodule_csrbank5_pid_ki1_w = linienmodule_pid_ki_storage_full[13:8];
assign linienmodule_csrbank5_pid_ki0_w = linienmodule_pid_ki_storage_full[7:0];
assign linienmodule_pid_reset_storage = linienmodule_pid_reset_storage_full;
assign linienmodule_csrbank5_pid_reset0_w = linienmodule_pid_reset_storage_full;
assign linienmodule_pid_kd_storage = linienmodule_pid_kd_storage_full[13:0];
assign linienmodule_csrbank5_pid_kd1_w = linienmodule_pid_kd_storage_full[13:8];
assign linienmodule_csrbank5_pid_kd0_w = linienmodule_pid_kd_storage_full[7:0];
assign linienmodule_autolock_fast_storage = linienmodule_autolock_fast_storage_full[13:0];
assign linienmodule_csrbank5_autolock_fast_target_position1_w = linienmodule_autolock_fast_storage_full[13:8];
assign linienmodule_csrbank5_autolock_fast_target_position0_w = linienmodule_autolock_fast_storage_full[7:0];
assign linienmodule_autolock_request_lock_storage = linienmodule_autolock_request_lock_storage_full;
assign linienmodule_csrbank5_autolock_request_lock0_w = linienmodule_autolock_request_lock_storage_full;
assign linienmodule_autolock_autolock_mode_storage = linienmodule_autolock_autolock_mode_storage_full[1:0];
assign linienmodule_csrbank5_autolock_autolock_mode0_w = linienmodule_autolock_autolock_mode_storage_full[1:0];
assign linienmodule_csrbank5_autolock_lock_running_w = linienmodule_autolock_status;
assign linienmodule_sequenceexecutor_reset_seq_storage = linienmodule_sequenceexecutor_reset_seq_storage_full;
assign linienmodule_csrbank5_sequence_reset_seq0_w = linienmodule_sequenceexecutor_reset_seq_storage_full;
assign linienmodule_sequenceexecutor_arm_storage = linienmodule_sequenceexecutor_arm_storage_full[3:0];
assign linienmodule_csrbank5_sequence_arm0_w = linienmodule_sequenceexecutor_arm_storage_full[3:0];
assign linienmodule_csrbank5_sequence_status_1_w = linienmodule_sequenceexecutor_status_1_status[1:0];
assign linienmodule_csrbank5_sequence_status_2_w = linienmodule_sequenceexecutor_status_2_status[1:0];
assign linienmodule_csrbank5_sequence_status_3_w = linienmodule_sequenceexecutor_status_3_status[1:0];
assign linienmodule_csrbank5_sequence_status_4_w = linienmodule_sequenceexecutor_status_4_status[1:0];
assign linienmodule_csrbank5_sequence_saved_pid_out1_w = linienmodule_sequenceexecutor_saved_pid_out_status[13:8];
assign linienmodule_csrbank5_sequence_saved_pid_out0_w = linienmodule_sequenceexecutor_saved_pid_out_status[7:0];
assign linienmodule_csrbank5_sequence_saved_integrator3_w = linienmodule_sequenceexecutor_saved_integrator_status[24];
assign linienmodule_csrbank5_sequence_saved_integrator2_w = linienmodule_sequenceexecutor_saved_integrator_status[23:16];
assign linienmodule_csrbank5_sequence_saved_integrator1_w = linienmodule_sequenceexecutor_saved_integrator_status[15:8];
assign linienmodule_csrbank5_sequence_saved_integrator0_w = linienmodule_sequenceexecutor_saved_integrator_status[7:0];
assign linienmodule_csrbank5_sequence_saved_sweep_pos1_w = linienmodule_sequenceexecutor_saved_sweep_pos_status[13:8];
assign linienmodule_csrbank5_sequence_saved_sweep_pos0_w = linienmodule_sequenceexecutor_saved_sweep_pos_status[7:0];
assign linienmodule_csrbank5_sequence_saved_dac_out1_w = linienmodule_sequenceexecutor_saved_dac_out_status[13:8];
assign linienmodule_csrbank5_sequence_saved_dac_out0_w = linienmodule_sequenceexecutor_saved_dac_out_status[7:0];
assign linienmodule_sequenceexecutor_fsm_reg_addr_storage = linienmodule_sequenceexecutor_fsm_reg_addr_storage_full[8:0];
assign linienmodule_csrbank5_sequence_fsm_reg_addr1_w = linienmodule_sequenceexecutor_fsm_reg_addr_storage_full[8];
assign linienmodule_csrbank5_sequence_fsm_reg_addr0_w = linienmodule_sequenceexecutor_fsm_reg_addr_storage_full[7:0];
assign linienmodule_sequenceexecutor_fsm_reg_data_storage = linienmodule_sequenceexecutor_fsm_reg_data_storage_full[31:0];
assign linienmodule_csrbank5_sequence_fsm_reg_data3_w = linienmodule_sequenceexecutor_fsm_reg_data_storage_full[31:24];
assign linienmodule_csrbank5_sequence_fsm_reg_data2_w = linienmodule_sequenceexecutor_fsm_reg_data_storage_full[23:16];
assign linienmodule_csrbank5_sequence_fsm_reg_data1_w = linienmodule_sequenceexecutor_fsm_reg_data_storage_full[15:8];
assign linienmodule_csrbank5_sequence_fsm_reg_data0_w = linienmodule_sequenceexecutor_fsm_reg_data_storage_full[7:0];
assign linienmodule_sequenceexecutor_fsm_reg_wen_storage = linienmodule_sequenceexecutor_fsm_reg_wen_storage_full;
assign linienmodule_csrbank5_sequence_fsm_reg_wen0_w = linienmodule_sequenceexecutor_fsm_reg_wen_storage_full;
assign linienmodule_sequenceexecutor_awg_reg_addr_storage = linienmodule_sequenceexecutor_awg_reg_addr_storage_full[9:0];
assign linienmodule_csrbank5_sequence_awg_reg_addr1_w = linienmodule_sequenceexecutor_awg_reg_addr_storage_full[9:8];
assign linienmodule_csrbank5_sequence_awg_reg_addr0_w = linienmodule_sequenceexecutor_awg_reg_addr_storage_full[7:0];
assign linienmodule_sequenceexecutor_awg_reg_data_storage = linienmodule_sequenceexecutor_awg_reg_data_storage_full[13:0];
assign linienmodule_csrbank5_sequence_awg_reg_data1_w = linienmodule_sequenceexecutor_awg_reg_data_storage_full[13:8];
assign linienmodule_csrbank5_sequence_awg_reg_data0_w = linienmodule_sequenceexecutor_awg_reg_data_storage_full[7:0];
assign linienmodule_sequenceexecutor_awg_reg_wen_storage = linienmodule_sequenceexecutor_awg_reg_wen_storage_full;
assign linienmodule_csrbank5_sequence_awg_reg_wen0_w = linienmodule_sequenceexecutor_awg_reg_wen_storage_full;
assign linienmodule_sequenceexecutor_num_blocks_1_storage = linienmodule_sequenceexecutor_num_blocks_1_storage_full[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_10_w = linienmodule_sequenceexecutor_num_blocks_1_storage_full[3:0];
assign linienmodule_sequenceexecutor_num_blocks_2_storage = linienmodule_sequenceexecutor_num_blocks_2_storage_full[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_20_w = linienmodule_sequenceexecutor_num_blocks_2_storage_full[3:0];
assign linienmodule_sequenceexecutor_num_blocks_3_storage = linienmodule_sequenceexecutor_num_blocks_3_storage_full[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_30_w = linienmodule_sequenceexecutor_num_blocks_3_storage_full[3:0];
assign linienmodule_sequenceexecutor_num_blocks_4_storage = linienmodule_sequenceexecutor_num_blocks_4_storage_full[3:0];
assign linienmodule_csrbank5_sequence_num_blocks_40_w = linienmodule_sequenceexecutor_num_blocks_4_storage_full[3:0];
assign linienmodule_sequenceexecutor_init_v_storage = linienmodule_sequenceexecutor_init_v_storage_full[13:0];
assign linienmodule_csrbank5_sequence_init_v1_w = linienmodule_sequenceexecutor_init_v_storage_full[13:8];
assign linienmodule_csrbank5_sequence_init_v0_w = linienmodule_sequenceexecutor_init_v_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_storage = linienmodule_raw_acquisition_iir_storage_full[26:0];
assign linienmodule_csrbank5_raw_acquisition_iir_z03_w = linienmodule_raw_acquisition_iir_storage_full[26:24];
assign linienmodule_csrbank5_raw_acquisition_iir_z02_w = linienmodule_raw_acquisition_iir_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_z01_w = linienmodule_raw_acquisition_iir_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_z00_w = linienmodule_raw_acquisition_iir_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage0_storage = linienmodule_raw_acquisition_iir_csrstorage0_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a13_w = linienmodule_raw_acquisition_iir_csrstorage0_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_a12_w = linienmodule_raw_acquisition_iir_csrstorage0_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_a11_w = linienmodule_raw_acquisition_iir_csrstorage0_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_a10_w = linienmodule_raw_acquisition_iir_csrstorage0_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage1_storage = linienmodule_raw_acquisition_iir_csrstorage1_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a23_w = linienmodule_raw_acquisition_iir_csrstorage1_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_a22_w = linienmodule_raw_acquisition_iir_csrstorage1_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_a21_w = linienmodule_raw_acquisition_iir_csrstorage1_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_a20_w = linienmodule_raw_acquisition_iir_csrstorage1_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage2_storage = linienmodule_raw_acquisition_iir_csrstorage2_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a33_w = linienmodule_raw_acquisition_iir_csrstorage2_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_a32_w = linienmodule_raw_acquisition_iir_csrstorage2_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_a31_w = linienmodule_raw_acquisition_iir_csrstorage2_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_a30_w = linienmodule_raw_acquisition_iir_csrstorage2_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage3_storage = linienmodule_raw_acquisition_iir_csrstorage3_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a43_w = linienmodule_raw_acquisition_iir_csrstorage3_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_a42_w = linienmodule_raw_acquisition_iir_csrstorage3_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_a41_w = linienmodule_raw_acquisition_iir_csrstorage3_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_a40_w = linienmodule_raw_acquisition_iir_csrstorage3_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage4_storage = linienmodule_raw_acquisition_iir_csrstorage4_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_a53_w = linienmodule_raw_acquisition_iir_csrstorage4_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_a52_w = linienmodule_raw_acquisition_iir_csrstorage4_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_a51_w = linienmodule_raw_acquisition_iir_csrstorage4_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_a50_w = linienmodule_raw_acquisition_iir_csrstorage4_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage5_storage = linienmodule_raw_acquisition_iir_csrstorage5_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b03_w = linienmodule_raw_acquisition_iir_csrstorage5_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b02_w = linienmodule_raw_acquisition_iir_csrstorage5_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b01_w = linienmodule_raw_acquisition_iir_csrstorage5_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b00_w = linienmodule_raw_acquisition_iir_csrstorage5_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage6_storage = linienmodule_raw_acquisition_iir_csrstorage6_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b13_w = linienmodule_raw_acquisition_iir_csrstorage6_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b12_w = linienmodule_raw_acquisition_iir_csrstorage6_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b11_w = linienmodule_raw_acquisition_iir_csrstorage6_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b10_w = linienmodule_raw_acquisition_iir_csrstorage6_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage7_storage = linienmodule_raw_acquisition_iir_csrstorage7_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b23_w = linienmodule_raw_acquisition_iir_csrstorage7_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b22_w = linienmodule_raw_acquisition_iir_csrstorage7_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b21_w = linienmodule_raw_acquisition_iir_csrstorage7_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b20_w = linienmodule_raw_acquisition_iir_csrstorage7_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage8_storage = linienmodule_raw_acquisition_iir_csrstorage8_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b33_w = linienmodule_raw_acquisition_iir_csrstorage8_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b32_w = linienmodule_raw_acquisition_iir_csrstorage8_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b31_w = linienmodule_raw_acquisition_iir_csrstorage8_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b30_w = linienmodule_raw_acquisition_iir_csrstorage8_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage9_storage = linienmodule_raw_acquisition_iir_csrstorage9_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b43_w = linienmodule_raw_acquisition_iir_csrstorage9_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b42_w = linienmodule_raw_acquisition_iir_csrstorage9_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b41_w = linienmodule_raw_acquisition_iir_csrstorage9_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b40_w = linienmodule_raw_acquisition_iir_csrstorage9_storage_full[7:0];
assign linienmodule_raw_acquisition_iir_csrstorage10_storage = linienmodule_raw_acquisition_iir_csrstorage10_storage_full[24:0];
assign linienmodule_csrbank5_raw_acquisition_iir_b53_w = linienmodule_raw_acquisition_iir_csrstorage10_storage_full[24];
assign linienmodule_csrbank5_raw_acquisition_iir_b52_w = linienmodule_raw_acquisition_iir_csrstorage10_storage_full[23:16];
assign linienmodule_csrbank5_raw_acquisition_iir_b51_w = linienmodule_raw_acquisition_iir_csrstorage10_storage_full[15:8];
assign linienmodule_csrbank5_raw_acquisition_iir_b50_w = linienmodule_raw_acquisition_iir_csrstorage10_storage_full[7:0];
assign linienmodule_csrbank5_control_signal_max3_w = linienmodule_max_status9[24];
assign linienmodule_csrbank5_control_signal_max2_w = linienmodule_max_status9[23:16];
assign linienmodule_csrbank5_control_signal_max1_w = linienmodule_max_status9[15:8];
assign linienmodule_csrbank5_control_signal_max0_w = linienmodule_max_status9[7:0];
assign linienmodule_csrbank5_control_signal_min3_w = linienmodule_min_status9[24];
assign linienmodule_csrbank5_control_signal_min2_w = linienmodule_min_status9[23:16];
assign linienmodule_csrbank5_control_signal_min1_w = linienmodule_min_status9[15:8];
assign linienmodule_csrbank5_control_signal_min0_w = linienmodule_min_status9[7:0];
assign linienmodule_csrbank5_combined_error_signal_max3_w = linienmodule_max_status10[24];
assign linienmodule_csrbank5_combined_error_signal_max2_w = linienmodule_max_status10[23:16];
assign linienmodule_csrbank5_combined_error_signal_max1_w = linienmodule_max_status10[15:8];
assign linienmodule_csrbank5_combined_error_signal_max0_w = linienmodule_max_status10[7:0];
assign linienmodule_csrbank5_combined_error_signal_min3_w = linienmodule_min_status10[24];
assign linienmodule_csrbank5_combined_error_signal_min2_w = linienmodule_min_status10[23:16];
assign linienmodule_csrbank5_combined_error_signal_min1_w = linienmodule_min_status10[15:8];
assign linienmodule_csrbank5_combined_error_signal_min0_w = linienmodule_min_status10[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_max3_w = linienmodule_max_status11[24];
assign linienmodule_csrbank5_combined_error_signal_filtered_max2_w = linienmodule_max_status11[23:16];
assign linienmodule_csrbank5_combined_error_signal_filtered_max1_w = linienmodule_max_status11[15:8];
assign linienmodule_csrbank5_combined_error_signal_filtered_max0_w = linienmodule_max_status11[7:0];
assign linienmodule_csrbank5_combined_error_signal_filtered_min3_w = linienmodule_min_status11[24];
assign linienmodule_csrbank5_combined_error_signal_filtered_min2_w = linienmodule_min_status11[23:16];
assign linienmodule_csrbank5_combined_error_signal_filtered_min1_w = linienmodule_min_status11[15:8];
assign linienmodule_csrbank5_combined_error_signal_filtered_min0_w = linienmodule_min_status11[7:0];
assign linienmodule_csrbank6_sel = (linienmodule_interface6_bank_bus_adr[13:9] == 3'd6);
assign linienmodule_csrbank6_external_trigger0_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_csrbank6_external_trigger0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 1'd0));
assign linienmodule_dac_a_clr_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_dac_a_clr_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 1'd1));
assign linienmodule_csrbank6_dac_a_max3_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_csrbank6_dac_a_max3_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 2'd2));
assign linienmodule_csrbank6_dac_a_max2_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_max2_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 2'd3));
assign linienmodule_csrbank6_dac_a_max1_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_max1_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 3'd4));
assign linienmodule_csrbank6_dac_a_max0_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_max0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 3'd5));
assign linienmodule_csrbank6_dac_a_min3_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_csrbank6_dac_a_min3_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 3'd6));
assign linienmodule_csrbank6_dac_a_min2_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_min2_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 3'd7));
assign linienmodule_csrbank6_dac_a_min1_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_min1_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd8));
assign linienmodule_csrbank6_dac_a_min0_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_a_min0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd9));
assign linienmodule_dac_b_clr_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_dac_b_clr_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd10));
assign linienmodule_csrbank6_dac_b_max3_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_csrbank6_dac_b_max3_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd11));
assign linienmodule_csrbank6_dac_b_max2_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_max2_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd12));
assign linienmodule_csrbank6_dac_b_max1_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_max1_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd13));
assign linienmodule_csrbank6_dac_b_max0_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_max0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd14));
assign linienmodule_csrbank6_dac_b_min3_r = linienmodule_interface6_bank_bus_dat_w[0];
assign linienmodule_csrbank6_dac_b_min3_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 4'd15));
assign linienmodule_csrbank6_dac_b_min2_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_min2_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd16));
assign linienmodule_csrbank6_dac_b_min1_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_min1_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd17));
assign linienmodule_csrbank6_dac_b_min0_r = linienmodule_interface6_bank_bus_dat_w[7:0];
assign linienmodule_csrbank6_dac_b_min0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd18));
assign linienmodule_csrbank6_adc_a_sel0_r = linienmodule_interface6_bank_bus_dat_w[3:0];
assign linienmodule_csrbank6_adc_a_sel0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd19));
assign linienmodule_csrbank6_adc_b_sel0_r = linienmodule_interface6_bank_bus_dat_w[3:0];
assign linienmodule_csrbank6_adc_b_sel0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd20));
assign linienmodule_csrbank6_adc_a_q_sel0_r = linienmodule_interface6_bank_bus_dat_w[3:0];
assign linienmodule_csrbank6_adc_a_q_sel0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd21));
assign linienmodule_csrbank6_adc_b_q_sel0_r = linienmodule_interface6_bank_bus_dat_w[3:0];
assign linienmodule_csrbank6_adc_b_q_sel0_re = ((linienmodule_csrbank6_sel & linienmodule_interface6_bank_bus_we) & (linienmodule_interface6_bank_bus_adr[4:0] == 5'd22));
assign linienmodule_scopegen_storage = linienmodule_scopegen_storage_full;
assign linienmodule_csrbank6_external_trigger0_w = linienmodule_scopegen_storage_full;
assign linienmodule_csrbank6_dac_a_max3_w = linienmodule_max_status7[24];
assign linienmodule_csrbank6_dac_a_max2_w = linienmodule_max_status7[23:16];
assign linienmodule_csrbank6_dac_a_max1_w = linienmodule_max_status7[15:8];
assign linienmodule_csrbank6_dac_a_max0_w = linienmodule_max_status7[7:0];
assign linienmodule_csrbank6_dac_a_min3_w = linienmodule_min_status7[24];
assign linienmodule_csrbank6_dac_a_min2_w = linienmodule_min_status7[23:16];
assign linienmodule_csrbank6_dac_a_min1_w = linienmodule_min_status7[15:8];
assign linienmodule_csrbank6_dac_a_min0_w = linienmodule_min_status7[7:0];
assign linienmodule_csrbank6_dac_b_max3_w = linienmodule_max_status8[24];
assign linienmodule_csrbank6_dac_b_max2_w = linienmodule_max_status8[23:16];
assign linienmodule_csrbank6_dac_b_max1_w = linienmodule_max_status8[15:8];
assign linienmodule_csrbank6_dac_b_max0_w = linienmodule_max_status8[7:0];
assign linienmodule_csrbank6_dac_b_min3_w = linienmodule_min_status8[24];
assign linienmodule_csrbank6_dac_b_min2_w = linienmodule_min_status8[23:16];
assign linienmodule_csrbank6_dac_b_min1_w = linienmodule_min_status8[15:8];
assign linienmodule_csrbank6_dac_b_min0_w = linienmodule_min_status8[7:0];
assign linienmodule_csrstorage12_storage = linienmodule_csrstorage12_storage_full[3:0];
assign linienmodule_csrbank6_adc_a_sel0_w = linienmodule_csrstorage12_storage_full[3:0];
assign linienmodule_csrstorage13_storage = linienmodule_csrstorage13_storage_full[3:0];
assign linienmodule_csrbank6_adc_b_sel0_w = linienmodule_csrstorage13_storage_full[3:0];
assign linienmodule_csrstorage14_storage = linienmodule_csrstorage14_storage_full[3:0];
assign linienmodule_csrbank6_adc_a_q_sel0_w = linienmodule_csrstorage14_storage_full[3:0];
assign linienmodule_csrstorage15_storage = linienmodule_csrstorage15_storage_full[3:0];
assign linienmodule_csrbank6_adc_b_q_sel0_w = linienmodule_csrstorage15_storage_full[3:0];
assign linienmodule_csrbank7_sel = (linienmodule_interface7_bank_bus_adr[13:9] == 2'd2);
assign linienmodule_csrbank7_pid_setpoint1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_pid_setpoint1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 1'd0));
assign linienmodule_csrbank7_pid_setpoint0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_pid_setpoint0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 1'd1));
assign linienmodule_csrbank7_pid_kp1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_pid_kp1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 2'd2));
assign linienmodule_csrbank7_pid_kp0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_pid_kp0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 2'd3));
assign linienmodule_csrbank7_pid_ki1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_pid_ki1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 3'd4));
assign linienmodule_csrbank7_pid_ki0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_pid_ki0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 3'd5));
assign linienmodule_csrbank7_pid_reset0_r = linienmodule_interface7_bank_bus_dat_w[0];
assign linienmodule_csrbank7_pid_reset0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 3'd6));
assign linienmodule_csrbank7_pid_kd1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_pid_kd1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 3'd7));
assign linienmodule_csrbank7_pid_kd0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_pid_kd0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd8));
assign linienmodule_csrbank7_limit_min1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_limit_min1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd9));
assign linienmodule_csrbank7_limit_min0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_limit_min0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd10));
assign linienmodule_csrbank7_limit_max1_r = linienmodule_interface7_bank_bus_dat_w[5:0];
assign linienmodule_csrbank7_limit_max1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd11));
assign linienmodule_csrbank7_limit_max0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_limit_max0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd12));
assign linienmodule_out_clr_r = linienmodule_interface7_bank_bus_dat_w[0];
assign linienmodule_out_clr_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd13));
assign linienmodule_csrbank7_out_max3_r = linienmodule_interface7_bank_bus_dat_w[0];
assign linienmodule_csrbank7_out_max3_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd14));
assign linienmodule_csrbank7_out_max2_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_max2_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 4'd15));
assign linienmodule_csrbank7_out_max1_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_max1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd16));
assign linienmodule_csrbank7_out_max0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_max0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd17));
assign linienmodule_csrbank7_out_min3_r = linienmodule_interface7_bank_bus_dat_w[0];
assign linienmodule_csrbank7_out_min3_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd18));
assign linienmodule_csrbank7_out_min2_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_min2_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd19));
assign linienmodule_csrbank7_out_min1_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_min1_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd20));
assign linienmodule_csrbank7_out_min0_r = linienmodule_interface7_bank_bus_dat_w[7:0];
assign linienmodule_csrbank7_out_min0_re = ((linienmodule_csrbank7_sel & linienmodule_interface7_bank_bus_we) & (linienmodule_interface7_bank_bus_adr[4:0] == 5'd21));
assign linienmodule_slowchain_setpoint_storage = linienmodule_slowchain_setpoint_storage_full[13:0];
assign linienmodule_csrbank7_pid_setpoint1_w = linienmodule_slowchain_setpoint_storage_full[13:8];
assign linienmodule_csrbank7_pid_setpoint0_w = linienmodule_slowchain_setpoint_storage_full[7:0];
assign linienmodule_slowchain_kp_storage = linienmodule_slowchain_kp_storage_full[13:0];
assign linienmodule_csrbank7_pid_kp1_w = linienmodule_slowchain_kp_storage_full[13:8];
assign linienmodule_csrbank7_pid_kp0_w = linienmodule_slowchain_kp_storage_full[7:0];
assign linienmodule_slowchain_ki_storage = linienmodule_slowchain_ki_storage_full[13:0];
assign linienmodule_csrbank7_pid_ki1_w = linienmodule_slowchain_ki_storage_full[13:8];
assign linienmodule_csrbank7_pid_ki0_w = linienmodule_slowchain_ki_storage_full[7:0];
assign linienmodule_slowchain_reset_storage = linienmodule_slowchain_reset_storage_full;
assign linienmodule_csrbank7_pid_reset0_w = linienmodule_slowchain_reset_storage_full;
assign linienmodule_slowchain_kd_storage = linienmodule_slowchain_kd_storage_full[13:0];
assign linienmodule_csrbank7_pid_kd1_w = linienmodule_slowchain_kd_storage_full[13:8];
assign linienmodule_csrbank7_pid_kd0_w = linienmodule_slowchain_kd_storage_full[7:0];
assign linienmodule_slowchain_min_storage = linienmodule_slowchain_min_storage_full[13:0];
assign linienmodule_csrbank7_limit_min1_w = linienmodule_slowchain_min_storage_full[13:8];
assign linienmodule_csrbank7_limit_min0_w = linienmodule_slowchain_min_storage_full[7:0];
assign linienmodule_slowchain_max_storage = linienmodule_slowchain_max_storage_full[13:0];
assign linienmodule_csrbank7_limit_max1_w = linienmodule_slowchain_max_storage_full[13:8];
assign linienmodule_csrbank7_limit_max0_w = linienmodule_slowchain_max_storage_full[7:0];
assign linienmodule_csrbank7_out_max3_w = linienmodule_max_status6[24];
assign linienmodule_csrbank7_out_max2_w = linienmodule_max_status6[23:16];
assign linienmodule_csrbank7_out_max1_w = linienmodule_max_status6[15:8];
assign linienmodule_csrbank7_out_max0_w = linienmodule_max_status6[7:0];
assign linienmodule_csrbank7_out_min3_w = linienmodule_min_status6[24];
assign linienmodule_csrbank7_out_min2_w = linienmodule_min_status6[23:16];
assign linienmodule_csrbank7_out_min1_w = linienmodule_min_status6[15:8];
assign linienmodule_csrbank7_out_min0_w = linienmodule_min_status6[7:0];
assign linienmodule_csrbank8_sel = (linienmodule_interface8_bank_bus_adr[13:9] == 5'd29);
assign linienmodule_csrbank8_temp1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_temp1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 1'd0));
assign linienmodule_csrbank8_temp0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_temp0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 1'd1));
assign linienmodule_csrbank8_v1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_v1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 2'd2));
assign linienmodule_csrbank8_v0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_v0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 2'd3));
assign linienmodule_csrbank8_a1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_a1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 3'd4));
assign linienmodule_csrbank8_a0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_a0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 3'd5));
assign linienmodule_csrbank8_b1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_b1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 3'd6));
assign linienmodule_csrbank8_b0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_b0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 3'd7));
assign linienmodule_csrbank8_c1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_c1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 4'd8));
assign linienmodule_csrbank8_c0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_c0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 4'd9));
assign linienmodule_csrbank8_d1_r = linienmodule_interface8_bank_bus_dat_w[3:0];
assign linienmodule_csrbank8_d1_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 4'd10));
assign linienmodule_csrbank8_d0_r = linienmodule_interface8_bank_bus_dat_w[7:0];
assign linienmodule_csrbank8_d0_re = ((linienmodule_csrbank8_sel & linienmodule_interface8_bank_bus_we) & (linienmodule_interface8_bank_bus_adr[3:0] == 4'd11));
assign linienmodule_csrbank8_temp1_w = linienmodule_xadc_temp_status[11:8];
assign linienmodule_csrbank8_temp0_w = linienmodule_xadc_temp_status[7:0];
assign linienmodule_csrbank8_v1_w = linienmodule_xadc_v_status[11:8];
assign linienmodule_csrbank8_v0_w = linienmodule_xadc_v_status[7:0];
assign linienmodule_csrbank8_a1_w = linienmodule_xadc_a_status[11:8];
assign linienmodule_csrbank8_a0_w = linienmodule_xadc_a_status[7:0];
assign linienmodule_csrbank8_b1_w = linienmodule_xadc_b_status[11:8];
assign linienmodule_csrbank8_b0_w = linienmodule_xadc_b_status[7:0];
assign linienmodule_csrbank8_c1_w = linienmodule_xadc_c_status[11:8];
assign linienmodule_csrbank8_c0_w = linienmodule_xadc_c_status[7:0];
assign linienmodule_csrbank8_d1_w = linienmodule_xadc_d_status[11:8];
assign linienmodule_csrbank8_d0_w = linienmodule_xadc_d_status[7:0];
assign linienmodule_interface0_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface1_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface2_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface3_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface4_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface5_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface6_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface7_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface8_bank_bus_adr = linienmodule_csr_adr;
assign linienmodule_interface0_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface1_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface2_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface3_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface4_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface5_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface6_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface7_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface8_bank_bus_we = linienmodule_csr_we;
assign linienmodule_interface0_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface1_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface2_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface3_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface4_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface5_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface6_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface7_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_interface8_bank_bus_dat_w = linienmodule_csr_dat_w;
assign linienmodule_csr_dat_r = ((((((((linienmodule_interface0_bank_bus_dat_r | linienmodule_interface1_bank_bus_dat_r) | linienmodule_interface2_bank_bus_dat_r) | linienmodule_interface3_bank_bus_dat_r) | linienmodule_interface4_bank_bus_dat_r) | linienmodule_interface5_bank_bus_dat_r) | linienmodule_interface6_bank_bus_dat_r) | linienmodule_interface7_bank_bus_dat_r) | linienmodule_interface8_bank_bus_dat_r);
assign linienmodule_target_clk = sys_clk;
assign linienmodule_target_rstn = (~sys_rst);
assign dummyhk_sel = (dummyhk_bank_bus_adr[13:9] == 1'd0);
assign dummyhk_id_r = dummyhk_bank_bus_dat_w[0];
assign dummyhk_id_re = ((dummyhk_sel & dummyhk_bank_bus_we) & (dummyhk_bank_bus_adr[0] == 1'd0));
assign dummyhk_id_w = dummyhk_status;
assign dummyhk_bank_bus_adr = dummyhk_csr_adr;
assign dummyhk_bank_bus_we = dummyhk_csr_we;
assign dummyhk_bank_bus_dat_w = dummyhk_csr_dat_w;
assign dummyhk_csr_dat_r = dummyhk_bank_bus_dat_r;
assign ic_cs = ps_sys_addr[22:20];
assign ic_sel0 = (ic_cs == 1'd0);
assign dummyhk_sys_clk = ps_sys_clk;
assign dummyhk_sys_rstn = ps_sys_rstn;
assign dummyhk_sys_addr = ps_sys_addr;
assign dummyhk_sys_wdata = ps_sys_wdata;
assign dummyhk_sys_sel = ps_sys_sel;
assign dummyhk_sys_wen = (ic_sel0 & ps_sys_wen);
assign dummyhk_sys_ren = (ic_sel0 & ps_sys_ren);
assign ic_sel1 = (ic_cs == 1'd1);
assign linienmodule_scopegen_scope_sys_clk = ps_sys_clk;
assign linienmodule_scopegen_scope_sys_rstn = ps_sys_rstn;
assign linienmodule_scopegen_scope_sys_addr = ps_sys_addr;
assign linienmodule_scopegen_scope_sys_wdata = ps_sys_wdata;
assign linienmodule_scopegen_scope_sys_sel = ps_sys_sel;
assign linienmodule_scopegen_scope_sys_wen = (ic_sel1 & ps_sys_wen);
assign linienmodule_scopegen_scope_sys_ren = (ic_sel1 & ps_sys_ren);
assign ic_sel2 = (ic_cs == 2'd2);
assign linienmodule_scopegen_asg_sys_clk = ps_sys_clk;
assign linienmodule_scopegen_asg_sys_rstn = ps_sys_rstn;
assign linienmodule_scopegen_asg_sys_addr = ps_sys_addr;
assign linienmodule_scopegen_asg_sys_wdata = ps_sys_wdata;
assign linienmodule_scopegen_asg_sys_sel = ps_sys_sel;
assign linienmodule_scopegen_asg_sys_wen = (ic_sel2 & ps_sys_wen);
assign linienmodule_scopegen_asg_sys_ren = (ic_sel2 & ps_sys_ren);
assign ic_sel3 = (ic_cs == 2'd3);
assign linienmodule_source_clk = ps_sys_clk;
assign linienmodule_source_rstn = ps_sys_rstn;
assign linienmodule_source_addr = ps_sys_addr;
assign linienmodule_source_wdata = ps_sys_wdata;
assign linienmodule_source_sel = ps_sys_sel;
assign linienmodule_source_wen = (ic_sel3 & ps_sys_wen);
assign linienmodule_source_ren = (ic_sel3 & ps_sys_ren);
assign {ps_sys_rdata, ps_sys_ack, ps_sys_err} = (((({34{ic_sel0}} & {dummyhk_sys_rdata, dummyhk_sys_ack, dummyhk_sys_err}) | ({34{ic_sel1}} & {linienmodule_scopegen_scope_sys_rdata, linienmodule_scopegen_scope_sys_ack, linienmodule_scopegen_scope_sys_err})) | ({34{ic_sel2}} & {linienmodule_scopegen_asg_sys_rdata, linienmodule_scopegen_asg_sys_ack, linienmodule_scopegen_asg_sys_err})) | ({34{ic_sel3}} & {linienmodule_source_rdata, linienmodule_source_ack, linienmodule_source_err}));
assign slice_proxy0 = {xadc_n[4], {6{1'd0}}, xadc_n[3:2], {6{1'd0}}, xadc_n[1:0]};
assign slice_proxy1 = {xadc_p[4], {6{1'd0}}, xadc_p[3:2], {6{1'd0}}, xadc_p[1:0]};
assign slice_proxy2 = {xadc_n[4], {6{1'd0}}, xadc_n[3:2], {6{1'd0}}, xadc_n[1:0]};
assign slice_proxy3 = {xadc_p[4], {6{1'd0}}, xadc_p[3:2], {6{1'd0}}, xadc_p[1:0]};

// synthesis translate_off
reg dummy_d_38;
// synthesis translate_on
always @(*) begin
	comb_self0 <= 14'sd0;
	case (linienmodule_control_channel_storage)
		1'd0: begin
			comb_self0 <= linienmodule_limit_fast1_limitcsr_y;
		end
		default: begin
			comb_self0 <= linienmodule_limit_fast2_limitcsr_y;
		end
	endcase
// synthesis translate_off
	dummy_d_38 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_39;
// synthesis translate_on
always @(*) begin
	comb_self1 <= 25'sd0;
	case (linienmodule_fast_a_y_tap_storage)
		1'd0: begin
			comb_self1 <= linienmodule_fast_a_iir0_x0;
		end
		1'd1: begin
			comb_self1 <= linienmodule_fast_a_iir0_y0;
		end
		default: begin
			comb_self1 <= linienmodule_fast_a_iir0_y2;
		end
	endcase
// synthesis translate_off
	dummy_d_39 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_40;
// synthesis translate_on
always @(*) begin
	comb_self2 <= 25'sd0;
	case (linienmodule_fast_a_y_tap_storage)
		1'd0: begin
			comb_self2 <= linienmodule_fast_a_iir1_x0;
		end
		1'd1: begin
			comb_self2 <= linienmodule_fast_a_iir1_y0;
		end
		default: begin
			comb_self2 <= linienmodule_fast_a_iir1_y2;
		end
	endcase
// synthesis translate_off
	dummy_d_40 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_41;
// synthesis translate_on
always @(*) begin
	comb_self3 <= 25'sd0;
	case (linienmodule_fast_b_y_tap_storage)
		1'd0: begin
			comb_self3 <= linienmodule_fast_b_iir0_x0;
		end
		1'd1: begin
			comb_self3 <= linienmodule_fast_b_iir0_y0;
		end
		default: begin
			comb_self3 <= linienmodule_fast_b_iir0_y2;
		end
	endcase
// synthesis translate_off
	dummy_d_41 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_42;
// synthesis translate_on
always @(*) begin
	comb_self4 <= 25'sd0;
	case (linienmodule_fast_b_y_tap_storage)
		1'd0: begin
			comb_self4 <= linienmodule_fast_b_iir1_x0;
		end
		1'd1: begin
			comb_self4 <= linienmodule_fast_b_iir1_y0;
		end
		default: begin
			comb_self4 <= linienmodule_fast_b_iir1_y2;
		end
	endcase
// synthesis translate_off
	dummy_d_42 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_43;
// synthesis translate_on
always @(*) begin
	sync_self0 <= 25'sd0;
	case (linienmodule_csrstorage8_storage)
		1'd0: begin
			sync_self0 <= 1'd0;
		end
		1'd1: begin
			sync_self0 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self0 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self0 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self0 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self0 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self0 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self0 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self0 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self0 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self0 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self0 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self0 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_43 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_44;
// synthesis translate_on
always @(*) begin
	sync_self1 <= 25'sd0;
	case (linienmodule_csrstorage9_storage)
		1'd0: begin
			sync_self1 <= 1'd0;
		end
		1'd1: begin
			sync_self1 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self1 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self1 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self1 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self1 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self1 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self1 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self1 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self1 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self1 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self1 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self1 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_44 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_45;
// synthesis translate_on
always @(*) begin
	sync_self2 <= 25'sd0;
	case (linienmodule_csrstorage10_storage)
		1'd0: begin
			sync_self2 <= 1'd0;
		end
		1'd1: begin
			sync_self2 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self2 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self2 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self2 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self2 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self2 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self2 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self2 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self2 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self2 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self2 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self2 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_45 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_46;
// synthesis translate_on
always @(*) begin
	sync_self3 <= 25'sd0;
	case (linienmodule_csrstorage11_storage)
		1'd0: begin
			sync_self3 <= 1'd0;
		end
		1'd1: begin
			sync_self3 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self3 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self3 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self3 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self3 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self3 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self3 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self3 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self3 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self3 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self3 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self3 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_46 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_47;
// synthesis translate_on
always @(*) begin
	sync_self4 <= 25'sd0;
	case (linienmodule_csrstorage12_storage)
		1'd0: begin
			sync_self4 <= 1'd0;
		end
		1'd1: begin
			sync_self4 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self4 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self4 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self4 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self4 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self4 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self4 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self4 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self4 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self4 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self4 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self4 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_47 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_48;
// synthesis translate_on
always @(*) begin
	sync_self5 <= 25'sd0;
	case (linienmodule_csrstorage13_storage)
		1'd0: begin
			sync_self5 <= 1'd0;
		end
		1'd1: begin
			sync_self5 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self5 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self5 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self5 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self5 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self5 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self5 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self5 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self5 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self5 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self5 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self5 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_48 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_49;
// synthesis translate_on
always @(*) begin
	sync_self6 <= 25'sd0;
	case (linienmodule_csrstorage14_storage)
		1'd0: begin
			sync_self6 <= 1'd0;
		end
		1'd1: begin
			sync_self6 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self6 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self6 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self6 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self6 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self6 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self6 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self6 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self6 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self6 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self6 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self6 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_49 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_50;
// synthesis translate_on
always @(*) begin
	sync_self7 <= 25'sd0;
	case (linienmodule_csrstorage15_storage)
		1'd0: begin
			sync_self7 <= 1'd0;
		end
		1'd1: begin
			sync_self7 <= linienmodule_fast_a_x0;
		end
		2'd2: begin
			sync_self7 <= linienmodule_fast_a_out_i;
		end
		2'd3: begin
			sync_self7 <= linienmodule_fast_a_out_q;
		end
		3'd4: begin
			sync_self7 <= linienmodule_fast_b_x0;
		end
		3'd5: begin
			sync_self7 <= linienmodule_fast_b_out_i;
		end
		3'd6: begin
			sync_self7 <= linienmodule_fast_b_out_q;
		end
		3'd7: begin
			sync_self7 <= linienmodule_slowchain_out;
		end
		4'd8: begin
			sync_self7 <= linienmodule_scopegen_dac_a;
		end
		4'd9: begin
			sync_self7 <= linienmodule_scopegen_dac_b;
		end
		4'd10: begin
			sync_self7 <= linienmodule_control_signal;
		end
		4'd11: begin
			sync_self7 <= linienmodule_combined_error_signal;
		end
		default: begin
			sync_self7 <= linienmodule_combined_error_signal_filtered;
		end
	endcase
// synthesis translate_off
	dummy_d_50 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_51;
// synthesis translate_on
always @(*) begin
	sync_self8 <= 1'd0;
	case (linienmodule_decimate_decimation)
		1'd0: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[0];
		end
		1'd1: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[1];
		end
		2'd2: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[2];
		end
		2'd3: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[3];
		end
		3'd4: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[4];
		end
		3'd5: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[5];
		end
		3'd6: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[6];
		end
		3'd7: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[7];
		end
		4'd8: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[8];
		end
		4'd9: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[9];
		end
		4'd10: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[10];
		end
		4'd11: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[11];
		end
		4'd12: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[12];
		end
		4'd13: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[13];
		end
		4'd14: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[14];
		end
		default: begin
			sync_self8 <= linienmodule_decimate_decimation_counter[15];
		end
	endcase
// synthesis translate_off
	dummy_d_51 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_52;
// synthesis translate_on
always @(*) begin
	self <= 1'd0;
	case (linienmodule_scopegen_storage)
		1'd0: begin
			self <= linienmodule_scopegen_gpio_trigger;
		end
		default: begin
			self <= linienmodule_scopegen_sweep_trigger;
		end
	endcase
// synthesis translate_off
	dummy_d_52 <= dummy_s;
// synthesis translate_on
end
assign linienmodule_gpio_n_i = xilinxmultiregimpl0_xilinxmultiregimpl01;
assign xilinxmultiregimpl0_i = {linienmodule_gpio_n_tstriple7_i, linienmodule_gpio_n_tstriple6_i, linienmodule_gpio_n_tstriple5_i, linienmodule_gpio_n_tstriple4_i, linienmodule_gpio_n_tstriple3_i, linienmodule_gpio_n_tstriple2_i, linienmodule_gpio_n_tstriple1_i, linienmodule_gpio_n_tstriple0_i};
assign linienmodule_gpio_p_i = xilinxmultiregimpl1_xilinxmultiregimpl11;
assign xilinxmultiregimpl1_i = {linienmodule_gpio_p_tstriple7_i, linienmodule_gpio_p_tstriple6_i, linienmodule_gpio_p_tstriple5_i, linienmodule_gpio_p_tstriple4_i, linienmodule_gpio_p_tstriple3_i, linienmodule_gpio_p_tstriple2_i, linienmodule_gpio_p_tstriple1_i, linienmodule_gpio_p_tstriple0_i};

always @(posedge decimated_clock_clk) begin
	if (($signed({1'd0, linienmodule_out_clr_re}) | ($signed({1'd0, linienmodule_max_status6}) < linienmodule_slowchain_out))) begin
		linienmodule_max_status6 <= linienmodule_slowchain_out;
	end
	if (($signed({1'd0, linienmodule_out_clr_re}) | ($signed({1'd0, linienmodule_min_status6}) > linienmodule_slowchain_out))) begin
		linienmodule_min_status6 <= linienmodule_slowchain_out;
	end
	if (linienmodule_slowchain_reset_storage) begin
		linienmodule_slowchain_int_reg <= 1'd0;
	end else begin
		if ((linienmodule_slowchain_i_ttl_active != 1'd0)) begin
			linienmodule_slowchain_int_reg <= linienmodule_slowchain_int_reg;
		end else begin
			if ((linienmodule_slowchain_int_sum > $signed({1'd0, 31'd2147221504}))) begin
				linienmodule_slowchain_int_reg <= 31'd2147221504;
			end else begin
				if ((linienmodule_slowchain_int_sum < 32'sd2147745791)) begin
					linienmodule_slowchain_int_reg <= 32'sd2147745791;
				end else begin
					linienmodule_slowchain_int_reg <= linienmodule_slowchain_int_sum;
				end
			end
		end
	end
	linienmodule_slowchain_kd_reg <= (linienmodule_slowchain_kd_mult >>> 4'd8);
	linienmodule_slowchain_kd_reg_r <= linienmodule_slowchain_kd_reg;
	linienmodule_slowchain_output_d <= (linienmodule_slowchain_kd_reg - linienmodule_slowchain_kd_reg_r);
	linienmodule_slowchain_pid_sum <= ((linienmodule_slowchain_output_p + linienmodule_slowchain_int_out) + linienmodule_slowchain_output_d);
	linienmodule_slowchain_limit_min <= {{5{linienmodule_slowchain_min_storage[13]}}, linienmodule_slowchain_min_storage};
	linienmodule_slowchain_limit_max <= {{5{linienmodule_slowchain_max_storage[13]}}, linienmodule_slowchain_max_storage};
	linienmodule_slowchain_limitcsr_y <= linienmodule_slowchain_limit_y;
	linienmodule_slowchain_limitcsr_error <= linienmodule_slowchain_limit_railed;
	if (decimated_clock_rst) begin
		linienmodule_slowchain_int_reg <= 32'sd0;
		linienmodule_slowchain_kd_reg <= 23'sd0;
		linienmodule_slowchain_kd_reg_r <= 23'sd0;
		linienmodule_slowchain_output_d <= 23'sd0;
		linienmodule_slowchain_pid_sum <= 51'sd0;
		linienmodule_slowchain_limitcsr_y <= 14'sd0;
		linienmodule_slowchain_limitcsr_error <= 1'd0;
		linienmodule_slowchain_limit_max <= 19'sd0;
		linienmodule_slowchain_limit_min <= 19'sd0;
		linienmodule_max_status6 <= 25'd0;
		linienmodule_min_status6 <= 25'd0;
	end
end

always @(posedge sys_clk) begin
	linienmodule_slow_out_shifted <= ((linienmodule_slowchain_limitcsr_y <<< 1'd1) + $signed({1'd0, 15'd16384}));
	linienmodule_limit_fast1_x <= linienmodule;
	linienmodule_limit_fast2_x <= linienmodule_fast_outs;
	linienmodule_chain_a_offset_signed <= linienmodule_chain_a_offset_storage;
	linienmodule_chain_b_offset_signed <= linienmodule_chain_b_offset_storage;
	linienmodule_combined_offset_signed <= linienmodule_combined_offset_storage;
	linienmodule_out_offset_signed <= linienmodule_out_offset_storage;
	if (($signed({1'd0, linienmodule_control_signal_clr_re}) | ($signed({1'd0, linienmodule_max_status9}) < linienmodule_control_signal))) begin
		linienmodule_max_status9 <= linienmodule_control_signal;
	end
	if (($signed({1'd0, linienmodule_control_signal_clr_re}) | ($signed({1'd0, linienmodule_min_status9}) > linienmodule_control_signal))) begin
		linienmodule_min_status9 <= linienmodule_control_signal;
	end
	if (($signed({1'd0, linienmodule_combined_error_signal_clr_re}) | ($signed({1'd0, linienmodule_max_status10}) < linienmodule_combined_error_signal))) begin
		linienmodule_max_status10 <= linienmodule_combined_error_signal;
	end
	if (($signed({1'd0, linienmodule_combined_error_signal_clr_re}) | ($signed({1'd0, linienmodule_min_status10}) > linienmodule_combined_error_signal))) begin
		linienmodule_min_status10 <= linienmodule_combined_error_signal;
	end
	if (($signed({1'd0, linienmodule_combined_error_signal_filtered_clr_re}) | ($signed({1'd0, linienmodule_max_status11}) < linienmodule_combined_error_signal_filtered))) begin
		linienmodule_max_status11 <= linienmodule_combined_error_signal_filtered;
	end
	if (($signed({1'd0, linienmodule_combined_error_signal_filtered_clr_re}) | ($signed({1'd0, linienmodule_min_status11}) > linienmodule_combined_error_signal_filtered))) begin
		linienmodule_min_status11 <= linienmodule_combined_error_signal_filtered;
	end
	linienmodule_mod_stop <= (linienmodule_mod_freq_storage == 1'd0);
	if ((linienmodule_mod_stop | linienmodule_mod_sync_phase)) begin
		linienmodule_mod_z <= 1'd0;
	end else begin
		linienmodule_mod_z <= (linienmodule_mod_z + linienmodule_mod_freq_storage);
	end
	linienmodule_mod_cordic1 <= (linienmodule_mod_cordic0 + (linienmodule_mod_cordic_dir0 ? (linienmodule_mod_cordic16 >>> 1'd0) : (-(linienmodule_mod_cordic16 >>> 1'd0))));
	linienmodule_mod_cordic17 <= (linienmodule_mod_cordic16 + (linienmodule_mod_cordic_dir0 ? (-(linienmodule_mod_cordic0 >>> 1'd0)) : (linienmodule_mod_cordic0 >>> 1'd0)));
	linienmodule_mod_cordic33 <= (linienmodule_mod_cordic32 + (linienmodule_mod_cordic_dir0 ? $signed({1'd0, 15'd16384}) : 15'sd16384));
	linienmodule_mod_cordic2 <= (linienmodule_mod_cordic1 + (linienmodule_mod_cordic_dir1 ? (linienmodule_mod_cordic17 >>> 1'd1) : (-(linienmodule_mod_cordic17 >>> 1'd1))));
	linienmodule_mod_cordic18 <= (linienmodule_mod_cordic17 + (linienmodule_mod_cordic_dir1 ? (-(linienmodule_mod_cordic1 >>> 1'd1)) : (linienmodule_mod_cordic1 >>> 1'd1)));
	linienmodule_mod_cordic34 <= (linienmodule_mod_cordic33 + (linienmodule_mod_cordic_dir1 ? $signed({1'd0, 14'd9672}) : 15'sd23096));
	linienmodule_mod_cordic3 <= (linienmodule_mod_cordic2 + (linienmodule_mod_cordic_dir2 ? (linienmodule_mod_cordic18 >>> 2'd2) : (-(linienmodule_mod_cordic18 >>> 2'd2))));
	linienmodule_mod_cordic19 <= (linienmodule_mod_cordic18 + (linienmodule_mod_cordic_dir2 ? (-(linienmodule_mod_cordic2 >>> 2'd2)) : (linienmodule_mod_cordic2 >>> 2'd2)));
	linienmodule_mod_cordic35 <= (linienmodule_mod_cordic34 + (linienmodule_mod_cordic_dir2 ? $signed({1'd0, 13'd5110}) : 14'sd11274));
	linienmodule_mod_cordic4 <= (linienmodule_mod_cordic3 + (linienmodule_mod_cordic_dir3 ? (linienmodule_mod_cordic19 >>> 2'd3) : (-(linienmodule_mod_cordic19 >>> 2'd3))));
	linienmodule_mod_cordic20 <= (linienmodule_mod_cordic19 + (linienmodule_mod_cordic_dir3 ? (-(linienmodule_mod_cordic3 >>> 2'd3)) : (linienmodule_mod_cordic3 >>> 2'd3)));
	linienmodule_mod_cordic36 <= (linienmodule_mod_cordic35 + (linienmodule_mod_cordic_dir3 ? $signed({1'd0, 12'd2594}) : 13'sd5598));
	linienmodule_mod_cordic5 <= (linienmodule_mod_cordic4 + (linienmodule_mod_cordic_dir4 ? (linienmodule_mod_cordic20 >>> 3'd4) : (-(linienmodule_mod_cordic20 >>> 3'd4))));
	linienmodule_mod_cordic21 <= (linienmodule_mod_cordic20 + (linienmodule_mod_cordic_dir4 ? (-(linienmodule_mod_cordic4 >>> 3'd4)) : (linienmodule_mod_cordic4 >>> 3'd4)));
	linienmodule_mod_cordic37 <= (linienmodule_mod_cordic36 + (linienmodule_mod_cordic_dir4 ? $signed({1'd0, 11'd1302}) : 12'sd2794));
	linienmodule_mod_cordic6 <= (linienmodule_mod_cordic5 + (linienmodule_mod_cordic_dir5 ? (linienmodule_mod_cordic21 >>> 3'd5) : (-(linienmodule_mod_cordic21 >>> 3'd5))));
	linienmodule_mod_cordic22 <= (linienmodule_mod_cordic21 + (linienmodule_mod_cordic_dir5 ? (-(linienmodule_mod_cordic5 >>> 3'd5)) : (linienmodule_mod_cordic5 >>> 3'd5)));
	linienmodule_mod_cordic38 <= (linienmodule_mod_cordic37 + (linienmodule_mod_cordic_dir5 ? $signed({1'd0, 10'd652}) : 11'sd1396));
	linienmodule_mod_cordic7 <= (linienmodule_mod_cordic6 + (linienmodule_mod_cordic_dir6 ? (linienmodule_mod_cordic22 >>> 3'd6) : (-(linienmodule_mod_cordic22 >>> 3'd6))));
	linienmodule_mod_cordic23 <= (linienmodule_mod_cordic22 + (linienmodule_mod_cordic_dir6 ? (-(linienmodule_mod_cordic6 >>> 3'd6)) : (linienmodule_mod_cordic6 >>> 3'd6)));
	linienmodule_mod_cordic39 <= (linienmodule_mod_cordic38 + (linienmodule_mod_cordic_dir6 ? $signed({1'd0, 9'd326}) : 10'sd698));
	linienmodule_mod_cordic8 <= (linienmodule_mod_cordic7 + (linienmodule_mod_cordic_dir7 ? (linienmodule_mod_cordic23 >>> 3'd7) : (-(linienmodule_mod_cordic23 >>> 3'd7))));
	linienmodule_mod_cordic24 <= (linienmodule_mod_cordic23 + (linienmodule_mod_cordic_dir7 ? (-(linienmodule_mod_cordic7 >>> 3'd7)) : (linienmodule_mod_cordic7 >>> 3'd7)));
	linienmodule_mod_cordic40 <= (linienmodule_mod_cordic39 + (linienmodule_mod_cordic_dir7 ? $signed({1'd0, 8'd163}) : 9'sd349));
	linienmodule_mod_cordic9 <= (linienmodule_mod_cordic8 + (linienmodule_mod_cordic_dir8 ? (linienmodule_mod_cordic24 >>> 4'd8) : (-(linienmodule_mod_cordic24 >>> 4'd8))));
	linienmodule_mod_cordic25 <= (linienmodule_mod_cordic24 + (linienmodule_mod_cordic_dir8 ? (-(linienmodule_mod_cordic8 >>> 4'd8)) : (linienmodule_mod_cordic8 >>> 4'd8)));
	linienmodule_mod_cordic41 <= (linienmodule_mod_cordic40 + (linienmodule_mod_cordic_dir8 ? $signed({1'd0, 7'd81}) : 8'sd175));
	linienmodule_mod_cordic10 <= (linienmodule_mod_cordic9 + (linienmodule_mod_cordic_dir9 ? (linienmodule_mod_cordic25 >>> 4'd9) : (-(linienmodule_mod_cordic25 >>> 4'd9))));
	linienmodule_mod_cordic26 <= (linienmodule_mod_cordic25 + (linienmodule_mod_cordic_dir9 ? (-(linienmodule_mod_cordic9 >>> 4'd9)) : (linienmodule_mod_cordic9 >>> 4'd9)));
	linienmodule_mod_cordic42 <= (linienmodule_mod_cordic41 + (linienmodule_mod_cordic_dir9 ? $signed({1'd0, 6'd41}) : 7'sd87));
	linienmodule_mod_cordic11 <= (linienmodule_mod_cordic10 + (linienmodule_mod_cordic_dir10 ? (linienmodule_mod_cordic26 >>> 4'd10) : (-(linienmodule_mod_cordic26 >>> 4'd10))));
	linienmodule_mod_cordic27 <= (linienmodule_mod_cordic26 + (linienmodule_mod_cordic_dir10 ? (-(linienmodule_mod_cordic10 >>> 4'd10)) : (linienmodule_mod_cordic10 >>> 4'd10)));
	linienmodule_mod_cordic43 <= (linienmodule_mod_cordic42 + (linienmodule_mod_cordic_dir10 ? $signed({1'd0, 5'd20}) : 6'sd44));
	linienmodule_mod_cordic12 <= (linienmodule_mod_cordic11 + (linienmodule_mod_cordic_dir11 ? (linienmodule_mod_cordic27 >>> 4'd11) : (-(linienmodule_mod_cordic27 >>> 4'd11))));
	linienmodule_mod_cordic28 <= (linienmodule_mod_cordic27 + (linienmodule_mod_cordic_dir11 ? (-(linienmodule_mod_cordic11 >>> 4'd11)) : (linienmodule_mod_cordic11 >>> 4'd11)));
	linienmodule_mod_cordic44 <= (linienmodule_mod_cordic43 + (linienmodule_mod_cordic_dir11 ? $signed({1'd0, 4'd10}) : 5'sd22));
	linienmodule_mod_cordic13 <= (linienmodule_mod_cordic12 + (linienmodule_mod_cordic_dir12 ? (linienmodule_mod_cordic28 >>> 4'd12) : (-(linienmodule_mod_cordic28 >>> 4'd12))));
	linienmodule_mod_cordic29 <= (linienmodule_mod_cordic28 + (linienmodule_mod_cordic_dir12 ? (-(linienmodule_mod_cordic12 >>> 4'd12)) : (linienmodule_mod_cordic12 >>> 4'd12)));
	linienmodule_mod_cordic45 <= (linienmodule_mod_cordic44 + (linienmodule_mod_cordic_dir12 ? $signed({1'd0, 3'd5}) : 4'sd11));
	linienmodule_mod_cordic14 <= (linienmodule_mod_cordic13 + (linienmodule_mod_cordic_dir13 ? (linienmodule_mod_cordic29 >>> 4'd13) : (-(linienmodule_mod_cordic29 >>> 4'd13))));
	linienmodule_mod_cordic30 <= (linienmodule_mod_cordic29 + (linienmodule_mod_cordic_dir13 ? (-(linienmodule_mod_cordic13 >>> 4'd13)) : (linienmodule_mod_cordic13 >>> 4'd13)));
	linienmodule_mod_cordic46 <= (linienmodule_mod_cordic45 + (linienmodule_mod_cordic_dir13 ? $signed({1'd0, 2'd3}) : 3'sd5));
	linienmodule_mod_cordic15 <= (linienmodule_mod_cordic14 + (linienmodule_mod_cordic_dir14 ? (linienmodule_mod_cordic30 >>> 4'd14) : (-(linienmodule_mod_cordic30 >>> 4'd14))));
	linienmodule_mod_cordic31 <= (linienmodule_mod_cordic30 + (linienmodule_mod_cordic_dir14 ? (-(linienmodule_mod_cordic14 >>> 4'd14)) : (linienmodule_mod_cordic14 >>> 4'd14)));
	linienmodule_mod_cordic47 <= (linienmodule_mod_cordic46 + (linienmodule_mod_cordic_dir14 ? $signed({1'd0, 1'd1}) : 1'sd1));
	linienmodule_sweep_limit_min <= {linienmodule_sweep_min_storage[13], linienmodule_sweep_min_storage};
	linienmodule_sweep_limit_max <= {linienmodule_sweep_max_storage[13], linienmodule_sweep_max_storage};
	linienmodule_sweep_sweep_turn <= linienmodule_sweep_limit_railed;
	if (linienmodule_sweep_pause_storage) begin
		linienmodule_sweep_y <= 1'd0;
	end else begin
		linienmodule_sweep_y <= linienmodule_sweep_limit_y;
	end
	linienmodule_sweep_sweep_trigger <= (linienmodule_sweep_sweep_turn & linienmodule_sweep_sweep_up);
	linienmodule_sweep_sweep_turning <= linienmodule_sweep_sweep_turn;
	linienmodule_sweep_sweep_dir <= linienmodule_sweep_sweep_up;
	if ((~linienmodule_sweep_sweep_run)) begin
		linienmodule_sweep_sweep_y <= 1'd0;
	end else begin
		if ((~linienmodule_sweep_sweep_hold)) begin
			if (linienmodule_sweep_sweep_up) begin
				linienmodule_sweep_sweep_y <= (linienmodule_sweep_sweep_y + $signed({1'd0, linienmodule_sweep_sweep_step}));
			end else begin
				linienmodule_sweep_sweep_y <= (linienmodule_sweep_sweep_y - $signed({1'd0, linienmodule_sweep_sweep_step}));
			end
		end
	end
	linienmodule_limit_error_signal_limit_min <= {{4{linienmodule_limit_error_signal_min_storage[24]}}, linienmodule_limit_error_signal_min_storage};
	linienmodule_limit_error_signal_limit_max <= {{4{linienmodule_limit_error_signal_max_storage[24]}}, linienmodule_limit_error_signal_max_storage};
	linienmodule_limit_error_signal_limitcsr_y <= linienmodule_limit_error_signal_limit_y;
	linienmodule_limit_error_signal_limitcsr_error <= linienmodule_limit_error_signal_limit_railed;
	linienmodule_limit_fast1_limit_min <= {{5{linienmodule_limit_fast1_min_storage[13]}}, linienmodule_limit_fast1_min_storage};
	linienmodule_limit_fast1_limit_max <= {{5{linienmodule_limit_fast1_max_storage[13]}}, linienmodule_limit_fast1_max_storage};
	linienmodule_limit_fast1_limitcsr_y <= linienmodule_limit_fast1_limit_y;
	linienmodule_limit_fast1_limitcsr_error <= linienmodule_limit_fast1_limit_railed;
	linienmodule_limit_fast2_limit_min <= {{5{linienmodule_limit_fast2_min_storage[13]}}, linienmodule_limit_fast2_min_storage};
	linienmodule_limit_fast2_limit_max <= {{5{linienmodule_limit_fast2_max_storage[13]}}, linienmodule_limit_fast2_max_storage};
	linienmodule_limit_fast2_limitcsr_y <= linienmodule_limit_fast2_limit_y;
	linienmodule_limit_fast2_limitcsr_error <= linienmodule_limit_fast2_limit_railed;
	if (linienmodule_pid_reset_storage) begin
		linienmodule_pid_int_reg <= 1'd0;
	end else begin
		if ((linienmodule_pid_i_ttl_active != 1'd0)) begin
			linienmodule_pid_int_reg <= linienmodule_pid_int_reg;
		end else begin
			if ((linienmodule_pid_int_sum > $signed({1'd0, 42'd4398046248960}))) begin
				linienmodule_pid_int_reg <= 42'd4398046248960;
			end else begin
				if ((linienmodule_pid_int_sum < 43'sd4398046773247)) begin
					linienmodule_pid_int_reg <= 43'sd4398046773247;
				end else begin
					linienmodule_pid_int_reg <= linienmodule_pid_int_sum;
				end
			end
		end
	end
	linienmodule_pid_kd_reg <= (linienmodule_pid_kd_mult >>> 4'd8);
	linienmodule_pid_kd_reg_r <= linienmodule_pid_kd_reg;
	linienmodule_pid_output_d <= (linienmodule_pid_kd_reg - linienmodule_pid_kd_reg_r);
	linienmodule_pid_pid_sum <= ((linienmodule_pid_output_p + linienmodule_pid_int_out) + linienmodule_pid_output_d);
	if ((~linienmodule_autolock_request_lock_storage)) begin
		linienmodule_autolock_status <= 1'd0;
	end
	if ((linienmodule_autolock_request_lock_storage & linienmodule_autolock_fast_turn_on_lock)) begin
		linienmodule_autolock_status <= 1'd1;
	end
	if ((~linienmodule_autolock_fast_request_lock)) begin
		linienmodule_autolock_fast_turn_on_lock <= 1'd0;
	end else begin
		linienmodule_autolock_fast_turn_on_lock <= (((linienmodule_autolock_fast_sweep_value >= (linienmodule_autolock_fast_target_position_signed - $signed({1'd0, (linienmodule_autolock_fast_sweep_step >>> 1'd1)}))) & (linienmodule_autolock_fast_sweep_value <= ((linienmodule_autolock_fast_target_position_signed + $signed({1'd0, 1'd1})) + $signed({1'd0, (linienmodule_autolock_fast_sweep_step >>> 1'd1)})))) & $signed({1'd0, linienmodule_autolock_fast_sweep_up}));
	end
	linienmodule_sequenceexecutor_ttl_sync0 <= linienmodule_sequenceexecutor_i_ttl;
	linienmodule_sequenceexecutor_ttl_sync1 <= linienmodule_sequenceexecutor_ttl_sync0;
	linienmodule_sequenceexecutor_ttl_prev <= linienmodule_sequenceexecutor_ttl_sync1;
	state <= next_state;
	if (linienmodule_sequenceexecutor_o_active_offset_next_value_ce0) begin
		linienmodule_sequenceexecutor_o_active_offset <= linienmodule_sequenceexecutor_o_active_offset_next_value0;
	end
	if (linienmodule_sequenceexecutor_o_saved_pid_out_next_value_ce1) begin
		linienmodule_sequenceexecutor_o_saved_pid_out <= linienmodule_sequenceexecutor_o_saved_pid_out_next_value1;
	end
	if (linienmodule_sequenceexecutor_o_saved_integrator_next_value_ce2) begin
		linienmodule_sequenceexecutor_o_saved_integrator <= linienmodule_sequenceexecutor_o_saved_integrator_next_value2;
	end
	if (linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value_ce3) begin
		linienmodule_sequenceexecutor_o_saved_sweep_pos <= linienmodule_sequenceexecutor_o_saved_sweep_pos_next_value3;
	end
	if (linienmodule_sequenceexecutor_o_saved_dac_out_next_value_ce4) begin
		linienmodule_sequenceexecutor_o_saved_dac_out <= linienmodule_sequenceexecutor_o_saved_dac_out_next_value4;
	end
	linienmodule_raw_acquisition_iir_a1 <= linienmodule_raw_acquisition_iir_csrstorage0_storage;
	linienmodule_raw_acquisition_iir_a2 <= linienmodule_raw_acquisition_iir_csrstorage1_storage;
	linienmodule_raw_acquisition_iir_a3 <= linienmodule_raw_acquisition_iir_csrstorage2_storage;
	linienmodule_raw_acquisition_iir_a4 <= linienmodule_raw_acquisition_iir_csrstorage3_storage;
	linienmodule_raw_acquisition_iir_a5 <= linienmodule_raw_acquisition_iir_csrstorage4_storage;
	linienmodule_raw_acquisition_iir_b0 <= linienmodule_raw_acquisition_iir_csrstorage5_storage;
	linienmodule_raw_acquisition_iir_b1 <= linienmodule_raw_acquisition_iir_csrstorage6_storage;
	linienmodule_raw_acquisition_iir_b2 <= linienmodule_raw_acquisition_iir_csrstorage7_storage;
	linienmodule_raw_acquisition_iir_b3 <= linienmodule_raw_acquisition_iir_csrstorage8_storage;
	linienmodule_raw_acquisition_iir_b4 <= linienmodule_raw_acquisition_iir_csrstorage9_storage;
	linienmodule_raw_acquisition_iir_b5 <= linienmodule_raw_acquisition_iir_csrstorage10_storage;
	linienmodule_raw_acquisition_iir_z0r <= (linienmodule_raw_acquisition_iir_storage <<< 5'd23);
	linienmodule_raw_acquisition_iir_error <= linienmodule_raw_acquisition_iir_railed;
	linienmodule_raw_acquisition_iir_y0 <= linienmodule_raw_acquisition_iir_y_lim;
	if (linienmodule_raw_acquisition_iir_clear) begin
		linienmodule_raw_acquisition_iir_y1 <= 1'd0;
	end else begin
		if ((~linienmodule_raw_acquisition_iir_hold)) begin
			linienmodule_raw_acquisition_iir_y1 <= linienmodule_raw_acquisition_iir_y_lim;
		end
	end
	linienmodule_raw_acquisition_iir_zr0 <= linienmodule_raw_acquisition_iir_z0r;
	linienmodule_raw_acquisition_iir_zr1 <= linienmodule_raw_acquisition_iir_z0;
	linienmodule_raw_acquisition_iir_zr2 <= linienmodule_raw_acquisition_iir_z1;
	linienmodule_raw_acquisition_iir_zr3 <= linienmodule_raw_acquisition_iir_z2;
	linienmodule_raw_acquisition_iir_zr4 <= linienmodule_raw_acquisition_iir_z3;
	linienmodule_raw_acquisition_iir_zr5 <= linienmodule_raw_acquisition_iir_z4;
	linienmodule_raw_acquisition_iir_zr6 <= linienmodule_raw_acquisition_iir_z5;
	linienmodule_raw_acquisition_iir_zr7 <= linienmodule_raw_acquisition_iir_z6;
	linienmodule_raw_acquisition_iir_zr8 <= linienmodule_raw_acquisition_iir_z7;
	linienmodule_raw_acquisition_iir_zr9 <= linienmodule_raw_acquisition_iir_z8;
	linienmodule_raw_acquisition_iir_zr10 <= linienmodule_raw_acquisition_iir_z9;
	linienmodule_analog_adca <= adc_data_a;
	linienmodule_analog_adcb <= adc_data_b;
	linienmodule_analog_daca <= {linienmodule_analog_dac_a[13], (~linienmodule_analog_dac_a[12:0])};
	linienmodule_analog_dacb <= {linienmodule_analog_dac_b[13], (~linienmodule_analog_dac_b[12:0])};
	if (linienmodule_xadc_drdy) begin
		case (linienmodule_xadc_channel)
			1'd0: begin
				linienmodule_xadc_temp_status <= (linienmodule_xadc_data >>> 3'd4);
			end
			2'd3: begin
				linienmodule_xadc_v_status <= (linienmodule_xadc_data >>> 3'd4);
			end
			5'd16: begin
				linienmodule_xadc_b_status <= (linienmodule_xadc_data >>> 3'd4);
			end
			5'd17: begin
				linienmodule_xadc_c_status <= (linienmodule_xadc_data >>> 3'd4);
			end
			5'd24: begin
				linienmodule_xadc_a_status <= (linienmodule_xadc_data >>> 3'd4);
			end
			5'd25: begin
				linienmodule_xadc_d_status <= (linienmodule_xadc_data >>> 3'd4);
			end
		endcase
	end
	if (linienmodule_state_clr_re) begin
		linienmodule_state_status <= 1'd0;
	end else begin
		linienmodule_state_status <= (linienmodule_state_status | linienmodule_state);
	end
	linienmodule_gpio_n_o[0] <= ((linienmodule_state & linienmodule_csrstorage0_storage1) != 1'd0);
	linienmodule_gpio_n_o[1] <= ((linienmodule_state & linienmodule_csrstorage1_storage1) != 1'd0);
	linienmodule_gpio_n_o[2] <= ((linienmodule_state & linienmodule_csrstorage2_storage1) != 1'd0);
	linienmodule_gpio_n_o[3] <= ((linienmodule_state & linienmodule_csrstorage3_storage) != 1'd0);
	linienmodule_gpio_n_o[4] <= ((linienmodule_state & linienmodule_csrstorage4_storage) != 1'd0);
	linienmodule_gpio_n_o[5] <= ((linienmodule_state & linienmodule_csrstorage5_storage) != 1'd0);
	linienmodule_gpio_n_o[6] <= ((linienmodule_state & linienmodule_csrstorage6_storage) != 1'd0);
	linienmodule_gpio_n_o[7] <= ((linienmodule_state & linienmodule_csrstorage7_storage) != 1'd0);
	if ((linienmodule_dna_cnt < 8'd128)) begin
		linienmodule_dna_cnt <= (linienmodule_dna_cnt + 1'd1);
		if (linienmodule_dna_cnt[0]) begin
			linienmodule_dna_status <= {linienmodule_dna_status, linienmodule_dna_do};
		end
	end
	linienmodule_fast_a_ya <= (linienmodule_fast_a_dy >>> 4'd11);
	if (($signed({1'd0, linienmodule_csr0_x_clr_re}) | ($signed({1'd0, linienmodule_max_status0}) < linienmodule_fast_a_x0))) begin
		linienmodule_max_status0 <= linienmodule_fast_a_x0;
	end
	if (($signed({1'd0, linienmodule_csr0_x_clr_re}) | ($signed({1'd0, linienmodule_min_status0}) > linienmodule_fast_a_x0))) begin
		linienmodule_min_status0 <= linienmodule_fast_a_x0;
	end
	if (($signed({1'd0, linienmodule_csr1_out_i_clr_re}) | ($signed({1'd0, linienmodule_max_status1}) < linienmodule_fast_a_out_i))) begin
		linienmodule_max_status1 <= linienmodule_fast_a_out_i;
	end
	if (($signed({1'd0, linienmodule_csr1_out_i_clr_re}) | ($signed({1'd0, linienmodule_min_status1}) > linienmodule_fast_a_out_i))) begin
		linienmodule_min_status1 <= linienmodule_fast_a_out_i;
	end
	if (($signed({1'd0, linienmodule_csr2_out_q_clr_re}) | ($signed({1'd0, linienmodule_max_status2}) < linienmodule_fast_a_out_q))) begin
		linienmodule_max_status2 <= linienmodule_fast_a_out_q;
	end
	if (($signed({1'd0, linienmodule_csr2_out_q_clr_re}) | ($signed({1'd0, linienmodule_min_status2}) > linienmodule_fast_a_out_q))) begin
		linienmodule_min_status2 <= linienmodule_fast_a_out_q;
	end
	linienmodule_fast_a_dx <= sync_self0;
	linienmodule_fast_a_dy <= sync_self1;
	linienmodule_fast_a_cordic1 <= (linienmodule_fast_a_cordic0 + (linienmodule_fast_a_cordic_dir0 ? (linienmodule_fast_a_cordic16 >>> 1'd0) : (-(linienmodule_fast_a_cordic16 >>> 1'd0))));
	linienmodule_fast_a_cordic17 <= (linienmodule_fast_a_cordic16 + (linienmodule_fast_a_cordic_dir0 ? (-(linienmodule_fast_a_cordic0 >>> 1'd0)) : (linienmodule_fast_a_cordic0 >>> 1'd0)));
	linienmodule_fast_a_cordic33 <= (linienmodule_fast_a_cordic32 + (linienmodule_fast_a_cordic_dir0 ? $signed({1'd0, 15'd16384}) : 15'sd16384));
	linienmodule_fast_a_cordic2 <= (linienmodule_fast_a_cordic1 + (linienmodule_fast_a_cordic_dir1 ? (linienmodule_fast_a_cordic17 >>> 1'd1) : (-(linienmodule_fast_a_cordic17 >>> 1'd1))));
	linienmodule_fast_a_cordic18 <= (linienmodule_fast_a_cordic17 + (linienmodule_fast_a_cordic_dir1 ? (-(linienmodule_fast_a_cordic1 >>> 1'd1)) : (linienmodule_fast_a_cordic1 >>> 1'd1)));
	linienmodule_fast_a_cordic34 <= (linienmodule_fast_a_cordic33 + (linienmodule_fast_a_cordic_dir1 ? $signed({1'd0, 14'd9672}) : 15'sd23096));
	linienmodule_fast_a_cordic3 <= (linienmodule_fast_a_cordic2 + (linienmodule_fast_a_cordic_dir2 ? (linienmodule_fast_a_cordic18 >>> 2'd2) : (-(linienmodule_fast_a_cordic18 >>> 2'd2))));
	linienmodule_fast_a_cordic19 <= (linienmodule_fast_a_cordic18 + (linienmodule_fast_a_cordic_dir2 ? (-(linienmodule_fast_a_cordic2 >>> 2'd2)) : (linienmodule_fast_a_cordic2 >>> 2'd2)));
	linienmodule_fast_a_cordic35 <= (linienmodule_fast_a_cordic34 + (linienmodule_fast_a_cordic_dir2 ? $signed({1'd0, 13'd5110}) : 14'sd11274));
	linienmodule_fast_a_cordic4 <= (linienmodule_fast_a_cordic3 + (linienmodule_fast_a_cordic_dir3 ? (linienmodule_fast_a_cordic19 >>> 2'd3) : (-(linienmodule_fast_a_cordic19 >>> 2'd3))));
	linienmodule_fast_a_cordic20 <= (linienmodule_fast_a_cordic19 + (linienmodule_fast_a_cordic_dir3 ? (-(linienmodule_fast_a_cordic3 >>> 2'd3)) : (linienmodule_fast_a_cordic3 >>> 2'd3)));
	linienmodule_fast_a_cordic36 <= (linienmodule_fast_a_cordic35 + (linienmodule_fast_a_cordic_dir3 ? $signed({1'd0, 12'd2594}) : 13'sd5598));
	linienmodule_fast_a_cordic5 <= (linienmodule_fast_a_cordic4 + (linienmodule_fast_a_cordic_dir4 ? (linienmodule_fast_a_cordic20 >>> 3'd4) : (-(linienmodule_fast_a_cordic20 >>> 3'd4))));
	linienmodule_fast_a_cordic21 <= (linienmodule_fast_a_cordic20 + (linienmodule_fast_a_cordic_dir4 ? (-(linienmodule_fast_a_cordic4 >>> 3'd4)) : (linienmodule_fast_a_cordic4 >>> 3'd4)));
	linienmodule_fast_a_cordic37 <= (linienmodule_fast_a_cordic36 + (linienmodule_fast_a_cordic_dir4 ? $signed({1'd0, 11'd1302}) : 12'sd2794));
	linienmodule_fast_a_cordic6 <= (linienmodule_fast_a_cordic5 + (linienmodule_fast_a_cordic_dir5 ? (linienmodule_fast_a_cordic21 >>> 3'd5) : (-(linienmodule_fast_a_cordic21 >>> 3'd5))));
	linienmodule_fast_a_cordic22 <= (linienmodule_fast_a_cordic21 + (linienmodule_fast_a_cordic_dir5 ? (-(linienmodule_fast_a_cordic5 >>> 3'd5)) : (linienmodule_fast_a_cordic5 >>> 3'd5)));
	linienmodule_fast_a_cordic38 <= (linienmodule_fast_a_cordic37 + (linienmodule_fast_a_cordic_dir5 ? $signed({1'd0, 10'd652}) : 11'sd1396));
	linienmodule_fast_a_cordic7 <= (linienmodule_fast_a_cordic6 + (linienmodule_fast_a_cordic_dir6 ? (linienmodule_fast_a_cordic22 >>> 3'd6) : (-(linienmodule_fast_a_cordic22 >>> 3'd6))));
	linienmodule_fast_a_cordic23 <= (linienmodule_fast_a_cordic22 + (linienmodule_fast_a_cordic_dir6 ? (-(linienmodule_fast_a_cordic6 >>> 3'd6)) : (linienmodule_fast_a_cordic6 >>> 3'd6)));
	linienmodule_fast_a_cordic39 <= (linienmodule_fast_a_cordic38 + (linienmodule_fast_a_cordic_dir6 ? $signed({1'd0, 9'd326}) : 10'sd698));
	linienmodule_fast_a_cordic8 <= (linienmodule_fast_a_cordic7 + (linienmodule_fast_a_cordic_dir7 ? (linienmodule_fast_a_cordic23 >>> 3'd7) : (-(linienmodule_fast_a_cordic23 >>> 3'd7))));
	linienmodule_fast_a_cordic24 <= (linienmodule_fast_a_cordic23 + (linienmodule_fast_a_cordic_dir7 ? (-(linienmodule_fast_a_cordic7 >>> 3'd7)) : (linienmodule_fast_a_cordic7 >>> 3'd7)));
	linienmodule_fast_a_cordic40 <= (linienmodule_fast_a_cordic39 + (linienmodule_fast_a_cordic_dir7 ? $signed({1'd0, 8'd163}) : 9'sd349));
	linienmodule_fast_a_cordic9 <= (linienmodule_fast_a_cordic8 + (linienmodule_fast_a_cordic_dir8 ? (linienmodule_fast_a_cordic24 >>> 4'd8) : (-(linienmodule_fast_a_cordic24 >>> 4'd8))));
	linienmodule_fast_a_cordic25 <= (linienmodule_fast_a_cordic24 + (linienmodule_fast_a_cordic_dir8 ? (-(linienmodule_fast_a_cordic8 >>> 4'd8)) : (linienmodule_fast_a_cordic8 >>> 4'd8)));
	linienmodule_fast_a_cordic41 <= (linienmodule_fast_a_cordic40 + (linienmodule_fast_a_cordic_dir8 ? $signed({1'd0, 7'd81}) : 8'sd175));
	linienmodule_fast_a_cordic10 <= (linienmodule_fast_a_cordic9 + (linienmodule_fast_a_cordic_dir9 ? (linienmodule_fast_a_cordic25 >>> 4'd9) : (-(linienmodule_fast_a_cordic25 >>> 4'd9))));
	linienmodule_fast_a_cordic26 <= (linienmodule_fast_a_cordic25 + (linienmodule_fast_a_cordic_dir9 ? (-(linienmodule_fast_a_cordic9 >>> 4'd9)) : (linienmodule_fast_a_cordic9 >>> 4'd9)));
	linienmodule_fast_a_cordic42 <= (linienmodule_fast_a_cordic41 + (linienmodule_fast_a_cordic_dir9 ? $signed({1'd0, 6'd41}) : 7'sd87));
	linienmodule_fast_a_cordic11 <= (linienmodule_fast_a_cordic10 + (linienmodule_fast_a_cordic_dir10 ? (linienmodule_fast_a_cordic26 >>> 4'd10) : (-(linienmodule_fast_a_cordic26 >>> 4'd10))));
	linienmodule_fast_a_cordic27 <= (linienmodule_fast_a_cordic26 + (linienmodule_fast_a_cordic_dir10 ? (-(linienmodule_fast_a_cordic10 >>> 4'd10)) : (linienmodule_fast_a_cordic10 >>> 4'd10)));
	linienmodule_fast_a_cordic43 <= (linienmodule_fast_a_cordic42 + (linienmodule_fast_a_cordic_dir10 ? $signed({1'd0, 5'd20}) : 6'sd44));
	linienmodule_fast_a_cordic12 <= (linienmodule_fast_a_cordic11 + (linienmodule_fast_a_cordic_dir11 ? (linienmodule_fast_a_cordic27 >>> 4'd11) : (-(linienmodule_fast_a_cordic27 >>> 4'd11))));
	linienmodule_fast_a_cordic28 <= (linienmodule_fast_a_cordic27 + (linienmodule_fast_a_cordic_dir11 ? (-(linienmodule_fast_a_cordic11 >>> 4'd11)) : (linienmodule_fast_a_cordic11 >>> 4'd11)));
	linienmodule_fast_a_cordic44 <= (linienmodule_fast_a_cordic43 + (linienmodule_fast_a_cordic_dir11 ? $signed({1'd0, 4'd10}) : 5'sd22));
	linienmodule_fast_a_cordic13 <= (linienmodule_fast_a_cordic12 + (linienmodule_fast_a_cordic_dir12 ? (linienmodule_fast_a_cordic28 >>> 4'd12) : (-(linienmodule_fast_a_cordic28 >>> 4'd12))));
	linienmodule_fast_a_cordic29 <= (linienmodule_fast_a_cordic28 + (linienmodule_fast_a_cordic_dir12 ? (-(linienmodule_fast_a_cordic12 >>> 4'd12)) : (linienmodule_fast_a_cordic12 >>> 4'd12)));
	linienmodule_fast_a_cordic45 <= (linienmodule_fast_a_cordic44 + (linienmodule_fast_a_cordic_dir12 ? $signed({1'd0, 3'd5}) : 4'sd11));
	linienmodule_fast_a_cordic14 <= (linienmodule_fast_a_cordic13 + (linienmodule_fast_a_cordic_dir13 ? (linienmodule_fast_a_cordic29 >>> 4'd13) : (-(linienmodule_fast_a_cordic29 >>> 4'd13))));
	linienmodule_fast_a_cordic30 <= (linienmodule_fast_a_cordic29 + (linienmodule_fast_a_cordic_dir13 ? (-(linienmodule_fast_a_cordic13 >>> 4'd13)) : (linienmodule_fast_a_cordic13 >>> 4'd13)));
	linienmodule_fast_a_cordic46 <= (linienmodule_fast_a_cordic45 + (linienmodule_fast_a_cordic_dir13 ? $signed({1'd0, 2'd3}) : 3'sd5));
	linienmodule_fast_a_cordic15 <= (linienmodule_fast_a_cordic14 + (linienmodule_fast_a_cordic_dir14 ? (linienmodule_fast_a_cordic30 >>> 4'd14) : (-(linienmodule_fast_a_cordic30 >>> 4'd14))));
	linienmodule_fast_a_cordic31 <= (linienmodule_fast_a_cordic30 + (linienmodule_fast_a_cordic_dir14 ? (-(linienmodule_fast_a_cordic14 >>> 4'd14)) : (linienmodule_fast_a_cordic14 >>> 4'd14)));
	linienmodule_fast_a_cordic47 <= (linienmodule_fast_a_cordic46 + (linienmodule_fast_a_cordic_dir14 ? $signed({1'd0, 1'd1}) : 1'sd1));
	linienmodule_fast_a_limitcsr0_limit_min0 <= {{1{linienmodule_fast_a_limitcsr0_min_storage0[24]}}, linienmodule_fast_a_limitcsr0_min_storage0};
	linienmodule_fast_a_limitcsr0_limit_max0 <= {{1{linienmodule_fast_a_limitcsr0_max_storage0[24]}}, linienmodule_fast_a_limitcsr0_max_storage0};
	linienmodule_fast_a_limitcsr0_limitcsr0_y0 <= linienmodule_fast_a_limitcsr0_limit_y0;
	linienmodule_fast_a_limitcsr0_limitcsr0_error0 <= linienmodule_fast_a_limitcsr0_limit_railed0;
	linienmodule_fast_a_iir0_a10 <= linienmodule_fast_a_iir0_csrstorage0_storage0;
	linienmodule_fast_a_iir0_b00 <= linienmodule_fast_a_iir0_csrstorage1_storage0;
	linienmodule_fast_a_iir0_b10 <= linienmodule_fast_a_iir0_csrstorage2_storage0;
	linienmodule_fast_a_iir0_z0r0 <= (linienmodule_fast_a_iir0_storage0 <<< 5'd23);
	linienmodule_fast_a_iir0_error0 <= linienmodule_fast_a_iir0_railed0;
	linienmodule_fast_a_iir0_y0 <= linienmodule_fast_a_iir0_y_lim0;
	if (linienmodule_fast_a_iir0_clear0) begin
		linienmodule_fast_a_iir0_y1 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_a_iir0_hold0)) begin
			linienmodule_fast_a_iir0_y1 <= linienmodule_fast_a_iir0_y_lim0;
		end
	end
	linienmodule_fast_a_iir0_zr0 <= linienmodule_fast_a_iir0_z0r0;
	linienmodule_fast_a_iir0_zr1 <= linienmodule_fast_a_iir0_z0;
	linienmodule_fast_a_iir0_zr2 <= linienmodule_fast_a_iir0_z1;
	linienmodule_fast_a_iir0_a11 <= linienmodule_fast_a_iir0_csrstorage0_storage1;
	linienmodule_fast_a_iir0_a2 <= linienmodule_fast_a_iir0_csrstorage1_storage1;
	linienmodule_fast_a_iir0_b01 <= linienmodule_fast_a_iir0_csrstorage2_storage1;
	linienmodule_fast_a_iir0_b11 <= linienmodule_fast_a_iir0_csrstorage3_storage;
	linienmodule_fast_a_iir0_b2 <= linienmodule_fast_a_iir0_csrstorage4_storage;
	linienmodule_fast_a_iir0_z0r1 <= (linienmodule_fast_a_iir0_storage1 <<< 5'd23);
	linienmodule_fast_a_iir0_error1 <= linienmodule_fast_a_iir0_railed1;
	linienmodule_fast_a_iir0_y2 <= linienmodule_fast_a_iir0_y_lim1;
	if (linienmodule_fast_a_iir0_clear1) begin
		linienmodule_fast_a_iir0_y3 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_a_iir0_hold1)) begin
			linienmodule_fast_a_iir0_y3 <= linienmodule_fast_a_iir0_y_lim1;
		end
	end
	linienmodule_fast_a_iir0_zr3 <= linienmodule_fast_a_iir0_z0r1;
	linienmodule_fast_a_iir0_zr4 <= linienmodule_fast_a_iir0_z3;
	linienmodule_fast_a_iir0_zr5 <= linienmodule_fast_a_iir0_z4;
	linienmodule_fast_a_iir0_zr6 <= linienmodule_fast_a_iir0_z5;
	linienmodule_fast_a_iir0_zr7 <= linienmodule_fast_a_iir0_z6;
	linienmodule_fast_a_limitcsr0_limit_min1 <= {{3{linienmodule_fast_a_limitcsr0_min_storage1[24]}}, linienmodule_fast_a_limitcsr0_min_storage1};
	linienmodule_fast_a_limitcsr0_limit_max1 <= {{3{linienmodule_fast_a_limitcsr0_max_storage1[24]}}, linienmodule_fast_a_limitcsr0_max_storage1};
	linienmodule_fast_a_limitcsr0_limitcsr0_y1 <= linienmodule_fast_a_limitcsr0_limit_y1;
	linienmodule_fast_a_limitcsr0_limitcsr0_error1 <= linienmodule_fast_a_limitcsr0_limit_railed1;
	linienmodule_fast_a_limitcsr1_limit_min0 <= {{1{linienmodule_fast_a_limitcsr1_min_storage0[24]}}, linienmodule_fast_a_limitcsr1_min_storage0};
	linienmodule_fast_a_limitcsr1_limit_max0 <= {{1{linienmodule_fast_a_limitcsr1_max_storage0[24]}}, linienmodule_fast_a_limitcsr1_max_storage0};
	linienmodule_fast_a_limitcsr1_limitcsr1_y0 <= linienmodule_fast_a_limitcsr1_limit_y0;
	linienmodule_fast_a_limitcsr1_limitcsr1_error0 <= linienmodule_fast_a_limitcsr1_limit_railed0;
	linienmodule_fast_a_iir1_a10 <= linienmodule_fast_a_iir1_csrstorage3_storage;
	linienmodule_fast_a_iir1_b00 <= linienmodule_fast_a_iir1_csrstorage4_storage;
	linienmodule_fast_a_iir1_b10 <= linienmodule_fast_a_iir1_csrstorage5_storage0;
	linienmodule_fast_a_iir1_z0r0 <= (linienmodule_fast_a_iir1_storage0 <<< 5'd23);
	linienmodule_fast_a_iir1_error0 <= linienmodule_fast_a_iir1_railed0;
	linienmodule_fast_a_iir1_y0 <= linienmodule_fast_a_iir1_y_lim0;
	if (linienmodule_fast_a_iir1_clear0) begin
		linienmodule_fast_a_iir1_y1 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_a_iir1_hold0)) begin
			linienmodule_fast_a_iir1_y1 <= linienmodule_fast_a_iir1_y_lim0;
		end
	end
	linienmodule_fast_a_iir1_zr0 <= linienmodule_fast_a_iir1_z0r0;
	linienmodule_fast_a_iir1_zr1 <= linienmodule_fast_a_iir1_z0;
	linienmodule_fast_a_iir1_zr2 <= linienmodule_fast_a_iir1_z1;
	linienmodule_fast_a_iir1_a11 <= linienmodule_fast_a_iir1_csrstorage5_storage1;
	linienmodule_fast_a_iir1_a2 <= linienmodule_fast_a_iir1_csrstorage6_storage;
	linienmodule_fast_a_iir1_b01 <= linienmodule_fast_a_iir1_csrstorage7_storage;
	linienmodule_fast_a_iir1_b11 <= linienmodule_fast_a_iir1_csrstorage8_storage;
	linienmodule_fast_a_iir1_b2 <= linienmodule_fast_a_iir1_csrstorage9_storage;
	linienmodule_fast_a_iir1_z0r1 <= (linienmodule_fast_a_iir1_storage1 <<< 5'd23);
	linienmodule_fast_a_iir1_error1 <= linienmodule_fast_a_iir1_railed1;
	linienmodule_fast_a_iir1_y2 <= linienmodule_fast_a_iir1_y_lim1;
	if (linienmodule_fast_a_iir1_clear1) begin
		linienmodule_fast_a_iir1_y3 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_a_iir1_hold1)) begin
			linienmodule_fast_a_iir1_y3 <= linienmodule_fast_a_iir1_y_lim1;
		end
	end
	linienmodule_fast_a_iir1_zr3 <= linienmodule_fast_a_iir1_z0r1;
	linienmodule_fast_a_iir1_zr4 <= linienmodule_fast_a_iir1_z3;
	linienmodule_fast_a_iir1_zr5 <= linienmodule_fast_a_iir1_z4;
	linienmodule_fast_a_iir1_zr6 <= linienmodule_fast_a_iir1_z5;
	linienmodule_fast_a_iir1_zr7 <= linienmodule_fast_a_iir1_z6;
	linienmodule_fast_a_limitcsr1_limit_min1 <= {{3{linienmodule_fast_a_limitcsr1_min_storage1[24]}}, linienmodule_fast_a_limitcsr1_min_storage1};
	linienmodule_fast_a_limitcsr1_limit_max1 <= {{3{linienmodule_fast_a_limitcsr1_max_storage1[24]}}, linienmodule_fast_a_limitcsr1_max_storage1};
	linienmodule_fast_a_limitcsr1_limitcsr1_y1 <= linienmodule_fast_a_limitcsr1_limit_y1;
	linienmodule_fast_a_limitcsr1_limitcsr1_error1 <= linienmodule_fast_a_limitcsr1_limit_railed1;
	linienmodule_fast_b_ya <= (linienmodule_fast_b_dy >>> 4'd11);
	if (($signed({1'd0, linienmodule_csr3_x_clr_re}) | ($signed({1'd0, linienmodule_max_status3}) < linienmodule_fast_b_x0))) begin
		linienmodule_max_status3 <= linienmodule_fast_b_x0;
	end
	if (($signed({1'd0, linienmodule_csr3_x_clr_re}) | ($signed({1'd0, linienmodule_min_status3}) > linienmodule_fast_b_x0))) begin
		linienmodule_min_status3 <= linienmodule_fast_b_x0;
	end
	if (($signed({1'd0, linienmodule_csr4_out_i_clr_re}) | ($signed({1'd0, linienmodule_max_status4}) < linienmodule_fast_b_out_i))) begin
		linienmodule_max_status4 <= linienmodule_fast_b_out_i;
	end
	if (($signed({1'd0, linienmodule_csr4_out_i_clr_re}) | ($signed({1'd0, linienmodule_min_status4}) > linienmodule_fast_b_out_i))) begin
		linienmodule_min_status4 <= linienmodule_fast_b_out_i;
	end
	if (($signed({1'd0, linienmodule_csr5_out_q_clr_re}) | ($signed({1'd0, linienmodule_max_status5}) < linienmodule_fast_b_out_q))) begin
		linienmodule_max_status5 <= linienmodule_fast_b_out_q;
	end
	if (($signed({1'd0, linienmodule_csr5_out_q_clr_re}) | ($signed({1'd0, linienmodule_min_status5}) > linienmodule_fast_b_out_q))) begin
		linienmodule_min_status5 <= linienmodule_fast_b_out_q;
	end
	linienmodule_fast_b_dx <= sync_self2;
	linienmodule_fast_b_dy <= sync_self3;
	linienmodule_fast_b_cordic1 <= (linienmodule_fast_b_cordic0 + (linienmodule_fast_b_cordic_dir0 ? (linienmodule_fast_b_cordic16 >>> 1'd0) : (-(linienmodule_fast_b_cordic16 >>> 1'd0))));
	linienmodule_fast_b_cordic17 <= (linienmodule_fast_b_cordic16 + (linienmodule_fast_b_cordic_dir0 ? (-(linienmodule_fast_b_cordic0 >>> 1'd0)) : (linienmodule_fast_b_cordic0 >>> 1'd0)));
	linienmodule_fast_b_cordic33 <= (linienmodule_fast_b_cordic32 + (linienmodule_fast_b_cordic_dir0 ? $signed({1'd0, 15'd16384}) : 15'sd16384));
	linienmodule_fast_b_cordic2 <= (linienmodule_fast_b_cordic1 + (linienmodule_fast_b_cordic_dir1 ? (linienmodule_fast_b_cordic17 >>> 1'd1) : (-(linienmodule_fast_b_cordic17 >>> 1'd1))));
	linienmodule_fast_b_cordic18 <= (linienmodule_fast_b_cordic17 + (linienmodule_fast_b_cordic_dir1 ? (-(linienmodule_fast_b_cordic1 >>> 1'd1)) : (linienmodule_fast_b_cordic1 >>> 1'd1)));
	linienmodule_fast_b_cordic34 <= (linienmodule_fast_b_cordic33 + (linienmodule_fast_b_cordic_dir1 ? $signed({1'd0, 14'd9672}) : 15'sd23096));
	linienmodule_fast_b_cordic3 <= (linienmodule_fast_b_cordic2 + (linienmodule_fast_b_cordic_dir2 ? (linienmodule_fast_b_cordic18 >>> 2'd2) : (-(linienmodule_fast_b_cordic18 >>> 2'd2))));
	linienmodule_fast_b_cordic19 <= (linienmodule_fast_b_cordic18 + (linienmodule_fast_b_cordic_dir2 ? (-(linienmodule_fast_b_cordic2 >>> 2'd2)) : (linienmodule_fast_b_cordic2 >>> 2'd2)));
	linienmodule_fast_b_cordic35 <= (linienmodule_fast_b_cordic34 + (linienmodule_fast_b_cordic_dir2 ? $signed({1'd0, 13'd5110}) : 14'sd11274));
	linienmodule_fast_b_cordic4 <= (linienmodule_fast_b_cordic3 + (linienmodule_fast_b_cordic_dir3 ? (linienmodule_fast_b_cordic19 >>> 2'd3) : (-(linienmodule_fast_b_cordic19 >>> 2'd3))));
	linienmodule_fast_b_cordic20 <= (linienmodule_fast_b_cordic19 + (linienmodule_fast_b_cordic_dir3 ? (-(linienmodule_fast_b_cordic3 >>> 2'd3)) : (linienmodule_fast_b_cordic3 >>> 2'd3)));
	linienmodule_fast_b_cordic36 <= (linienmodule_fast_b_cordic35 + (linienmodule_fast_b_cordic_dir3 ? $signed({1'd0, 12'd2594}) : 13'sd5598));
	linienmodule_fast_b_cordic5 <= (linienmodule_fast_b_cordic4 + (linienmodule_fast_b_cordic_dir4 ? (linienmodule_fast_b_cordic20 >>> 3'd4) : (-(linienmodule_fast_b_cordic20 >>> 3'd4))));
	linienmodule_fast_b_cordic21 <= (linienmodule_fast_b_cordic20 + (linienmodule_fast_b_cordic_dir4 ? (-(linienmodule_fast_b_cordic4 >>> 3'd4)) : (linienmodule_fast_b_cordic4 >>> 3'd4)));
	linienmodule_fast_b_cordic37 <= (linienmodule_fast_b_cordic36 + (linienmodule_fast_b_cordic_dir4 ? $signed({1'd0, 11'd1302}) : 12'sd2794));
	linienmodule_fast_b_cordic6 <= (linienmodule_fast_b_cordic5 + (linienmodule_fast_b_cordic_dir5 ? (linienmodule_fast_b_cordic21 >>> 3'd5) : (-(linienmodule_fast_b_cordic21 >>> 3'd5))));
	linienmodule_fast_b_cordic22 <= (linienmodule_fast_b_cordic21 + (linienmodule_fast_b_cordic_dir5 ? (-(linienmodule_fast_b_cordic5 >>> 3'd5)) : (linienmodule_fast_b_cordic5 >>> 3'd5)));
	linienmodule_fast_b_cordic38 <= (linienmodule_fast_b_cordic37 + (linienmodule_fast_b_cordic_dir5 ? $signed({1'd0, 10'd652}) : 11'sd1396));
	linienmodule_fast_b_cordic7 <= (linienmodule_fast_b_cordic6 + (linienmodule_fast_b_cordic_dir6 ? (linienmodule_fast_b_cordic22 >>> 3'd6) : (-(linienmodule_fast_b_cordic22 >>> 3'd6))));
	linienmodule_fast_b_cordic23 <= (linienmodule_fast_b_cordic22 + (linienmodule_fast_b_cordic_dir6 ? (-(linienmodule_fast_b_cordic6 >>> 3'd6)) : (linienmodule_fast_b_cordic6 >>> 3'd6)));
	linienmodule_fast_b_cordic39 <= (linienmodule_fast_b_cordic38 + (linienmodule_fast_b_cordic_dir6 ? $signed({1'd0, 9'd326}) : 10'sd698));
	linienmodule_fast_b_cordic8 <= (linienmodule_fast_b_cordic7 + (linienmodule_fast_b_cordic_dir7 ? (linienmodule_fast_b_cordic23 >>> 3'd7) : (-(linienmodule_fast_b_cordic23 >>> 3'd7))));
	linienmodule_fast_b_cordic24 <= (linienmodule_fast_b_cordic23 + (linienmodule_fast_b_cordic_dir7 ? (-(linienmodule_fast_b_cordic7 >>> 3'd7)) : (linienmodule_fast_b_cordic7 >>> 3'd7)));
	linienmodule_fast_b_cordic40 <= (linienmodule_fast_b_cordic39 + (linienmodule_fast_b_cordic_dir7 ? $signed({1'd0, 8'd163}) : 9'sd349));
	linienmodule_fast_b_cordic9 <= (linienmodule_fast_b_cordic8 + (linienmodule_fast_b_cordic_dir8 ? (linienmodule_fast_b_cordic24 >>> 4'd8) : (-(linienmodule_fast_b_cordic24 >>> 4'd8))));
	linienmodule_fast_b_cordic25 <= (linienmodule_fast_b_cordic24 + (linienmodule_fast_b_cordic_dir8 ? (-(linienmodule_fast_b_cordic8 >>> 4'd8)) : (linienmodule_fast_b_cordic8 >>> 4'd8)));
	linienmodule_fast_b_cordic41 <= (linienmodule_fast_b_cordic40 + (linienmodule_fast_b_cordic_dir8 ? $signed({1'd0, 7'd81}) : 8'sd175));
	linienmodule_fast_b_cordic10 <= (linienmodule_fast_b_cordic9 + (linienmodule_fast_b_cordic_dir9 ? (linienmodule_fast_b_cordic25 >>> 4'd9) : (-(linienmodule_fast_b_cordic25 >>> 4'd9))));
	linienmodule_fast_b_cordic26 <= (linienmodule_fast_b_cordic25 + (linienmodule_fast_b_cordic_dir9 ? (-(linienmodule_fast_b_cordic9 >>> 4'd9)) : (linienmodule_fast_b_cordic9 >>> 4'd9)));
	linienmodule_fast_b_cordic42 <= (linienmodule_fast_b_cordic41 + (linienmodule_fast_b_cordic_dir9 ? $signed({1'd0, 6'd41}) : 7'sd87));
	linienmodule_fast_b_cordic11 <= (linienmodule_fast_b_cordic10 + (linienmodule_fast_b_cordic_dir10 ? (linienmodule_fast_b_cordic26 >>> 4'd10) : (-(linienmodule_fast_b_cordic26 >>> 4'd10))));
	linienmodule_fast_b_cordic27 <= (linienmodule_fast_b_cordic26 + (linienmodule_fast_b_cordic_dir10 ? (-(linienmodule_fast_b_cordic10 >>> 4'd10)) : (linienmodule_fast_b_cordic10 >>> 4'd10)));
	linienmodule_fast_b_cordic43 <= (linienmodule_fast_b_cordic42 + (linienmodule_fast_b_cordic_dir10 ? $signed({1'd0, 5'd20}) : 6'sd44));
	linienmodule_fast_b_cordic12 <= (linienmodule_fast_b_cordic11 + (linienmodule_fast_b_cordic_dir11 ? (linienmodule_fast_b_cordic27 >>> 4'd11) : (-(linienmodule_fast_b_cordic27 >>> 4'd11))));
	linienmodule_fast_b_cordic28 <= (linienmodule_fast_b_cordic27 + (linienmodule_fast_b_cordic_dir11 ? (-(linienmodule_fast_b_cordic11 >>> 4'd11)) : (linienmodule_fast_b_cordic11 >>> 4'd11)));
	linienmodule_fast_b_cordic44 <= (linienmodule_fast_b_cordic43 + (linienmodule_fast_b_cordic_dir11 ? $signed({1'd0, 4'd10}) : 5'sd22));
	linienmodule_fast_b_cordic13 <= (linienmodule_fast_b_cordic12 + (linienmodule_fast_b_cordic_dir12 ? (linienmodule_fast_b_cordic28 >>> 4'd12) : (-(linienmodule_fast_b_cordic28 >>> 4'd12))));
	linienmodule_fast_b_cordic29 <= (linienmodule_fast_b_cordic28 + (linienmodule_fast_b_cordic_dir12 ? (-(linienmodule_fast_b_cordic12 >>> 4'd12)) : (linienmodule_fast_b_cordic12 >>> 4'd12)));
	linienmodule_fast_b_cordic45 <= (linienmodule_fast_b_cordic44 + (linienmodule_fast_b_cordic_dir12 ? $signed({1'd0, 3'd5}) : 4'sd11));
	linienmodule_fast_b_cordic14 <= (linienmodule_fast_b_cordic13 + (linienmodule_fast_b_cordic_dir13 ? (linienmodule_fast_b_cordic29 >>> 4'd13) : (-(linienmodule_fast_b_cordic29 >>> 4'd13))));
	linienmodule_fast_b_cordic30 <= (linienmodule_fast_b_cordic29 + (linienmodule_fast_b_cordic_dir13 ? (-(linienmodule_fast_b_cordic13 >>> 4'd13)) : (linienmodule_fast_b_cordic13 >>> 4'd13)));
	linienmodule_fast_b_cordic46 <= (linienmodule_fast_b_cordic45 + (linienmodule_fast_b_cordic_dir13 ? $signed({1'd0, 2'd3}) : 3'sd5));
	linienmodule_fast_b_cordic15 <= (linienmodule_fast_b_cordic14 + (linienmodule_fast_b_cordic_dir14 ? (linienmodule_fast_b_cordic30 >>> 4'd14) : (-(linienmodule_fast_b_cordic30 >>> 4'd14))));
	linienmodule_fast_b_cordic31 <= (linienmodule_fast_b_cordic30 + (linienmodule_fast_b_cordic_dir14 ? (-(linienmodule_fast_b_cordic14 >>> 4'd14)) : (linienmodule_fast_b_cordic14 >>> 4'd14)));
	linienmodule_fast_b_cordic47 <= (linienmodule_fast_b_cordic46 + (linienmodule_fast_b_cordic_dir14 ? $signed({1'd0, 1'd1}) : 1'sd1));
	linienmodule_fast_b_limitcsr0_limit_min0 <= {{1{linienmodule_fast_b_limitcsr0_min_storage0[24]}}, linienmodule_fast_b_limitcsr0_min_storage0};
	linienmodule_fast_b_limitcsr0_limit_max0 <= {{1{linienmodule_fast_b_limitcsr0_max_storage0[24]}}, linienmodule_fast_b_limitcsr0_max_storage0};
	linienmodule_fast_b_limitcsr0_limitcsr0_y0 <= linienmodule_fast_b_limitcsr0_limit_y0;
	linienmodule_fast_b_limitcsr0_limitcsr0_error0 <= linienmodule_fast_b_limitcsr0_limit_railed0;
	linienmodule_fast_b_iir0_a10 <= linienmodule_fast_b_iir0_csrstorage0_storage0;
	linienmodule_fast_b_iir0_b00 <= linienmodule_fast_b_iir0_csrstorage1_storage0;
	linienmodule_fast_b_iir0_b10 <= linienmodule_fast_b_iir0_csrstorage2_storage0;
	linienmodule_fast_b_iir0_z0r0 <= (linienmodule_fast_b_iir0_storage0 <<< 5'd23);
	linienmodule_fast_b_iir0_error0 <= linienmodule_fast_b_iir0_railed0;
	linienmodule_fast_b_iir0_y0 <= linienmodule_fast_b_iir0_y_lim0;
	if (linienmodule_fast_b_iir0_clear0) begin
		linienmodule_fast_b_iir0_y1 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_b_iir0_hold0)) begin
			linienmodule_fast_b_iir0_y1 <= linienmodule_fast_b_iir0_y_lim0;
		end
	end
	linienmodule_fast_b_iir0_zr0 <= linienmodule_fast_b_iir0_z0r0;
	linienmodule_fast_b_iir0_zr1 <= linienmodule_fast_b_iir0_z0;
	linienmodule_fast_b_iir0_zr2 <= linienmodule_fast_b_iir0_z1;
	linienmodule_fast_b_iir0_a11 <= linienmodule_fast_b_iir0_csrstorage0_storage1;
	linienmodule_fast_b_iir0_a2 <= linienmodule_fast_b_iir0_csrstorage1_storage1;
	linienmodule_fast_b_iir0_b01 <= linienmodule_fast_b_iir0_csrstorage2_storage1;
	linienmodule_fast_b_iir0_b11 <= linienmodule_fast_b_iir0_csrstorage3_storage;
	linienmodule_fast_b_iir0_b2 <= linienmodule_fast_b_iir0_csrstorage4_storage;
	linienmodule_fast_b_iir0_z0r1 <= (linienmodule_fast_b_iir0_storage1 <<< 5'd23);
	linienmodule_fast_b_iir0_error1 <= linienmodule_fast_b_iir0_railed1;
	linienmodule_fast_b_iir0_y2 <= linienmodule_fast_b_iir0_y_lim1;
	if (linienmodule_fast_b_iir0_clear1) begin
		linienmodule_fast_b_iir0_y3 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_b_iir0_hold1)) begin
			linienmodule_fast_b_iir0_y3 <= linienmodule_fast_b_iir0_y_lim1;
		end
	end
	linienmodule_fast_b_iir0_zr3 <= linienmodule_fast_b_iir0_z0r1;
	linienmodule_fast_b_iir0_zr4 <= linienmodule_fast_b_iir0_z3;
	linienmodule_fast_b_iir0_zr5 <= linienmodule_fast_b_iir0_z4;
	linienmodule_fast_b_iir0_zr6 <= linienmodule_fast_b_iir0_z5;
	linienmodule_fast_b_iir0_zr7 <= linienmodule_fast_b_iir0_z6;
	linienmodule_fast_b_limitcsr0_limit_min1 <= {{3{linienmodule_fast_b_limitcsr0_min_storage1[24]}}, linienmodule_fast_b_limitcsr0_min_storage1};
	linienmodule_fast_b_limitcsr0_limit_max1 <= {{3{linienmodule_fast_b_limitcsr0_max_storage1[24]}}, linienmodule_fast_b_limitcsr0_max_storage1};
	linienmodule_fast_b_limitcsr0_limitcsr0_y1 <= linienmodule_fast_b_limitcsr0_limit_y1;
	linienmodule_fast_b_limitcsr0_limitcsr0_error1 <= linienmodule_fast_b_limitcsr0_limit_railed1;
	linienmodule_fast_b_limitcsr1_limit_min0 <= {{1{linienmodule_fast_b_limitcsr1_min_storage0[24]}}, linienmodule_fast_b_limitcsr1_min_storage0};
	linienmodule_fast_b_limitcsr1_limit_max0 <= {{1{linienmodule_fast_b_limitcsr1_max_storage0[24]}}, linienmodule_fast_b_limitcsr1_max_storage0};
	linienmodule_fast_b_limitcsr1_limitcsr1_y0 <= linienmodule_fast_b_limitcsr1_limit_y0;
	linienmodule_fast_b_limitcsr1_limitcsr1_error0 <= linienmodule_fast_b_limitcsr1_limit_railed0;
	linienmodule_fast_b_iir1_a10 <= linienmodule_fast_b_iir1_csrstorage3_storage;
	linienmodule_fast_b_iir1_b00 <= linienmodule_fast_b_iir1_csrstorage4_storage;
	linienmodule_fast_b_iir1_b10 <= linienmodule_fast_b_iir1_csrstorage5_storage0;
	linienmodule_fast_b_iir1_z0r0 <= (linienmodule_fast_b_iir1_storage0 <<< 5'd23);
	linienmodule_fast_b_iir1_error0 <= linienmodule_fast_b_iir1_railed0;
	linienmodule_fast_b_iir1_y0 <= linienmodule_fast_b_iir1_y_lim0;
	if (linienmodule_fast_b_iir1_clear0) begin
		linienmodule_fast_b_iir1_y1 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_b_iir1_hold0)) begin
			linienmodule_fast_b_iir1_y1 <= linienmodule_fast_b_iir1_y_lim0;
		end
	end
	linienmodule_fast_b_iir1_zr0 <= linienmodule_fast_b_iir1_z0r0;
	linienmodule_fast_b_iir1_zr1 <= linienmodule_fast_b_iir1_z0;
	linienmodule_fast_b_iir1_zr2 <= linienmodule_fast_b_iir1_z1;
	linienmodule_fast_b_iir1_a11 <= linienmodule_fast_b_iir1_csrstorage5_storage1;
	linienmodule_fast_b_iir1_a2 <= linienmodule_fast_b_iir1_csrstorage6_storage;
	linienmodule_fast_b_iir1_b01 <= linienmodule_fast_b_iir1_csrstorage7_storage;
	linienmodule_fast_b_iir1_b11 <= linienmodule_fast_b_iir1_csrstorage8_storage;
	linienmodule_fast_b_iir1_b2 <= linienmodule_fast_b_iir1_csrstorage9_storage;
	linienmodule_fast_b_iir1_z0r1 <= (linienmodule_fast_b_iir1_storage1 <<< 5'd23);
	linienmodule_fast_b_iir1_error1 <= linienmodule_fast_b_iir1_railed1;
	linienmodule_fast_b_iir1_y2 <= linienmodule_fast_b_iir1_y_lim1;
	if (linienmodule_fast_b_iir1_clear1) begin
		linienmodule_fast_b_iir1_y3 <= 1'd0;
	end else begin
		if ((~linienmodule_fast_b_iir1_hold1)) begin
			linienmodule_fast_b_iir1_y3 <= linienmodule_fast_b_iir1_y_lim1;
		end
	end
	linienmodule_fast_b_iir1_zr3 <= linienmodule_fast_b_iir1_z0r1;
	linienmodule_fast_b_iir1_zr4 <= linienmodule_fast_b_iir1_z3;
	linienmodule_fast_b_iir1_zr5 <= linienmodule_fast_b_iir1_z4;
	linienmodule_fast_b_iir1_zr6 <= linienmodule_fast_b_iir1_z5;
	linienmodule_fast_b_iir1_zr7 <= linienmodule_fast_b_iir1_z6;
	linienmodule_fast_b_limitcsr1_limit_min1 <= {{3{linienmodule_fast_b_limitcsr1_min_storage1[24]}}, linienmodule_fast_b_limitcsr1_min_storage1};
	linienmodule_fast_b_limitcsr1_limit_max1 <= {{3{linienmodule_fast_b_limitcsr1_max_storage1[24]}}, linienmodule_fast_b_limitcsr1_max_storage1};
	linienmodule_fast_b_limitcsr1_limitcsr1_y1 <= linienmodule_fast_b_limitcsr1_limit_y1;
	linienmodule_fast_b_limitcsr1_limitcsr1_error1 <= linienmodule_fast_b_limitcsr1_limit_railed1;
	if (linienmodule_scopegen_automatically_trigger) begin
		linienmodule_scopegen_automatic_trigger_signal <= (~linienmodule_scopegen_automatic_trigger_signal);
	end else begin
		linienmodule_scopegen_automatic_trigger_signal <= 1'd0;
	end
	if (($signed({1'd0, linienmodule_dac_a_clr_re}) | ($signed({1'd0, linienmodule_max_status7}) < linienmodule_scopegen_dac_a))) begin
		linienmodule_max_status7 <= linienmodule_scopegen_dac_a;
	end
	if (($signed({1'd0, linienmodule_dac_a_clr_re}) | ($signed({1'd0, linienmodule_min_status7}) > linienmodule_scopegen_dac_a))) begin
		linienmodule_min_status7 <= linienmodule_scopegen_dac_a;
	end
	if (($signed({1'd0, linienmodule_dac_b_clr_re}) | ($signed({1'd0, linienmodule_max_status8}) < linienmodule_scopegen_dac_b))) begin
		linienmodule_max_status8 <= linienmodule_scopegen_dac_b;
	end
	if (($signed({1'd0, linienmodule_dac_b_clr_re}) | ($signed({1'd0, linienmodule_min_status8}) > linienmodule_scopegen_dac_b))) begin
		linienmodule_min_status8 <= linienmodule_scopegen_dac_b;
	end
	linienmodule_scopegen_adc_a <= sync_self4;
	linienmodule_scopegen_adc_b <= sync_self5;
	linienmodule_scopegen_adc_a_q <= sync_self6;
	linienmodule_scopegen_adc_b_q <= sync_self7;
	linienmodule_interface0_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank0_sel) begin
		case (linienmodule_interface0_bank_bus_adr[2:0])
			1'd0: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna7_w;
			end
			1'd1: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna6_w;
			end
			2'd2: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna5_w;
			end
			2'd3: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna4_w;
			end
			3'd4: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna3_w;
			end
			3'd5: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna2_w;
			end
			3'd6: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna1_w;
			end
			3'd7: begin
				linienmodule_interface0_bank_bus_dat_r <= linienmodule_csrbank0_dna0_w;
			end
		endcase
	end
	linienmodule_interface1_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank1_sel) begin
		case (linienmodule_interface1_bank_bus_adr[7:0])
			1'd0: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_tap0_w;
			end
			1'd1: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_invert0_w;
			end
			2'd2: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_demod_delay3_w;
			end
			2'd3: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_demod_delay2_w;
			end
			3'd4: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_demod_delay1_w;
			end
			3'd5: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_demod_delay0_w;
			end
			3'd6: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_demod_multiplier0_w;
			end
			3'd7: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_min3_w;
			end
			4'd8: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_min2_w;
			end
			4'd9: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_min1_w;
			end
			4'd10: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_min0_w;
			end
			4'd11: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_max3_w;
			end
			4'd12: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_max2_w;
			end
			4'd13: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_max1_w;
			end
			4'd14: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_1_max0_w;
			end
			4'd15: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_z03_w;
			end
			5'd16: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_z02_w;
			end
			5'd17: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_z01_w;
			end
			5'd18: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_z00_w;
			end
			5'd19: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_a13_w;
			end
			5'd20: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_a12_w;
			end
			5'd21: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_a11_w;
			end
			5'd22: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_a10_w;
			end
			5'd23: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b03_w;
			end
			5'd24: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b02_w;
			end
			5'd25: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b01_w;
			end
			5'd26: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b00_w;
			end
			5'd27: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b13_w;
			end
			5'd28: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b12_w;
			end
			5'd29: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b11_w;
			end
			5'd30: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_1_b10_w;
			end
			5'd31: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_z03_w;
			end
			6'd32: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_z02_w;
			end
			6'd33: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_z01_w;
			end
			6'd34: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_z00_w;
			end
			6'd35: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a13_w;
			end
			6'd36: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a12_w;
			end
			6'd37: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a11_w;
			end
			6'd38: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a10_w;
			end
			6'd39: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a23_w;
			end
			6'd40: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a22_w;
			end
			6'd41: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a21_w;
			end
			6'd42: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_a20_w;
			end
			6'd43: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b03_w;
			end
			6'd44: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b02_w;
			end
			6'd45: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b01_w;
			end
			6'd46: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b00_w;
			end
			6'd47: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b13_w;
			end
			6'd48: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b12_w;
			end
			6'd49: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b11_w;
			end
			6'd50: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b10_w;
			end
			6'd51: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b23_w;
			end
			6'd52: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b22_w;
			end
			6'd53: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b21_w;
			end
			6'd54: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_1_b20_w;
			end
			6'd55: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_min3_w;
			end
			6'd56: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_min2_w;
			end
			6'd57: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_min1_w;
			end
			6'd58: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_min0_w;
			end
			6'd59: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_max3_w;
			end
			6'd60: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_max2_w;
			end
			6'd61: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_max1_w;
			end
			6'd62: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_1_max0_w;
			end
			6'd63: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_min3_w;
			end
			7'd64: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_min2_w;
			end
			7'd65: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_min1_w;
			end
			7'd66: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_min0_w;
			end
			7'd67: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_max3_w;
			end
			7'd68: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_max2_w;
			end
			7'd69: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_max1_w;
			end
			7'd70: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_limit_2_max0_w;
			end
			7'd71: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_z03_w;
			end
			7'd72: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_z02_w;
			end
			7'd73: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_z01_w;
			end
			7'd74: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_z00_w;
			end
			7'd75: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_a13_w;
			end
			7'd76: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_a12_w;
			end
			7'd77: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_a11_w;
			end
			7'd78: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_a10_w;
			end
			7'd79: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b03_w;
			end
			7'd80: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b02_w;
			end
			7'd81: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b01_w;
			end
			7'd82: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b00_w;
			end
			7'd83: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b13_w;
			end
			7'd84: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b12_w;
			end
			7'd85: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b11_w;
			end
			7'd86: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_c_2_b10_w;
			end
			7'd87: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_z03_w;
			end
			7'd88: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_z02_w;
			end
			7'd89: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_z01_w;
			end
			7'd90: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_z00_w;
			end
			7'd91: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a13_w;
			end
			7'd92: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a12_w;
			end
			7'd93: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a11_w;
			end
			7'd94: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a10_w;
			end
			7'd95: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a23_w;
			end
			7'd96: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a22_w;
			end
			7'd97: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a21_w;
			end
			7'd98: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_a20_w;
			end
			7'd99: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b03_w;
			end
			7'd100: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b02_w;
			end
			7'd101: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b01_w;
			end
			7'd102: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b00_w;
			end
			7'd103: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b13_w;
			end
			7'd104: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b12_w;
			end
			7'd105: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b11_w;
			end
			7'd106: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b10_w;
			end
			7'd107: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b23_w;
			end
			7'd108: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b22_w;
			end
			7'd109: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b21_w;
			end
			7'd110: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_iir_d_2_b20_w;
			end
			7'd111: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_min3_w;
			end
			7'd112: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_min2_w;
			end
			7'd113: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_min1_w;
			end
			7'd114: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_min0_w;
			end
			7'd115: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_max3_w;
			end
			7'd116: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_max2_w;
			end
			7'd117: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_max1_w;
			end
			7'd118: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_y_limit_2_max0_w;
			end
			7'd119: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csr0_x_clr_w;
			end
			7'd120: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_max3_w;
			end
			7'd121: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_max2_w;
			end
			7'd122: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_max1_w;
			end
			7'd123: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_max0_w;
			end
			7'd124: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_min3_w;
			end
			7'd125: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_min2_w;
			end
			7'd126: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_min1_w;
			end
			7'd127: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_x_min0_w;
			end
			8'd128: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csr1_out_i_clr_w;
			end
			8'd129: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_max3_w;
			end
			8'd130: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_max2_w;
			end
			8'd131: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_max1_w;
			end
			8'd132: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_max0_w;
			end
			8'd133: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_min3_w;
			end
			8'd134: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_min2_w;
			end
			8'd135: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_min1_w;
			end
			8'd136: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_i_min0_w;
			end
			8'd137: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csr2_out_q_clr_w;
			end
			8'd138: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_max3_w;
			end
			8'd139: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_max2_w;
			end
			8'd140: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_max1_w;
			end
			8'd141: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_max0_w;
			end
			8'd142: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_min3_w;
			end
			8'd143: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_min2_w;
			end
			8'd144: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_min1_w;
			end
			8'd145: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_out_q_min0_w;
			end
			8'd146: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_dx_sel0_w;
			end
			8'd147: begin
				linienmodule_interface1_bank_bus_dat_r <= linienmodule_csrbank1_dy_sel0_w;
			end
		endcase
	end
	if (linienmodule_csrbank1_y_tap0_re) begin
		linienmodule_fast_a_y_tap_storage_full[1:0] <= linienmodule_csrbank1_y_tap0_r;
	end
	linienmodule_fast_a_y_tap_re <= linienmodule_csrbank1_y_tap0_re;
	if (linienmodule_csrbank1_invert0_re) begin
		linienmodule_fast_a_invert_storage_full <= linienmodule_csrbank1_invert0_r;
	end
	linienmodule_fast_a_invert_re <= linienmodule_csrbank1_invert0_re;
	if (linienmodule_csrbank1_demod_delay3_re) begin
		linienmodule_fast_a_delay_storage_full[31:24] <= linienmodule_csrbank1_demod_delay3_r;
	end
	if (linienmodule_csrbank1_demod_delay2_re) begin
		linienmodule_fast_a_delay_storage_full[23:16] <= linienmodule_csrbank1_demod_delay2_r;
	end
	if (linienmodule_csrbank1_demod_delay1_re) begin
		linienmodule_fast_a_delay_storage_full[15:8] <= linienmodule_csrbank1_demod_delay1_r;
	end
	if (linienmodule_csrbank1_demod_delay0_re) begin
		linienmodule_fast_a_delay_storage_full[7:0] <= linienmodule_csrbank1_demod_delay0_r;
	end
	linienmodule_fast_a_delay_re <= linienmodule_csrbank1_demod_delay0_re;
	if (linienmodule_csrbank1_demod_multiplier0_re) begin
		linienmodule_fast_a_multiplier_storage_full[3:0] <= linienmodule_csrbank1_demod_multiplier0_r;
	end
	linienmodule_fast_a_multiplier_re <= linienmodule_csrbank1_demod_multiplier0_re;
	if (linienmodule_csrbank1_x_limit_1_min3_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full0[24] <= linienmodule_csrbank1_x_limit_1_min3_r;
	end
	if (linienmodule_csrbank1_x_limit_1_min2_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full0[23:16] <= linienmodule_csrbank1_x_limit_1_min2_r;
	end
	if (linienmodule_csrbank1_x_limit_1_min1_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full0[15:8] <= linienmodule_csrbank1_x_limit_1_min1_r;
	end
	if (linienmodule_csrbank1_x_limit_1_min0_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full0[7:0] <= linienmodule_csrbank1_x_limit_1_min0_r;
	end
	linienmodule_fast_a_limitcsr0_min_re0 <= linienmodule_csrbank1_x_limit_1_min0_re;
	if (linienmodule_csrbank1_x_limit_1_max3_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full0[24] <= linienmodule_csrbank1_x_limit_1_max3_r;
	end
	if (linienmodule_csrbank1_x_limit_1_max2_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full0[23:16] <= linienmodule_csrbank1_x_limit_1_max2_r;
	end
	if (linienmodule_csrbank1_x_limit_1_max1_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full0[15:8] <= linienmodule_csrbank1_x_limit_1_max1_r;
	end
	if (linienmodule_csrbank1_x_limit_1_max0_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full0[7:0] <= linienmodule_csrbank1_x_limit_1_max0_r;
	end
	linienmodule_fast_a_limitcsr0_max_re0 <= linienmodule_csrbank1_x_limit_1_max0_re;
	if (linienmodule_csrbank1_iir_c_1_z03_re) begin
		linienmodule_fast_a_iir0_storage_full0[26:24] <= linienmodule_csrbank1_iir_c_1_z03_r;
	end
	if (linienmodule_csrbank1_iir_c_1_z02_re) begin
		linienmodule_fast_a_iir0_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_1_z02_r;
	end
	if (linienmodule_csrbank1_iir_c_1_z01_re) begin
		linienmodule_fast_a_iir0_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_1_z01_r;
	end
	if (linienmodule_csrbank1_iir_c_1_z00_re) begin
		linienmodule_fast_a_iir0_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_1_z00_r;
	end
	linienmodule_fast_a_iir0_re0 <= linienmodule_csrbank1_iir_c_1_z00_re;
	if (linienmodule_csrbank1_iir_c_1_a13_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full0[24] <= linienmodule_csrbank1_iir_c_1_a13_r;
	end
	if (linienmodule_csrbank1_iir_c_1_a12_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_1_a12_r;
	end
	if (linienmodule_csrbank1_iir_c_1_a11_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_1_a11_r;
	end
	if (linienmodule_csrbank1_iir_c_1_a10_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_1_a10_r;
	end
	linienmodule_fast_a_iir0_csrstorage0_re0 <= linienmodule_csrbank1_iir_c_1_a10_re;
	if (linienmodule_csrbank1_iir_c_1_b03_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full0[24] <= linienmodule_csrbank1_iir_c_1_b03_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b02_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_1_b02_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b01_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_1_b01_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b00_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_1_b00_r;
	end
	linienmodule_fast_a_iir0_csrstorage1_re0 <= linienmodule_csrbank1_iir_c_1_b00_re;
	if (linienmodule_csrbank1_iir_c_1_b13_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full0[24] <= linienmodule_csrbank1_iir_c_1_b13_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b12_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_1_b12_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b11_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_1_b11_r;
	end
	if (linienmodule_csrbank1_iir_c_1_b10_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_1_b10_r;
	end
	linienmodule_fast_a_iir0_csrstorage2_re0 <= linienmodule_csrbank1_iir_c_1_b10_re;
	if (linienmodule_csrbank1_iir_d_1_z03_re) begin
		linienmodule_fast_a_iir0_storage_full1[26:24] <= linienmodule_csrbank1_iir_d_1_z03_r;
	end
	if (linienmodule_csrbank1_iir_d_1_z02_re) begin
		linienmodule_fast_a_iir0_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_1_z02_r;
	end
	if (linienmodule_csrbank1_iir_d_1_z01_re) begin
		linienmodule_fast_a_iir0_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_1_z01_r;
	end
	if (linienmodule_csrbank1_iir_d_1_z00_re) begin
		linienmodule_fast_a_iir0_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_1_z00_r;
	end
	linienmodule_fast_a_iir0_re1 <= linienmodule_csrbank1_iir_d_1_z00_re;
	if (linienmodule_csrbank1_iir_d_1_a13_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full1[24] <= linienmodule_csrbank1_iir_d_1_a13_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a12_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_1_a12_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a11_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_1_a11_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a10_re) begin
		linienmodule_fast_a_iir0_csrstorage0_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_1_a10_r;
	end
	linienmodule_fast_a_iir0_csrstorage0_re1 <= linienmodule_csrbank1_iir_d_1_a10_re;
	if (linienmodule_csrbank1_iir_d_1_a23_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full1[24] <= linienmodule_csrbank1_iir_d_1_a23_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a22_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_1_a22_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a21_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_1_a21_r;
	end
	if (linienmodule_csrbank1_iir_d_1_a20_re) begin
		linienmodule_fast_a_iir0_csrstorage1_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_1_a20_r;
	end
	linienmodule_fast_a_iir0_csrstorage1_re1 <= linienmodule_csrbank1_iir_d_1_a20_re;
	if (linienmodule_csrbank1_iir_d_1_b03_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full1[24] <= linienmodule_csrbank1_iir_d_1_b03_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b02_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_1_b02_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b01_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_1_b01_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b00_re) begin
		linienmodule_fast_a_iir0_csrstorage2_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_1_b00_r;
	end
	linienmodule_fast_a_iir0_csrstorage2_re1 <= linienmodule_csrbank1_iir_d_1_b00_re;
	if (linienmodule_csrbank1_iir_d_1_b13_re) begin
		linienmodule_fast_a_iir0_csrstorage3_storage_full[24] <= linienmodule_csrbank1_iir_d_1_b13_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b12_re) begin
		linienmodule_fast_a_iir0_csrstorage3_storage_full[23:16] <= linienmodule_csrbank1_iir_d_1_b12_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b11_re) begin
		linienmodule_fast_a_iir0_csrstorage3_storage_full[15:8] <= linienmodule_csrbank1_iir_d_1_b11_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b10_re) begin
		linienmodule_fast_a_iir0_csrstorage3_storage_full[7:0] <= linienmodule_csrbank1_iir_d_1_b10_r;
	end
	linienmodule_fast_a_iir0_csrstorage3_re <= linienmodule_csrbank1_iir_d_1_b10_re;
	if (linienmodule_csrbank1_iir_d_1_b23_re) begin
		linienmodule_fast_a_iir0_csrstorage4_storage_full[24] <= linienmodule_csrbank1_iir_d_1_b23_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b22_re) begin
		linienmodule_fast_a_iir0_csrstorage4_storage_full[23:16] <= linienmodule_csrbank1_iir_d_1_b22_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b21_re) begin
		linienmodule_fast_a_iir0_csrstorage4_storage_full[15:8] <= linienmodule_csrbank1_iir_d_1_b21_r;
	end
	if (linienmodule_csrbank1_iir_d_1_b20_re) begin
		linienmodule_fast_a_iir0_csrstorage4_storage_full[7:0] <= linienmodule_csrbank1_iir_d_1_b20_r;
	end
	linienmodule_fast_a_iir0_csrstorage4_re <= linienmodule_csrbank1_iir_d_1_b20_re;
	if (linienmodule_csrbank1_y_limit_1_min3_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full1[24] <= linienmodule_csrbank1_y_limit_1_min3_r;
	end
	if (linienmodule_csrbank1_y_limit_1_min2_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full1[23:16] <= linienmodule_csrbank1_y_limit_1_min2_r;
	end
	if (linienmodule_csrbank1_y_limit_1_min1_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full1[15:8] <= linienmodule_csrbank1_y_limit_1_min1_r;
	end
	if (linienmodule_csrbank1_y_limit_1_min0_re) begin
		linienmodule_fast_a_limitcsr0_min_storage_full1[7:0] <= linienmodule_csrbank1_y_limit_1_min0_r;
	end
	linienmodule_fast_a_limitcsr0_min_re1 <= linienmodule_csrbank1_y_limit_1_min0_re;
	if (linienmodule_csrbank1_y_limit_1_max3_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full1[24] <= linienmodule_csrbank1_y_limit_1_max3_r;
	end
	if (linienmodule_csrbank1_y_limit_1_max2_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full1[23:16] <= linienmodule_csrbank1_y_limit_1_max2_r;
	end
	if (linienmodule_csrbank1_y_limit_1_max1_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full1[15:8] <= linienmodule_csrbank1_y_limit_1_max1_r;
	end
	if (linienmodule_csrbank1_y_limit_1_max0_re) begin
		linienmodule_fast_a_limitcsr0_max_storage_full1[7:0] <= linienmodule_csrbank1_y_limit_1_max0_r;
	end
	linienmodule_fast_a_limitcsr0_max_re1 <= linienmodule_csrbank1_y_limit_1_max0_re;
	if (linienmodule_csrbank1_x_limit_2_min3_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full0[24] <= linienmodule_csrbank1_x_limit_2_min3_r;
	end
	if (linienmodule_csrbank1_x_limit_2_min2_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full0[23:16] <= linienmodule_csrbank1_x_limit_2_min2_r;
	end
	if (linienmodule_csrbank1_x_limit_2_min1_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full0[15:8] <= linienmodule_csrbank1_x_limit_2_min1_r;
	end
	if (linienmodule_csrbank1_x_limit_2_min0_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full0[7:0] <= linienmodule_csrbank1_x_limit_2_min0_r;
	end
	linienmodule_fast_a_limitcsr1_min_re0 <= linienmodule_csrbank1_x_limit_2_min0_re;
	if (linienmodule_csrbank1_x_limit_2_max3_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full0[24] <= linienmodule_csrbank1_x_limit_2_max3_r;
	end
	if (linienmodule_csrbank1_x_limit_2_max2_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full0[23:16] <= linienmodule_csrbank1_x_limit_2_max2_r;
	end
	if (linienmodule_csrbank1_x_limit_2_max1_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full0[15:8] <= linienmodule_csrbank1_x_limit_2_max1_r;
	end
	if (linienmodule_csrbank1_x_limit_2_max0_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full0[7:0] <= linienmodule_csrbank1_x_limit_2_max0_r;
	end
	linienmodule_fast_a_limitcsr1_max_re0 <= linienmodule_csrbank1_x_limit_2_max0_re;
	if (linienmodule_csrbank1_iir_c_2_z03_re) begin
		linienmodule_fast_a_iir1_storage_full0[26:24] <= linienmodule_csrbank1_iir_c_2_z03_r;
	end
	if (linienmodule_csrbank1_iir_c_2_z02_re) begin
		linienmodule_fast_a_iir1_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_2_z02_r;
	end
	if (linienmodule_csrbank1_iir_c_2_z01_re) begin
		linienmodule_fast_a_iir1_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_2_z01_r;
	end
	if (linienmodule_csrbank1_iir_c_2_z00_re) begin
		linienmodule_fast_a_iir1_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_2_z00_r;
	end
	linienmodule_fast_a_iir1_re0 <= linienmodule_csrbank1_iir_c_2_z00_re;
	if (linienmodule_csrbank1_iir_c_2_a13_re) begin
		linienmodule_fast_a_iir1_csrstorage3_storage_full[24] <= linienmodule_csrbank1_iir_c_2_a13_r;
	end
	if (linienmodule_csrbank1_iir_c_2_a12_re) begin
		linienmodule_fast_a_iir1_csrstorage3_storage_full[23:16] <= linienmodule_csrbank1_iir_c_2_a12_r;
	end
	if (linienmodule_csrbank1_iir_c_2_a11_re) begin
		linienmodule_fast_a_iir1_csrstorage3_storage_full[15:8] <= linienmodule_csrbank1_iir_c_2_a11_r;
	end
	if (linienmodule_csrbank1_iir_c_2_a10_re) begin
		linienmodule_fast_a_iir1_csrstorage3_storage_full[7:0] <= linienmodule_csrbank1_iir_c_2_a10_r;
	end
	linienmodule_fast_a_iir1_csrstorage3_re <= linienmodule_csrbank1_iir_c_2_a10_re;
	if (linienmodule_csrbank1_iir_c_2_b03_re) begin
		linienmodule_fast_a_iir1_csrstorage4_storage_full[24] <= linienmodule_csrbank1_iir_c_2_b03_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b02_re) begin
		linienmodule_fast_a_iir1_csrstorage4_storage_full[23:16] <= linienmodule_csrbank1_iir_c_2_b02_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b01_re) begin
		linienmodule_fast_a_iir1_csrstorage4_storage_full[15:8] <= linienmodule_csrbank1_iir_c_2_b01_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b00_re) begin
		linienmodule_fast_a_iir1_csrstorage4_storage_full[7:0] <= linienmodule_csrbank1_iir_c_2_b00_r;
	end
	linienmodule_fast_a_iir1_csrstorage4_re <= linienmodule_csrbank1_iir_c_2_b00_re;
	if (linienmodule_csrbank1_iir_c_2_b13_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full0[24] <= linienmodule_csrbank1_iir_c_2_b13_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b12_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full0[23:16] <= linienmodule_csrbank1_iir_c_2_b12_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b11_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full0[15:8] <= linienmodule_csrbank1_iir_c_2_b11_r;
	end
	if (linienmodule_csrbank1_iir_c_2_b10_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full0[7:0] <= linienmodule_csrbank1_iir_c_2_b10_r;
	end
	linienmodule_fast_a_iir1_csrstorage5_re0 <= linienmodule_csrbank1_iir_c_2_b10_re;
	if (linienmodule_csrbank1_iir_d_2_z03_re) begin
		linienmodule_fast_a_iir1_storage_full1[26:24] <= linienmodule_csrbank1_iir_d_2_z03_r;
	end
	if (linienmodule_csrbank1_iir_d_2_z02_re) begin
		linienmodule_fast_a_iir1_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_2_z02_r;
	end
	if (linienmodule_csrbank1_iir_d_2_z01_re) begin
		linienmodule_fast_a_iir1_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_2_z01_r;
	end
	if (linienmodule_csrbank1_iir_d_2_z00_re) begin
		linienmodule_fast_a_iir1_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_2_z00_r;
	end
	linienmodule_fast_a_iir1_re1 <= linienmodule_csrbank1_iir_d_2_z00_re;
	if (linienmodule_csrbank1_iir_d_2_a13_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full1[24] <= linienmodule_csrbank1_iir_d_2_a13_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a12_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full1[23:16] <= linienmodule_csrbank1_iir_d_2_a12_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a11_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full1[15:8] <= linienmodule_csrbank1_iir_d_2_a11_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a10_re) begin
		linienmodule_fast_a_iir1_csrstorage5_storage_full1[7:0] <= linienmodule_csrbank1_iir_d_2_a10_r;
	end
	linienmodule_fast_a_iir1_csrstorage5_re1 <= linienmodule_csrbank1_iir_d_2_a10_re;
	if (linienmodule_csrbank1_iir_d_2_a23_re) begin
		linienmodule_fast_a_iir1_csrstorage6_storage_full[24] <= linienmodule_csrbank1_iir_d_2_a23_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a22_re) begin
		linienmodule_fast_a_iir1_csrstorage6_storage_full[23:16] <= linienmodule_csrbank1_iir_d_2_a22_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a21_re) begin
		linienmodule_fast_a_iir1_csrstorage6_storage_full[15:8] <= linienmodule_csrbank1_iir_d_2_a21_r;
	end
	if (linienmodule_csrbank1_iir_d_2_a20_re) begin
		linienmodule_fast_a_iir1_csrstorage6_storage_full[7:0] <= linienmodule_csrbank1_iir_d_2_a20_r;
	end
	linienmodule_fast_a_iir1_csrstorage6_re <= linienmodule_csrbank1_iir_d_2_a20_re;
	if (linienmodule_csrbank1_iir_d_2_b03_re) begin
		linienmodule_fast_a_iir1_csrstorage7_storage_full[24] <= linienmodule_csrbank1_iir_d_2_b03_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b02_re) begin
		linienmodule_fast_a_iir1_csrstorage7_storage_full[23:16] <= linienmodule_csrbank1_iir_d_2_b02_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b01_re) begin
		linienmodule_fast_a_iir1_csrstorage7_storage_full[15:8] <= linienmodule_csrbank1_iir_d_2_b01_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b00_re) begin
		linienmodule_fast_a_iir1_csrstorage7_storage_full[7:0] <= linienmodule_csrbank1_iir_d_2_b00_r;
	end
	linienmodule_fast_a_iir1_csrstorage7_re <= linienmodule_csrbank1_iir_d_2_b00_re;
	if (linienmodule_csrbank1_iir_d_2_b13_re) begin
		linienmodule_fast_a_iir1_csrstorage8_storage_full[24] <= linienmodule_csrbank1_iir_d_2_b13_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b12_re) begin
		linienmodule_fast_a_iir1_csrstorage8_storage_full[23:16] <= linienmodule_csrbank1_iir_d_2_b12_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b11_re) begin
		linienmodule_fast_a_iir1_csrstorage8_storage_full[15:8] <= linienmodule_csrbank1_iir_d_2_b11_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b10_re) begin
		linienmodule_fast_a_iir1_csrstorage8_storage_full[7:0] <= linienmodule_csrbank1_iir_d_2_b10_r;
	end
	linienmodule_fast_a_iir1_csrstorage8_re <= linienmodule_csrbank1_iir_d_2_b10_re;
	if (linienmodule_csrbank1_iir_d_2_b23_re) begin
		linienmodule_fast_a_iir1_csrstorage9_storage_full[24] <= linienmodule_csrbank1_iir_d_2_b23_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b22_re) begin
		linienmodule_fast_a_iir1_csrstorage9_storage_full[23:16] <= linienmodule_csrbank1_iir_d_2_b22_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b21_re) begin
		linienmodule_fast_a_iir1_csrstorage9_storage_full[15:8] <= linienmodule_csrbank1_iir_d_2_b21_r;
	end
	if (linienmodule_csrbank1_iir_d_2_b20_re) begin
		linienmodule_fast_a_iir1_csrstorage9_storage_full[7:0] <= linienmodule_csrbank1_iir_d_2_b20_r;
	end
	linienmodule_fast_a_iir1_csrstorage9_re <= linienmodule_csrbank1_iir_d_2_b20_re;
	if (linienmodule_csrbank1_y_limit_2_min3_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full1[24] <= linienmodule_csrbank1_y_limit_2_min3_r;
	end
	if (linienmodule_csrbank1_y_limit_2_min2_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full1[23:16] <= linienmodule_csrbank1_y_limit_2_min2_r;
	end
	if (linienmodule_csrbank1_y_limit_2_min1_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full1[15:8] <= linienmodule_csrbank1_y_limit_2_min1_r;
	end
	if (linienmodule_csrbank1_y_limit_2_min0_re) begin
		linienmodule_fast_a_limitcsr1_min_storage_full1[7:0] <= linienmodule_csrbank1_y_limit_2_min0_r;
	end
	linienmodule_fast_a_limitcsr1_min_re1 <= linienmodule_csrbank1_y_limit_2_min0_re;
	if (linienmodule_csrbank1_y_limit_2_max3_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full1[24] <= linienmodule_csrbank1_y_limit_2_max3_r;
	end
	if (linienmodule_csrbank1_y_limit_2_max2_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full1[23:16] <= linienmodule_csrbank1_y_limit_2_max2_r;
	end
	if (linienmodule_csrbank1_y_limit_2_max1_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full1[15:8] <= linienmodule_csrbank1_y_limit_2_max1_r;
	end
	if (linienmodule_csrbank1_y_limit_2_max0_re) begin
		linienmodule_fast_a_limitcsr1_max_storage_full1[7:0] <= linienmodule_csrbank1_y_limit_2_max0_r;
	end
	linienmodule_fast_a_limitcsr1_max_re1 <= linienmodule_csrbank1_y_limit_2_max0_re;
	if (linienmodule_csrbank1_dx_sel0_re) begin
		linienmodule_csrstorage8_storage_full[3:0] <= linienmodule_csrbank1_dx_sel0_r;
	end
	linienmodule_csrstorage8_re <= linienmodule_csrbank1_dx_sel0_re;
	if (linienmodule_csrbank1_dy_sel0_re) begin
		linienmodule_csrstorage9_storage_full[3:0] <= linienmodule_csrbank1_dy_sel0_r;
	end
	linienmodule_csrstorage9_re <= linienmodule_csrbank1_dy_sel0_re;
	linienmodule_interface2_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank2_sel) begin
		case (linienmodule_interface2_bank_bus_adr[7:0])
			1'd0: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_tap0_w;
			end
			1'd1: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_invert0_w;
			end
			2'd2: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_demod_delay3_w;
			end
			2'd3: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_demod_delay2_w;
			end
			3'd4: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_demod_delay1_w;
			end
			3'd5: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_demod_delay0_w;
			end
			3'd6: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_demod_multiplier0_w;
			end
			3'd7: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_min3_w;
			end
			4'd8: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_min2_w;
			end
			4'd9: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_min1_w;
			end
			4'd10: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_min0_w;
			end
			4'd11: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_max3_w;
			end
			4'd12: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_max2_w;
			end
			4'd13: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_max1_w;
			end
			4'd14: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_1_max0_w;
			end
			4'd15: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_z03_w;
			end
			5'd16: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_z02_w;
			end
			5'd17: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_z01_w;
			end
			5'd18: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_z00_w;
			end
			5'd19: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_a13_w;
			end
			5'd20: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_a12_w;
			end
			5'd21: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_a11_w;
			end
			5'd22: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_a10_w;
			end
			5'd23: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b03_w;
			end
			5'd24: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b02_w;
			end
			5'd25: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b01_w;
			end
			5'd26: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b00_w;
			end
			5'd27: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b13_w;
			end
			5'd28: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b12_w;
			end
			5'd29: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b11_w;
			end
			5'd30: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_1_b10_w;
			end
			5'd31: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_z03_w;
			end
			6'd32: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_z02_w;
			end
			6'd33: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_z01_w;
			end
			6'd34: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_z00_w;
			end
			6'd35: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a13_w;
			end
			6'd36: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a12_w;
			end
			6'd37: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a11_w;
			end
			6'd38: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a10_w;
			end
			6'd39: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a23_w;
			end
			6'd40: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a22_w;
			end
			6'd41: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a21_w;
			end
			6'd42: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_a20_w;
			end
			6'd43: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b03_w;
			end
			6'd44: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b02_w;
			end
			6'd45: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b01_w;
			end
			6'd46: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b00_w;
			end
			6'd47: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b13_w;
			end
			6'd48: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b12_w;
			end
			6'd49: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b11_w;
			end
			6'd50: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b10_w;
			end
			6'd51: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b23_w;
			end
			6'd52: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b22_w;
			end
			6'd53: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b21_w;
			end
			6'd54: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_1_b20_w;
			end
			6'd55: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_min3_w;
			end
			6'd56: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_min2_w;
			end
			6'd57: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_min1_w;
			end
			6'd58: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_min0_w;
			end
			6'd59: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_max3_w;
			end
			6'd60: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_max2_w;
			end
			6'd61: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_max1_w;
			end
			6'd62: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_1_max0_w;
			end
			6'd63: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_min3_w;
			end
			7'd64: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_min2_w;
			end
			7'd65: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_min1_w;
			end
			7'd66: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_min0_w;
			end
			7'd67: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_max3_w;
			end
			7'd68: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_max2_w;
			end
			7'd69: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_max1_w;
			end
			7'd70: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_limit_2_max0_w;
			end
			7'd71: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_z03_w;
			end
			7'd72: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_z02_w;
			end
			7'd73: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_z01_w;
			end
			7'd74: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_z00_w;
			end
			7'd75: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_a13_w;
			end
			7'd76: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_a12_w;
			end
			7'd77: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_a11_w;
			end
			7'd78: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_a10_w;
			end
			7'd79: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b03_w;
			end
			7'd80: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b02_w;
			end
			7'd81: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b01_w;
			end
			7'd82: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b00_w;
			end
			7'd83: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b13_w;
			end
			7'd84: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b12_w;
			end
			7'd85: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b11_w;
			end
			7'd86: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_c_2_b10_w;
			end
			7'd87: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_z03_w;
			end
			7'd88: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_z02_w;
			end
			7'd89: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_z01_w;
			end
			7'd90: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_z00_w;
			end
			7'd91: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a13_w;
			end
			7'd92: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a12_w;
			end
			7'd93: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a11_w;
			end
			7'd94: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a10_w;
			end
			7'd95: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a23_w;
			end
			7'd96: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a22_w;
			end
			7'd97: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a21_w;
			end
			7'd98: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_a20_w;
			end
			7'd99: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b03_w;
			end
			7'd100: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b02_w;
			end
			7'd101: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b01_w;
			end
			7'd102: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b00_w;
			end
			7'd103: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b13_w;
			end
			7'd104: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b12_w;
			end
			7'd105: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b11_w;
			end
			7'd106: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b10_w;
			end
			7'd107: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b23_w;
			end
			7'd108: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b22_w;
			end
			7'd109: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b21_w;
			end
			7'd110: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_iir_d_2_b20_w;
			end
			7'd111: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_min3_w;
			end
			7'd112: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_min2_w;
			end
			7'd113: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_min1_w;
			end
			7'd114: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_min0_w;
			end
			7'd115: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_max3_w;
			end
			7'd116: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_max2_w;
			end
			7'd117: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_max1_w;
			end
			7'd118: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_y_limit_2_max0_w;
			end
			7'd119: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csr3_x_clr_w;
			end
			7'd120: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_max3_w;
			end
			7'd121: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_max2_w;
			end
			7'd122: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_max1_w;
			end
			7'd123: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_max0_w;
			end
			7'd124: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_min3_w;
			end
			7'd125: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_min2_w;
			end
			7'd126: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_min1_w;
			end
			7'd127: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_x_min0_w;
			end
			8'd128: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csr4_out_i_clr_w;
			end
			8'd129: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_max3_w;
			end
			8'd130: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_max2_w;
			end
			8'd131: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_max1_w;
			end
			8'd132: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_max0_w;
			end
			8'd133: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_min3_w;
			end
			8'd134: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_min2_w;
			end
			8'd135: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_min1_w;
			end
			8'd136: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_i_min0_w;
			end
			8'd137: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csr5_out_q_clr_w;
			end
			8'd138: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_max3_w;
			end
			8'd139: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_max2_w;
			end
			8'd140: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_max1_w;
			end
			8'd141: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_max0_w;
			end
			8'd142: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_min3_w;
			end
			8'd143: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_min2_w;
			end
			8'd144: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_min1_w;
			end
			8'd145: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_out_q_min0_w;
			end
			8'd146: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_dx_sel0_w;
			end
			8'd147: begin
				linienmodule_interface2_bank_bus_dat_r <= linienmodule_csrbank2_dy_sel0_w;
			end
		endcase
	end
	if (linienmodule_csrbank2_y_tap0_re) begin
		linienmodule_fast_b_y_tap_storage_full[1:0] <= linienmodule_csrbank2_y_tap0_r;
	end
	linienmodule_fast_b_y_tap_re <= linienmodule_csrbank2_y_tap0_re;
	if (linienmodule_csrbank2_invert0_re) begin
		linienmodule_fast_b_invert_storage_full <= linienmodule_csrbank2_invert0_r;
	end
	linienmodule_fast_b_invert_re <= linienmodule_csrbank2_invert0_re;
	if (linienmodule_csrbank2_demod_delay3_re) begin
		linienmodule_fast_b_delay_storage_full[31:24] <= linienmodule_csrbank2_demod_delay3_r;
	end
	if (linienmodule_csrbank2_demod_delay2_re) begin
		linienmodule_fast_b_delay_storage_full[23:16] <= linienmodule_csrbank2_demod_delay2_r;
	end
	if (linienmodule_csrbank2_demod_delay1_re) begin
		linienmodule_fast_b_delay_storage_full[15:8] <= linienmodule_csrbank2_demod_delay1_r;
	end
	if (linienmodule_csrbank2_demod_delay0_re) begin
		linienmodule_fast_b_delay_storage_full[7:0] <= linienmodule_csrbank2_demod_delay0_r;
	end
	linienmodule_fast_b_delay_re <= linienmodule_csrbank2_demod_delay0_re;
	if (linienmodule_csrbank2_demod_multiplier0_re) begin
		linienmodule_fast_b_multiplier_storage_full[3:0] <= linienmodule_csrbank2_demod_multiplier0_r;
	end
	linienmodule_fast_b_multiplier_re <= linienmodule_csrbank2_demod_multiplier0_re;
	if (linienmodule_csrbank2_x_limit_1_min3_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full0[24] <= linienmodule_csrbank2_x_limit_1_min3_r;
	end
	if (linienmodule_csrbank2_x_limit_1_min2_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full0[23:16] <= linienmodule_csrbank2_x_limit_1_min2_r;
	end
	if (linienmodule_csrbank2_x_limit_1_min1_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full0[15:8] <= linienmodule_csrbank2_x_limit_1_min1_r;
	end
	if (linienmodule_csrbank2_x_limit_1_min0_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full0[7:0] <= linienmodule_csrbank2_x_limit_1_min0_r;
	end
	linienmodule_fast_b_limitcsr0_min_re0 <= linienmodule_csrbank2_x_limit_1_min0_re;
	if (linienmodule_csrbank2_x_limit_1_max3_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full0[24] <= linienmodule_csrbank2_x_limit_1_max3_r;
	end
	if (linienmodule_csrbank2_x_limit_1_max2_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full0[23:16] <= linienmodule_csrbank2_x_limit_1_max2_r;
	end
	if (linienmodule_csrbank2_x_limit_1_max1_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full0[15:8] <= linienmodule_csrbank2_x_limit_1_max1_r;
	end
	if (linienmodule_csrbank2_x_limit_1_max0_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full0[7:0] <= linienmodule_csrbank2_x_limit_1_max0_r;
	end
	linienmodule_fast_b_limitcsr0_max_re0 <= linienmodule_csrbank2_x_limit_1_max0_re;
	if (linienmodule_csrbank2_iir_c_1_z03_re) begin
		linienmodule_fast_b_iir0_storage_full0[26:24] <= linienmodule_csrbank2_iir_c_1_z03_r;
	end
	if (linienmodule_csrbank2_iir_c_1_z02_re) begin
		linienmodule_fast_b_iir0_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_1_z02_r;
	end
	if (linienmodule_csrbank2_iir_c_1_z01_re) begin
		linienmodule_fast_b_iir0_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_1_z01_r;
	end
	if (linienmodule_csrbank2_iir_c_1_z00_re) begin
		linienmodule_fast_b_iir0_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_1_z00_r;
	end
	linienmodule_fast_b_iir0_re0 <= linienmodule_csrbank2_iir_c_1_z00_re;
	if (linienmodule_csrbank2_iir_c_1_a13_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full0[24] <= linienmodule_csrbank2_iir_c_1_a13_r;
	end
	if (linienmodule_csrbank2_iir_c_1_a12_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_1_a12_r;
	end
	if (linienmodule_csrbank2_iir_c_1_a11_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_1_a11_r;
	end
	if (linienmodule_csrbank2_iir_c_1_a10_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_1_a10_r;
	end
	linienmodule_fast_b_iir0_csrstorage0_re0 <= linienmodule_csrbank2_iir_c_1_a10_re;
	if (linienmodule_csrbank2_iir_c_1_b03_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full0[24] <= linienmodule_csrbank2_iir_c_1_b03_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b02_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_1_b02_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b01_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_1_b01_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b00_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_1_b00_r;
	end
	linienmodule_fast_b_iir0_csrstorage1_re0 <= linienmodule_csrbank2_iir_c_1_b00_re;
	if (linienmodule_csrbank2_iir_c_1_b13_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full0[24] <= linienmodule_csrbank2_iir_c_1_b13_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b12_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_1_b12_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b11_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_1_b11_r;
	end
	if (linienmodule_csrbank2_iir_c_1_b10_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_1_b10_r;
	end
	linienmodule_fast_b_iir0_csrstorage2_re0 <= linienmodule_csrbank2_iir_c_1_b10_re;
	if (linienmodule_csrbank2_iir_d_1_z03_re) begin
		linienmodule_fast_b_iir0_storage_full1[26:24] <= linienmodule_csrbank2_iir_d_1_z03_r;
	end
	if (linienmodule_csrbank2_iir_d_1_z02_re) begin
		linienmodule_fast_b_iir0_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_1_z02_r;
	end
	if (linienmodule_csrbank2_iir_d_1_z01_re) begin
		linienmodule_fast_b_iir0_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_1_z01_r;
	end
	if (linienmodule_csrbank2_iir_d_1_z00_re) begin
		linienmodule_fast_b_iir0_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_1_z00_r;
	end
	linienmodule_fast_b_iir0_re1 <= linienmodule_csrbank2_iir_d_1_z00_re;
	if (linienmodule_csrbank2_iir_d_1_a13_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full1[24] <= linienmodule_csrbank2_iir_d_1_a13_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a12_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_1_a12_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a11_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_1_a11_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a10_re) begin
		linienmodule_fast_b_iir0_csrstorage0_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_1_a10_r;
	end
	linienmodule_fast_b_iir0_csrstorage0_re1 <= linienmodule_csrbank2_iir_d_1_a10_re;
	if (linienmodule_csrbank2_iir_d_1_a23_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full1[24] <= linienmodule_csrbank2_iir_d_1_a23_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a22_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_1_a22_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a21_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_1_a21_r;
	end
	if (linienmodule_csrbank2_iir_d_1_a20_re) begin
		linienmodule_fast_b_iir0_csrstorage1_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_1_a20_r;
	end
	linienmodule_fast_b_iir0_csrstorage1_re1 <= linienmodule_csrbank2_iir_d_1_a20_re;
	if (linienmodule_csrbank2_iir_d_1_b03_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full1[24] <= linienmodule_csrbank2_iir_d_1_b03_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b02_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_1_b02_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b01_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_1_b01_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b00_re) begin
		linienmodule_fast_b_iir0_csrstorage2_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_1_b00_r;
	end
	linienmodule_fast_b_iir0_csrstorage2_re1 <= linienmodule_csrbank2_iir_d_1_b00_re;
	if (linienmodule_csrbank2_iir_d_1_b13_re) begin
		linienmodule_fast_b_iir0_csrstorage3_storage_full[24] <= linienmodule_csrbank2_iir_d_1_b13_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b12_re) begin
		linienmodule_fast_b_iir0_csrstorage3_storage_full[23:16] <= linienmodule_csrbank2_iir_d_1_b12_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b11_re) begin
		linienmodule_fast_b_iir0_csrstorage3_storage_full[15:8] <= linienmodule_csrbank2_iir_d_1_b11_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b10_re) begin
		linienmodule_fast_b_iir0_csrstorage3_storage_full[7:0] <= linienmodule_csrbank2_iir_d_1_b10_r;
	end
	linienmodule_fast_b_iir0_csrstorage3_re <= linienmodule_csrbank2_iir_d_1_b10_re;
	if (linienmodule_csrbank2_iir_d_1_b23_re) begin
		linienmodule_fast_b_iir0_csrstorage4_storage_full[24] <= linienmodule_csrbank2_iir_d_1_b23_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b22_re) begin
		linienmodule_fast_b_iir0_csrstorage4_storage_full[23:16] <= linienmodule_csrbank2_iir_d_1_b22_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b21_re) begin
		linienmodule_fast_b_iir0_csrstorage4_storage_full[15:8] <= linienmodule_csrbank2_iir_d_1_b21_r;
	end
	if (linienmodule_csrbank2_iir_d_1_b20_re) begin
		linienmodule_fast_b_iir0_csrstorage4_storage_full[7:0] <= linienmodule_csrbank2_iir_d_1_b20_r;
	end
	linienmodule_fast_b_iir0_csrstorage4_re <= linienmodule_csrbank2_iir_d_1_b20_re;
	if (linienmodule_csrbank2_y_limit_1_min3_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full1[24] <= linienmodule_csrbank2_y_limit_1_min3_r;
	end
	if (linienmodule_csrbank2_y_limit_1_min2_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full1[23:16] <= linienmodule_csrbank2_y_limit_1_min2_r;
	end
	if (linienmodule_csrbank2_y_limit_1_min1_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full1[15:8] <= linienmodule_csrbank2_y_limit_1_min1_r;
	end
	if (linienmodule_csrbank2_y_limit_1_min0_re) begin
		linienmodule_fast_b_limitcsr0_min_storage_full1[7:0] <= linienmodule_csrbank2_y_limit_1_min0_r;
	end
	linienmodule_fast_b_limitcsr0_min_re1 <= linienmodule_csrbank2_y_limit_1_min0_re;
	if (linienmodule_csrbank2_y_limit_1_max3_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full1[24] <= linienmodule_csrbank2_y_limit_1_max3_r;
	end
	if (linienmodule_csrbank2_y_limit_1_max2_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full1[23:16] <= linienmodule_csrbank2_y_limit_1_max2_r;
	end
	if (linienmodule_csrbank2_y_limit_1_max1_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full1[15:8] <= linienmodule_csrbank2_y_limit_1_max1_r;
	end
	if (linienmodule_csrbank2_y_limit_1_max0_re) begin
		linienmodule_fast_b_limitcsr0_max_storage_full1[7:0] <= linienmodule_csrbank2_y_limit_1_max0_r;
	end
	linienmodule_fast_b_limitcsr0_max_re1 <= linienmodule_csrbank2_y_limit_1_max0_re;
	if (linienmodule_csrbank2_x_limit_2_min3_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full0[24] <= linienmodule_csrbank2_x_limit_2_min3_r;
	end
	if (linienmodule_csrbank2_x_limit_2_min2_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full0[23:16] <= linienmodule_csrbank2_x_limit_2_min2_r;
	end
	if (linienmodule_csrbank2_x_limit_2_min1_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full0[15:8] <= linienmodule_csrbank2_x_limit_2_min1_r;
	end
	if (linienmodule_csrbank2_x_limit_2_min0_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full0[7:0] <= linienmodule_csrbank2_x_limit_2_min0_r;
	end
	linienmodule_fast_b_limitcsr1_min_re0 <= linienmodule_csrbank2_x_limit_2_min0_re;
	if (linienmodule_csrbank2_x_limit_2_max3_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full0[24] <= linienmodule_csrbank2_x_limit_2_max3_r;
	end
	if (linienmodule_csrbank2_x_limit_2_max2_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full0[23:16] <= linienmodule_csrbank2_x_limit_2_max2_r;
	end
	if (linienmodule_csrbank2_x_limit_2_max1_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full0[15:8] <= linienmodule_csrbank2_x_limit_2_max1_r;
	end
	if (linienmodule_csrbank2_x_limit_2_max0_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full0[7:0] <= linienmodule_csrbank2_x_limit_2_max0_r;
	end
	linienmodule_fast_b_limitcsr1_max_re0 <= linienmodule_csrbank2_x_limit_2_max0_re;
	if (linienmodule_csrbank2_iir_c_2_z03_re) begin
		linienmodule_fast_b_iir1_storage_full0[26:24] <= linienmodule_csrbank2_iir_c_2_z03_r;
	end
	if (linienmodule_csrbank2_iir_c_2_z02_re) begin
		linienmodule_fast_b_iir1_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_2_z02_r;
	end
	if (linienmodule_csrbank2_iir_c_2_z01_re) begin
		linienmodule_fast_b_iir1_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_2_z01_r;
	end
	if (linienmodule_csrbank2_iir_c_2_z00_re) begin
		linienmodule_fast_b_iir1_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_2_z00_r;
	end
	linienmodule_fast_b_iir1_re0 <= linienmodule_csrbank2_iir_c_2_z00_re;
	if (linienmodule_csrbank2_iir_c_2_a13_re) begin
		linienmodule_fast_b_iir1_csrstorage3_storage_full[24] <= linienmodule_csrbank2_iir_c_2_a13_r;
	end
	if (linienmodule_csrbank2_iir_c_2_a12_re) begin
		linienmodule_fast_b_iir1_csrstorage3_storage_full[23:16] <= linienmodule_csrbank2_iir_c_2_a12_r;
	end
	if (linienmodule_csrbank2_iir_c_2_a11_re) begin
		linienmodule_fast_b_iir1_csrstorage3_storage_full[15:8] <= linienmodule_csrbank2_iir_c_2_a11_r;
	end
	if (linienmodule_csrbank2_iir_c_2_a10_re) begin
		linienmodule_fast_b_iir1_csrstorage3_storage_full[7:0] <= linienmodule_csrbank2_iir_c_2_a10_r;
	end
	linienmodule_fast_b_iir1_csrstorage3_re <= linienmodule_csrbank2_iir_c_2_a10_re;
	if (linienmodule_csrbank2_iir_c_2_b03_re) begin
		linienmodule_fast_b_iir1_csrstorage4_storage_full[24] <= linienmodule_csrbank2_iir_c_2_b03_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b02_re) begin
		linienmodule_fast_b_iir1_csrstorage4_storage_full[23:16] <= linienmodule_csrbank2_iir_c_2_b02_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b01_re) begin
		linienmodule_fast_b_iir1_csrstorage4_storage_full[15:8] <= linienmodule_csrbank2_iir_c_2_b01_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b00_re) begin
		linienmodule_fast_b_iir1_csrstorage4_storage_full[7:0] <= linienmodule_csrbank2_iir_c_2_b00_r;
	end
	linienmodule_fast_b_iir1_csrstorage4_re <= linienmodule_csrbank2_iir_c_2_b00_re;
	if (linienmodule_csrbank2_iir_c_2_b13_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full0[24] <= linienmodule_csrbank2_iir_c_2_b13_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b12_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full0[23:16] <= linienmodule_csrbank2_iir_c_2_b12_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b11_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full0[15:8] <= linienmodule_csrbank2_iir_c_2_b11_r;
	end
	if (linienmodule_csrbank2_iir_c_2_b10_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full0[7:0] <= linienmodule_csrbank2_iir_c_2_b10_r;
	end
	linienmodule_fast_b_iir1_csrstorage5_re0 <= linienmodule_csrbank2_iir_c_2_b10_re;
	if (linienmodule_csrbank2_iir_d_2_z03_re) begin
		linienmodule_fast_b_iir1_storage_full1[26:24] <= linienmodule_csrbank2_iir_d_2_z03_r;
	end
	if (linienmodule_csrbank2_iir_d_2_z02_re) begin
		linienmodule_fast_b_iir1_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_2_z02_r;
	end
	if (linienmodule_csrbank2_iir_d_2_z01_re) begin
		linienmodule_fast_b_iir1_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_2_z01_r;
	end
	if (linienmodule_csrbank2_iir_d_2_z00_re) begin
		linienmodule_fast_b_iir1_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_2_z00_r;
	end
	linienmodule_fast_b_iir1_re1 <= linienmodule_csrbank2_iir_d_2_z00_re;
	if (linienmodule_csrbank2_iir_d_2_a13_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full1[24] <= linienmodule_csrbank2_iir_d_2_a13_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a12_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full1[23:16] <= linienmodule_csrbank2_iir_d_2_a12_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a11_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full1[15:8] <= linienmodule_csrbank2_iir_d_2_a11_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a10_re) begin
		linienmodule_fast_b_iir1_csrstorage5_storage_full1[7:0] <= linienmodule_csrbank2_iir_d_2_a10_r;
	end
	linienmodule_fast_b_iir1_csrstorage5_re1 <= linienmodule_csrbank2_iir_d_2_a10_re;
	if (linienmodule_csrbank2_iir_d_2_a23_re) begin
		linienmodule_fast_b_iir1_csrstorage6_storage_full[24] <= linienmodule_csrbank2_iir_d_2_a23_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a22_re) begin
		linienmodule_fast_b_iir1_csrstorage6_storage_full[23:16] <= linienmodule_csrbank2_iir_d_2_a22_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a21_re) begin
		linienmodule_fast_b_iir1_csrstorage6_storage_full[15:8] <= linienmodule_csrbank2_iir_d_2_a21_r;
	end
	if (linienmodule_csrbank2_iir_d_2_a20_re) begin
		linienmodule_fast_b_iir1_csrstorage6_storage_full[7:0] <= linienmodule_csrbank2_iir_d_2_a20_r;
	end
	linienmodule_fast_b_iir1_csrstorage6_re <= linienmodule_csrbank2_iir_d_2_a20_re;
	if (linienmodule_csrbank2_iir_d_2_b03_re) begin
		linienmodule_fast_b_iir1_csrstorage7_storage_full[24] <= linienmodule_csrbank2_iir_d_2_b03_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b02_re) begin
		linienmodule_fast_b_iir1_csrstorage7_storage_full[23:16] <= linienmodule_csrbank2_iir_d_2_b02_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b01_re) begin
		linienmodule_fast_b_iir1_csrstorage7_storage_full[15:8] <= linienmodule_csrbank2_iir_d_2_b01_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b00_re) begin
		linienmodule_fast_b_iir1_csrstorage7_storage_full[7:0] <= linienmodule_csrbank2_iir_d_2_b00_r;
	end
	linienmodule_fast_b_iir1_csrstorage7_re <= linienmodule_csrbank2_iir_d_2_b00_re;
	if (linienmodule_csrbank2_iir_d_2_b13_re) begin
		linienmodule_fast_b_iir1_csrstorage8_storage_full[24] <= linienmodule_csrbank2_iir_d_2_b13_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b12_re) begin
		linienmodule_fast_b_iir1_csrstorage8_storage_full[23:16] <= linienmodule_csrbank2_iir_d_2_b12_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b11_re) begin
		linienmodule_fast_b_iir1_csrstorage8_storage_full[15:8] <= linienmodule_csrbank2_iir_d_2_b11_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b10_re) begin
		linienmodule_fast_b_iir1_csrstorage8_storage_full[7:0] <= linienmodule_csrbank2_iir_d_2_b10_r;
	end
	linienmodule_fast_b_iir1_csrstorage8_re <= linienmodule_csrbank2_iir_d_2_b10_re;
	if (linienmodule_csrbank2_iir_d_2_b23_re) begin
		linienmodule_fast_b_iir1_csrstorage9_storage_full[24] <= linienmodule_csrbank2_iir_d_2_b23_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b22_re) begin
		linienmodule_fast_b_iir1_csrstorage9_storage_full[23:16] <= linienmodule_csrbank2_iir_d_2_b22_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b21_re) begin
		linienmodule_fast_b_iir1_csrstorage9_storage_full[15:8] <= linienmodule_csrbank2_iir_d_2_b21_r;
	end
	if (linienmodule_csrbank2_iir_d_2_b20_re) begin
		linienmodule_fast_b_iir1_csrstorage9_storage_full[7:0] <= linienmodule_csrbank2_iir_d_2_b20_r;
	end
	linienmodule_fast_b_iir1_csrstorage9_re <= linienmodule_csrbank2_iir_d_2_b20_re;
	if (linienmodule_csrbank2_y_limit_2_min3_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full1[24] <= linienmodule_csrbank2_y_limit_2_min3_r;
	end
	if (linienmodule_csrbank2_y_limit_2_min2_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full1[23:16] <= linienmodule_csrbank2_y_limit_2_min2_r;
	end
	if (linienmodule_csrbank2_y_limit_2_min1_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full1[15:8] <= linienmodule_csrbank2_y_limit_2_min1_r;
	end
	if (linienmodule_csrbank2_y_limit_2_min0_re) begin
		linienmodule_fast_b_limitcsr1_min_storage_full1[7:0] <= linienmodule_csrbank2_y_limit_2_min0_r;
	end
	linienmodule_fast_b_limitcsr1_min_re1 <= linienmodule_csrbank2_y_limit_2_min0_re;
	if (linienmodule_csrbank2_y_limit_2_max3_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full1[24] <= linienmodule_csrbank2_y_limit_2_max3_r;
	end
	if (linienmodule_csrbank2_y_limit_2_max2_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full1[23:16] <= linienmodule_csrbank2_y_limit_2_max2_r;
	end
	if (linienmodule_csrbank2_y_limit_2_max1_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full1[15:8] <= linienmodule_csrbank2_y_limit_2_max1_r;
	end
	if (linienmodule_csrbank2_y_limit_2_max0_re) begin
		linienmodule_fast_b_limitcsr1_max_storage_full1[7:0] <= linienmodule_csrbank2_y_limit_2_max0_r;
	end
	linienmodule_fast_b_limitcsr1_max_re1 <= linienmodule_csrbank2_y_limit_2_max0_re;
	if (linienmodule_csrbank2_dx_sel0_re) begin
		linienmodule_csrstorage10_storage_full[3:0] <= linienmodule_csrbank2_dx_sel0_r;
	end
	linienmodule_csrstorage10_re <= linienmodule_csrbank2_dx_sel0_re;
	if (linienmodule_csrbank2_dy_sel0_re) begin
		linienmodule_csrstorage11_storage_full[3:0] <= linienmodule_csrbank2_dy_sel0_r;
	end
	linienmodule_csrstorage11_re <= linienmodule_csrbank2_dy_sel0_re;
	linienmodule_interface3_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank3_sel) begin
		case (linienmodule_interface3_bank_bus_adr[4:0])
			1'd0: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_ins_w;
			end
			1'd1: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_outs0_w;
			end
			2'd2: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_oes0_w;
			end
			2'd3: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_state1_w;
			end
			3'd4: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_state0_w;
			end
			3'd5: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_state_clr_w;
			end
			3'd6: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do0_en1_w;
			end
			3'd7: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do0_en0_w;
			end
			4'd8: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do1_en1_w;
			end
			4'd9: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do1_en0_w;
			end
			4'd10: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do2_en1_w;
			end
			4'd11: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do2_en0_w;
			end
			4'd12: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do3_en1_w;
			end
			4'd13: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do3_en0_w;
			end
			4'd14: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do4_en1_w;
			end
			4'd15: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do4_en0_w;
			end
			5'd16: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do5_en1_w;
			end
			5'd17: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do5_en0_w;
			end
			5'd18: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do6_en1_w;
			end
			5'd19: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do6_en0_w;
			end
			5'd20: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do7_en1_w;
			end
			5'd21: begin
				linienmodule_interface3_bank_bus_dat_r <= linienmodule_csrbank3_do7_en0_w;
			end
		endcase
	end
	if (linienmodule_csrbank3_outs0_re) begin
		linienmodule_gpio_n_outs_storage_full[7:0] <= linienmodule_csrbank3_outs0_r;
	end
	linienmodule_gpio_n_outs_re <= linienmodule_csrbank3_outs0_re;
	if (linienmodule_csrbank3_oes0_re) begin
		linienmodule_gpio_n_oes_storage_full[7:0] <= linienmodule_csrbank3_oes0_r;
	end
	linienmodule_gpio_n_oes_re <= linienmodule_csrbank3_oes0_re;
	if (linienmodule_csrbank3_do0_en1_re) begin
		linienmodule_csrstorage0_storage_full1[8] <= linienmodule_csrbank3_do0_en1_r;
	end
	if (linienmodule_csrbank3_do0_en0_re) begin
		linienmodule_csrstorage0_storage_full1[7:0] <= linienmodule_csrbank3_do0_en0_r;
	end
	linienmodule_csrstorage0_re1 <= linienmodule_csrbank3_do0_en0_re;
	if (linienmodule_csrbank3_do1_en1_re) begin
		linienmodule_csrstorage1_storage_full1[8] <= linienmodule_csrbank3_do1_en1_r;
	end
	if (linienmodule_csrbank3_do1_en0_re) begin
		linienmodule_csrstorage1_storage_full1[7:0] <= linienmodule_csrbank3_do1_en0_r;
	end
	linienmodule_csrstorage1_re1 <= linienmodule_csrbank3_do1_en0_re;
	if (linienmodule_csrbank3_do2_en1_re) begin
		linienmodule_csrstorage2_storage_full1[8] <= linienmodule_csrbank3_do2_en1_r;
	end
	if (linienmodule_csrbank3_do2_en0_re) begin
		linienmodule_csrstorage2_storage_full1[7:0] <= linienmodule_csrbank3_do2_en0_r;
	end
	linienmodule_csrstorage2_re1 <= linienmodule_csrbank3_do2_en0_re;
	if (linienmodule_csrbank3_do3_en1_re) begin
		linienmodule_csrstorage3_storage_full[8] <= linienmodule_csrbank3_do3_en1_r;
	end
	if (linienmodule_csrbank3_do3_en0_re) begin
		linienmodule_csrstorage3_storage_full[7:0] <= linienmodule_csrbank3_do3_en0_r;
	end
	linienmodule_csrstorage3_re <= linienmodule_csrbank3_do3_en0_re;
	if (linienmodule_csrbank3_do4_en1_re) begin
		linienmodule_csrstorage4_storage_full[8] <= linienmodule_csrbank3_do4_en1_r;
	end
	if (linienmodule_csrbank3_do4_en0_re) begin
		linienmodule_csrstorage4_storage_full[7:0] <= linienmodule_csrbank3_do4_en0_r;
	end
	linienmodule_csrstorage4_re <= linienmodule_csrbank3_do4_en0_re;
	if (linienmodule_csrbank3_do5_en1_re) begin
		linienmodule_csrstorage5_storage_full[8] <= linienmodule_csrbank3_do5_en1_r;
	end
	if (linienmodule_csrbank3_do5_en0_re) begin
		linienmodule_csrstorage5_storage_full[7:0] <= linienmodule_csrbank3_do5_en0_r;
	end
	linienmodule_csrstorage5_re <= linienmodule_csrbank3_do5_en0_re;
	if (linienmodule_csrbank3_do6_en1_re) begin
		linienmodule_csrstorage6_storage_full[8] <= linienmodule_csrbank3_do6_en1_r;
	end
	if (linienmodule_csrbank3_do6_en0_re) begin
		linienmodule_csrstorage6_storage_full[7:0] <= linienmodule_csrbank3_do6_en0_r;
	end
	linienmodule_csrstorage6_re <= linienmodule_csrbank3_do6_en0_re;
	if (linienmodule_csrbank3_do7_en1_re) begin
		linienmodule_csrstorage7_storage_full[8] <= linienmodule_csrbank3_do7_en1_r;
	end
	if (linienmodule_csrbank3_do7_en0_re) begin
		linienmodule_csrstorage7_storage_full[7:0] <= linienmodule_csrbank3_do7_en0_r;
	end
	linienmodule_csrstorage7_re <= linienmodule_csrbank3_do7_en0_re;
	linienmodule_interface4_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank4_sel) begin
		case (linienmodule_interface4_bank_bus_adr[1:0])
			1'd0: begin
				linienmodule_interface4_bank_bus_dat_r <= linienmodule_csrbank4_ins_w;
			end
			1'd1: begin
				linienmodule_interface4_bank_bus_dat_r <= linienmodule_csrbank4_outs0_w;
			end
			2'd2: begin
				linienmodule_interface4_bank_bus_dat_r <= linienmodule_csrbank4_oes0_w;
			end
		endcase
	end
	if (linienmodule_csrbank4_outs0_re) begin
		linienmodule_gpio_p_outs_storage_full[7:0] <= linienmodule_csrbank4_outs0_r;
	end
	linienmodule_gpio_p_outs_re <= linienmodule_csrbank4_outs0_re;
	if (linienmodule_csrbank4_oes0_re) begin
		linienmodule_gpio_p_oes_storage_full[7:0] <= linienmodule_csrbank4_oes0_r;
	end
	linienmodule_gpio_p_oes_re <= linienmodule_csrbank4_oes0_re;
	linienmodule_interface5_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank5_sel) begin
		case (linienmodule_interface5_bank_bus_adr[7:0])
			1'd0: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_dual_channel0_w;
			end
			1'd1: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_channel0_w;
			end
			2'd2: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_channel0_w;
			end
			2'd3: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_channel0_w;
			end
			3'd4: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_slow_control_channel0_w;
			end
			3'd5: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_only_mode0_w;
			end
			3'd6: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_a_factor1_w;
			end
			3'd7: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_a_factor0_w;
			end
			4'd8: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_b_factor1_w;
			end
			4'd9: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_b_factor0_w;
			end
			4'd10: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_a_offset1_w;
			end
			4'd11: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_a_offset0_w;
			end
			4'd12: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_b_offset1_w;
			end
			4'd13: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_chain_b_offset0_w;
			end
			4'd14: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_offset1_w;
			end
			4'd15: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_offset0_w;
			end
			5'd16: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_out_offset1_w;
			end
			5'd17: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_out_offset0_w;
			end
			5'd18: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_slow_decimation0_w;
			end
			5'd19: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_11_w;
			end
			5'd20: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_10_w;
			end
			5'd21: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_21_w;
			end
			5'd22: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_20_w;
			end
			5'd23: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_31_w;
			end
			5'd24: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_analog_out_30_w;
			end
			5'd25: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_slow_value1_w;
			end
			5'd26: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_slow_value0_w;
			end
			5'd27: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_amp1_w;
			end
			5'd28: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_amp0_w;
			end
			5'd29: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_freq3_w;
			end
			5'd30: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_freq2_w;
			end
			5'd31: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_freq1_w;
			end
			6'd32: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_mod_freq0_w;
			end
			6'd33: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_step3_w;
			end
			6'd34: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_step2_w;
			end
			6'd35: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_step1_w;
			end
			6'd36: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_step0_w;
			end
			6'd37: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_min1_w;
			end
			6'd38: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_min0_w;
			end
			6'd39: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_max1_w;
			end
			6'd40: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_max0_w;
			end
			6'd41: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_run0_w;
			end
			6'd42: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sweep_pause0_w;
			end
			6'd43: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_min3_w;
			end
			6'd44: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_min2_w;
			end
			6'd45: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_min1_w;
			end
			6'd46: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_min0_w;
			end
			6'd47: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_max3_w;
			end
			6'd48: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_max2_w;
			end
			6'd49: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_max1_w;
			end
			6'd50: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_error_signal_max0_w;
			end
			6'd51: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast1_min1_w;
			end
			6'd52: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast1_min0_w;
			end
			6'd53: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast1_max1_w;
			end
			6'd54: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast1_max0_w;
			end
			6'd55: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast2_min1_w;
			end
			6'd56: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast2_min0_w;
			end
			6'd57: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast2_max1_w;
			end
			6'd58: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_limit_fast2_max0_w;
			end
			6'd59: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_setpoint3_w;
			end
			6'd60: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_setpoint2_w;
			end
			6'd61: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_setpoint1_w;
			end
			6'd62: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_setpoint0_w;
			end
			6'd63: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_kp1_w;
			end
			7'd64: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_kp0_w;
			end
			7'd65: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_ki1_w;
			end
			7'd66: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_ki0_w;
			end
			7'd67: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_reset0_w;
			end
			7'd68: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_kd1_w;
			end
			7'd69: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_pid_kd0_w;
			end
			7'd70: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_autolock_fast_target_position1_w;
			end
			7'd71: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_autolock_fast_target_position0_w;
			end
			7'd72: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_autolock_request_lock0_w;
			end
			7'd73: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_autolock_autolock_mode0_w;
			end
			7'd74: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_autolock_lock_running_w;
			end
			7'd75: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_reset_seq0_w;
			end
			7'd76: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_arm0_w;
			end
			7'd77: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_status_1_w;
			end
			7'd78: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_status_2_w;
			end
			7'd79: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_status_3_w;
			end
			7'd80: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_status_4_w;
			end
			7'd81: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_pid_out1_w;
			end
			7'd82: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_pid_out0_w;
			end
			7'd83: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_integrator3_w;
			end
			7'd84: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_integrator2_w;
			end
			7'd85: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_integrator1_w;
			end
			7'd86: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_integrator0_w;
			end
			7'd87: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_sweep_pos1_w;
			end
			7'd88: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_sweep_pos0_w;
			end
			7'd89: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_dac_out1_w;
			end
			7'd90: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_saved_dac_out0_w;
			end
			7'd91: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_addr1_w;
			end
			7'd92: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_addr0_w;
			end
			7'd93: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_data3_w;
			end
			7'd94: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_data2_w;
			end
			7'd95: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_data1_w;
			end
			7'd96: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_data0_w;
			end
			7'd97: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_fsm_reg_wen0_w;
			end
			7'd98: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_awg_reg_addr1_w;
			end
			7'd99: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_awg_reg_addr0_w;
			end
			7'd100: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_awg_reg_data1_w;
			end
			7'd101: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_awg_reg_data0_w;
			end
			7'd102: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_awg_reg_wen0_w;
			end
			7'd103: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_num_blocks_10_w;
			end
			7'd104: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_num_blocks_20_w;
			end
			7'd105: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_num_blocks_30_w;
			end
			7'd106: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_num_blocks_40_w;
			end
			7'd107: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_init_v1_w;
			end
			7'd108: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_sequence_init_v0_w;
			end
			7'd109: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_z03_w;
			end
			7'd110: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_z02_w;
			end
			7'd111: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_z01_w;
			end
			7'd112: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_z00_w;
			end
			7'd113: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a13_w;
			end
			7'd114: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a12_w;
			end
			7'd115: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a11_w;
			end
			7'd116: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a10_w;
			end
			7'd117: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a23_w;
			end
			7'd118: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a22_w;
			end
			7'd119: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a21_w;
			end
			7'd120: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a20_w;
			end
			7'd121: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a33_w;
			end
			7'd122: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a32_w;
			end
			7'd123: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a31_w;
			end
			7'd124: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a30_w;
			end
			7'd125: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a43_w;
			end
			7'd126: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a42_w;
			end
			7'd127: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a41_w;
			end
			8'd128: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a40_w;
			end
			8'd129: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a53_w;
			end
			8'd130: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a52_w;
			end
			8'd131: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a51_w;
			end
			8'd132: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_a50_w;
			end
			8'd133: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b03_w;
			end
			8'd134: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b02_w;
			end
			8'd135: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b01_w;
			end
			8'd136: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b00_w;
			end
			8'd137: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b13_w;
			end
			8'd138: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b12_w;
			end
			8'd139: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b11_w;
			end
			8'd140: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b10_w;
			end
			8'd141: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b23_w;
			end
			8'd142: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b22_w;
			end
			8'd143: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b21_w;
			end
			8'd144: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b20_w;
			end
			8'd145: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b33_w;
			end
			8'd146: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b32_w;
			end
			8'd147: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b31_w;
			end
			8'd148: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b30_w;
			end
			8'd149: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b43_w;
			end
			8'd150: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b42_w;
			end
			8'd151: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b41_w;
			end
			8'd152: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b40_w;
			end
			8'd153: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b53_w;
			end
			8'd154: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b52_w;
			end
			8'd155: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b51_w;
			end
			8'd156: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_raw_acquisition_iir_b50_w;
			end
			8'd157: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_control_signal_clr_w;
			end
			8'd158: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_max3_w;
			end
			8'd159: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_max2_w;
			end
			8'd160: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_max1_w;
			end
			8'd161: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_max0_w;
			end
			8'd162: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_min3_w;
			end
			8'd163: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_min2_w;
			end
			8'd164: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_min1_w;
			end
			8'd165: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_control_signal_min0_w;
			end
			8'd166: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_combined_error_signal_clr_w;
			end
			8'd167: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_max3_w;
			end
			8'd168: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_max2_w;
			end
			8'd169: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_max1_w;
			end
			8'd170: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_max0_w;
			end
			8'd171: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_min3_w;
			end
			8'd172: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_min2_w;
			end
			8'd173: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_min1_w;
			end
			8'd174: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_min0_w;
			end
			8'd175: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_combined_error_signal_filtered_clr_w;
			end
			8'd176: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_max3_w;
			end
			8'd177: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_max2_w;
			end
			8'd178: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_max1_w;
			end
			8'd179: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_max0_w;
			end
			8'd180: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_min3_w;
			end
			8'd181: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_min2_w;
			end
			8'd182: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_min1_w;
			end
			8'd183: begin
				linienmodule_interface5_bank_bus_dat_r <= linienmodule_csrbank5_combined_error_signal_filtered_min0_w;
			end
		endcase
	end
	if (linienmodule_csrbank5_dual_channel0_re) begin
		linienmodule_dual_channel_storage_full <= linienmodule_csrbank5_dual_channel0_r;
	end
	linienmodule_dual_channel_re <= linienmodule_csrbank5_dual_channel0_re;
	if (linienmodule_csrbank5_mod_channel0_re) begin
		linienmodule_mod_channel_storage_full <= linienmodule_csrbank5_mod_channel0_r;
	end
	linienmodule_mod_channel_re <= linienmodule_csrbank5_mod_channel0_re;
	if (linienmodule_csrbank5_control_channel0_re) begin
		linienmodule_control_channel_storage_full <= linienmodule_csrbank5_control_channel0_r;
	end
	linienmodule_control_channel_re <= linienmodule_csrbank5_control_channel0_re;
	if (linienmodule_csrbank5_sweep_channel0_re) begin
		linienmodule_sweep_channel_storage_full[1:0] <= linienmodule_csrbank5_sweep_channel0_r;
	end
	linienmodule_sweep_channel_re <= linienmodule_csrbank5_sweep_channel0_re;
	if (linienmodule_csrbank5_slow_control_channel0_re) begin
		linienmodule_slow_control_channel_storage_full[1:0] <= linienmodule_csrbank5_slow_control_channel0_r;
	end
	linienmodule_slow_control_channel_re <= linienmodule_csrbank5_slow_control_channel0_re;
	if (linienmodule_csrbank5_pid_only_mode0_re) begin
		linienmodule_pid_only_mode_storage_full <= linienmodule_csrbank5_pid_only_mode0_r;
	end
	linienmodule_pid_only_mode_re <= linienmodule_csrbank5_pid_only_mode0_re;
	if (linienmodule_csrbank5_chain_a_factor1_re) begin
		linienmodule_chain_a_factor_storage_full[8] <= linienmodule_csrbank5_chain_a_factor1_r;
	end
	if (linienmodule_csrbank5_chain_a_factor0_re) begin
		linienmodule_chain_a_factor_storage_full[7:0] <= linienmodule_csrbank5_chain_a_factor0_r;
	end
	linienmodule_chain_a_factor_re <= linienmodule_csrbank5_chain_a_factor0_re;
	if (linienmodule_csrbank5_chain_b_factor1_re) begin
		linienmodule_chain_b_factor_storage_full[8] <= linienmodule_csrbank5_chain_b_factor1_r;
	end
	if (linienmodule_csrbank5_chain_b_factor0_re) begin
		linienmodule_chain_b_factor_storage_full[7:0] <= linienmodule_csrbank5_chain_b_factor0_r;
	end
	linienmodule_chain_b_factor_re <= linienmodule_csrbank5_chain_b_factor0_re;
	if (linienmodule_csrbank5_chain_a_offset1_re) begin
		linienmodule_chain_a_offset_storage_full[13:8] <= linienmodule_csrbank5_chain_a_offset1_r;
	end
	if (linienmodule_csrbank5_chain_a_offset0_re) begin
		linienmodule_chain_a_offset_storage_full[7:0] <= linienmodule_csrbank5_chain_a_offset0_r;
	end
	linienmodule_chain_a_offset_re <= linienmodule_csrbank5_chain_a_offset0_re;
	if (linienmodule_csrbank5_chain_b_offset1_re) begin
		linienmodule_chain_b_offset_storage_full[13:8] <= linienmodule_csrbank5_chain_b_offset1_r;
	end
	if (linienmodule_csrbank5_chain_b_offset0_re) begin
		linienmodule_chain_b_offset_storage_full[7:0] <= linienmodule_csrbank5_chain_b_offset0_r;
	end
	linienmodule_chain_b_offset_re <= linienmodule_csrbank5_chain_b_offset0_re;
	if (linienmodule_csrbank5_combined_offset1_re) begin
		linienmodule_combined_offset_storage_full[13:8] <= linienmodule_csrbank5_combined_offset1_r;
	end
	if (linienmodule_csrbank5_combined_offset0_re) begin
		linienmodule_combined_offset_storage_full[7:0] <= linienmodule_csrbank5_combined_offset0_r;
	end
	linienmodule_combined_offset_re <= linienmodule_csrbank5_combined_offset0_re;
	if (linienmodule_csrbank5_out_offset1_re) begin
		linienmodule_out_offset_storage_full[13:8] <= linienmodule_csrbank5_out_offset1_r;
	end
	if (linienmodule_csrbank5_out_offset0_re) begin
		linienmodule_out_offset_storage_full[7:0] <= linienmodule_csrbank5_out_offset0_r;
	end
	linienmodule_out_offset_re <= linienmodule_csrbank5_out_offset0_re;
	if (linienmodule_csrbank5_slow_decimation0_re) begin
		linienmodule_slow_decimation_storage_full[4:0] <= linienmodule_csrbank5_slow_decimation0_r;
	end
	linienmodule_slow_decimation_re <= linienmodule_csrbank5_slow_decimation0_re;
	if (linienmodule_csrbank5_analog_out_11_re) begin
		linienmodule_csrstorage0_storage_full0[14:8] <= linienmodule_csrbank5_analog_out_11_r;
	end
	if (linienmodule_csrbank5_analog_out_10_re) begin
		linienmodule_csrstorage0_storage_full0[7:0] <= linienmodule_csrbank5_analog_out_10_r;
	end
	linienmodule_csrstorage0_re0 <= linienmodule_csrbank5_analog_out_10_re;
	if (linienmodule_csrbank5_analog_out_21_re) begin
		linienmodule_csrstorage1_storage_full0[14:8] <= linienmodule_csrbank5_analog_out_21_r;
	end
	if (linienmodule_csrbank5_analog_out_20_re) begin
		linienmodule_csrstorage1_storage_full0[7:0] <= linienmodule_csrbank5_analog_out_20_r;
	end
	linienmodule_csrstorage1_re0 <= linienmodule_csrbank5_analog_out_20_re;
	if (linienmodule_csrbank5_analog_out_31_re) begin
		linienmodule_csrstorage2_storage_full0[14:8] <= linienmodule_csrbank5_analog_out_31_r;
	end
	if (linienmodule_csrbank5_analog_out_30_re) begin
		linienmodule_csrstorage2_storage_full0[7:0] <= linienmodule_csrbank5_analog_out_30_r;
	end
	linienmodule_csrstorage2_re0 <= linienmodule_csrbank5_analog_out_30_re;
	if (linienmodule_csrbank5_mod_amp1_re) begin
		linienmodule_mod_amp_storage_full[13:8] <= linienmodule_csrbank5_mod_amp1_r;
	end
	if (linienmodule_csrbank5_mod_amp0_re) begin
		linienmodule_mod_amp_storage_full[7:0] <= linienmodule_csrbank5_mod_amp0_r;
	end
	linienmodule_mod_amp_re <= linienmodule_csrbank5_mod_amp0_re;
	if (linienmodule_csrbank5_mod_freq3_re) begin
		linienmodule_mod_freq_storage_full[31:24] <= linienmodule_csrbank5_mod_freq3_r;
	end
	if (linienmodule_csrbank5_mod_freq2_re) begin
		linienmodule_mod_freq_storage_full[23:16] <= linienmodule_csrbank5_mod_freq2_r;
	end
	if (linienmodule_csrbank5_mod_freq1_re) begin
		linienmodule_mod_freq_storage_full[15:8] <= linienmodule_csrbank5_mod_freq1_r;
	end
	if (linienmodule_csrbank5_mod_freq0_re) begin
		linienmodule_mod_freq_storage_full[7:0] <= linienmodule_csrbank5_mod_freq0_r;
	end
	linienmodule_mod_freq_re <= linienmodule_csrbank5_mod_freq0_re;
	if (linienmodule_csrbank5_sweep_step3_re) begin
		linienmodule_sweep_step_storage_full[29:24] <= linienmodule_csrbank5_sweep_step3_r;
	end
	if (linienmodule_csrbank5_sweep_step2_re) begin
		linienmodule_sweep_step_storage_full[23:16] <= linienmodule_csrbank5_sweep_step2_r;
	end
	if (linienmodule_csrbank5_sweep_step1_re) begin
		linienmodule_sweep_step_storage_full[15:8] <= linienmodule_csrbank5_sweep_step1_r;
	end
	if (linienmodule_csrbank5_sweep_step0_re) begin
		linienmodule_sweep_step_storage_full[7:0] <= linienmodule_csrbank5_sweep_step0_r;
	end
	linienmodule_sweep_step_re <= linienmodule_csrbank5_sweep_step0_re;
	if (linienmodule_csrbank5_sweep_min1_re) begin
		linienmodule_sweep_min_storage_full[13:8] <= linienmodule_csrbank5_sweep_min1_r;
	end
	if (linienmodule_csrbank5_sweep_min0_re) begin
		linienmodule_sweep_min_storage_full[7:0] <= linienmodule_csrbank5_sweep_min0_r;
	end
	linienmodule_sweep_min_re <= linienmodule_csrbank5_sweep_min0_re;
	if (linienmodule_csrbank5_sweep_max1_re) begin
		linienmodule_sweep_max_storage_full[13:8] <= linienmodule_csrbank5_sweep_max1_r;
	end
	if (linienmodule_csrbank5_sweep_max0_re) begin
		linienmodule_sweep_max_storage_full[7:0] <= linienmodule_csrbank5_sweep_max0_r;
	end
	linienmodule_sweep_max_re <= linienmodule_csrbank5_sweep_max0_re;
	if (linienmodule_csrbank5_sweep_run0_re) begin
		linienmodule_sweep_run_storage_full <= linienmodule_csrbank5_sweep_run0_r;
	end
	linienmodule_sweep_run_re <= linienmodule_csrbank5_sweep_run0_re;
	if (linienmodule_csrbank5_sweep_pause0_re) begin
		linienmodule_sweep_pause_storage_full <= linienmodule_csrbank5_sweep_pause0_r;
	end
	linienmodule_sweep_pause_re <= linienmodule_csrbank5_sweep_pause0_re;
	if (linienmodule_csrbank5_limit_error_signal_min3_re) begin
		linienmodule_limit_error_signal_min_storage_full[24] <= linienmodule_csrbank5_limit_error_signal_min3_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_min2_re) begin
		linienmodule_limit_error_signal_min_storage_full[23:16] <= linienmodule_csrbank5_limit_error_signal_min2_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_min1_re) begin
		linienmodule_limit_error_signal_min_storage_full[15:8] <= linienmodule_csrbank5_limit_error_signal_min1_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_min0_re) begin
		linienmodule_limit_error_signal_min_storage_full[7:0] <= linienmodule_csrbank5_limit_error_signal_min0_r;
	end
	linienmodule_limit_error_signal_min_re <= linienmodule_csrbank5_limit_error_signal_min0_re;
	if (linienmodule_csrbank5_limit_error_signal_max3_re) begin
		linienmodule_limit_error_signal_max_storage_full[24] <= linienmodule_csrbank5_limit_error_signal_max3_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_max2_re) begin
		linienmodule_limit_error_signal_max_storage_full[23:16] <= linienmodule_csrbank5_limit_error_signal_max2_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_max1_re) begin
		linienmodule_limit_error_signal_max_storage_full[15:8] <= linienmodule_csrbank5_limit_error_signal_max1_r;
	end
	if (linienmodule_csrbank5_limit_error_signal_max0_re) begin
		linienmodule_limit_error_signal_max_storage_full[7:0] <= linienmodule_csrbank5_limit_error_signal_max0_r;
	end
	linienmodule_limit_error_signal_max_re <= linienmodule_csrbank5_limit_error_signal_max0_re;
	if (linienmodule_csrbank5_limit_fast1_min1_re) begin
		linienmodule_limit_fast1_min_storage_full[13:8] <= linienmodule_csrbank5_limit_fast1_min1_r;
	end
	if (linienmodule_csrbank5_limit_fast1_min0_re) begin
		linienmodule_limit_fast1_min_storage_full[7:0] <= linienmodule_csrbank5_limit_fast1_min0_r;
	end
	linienmodule_limit_fast1_min_re <= linienmodule_csrbank5_limit_fast1_min0_re;
	if (linienmodule_csrbank5_limit_fast1_max1_re) begin
		linienmodule_limit_fast1_max_storage_full[13:8] <= linienmodule_csrbank5_limit_fast1_max1_r;
	end
	if (linienmodule_csrbank5_limit_fast1_max0_re) begin
		linienmodule_limit_fast1_max_storage_full[7:0] <= linienmodule_csrbank5_limit_fast1_max0_r;
	end
	linienmodule_limit_fast1_max_re <= linienmodule_csrbank5_limit_fast1_max0_re;
	if (linienmodule_csrbank5_limit_fast2_min1_re) begin
		linienmodule_limit_fast2_min_storage_full[13:8] <= linienmodule_csrbank5_limit_fast2_min1_r;
	end
	if (linienmodule_csrbank5_limit_fast2_min0_re) begin
		linienmodule_limit_fast2_min_storage_full[7:0] <= linienmodule_csrbank5_limit_fast2_min0_r;
	end
	linienmodule_limit_fast2_min_re <= linienmodule_csrbank5_limit_fast2_min0_re;
	if (linienmodule_csrbank5_limit_fast2_max1_re) begin
		linienmodule_limit_fast2_max_storage_full[13:8] <= linienmodule_csrbank5_limit_fast2_max1_r;
	end
	if (linienmodule_csrbank5_limit_fast2_max0_re) begin
		linienmodule_limit_fast2_max_storage_full[7:0] <= linienmodule_csrbank5_limit_fast2_max0_r;
	end
	linienmodule_limit_fast2_max_re <= linienmodule_csrbank5_limit_fast2_max0_re;
	if (linienmodule_csrbank5_pid_setpoint3_re) begin
		linienmodule_pid_setpoint_storage_full[24] <= linienmodule_csrbank5_pid_setpoint3_r;
	end
	if (linienmodule_csrbank5_pid_setpoint2_re) begin
		linienmodule_pid_setpoint_storage_full[23:16] <= linienmodule_csrbank5_pid_setpoint2_r;
	end
	if (linienmodule_csrbank5_pid_setpoint1_re) begin
		linienmodule_pid_setpoint_storage_full[15:8] <= linienmodule_csrbank5_pid_setpoint1_r;
	end
	if (linienmodule_csrbank5_pid_setpoint0_re) begin
		linienmodule_pid_setpoint_storage_full[7:0] <= linienmodule_csrbank5_pid_setpoint0_r;
	end
	linienmodule_pid_setpoint_re <= linienmodule_csrbank5_pid_setpoint0_re;
	if (linienmodule_csrbank5_pid_kp1_re) begin
		linienmodule_pid_kp_storage_full[13:8] <= linienmodule_csrbank5_pid_kp1_r;
	end
	if (linienmodule_csrbank5_pid_kp0_re) begin
		linienmodule_pid_kp_storage_full[7:0] <= linienmodule_csrbank5_pid_kp0_r;
	end
	linienmodule_pid_kp_re <= linienmodule_csrbank5_pid_kp0_re;
	if (linienmodule_csrbank5_pid_ki1_re) begin
		linienmodule_pid_ki_storage_full[13:8] <= linienmodule_csrbank5_pid_ki1_r;
	end
	if (linienmodule_csrbank5_pid_ki0_re) begin
		linienmodule_pid_ki_storage_full[7:0] <= linienmodule_csrbank5_pid_ki0_r;
	end
	linienmodule_pid_ki_re <= linienmodule_csrbank5_pid_ki0_re;
	if (linienmodule_csrbank5_pid_reset0_re) begin
		linienmodule_pid_reset_storage_full <= linienmodule_csrbank5_pid_reset0_r;
	end
	linienmodule_pid_reset_re <= linienmodule_csrbank5_pid_reset0_re;
	if (linienmodule_csrbank5_pid_kd1_re) begin
		linienmodule_pid_kd_storage_full[13:8] <= linienmodule_csrbank5_pid_kd1_r;
	end
	if (linienmodule_csrbank5_pid_kd0_re) begin
		linienmodule_pid_kd_storage_full[7:0] <= linienmodule_csrbank5_pid_kd0_r;
	end
	linienmodule_pid_kd_re <= linienmodule_csrbank5_pid_kd0_re;
	if (linienmodule_csrbank5_autolock_fast_target_position1_re) begin
		linienmodule_autolock_fast_storage_full[13:8] <= linienmodule_csrbank5_autolock_fast_target_position1_r;
	end
	if (linienmodule_csrbank5_autolock_fast_target_position0_re) begin
		linienmodule_autolock_fast_storage_full[7:0] <= linienmodule_csrbank5_autolock_fast_target_position0_r;
	end
	linienmodule_autolock_fast_re <= linienmodule_csrbank5_autolock_fast_target_position0_re;
	if (linienmodule_csrbank5_autolock_request_lock0_re) begin
		linienmodule_autolock_request_lock_storage_full <= linienmodule_csrbank5_autolock_request_lock0_r;
	end
	linienmodule_autolock_request_lock_re <= linienmodule_csrbank5_autolock_request_lock0_re;
	if (linienmodule_csrbank5_autolock_autolock_mode0_re) begin
		linienmodule_autolock_autolock_mode_storage_full[1:0] <= linienmodule_csrbank5_autolock_autolock_mode0_r;
	end
	linienmodule_autolock_autolock_mode_re <= linienmodule_csrbank5_autolock_autolock_mode0_re;
	if (linienmodule_csrbank5_sequence_reset_seq0_re) begin
		linienmodule_sequenceexecutor_reset_seq_storage_full <= linienmodule_csrbank5_sequence_reset_seq0_r;
	end
	linienmodule_sequenceexecutor_reset_seq_re <= linienmodule_csrbank5_sequence_reset_seq0_re;
	if (linienmodule_csrbank5_sequence_arm0_re) begin
		linienmodule_sequenceexecutor_arm_storage_full[3:0] <= linienmodule_csrbank5_sequence_arm0_r;
	end
	linienmodule_sequenceexecutor_arm_re <= linienmodule_csrbank5_sequence_arm0_re;
	if (linienmodule_csrbank5_sequence_fsm_reg_addr1_re) begin
		linienmodule_sequenceexecutor_fsm_reg_addr_storage_full[8] <= linienmodule_csrbank5_sequence_fsm_reg_addr1_r;
	end
	if (linienmodule_csrbank5_sequence_fsm_reg_addr0_re) begin
		linienmodule_sequenceexecutor_fsm_reg_addr_storage_full[7:0] <= linienmodule_csrbank5_sequence_fsm_reg_addr0_r;
	end
	linienmodule_sequenceexecutor_fsm_reg_addr_re <= linienmodule_csrbank5_sequence_fsm_reg_addr0_re;
	if (linienmodule_csrbank5_sequence_fsm_reg_data3_re) begin
		linienmodule_sequenceexecutor_fsm_reg_data_storage_full[31:24] <= linienmodule_csrbank5_sequence_fsm_reg_data3_r;
	end
	if (linienmodule_csrbank5_sequence_fsm_reg_data2_re) begin
		linienmodule_sequenceexecutor_fsm_reg_data_storage_full[23:16] <= linienmodule_csrbank5_sequence_fsm_reg_data2_r;
	end
	if (linienmodule_csrbank5_sequence_fsm_reg_data1_re) begin
		linienmodule_sequenceexecutor_fsm_reg_data_storage_full[15:8] <= linienmodule_csrbank5_sequence_fsm_reg_data1_r;
	end
	if (linienmodule_csrbank5_sequence_fsm_reg_data0_re) begin
		linienmodule_sequenceexecutor_fsm_reg_data_storage_full[7:0] <= linienmodule_csrbank5_sequence_fsm_reg_data0_r;
	end
	linienmodule_sequenceexecutor_fsm_reg_data_re <= linienmodule_csrbank5_sequence_fsm_reg_data0_re;
	if (linienmodule_csrbank5_sequence_fsm_reg_wen0_re) begin
		linienmodule_sequenceexecutor_fsm_reg_wen_storage_full <= linienmodule_csrbank5_sequence_fsm_reg_wen0_r;
	end
	linienmodule_sequenceexecutor_fsm_reg_wen_re <= linienmodule_csrbank5_sequence_fsm_reg_wen0_re;
	if (linienmodule_csrbank5_sequence_awg_reg_addr1_re) begin
		linienmodule_sequenceexecutor_awg_reg_addr_storage_full[9:8] <= linienmodule_csrbank5_sequence_awg_reg_addr1_r;
	end
	if (linienmodule_csrbank5_sequence_awg_reg_addr0_re) begin
		linienmodule_sequenceexecutor_awg_reg_addr_storage_full[7:0] <= linienmodule_csrbank5_sequence_awg_reg_addr0_r;
	end
	linienmodule_sequenceexecutor_awg_reg_addr_re <= linienmodule_csrbank5_sequence_awg_reg_addr0_re;
	if (linienmodule_csrbank5_sequence_awg_reg_data1_re) begin
		linienmodule_sequenceexecutor_awg_reg_data_storage_full[13:8] <= linienmodule_csrbank5_sequence_awg_reg_data1_r;
	end
	if (linienmodule_csrbank5_sequence_awg_reg_data0_re) begin
		linienmodule_sequenceexecutor_awg_reg_data_storage_full[7:0] <= linienmodule_csrbank5_sequence_awg_reg_data0_r;
	end
	linienmodule_sequenceexecutor_awg_reg_data_re <= linienmodule_csrbank5_sequence_awg_reg_data0_re;
	if (linienmodule_csrbank5_sequence_awg_reg_wen0_re) begin
		linienmodule_sequenceexecutor_awg_reg_wen_storage_full <= linienmodule_csrbank5_sequence_awg_reg_wen0_r;
	end
	linienmodule_sequenceexecutor_awg_reg_wen_re <= linienmodule_csrbank5_sequence_awg_reg_wen0_re;
	if (linienmodule_csrbank5_sequence_num_blocks_10_re) begin
		linienmodule_sequenceexecutor_num_blocks_1_storage_full[3:0] <= linienmodule_csrbank5_sequence_num_blocks_10_r;
	end
	linienmodule_sequenceexecutor_num_blocks_1_re <= linienmodule_csrbank5_sequence_num_blocks_10_re;
	if (linienmodule_csrbank5_sequence_num_blocks_20_re) begin
		linienmodule_sequenceexecutor_num_blocks_2_storage_full[3:0] <= linienmodule_csrbank5_sequence_num_blocks_20_r;
	end
	linienmodule_sequenceexecutor_num_blocks_2_re <= linienmodule_csrbank5_sequence_num_blocks_20_re;
	if (linienmodule_csrbank5_sequence_num_blocks_30_re) begin
		linienmodule_sequenceexecutor_num_blocks_3_storage_full[3:0] <= linienmodule_csrbank5_sequence_num_blocks_30_r;
	end
	linienmodule_sequenceexecutor_num_blocks_3_re <= linienmodule_csrbank5_sequence_num_blocks_30_re;
	if (linienmodule_csrbank5_sequence_num_blocks_40_re) begin
		linienmodule_sequenceexecutor_num_blocks_4_storage_full[3:0] <= linienmodule_csrbank5_sequence_num_blocks_40_r;
	end
	linienmodule_sequenceexecutor_num_blocks_4_re <= linienmodule_csrbank5_sequence_num_blocks_40_re;
	if (linienmodule_csrbank5_sequence_init_v1_re) begin
		linienmodule_sequenceexecutor_init_v_storage_full[13:8] <= linienmodule_csrbank5_sequence_init_v1_r;
	end
	if (linienmodule_csrbank5_sequence_init_v0_re) begin
		linienmodule_sequenceexecutor_init_v_storage_full[7:0] <= linienmodule_csrbank5_sequence_init_v0_r;
	end
	linienmodule_sequenceexecutor_init_v_re <= linienmodule_csrbank5_sequence_init_v0_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_z03_re) begin
		linienmodule_raw_acquisition_iir_storage_full[26:24] <= linienmodule_csrbank5_raw_acquisition_iir_z03_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_z02_re) begin
		linienmodule_raw_acquisition_iir_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_z02_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_z01_re) begin
		linienmodule_raw_acquisition_iir_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_z01_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_z00_re) begin
		linienmodule_raw_acquisition_iir_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_z00_r;
	end
	linienmodule_raw_acquisition_iir_re <= linienmodule_csrbank5_raw_acquisition_iir_z00_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_a13_re) begin
		linienmodule_raw_acquisition_iir_csrstorage0_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_a13_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a12_re) begin
		linienmodule_raw_acquisition_iir_csrstorage0_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_a12_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a11_re) begin
		linienmodule_raw_acquisition_iir_csrstorage0_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_a11_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a10_re) begin
		linienmodule_raw_acquisition_iir_csrstorage0_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_a10_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage0_re <= linienmodule_csrbank5_raw_acquisition_iir_a10_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_a23_re) begin
		linienmodule_raw_acquisition_iir_csrstorage1_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_a23_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a22_re) begin
		linienmodule_raw_acquisition_iir_csrstorage1_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_a22_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a21_re) begin
		linienmodule_raw_acquisition_iir_csrstorage1_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_a21_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a20_re) begin
		linienmodule_raw_acquisition_iir_csrstorage1_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_a20_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage1_re <= linienmodule_csrbank5_raw_acquisition_iir_a20_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_a33_re) begin
		linienmodule_raw_acquisition_iir_csrstorage2_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_a33_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a32_re) begin
		linienmodule_raw_acquisition_iir_csrstorage2_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_a32_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a31_re) begin
		linienmodule_raw_acquisition_iir_csrstorage2_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_a31_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a30_re) begin
		linienmodule_raw_acquisition_iir_csrstorage2_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_a30_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage2_re <= linienmodule_csrbank5_raw_acquisition_iir_a30_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_a43_re) begin
		linienmodule_raw_acquisition_iir_csrstorage3_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_a43_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a42_re) begin
		linienmodule_raw_acquisition_iir_csrstorage3_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_a42_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a41_re) begin
		linienmodule_raw_acquisition_iir_csrstorage3_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_a41_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a40_re) begin
		linienmodule_raw_acquisition_iir_csrstorage3_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_a40_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage3_re <= linienmodule_csrbank5_raw_acquisition_iir_a40_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_a53_re) begin
		linienmodule_raw_acquisition_iir_csrstorage4_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_a53_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a52_re) begin
		linienmodule_raw_acquisition_iir_csrstorage4_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_a52_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a51_re) begin
		linienmodule_raw_acquisition_iir_csrstorage4_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_a51_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_a50_re) begin
		linienmodule_raw_acquisition_iir_csrstorage4_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_a50_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage4_re <= linienmodule_csrbank5_raw_acquisition_iir_a50_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b03_re) begin
		linienmodule_raw_acquisition_iir_csrstorage5_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b03_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b02_re) begin
		linienmodule_raw_acquisition_iir_csrstorage5_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b02_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b01_re) begin
		linienmodule_raw_acquisition_iir_csrstorage5_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b01_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b00_re) begin
		linienmodule_raw_acquisition_iir_csrstorage5_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b00_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage5_re <= linienmodule_csrbank5_raw_acquisition_iir_b00_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b13_re) begin
		linienmodule_raw_acquisition_iir_csrstorage6_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b13_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b12_re) begin
		linienmodule_raw_acquisition_iir_csrstorage6_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b12_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b11_re) begin
		linienmodule_raw_acquisition_iir_csrstorage6_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b11_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b10_re) begin
		linienmodule_raw_acquisition_iir_csrstorage6_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b10_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage6_re <= linienmodule_csrbank5_raw_acquisition_iir_b10_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b23_re) begin
		linienmodule_raw_acquisition_iir_csrstorage7_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b23_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b22_re) begin
		linienmodule_raw_acquisition_iir_csrstorage7_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b22_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b21_re) begin
		linienmodule_raw_acquisition_iir_csrstorage7_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b21_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b20_re) begin
		linienmodule_raw_acquisition_iir_csrstorage7_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b20_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage7_re <= linienmodule_csrbank5_raw_acquisition_iir_b20_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b33_re) begin
		linienmodule_raw_acquisition_iir_csrstorage8_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b33_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b32_re) begin
		linienmodule_raw_acquisition_iir_csrstorage8_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b32_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b31_re) begin
		linienmodule_raw_acquisition_iir_csrstorage8_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b31_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b30_re) begin
		linienmodule_raw_acquisition_iir_csrstorage8_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b30_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage8_re <= linienmodule_csrbank5_raw_acquisition_iir_b30_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b43_re) begin
		linienmodule_raw_acquisition_iir_csrstorage9_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b43_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b42_re) begin
		linienmodule_raw_acquisition_iir_csrstorage9_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b42_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b41_re) begin
		linienmodule_raw_acquisition_iir_csrstorage9_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b41_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b40_re) begin
		linienmodule_raw_acquisition_iir_csrstorage9_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b40_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage9_re <= linienmodule_csrbank5_raw_acquisition_iir_b40_re;
	if (linienmodule_csrbank5_raw_acquisition_iir_b53_re) begin
		linienmodule_raw_acquisition_iir_csrstorage10_storage_full[24] <= linienmodule_csrbank5_raw_acquisition_iir_b53_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b52_re) begin
		linienmodule_raw_acquisition_iir_csrstorage10_storage_full[23:16] <= linienmodule_csrbank5_raw_acquisition_iir_b52_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b51_re) begin
		linienmodule_raw_acquisition_iir_csrstorage10_storage_full[15:8] <= linienmodule_csrbank5_raw_acquisition_iir_b51_r;
	end
	if (linienmodule_csrbank5_raw_acquisition_iir_b50_re) begin
		linienmodule_raw_acquisition_iir_csrstorage10_storage_full[7:0] <= linienmodule_csrbank5_raw_acquisition_iir_b50_r;
	end
	linienmodule_raw_acquisition_iir_csrstorage10_re <= linienmodule_csrbank5_raw_acquisition_iir_b50_re;
	linienmodule_interface6_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank6_sel) begin
		case (linienmodule_interface6_bank_bus_adr[4:0])
			1'd0: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_external_trigger0_w;
			end
			1'd1: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_dac_a_clr_w;
			end
			2'd2: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_max3_w;
			end
			2'd3: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_max2_w;
			end
			3'd4: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_max1_w;
			end
			3'd5: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_max0_w;
			end
			3'd6: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_min3_w;
			end
			3'd7: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_min2_w;
			end
			4'd8: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_min1_w;
			end
			4'd9: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_a_min0_w;
			end
			4'd10: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_dac_b_clr_w;
			end
			4'd11: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_max3_w;
			end
			4'd12: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_max2_w;
			end
			4'd13: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_max1_w;
			end
			4'd14: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_max0_w;
			end
			4'd15: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_min3_w;
			end
			5'd16: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_min2_w;
			end
			5'd17: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_min1_w;
			end
			5'd18: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_dac_b_min0_w;
			end
			5'd19: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_adc_a_sel0_w;
			end
			5'd20: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_adc_b_sel0_w;
			end
			5'd21: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_adc_a_q_sel0_w;
			end
			5'd22: begin
				linienmodule_interface6_bank_bus_dat_r <= linienmodule_csrbank6_adc_b_q_sel0_w;
			end
		endcase
	end
	if (linienmodule_csrbank6_external_trigger0_re) begin
		linienmodule_scopegen_storage_full <= linienmodule_csrbank6_external_trigger0_r;
	end
	linienmodule_scopegen_re <= linienmodule_csrbank6_external_trigger0_re;
	if (linienmodule_csrbank6_adc_a_sel0_re) begin
		linienmodule_csrstorage12_storage_full[3:0] <= linienmodule_csrbank6_adc_a_sel0_r;
	end
	linienmodule_csrstorage12_re <= linienmodule_csrbank6_adc_a_sel0_re;
	if (linienmodule_csrbank6_adc_b_sel0_re) begin
		linienmodule_csrstorage13_storage_full[3:0] <= linienmodule_csrbank6_adc_b_sel0_r;
	end
	linienmodule_csrstorage13_re <= linienmodule_csrbank6_adc_b_sel0_re;
	if (linienmodule_csrbank6_adc_a_q_sel0_re) begin
		linienmodule_csrstorage14_storage_full[3:0] <= linienmodule_csrbank6_adc_a_q_sel0_r;
	end
	linienmodule_csrstorage14_re <= linienmodule_csrbank6_adc_a_q_sel0_re;
	if (linienmodule_csrbank6_adc_b_q_sel0_re) begin
		linienmodule_csrstorage15_storage_full[3:0] <= linienmodule_csrbank6_adc_b_q_sel0_r;
	end
	linienmodule_csrstorage15_re <= linienmodule_csrbank6_adc_b_q_sel0_re;
	linienmodule_interface7_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank7_sel) begin
		case (linienmodule_interface7_bank_bus_adr[4:0])
			1'd0: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_setpoint1_w;
			end
			1'd1: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_setpoint0_w;
			end
			2'd2: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_kp1_w;
			end
			2'd3: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_kp0_w;
			end
			3'd4: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_ki1_w;
			end
			3'd5: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_ki0_w;
			end
			3'd6: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_reset0_w;
			end
			3'd7: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_kd1_w;
			end
			4'd8: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_pid_kd0_w;
			end
			4'd9: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_limit_min1_w;
			end
			4'd10: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_limit_min0_w;
			end
			4'd11: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_limit_max1_w;
			end
			4'd12: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_limit_max0_w;
			end
			4'd13: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_out_clr_w;
			end
			4'd14: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_max3_w;
			end
			4'd15: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_max2_w;
			end
			5'd16: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_max1_w;
			end
			5'd17: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_max0_w;
			end
			5'd18: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_min3_w;
			end
			5'd19: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_min2_w;
			end
			5'd20: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_min1_w;
			end
			5'd21: begin
				linienmodule_interface7_bank_bus_dat_r <= linienmodule_csrbank7_out_min0_w;
			end
		endcase
	end
	if (linienmodule_csrbank7_pid_setpoint1_re) begin
		linienmodule_slowchain_setpoint_storage_full[13:8] <= linienmodule_csrbank7_pid_setpoint1_r;
	end
	if (linienmodule_csrbank7_pid_setpoint0_re) begin
		linienmodule_slowchain_setpoint_storage_full[7:0] <= linienmodule_csrbank7_pid_setpoint0_r;
	end
	linienmodule_slowchain_setpoint_re <= linienmodule_csrbank7_pid_setpoint0_re;
	if (linienmodule_csrbank7_pid_kp1_re) begin
		linienmodule_slowchain_kp_storage_full[13:8] <= linienmodule_csrbank7_pid_kp1_r;
	end
	if (linienmodule_csrbank7_pid_kp0_re) begin
		linienmodule_slowchain_kp_storage_full[7:0] <= linienmodule_csrbank7_pid_kp0_r;
	end
	linienmodule_slowchain_kp_re <= linienmodule_csrbank7_pid_kp0_re;
	if (linienmodule_csrbank7_pid_ki1_re) begin
		linienmodule_slowchain_ki_storage_full[13:8] <= linienmodule_csrbank7_pid_ki1_r;
	end
	if (linienmodule_csrbank7_pid_ki0_re) begin
		linienmodule_slowchain_ki_storage_full[7:0] <= linienmodule_csrbank7_pid_ki0_r;
	end
	linienmodule_slowchain_ki_re <= linienmodule_csrbank7_pid_ki0_re;
	if (linienmodule_csrbank7_pid_reset0_re) begin
		linienmodule_slowchain_reset_storage_full <= linienmodule_csrbank7_pid_reset0_r;
	end
	linienmodule_slowchain_reset_re <= linienmodule_csrbank7_pid_reset0_re;
	if (linienmodule_csrbank7_pid_kd1_re) begin
		linienmodule_slowchain_kd_storage_full[13:8] <= linienmodule_csrbank7_pid_kd1_r;
	end
	if (linienmodule_csrbank7_pid_kd0_re) begin
		linienmodule_slowchain_kd_storage_full[7:0] <= linienmodule_csrbank7_pid_kd0_r;
	end
	linienmodule_slowchain_kd_re <= linienmodule_csrbank7_pid_kd0_re;
	if (linienmodule_csrbank7_limit_min1_re) begin
		linienmodule_slowchain_min_storage_full[13:8] <= linienmodule_csrbank7_limit_min1_r;
	end
	if (linienmodule_csrbank7_limit_min0_re) begin
		linienmodule_slowchain_min_storage_full[7:0] <= linienmodule_csrbank7_limit_min0_r;
	end
	linienmodule_slowchain_min_re <= linienmodule_csrbank7_limit_min0_re;
	if (linienmodule_csrbank7_limit_max1_re) begin
		linienmodule_slowchain_max_storage_full[13:8] <= linienmodule_csrbank7_limit_max1_r;
	end
	if (linienmodule_csrbank7_limit_max0_re) begin
		linienmodule_slowchain_max_storage_full[7:0] <= linienmodule_csrbank7_limit_max0_r;
	end
	linienmodule_slowchain_max_re <= linienmodule_csrbank7_limit_max0_re;
	linienmodule_interface8_bank_bus_dat_r <= 1'd0;
	if (linienmodule_csrbank8_sel) begin
		case (linienmodule_interface8_bank_bus_adr[3:0])
			1'd0: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_temp1_w;
			end
			1'd1: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_temp0_w;
			end
			2'd2: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_v1_w;
			end
			2'd3: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_v0_w;
			end
			3'd4: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_a1_w;
			end
			3'd5: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_a0_w;
			end
			3'd6: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_b1_w;
			end
			3'd7: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_b0_w;
			end
			4'd8: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_c1_w;
			end
			4'd9: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_c0_w;
			end
			4'd10: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_d1_w;
			end
			4'd11: begin
				linienmodule_interface8_bank_bus_dat_r <= linienmodule_csrbank8_d0_w;
			end
		endcase
	end
	linienmodule_stb <= (linienmodule_sys_wen | linienmodule_sys_ren);
	linienmodule_csr_adr <= linienmodule_sys_addr[31:2];
	linienmodule_csr_we <= linienmodule_sys_wen;
	linienmodule_csr_dat_w <= linienmodule_sys_wdata;
	linienmodule_sys_ack <= linienmodule_stb;
	linienmodule_sys_rdata <= linienmodule_csr_dat_r;
	if (sys_rst) begin
		linienmodule_dual_channel_storage_full <= 1'd0;
		linienmodule_dual_channel_re <= 1'd0;
		linienmodule_mod_channel_storage_full <= 1'd0;
		linienmodule_mod_channel_re <= 1'd0;
		linienmodule_control_channel_storage_full <= 1'd0;
		linienmodule_control_channel_re <= 1'd0;
		linienmodule_sweep_channel_storage_full <= 2'd0;
		linienmodule_sweep_channel_re <= 1'd0;
		linienmodule_slow_control_channel_storage_full <= 2'd0;
		linienmodule_slow_control_channel_re <= 1'd0;
		linienmodule_pid_only_mode_storage_full <= 1'd0;
		linienmodule_pid_only_mode_re <= 1'd0;
		linienmodule_chain_a_factor_storage_full <= 9'd128;
		linienmodule_chain_a_factor_re <= 1'd0;
		linienmodule_chain_b_factor_storage_full <= 9'd128;
		linienmodule_chain_b_factor_re <= 1'd0;
		linienmodule_chain_a_offset_storage_full <= 14'd0;
		linienmodule_chain_a_offset_re <= 1'd0;
		linienmodule_chain_b_offset_storage_full <= 14'd0;
		linienmodule_chain_b_offset_re <= 1'd0;
		linienmodule_combined_offset_storage_full <= 14'd0;
		linienmodule_combined_offset_re <= 1'd0;
		linienmodule_combined_offset_signed <= 14'sd0;
		linienmodule_out_offset_storage_full <= 14'd0;
		linienmodule_out_offset_re <= 1'd0;
		linienmodule_slow_decimation_storage_full <= 5'd0;
		linienmodule_slow_decimation_re <= 1'd0;
		linienmodule_csrstorage0_storage_full0 <= 15'd0;
		linienmodule_csrstorage0_re0 <= 1'd0;
		linienmodule_csrstorage1_storage_full0 <= 15'd0;
		linienmodule_csrstorage1_re0 <= 1'd0;
		linienmodule_csrstorage2_storage_full0 <= 15'd0;
		linienmodule_csrstorage2_re0 <= 1'd0;
		linienmodule_chain_a_offset_signed <= 14'sd0;
		linienmodule_chain_b_offset_signed <= 14'sd0;
		linienmodule_out_offset_signed <= 14'sd0;
		linienmodule_mod_amp_storage_full <= 14'd0;
		linienmodule_mod_amp_re <= 1'd0;
		linienmodule_mod_freq_storage_full <= 32'd0;
		linienmodule_mod_freq_re <= 1'd0;
		linienmodule_mod_z <= 32'd0;
		linienmodule_mod_stop <= 1'd0;
		linienmodule_mod_cordic1 <= 17'sd0;
		linienmodule_mod_cordic2 <= 17'sd0;
		linienmodule_mod_cordic3 <= 17'sd0;
		linienmodule_mod_cordic4 <= 17'sd0;
		linienmodule_mod_cordic5 <= 17'sd0;
		linienmodule_mod_cordic6 <= 17'sd0;
		linienmodule_mod_cordic7 <= 17'sd0;
		linienmodule_mod_cordic8 <= 17'sd0;
		linienmodule_mod_cordic9 <= 17'sd0;
		linienmodule_mod_cordic10 <= 17'sd0;
		linienmodule_mod_cordic11 <= 17'sd0;
		linienmodule_mod_cordic12 <= 17'sd0;
		linienmodule_mod_cordic13 <= 17'sd0;
		linienmodule_mod_cordic14 <= 17'sd0;
		linienmodule_mod_cordic15 <= 17'sd0;
		linienmodule_mod_cordic17 <= 17'sd0;
		linienmodule_mod_cordic18 <= 17'sd0;
		linienmodule_mod_cordic19 <= 17'sd0;
		linienmodule_mod_cordic20 <= 17'sd0;
		linienmodule_mod_cordic21 <= 17'sd0;
		linienmodule_mod_cordic22 <= 17'sd0;
		linienmodule_mod_cordic23 <= 17'sd0;
		linienmodule_mod_cordic24 <= 17'sd0;
		linienmodule_mod_cordic25 <= 17'sd0;
		linienmodule_mod_cordic26 <= 17'sd0;
		linienmodule_mod_cordic27 <= 17'sd0;
		linienmodule_mod_cordic28 <= 17'sd0;
		linienmodule_mod_cordic29 <= 17'sd0;
		linienmodule_mod_cordic30 <= 17'sd0;
		linienmodule_mod_cordic31 <= 17'sd0;
		linienmodule_mod_cordic33 <= 17'sd0;
		linienmodule_mod_cordic34 <= 17'sd0;
		linienmodule_mod_cordic35 <= 17'sd0;
		linienmodule_mod_cordic36 <= 17'sd0;
		linienmodule_mod_cordic37 <= 17'sd0;
		linienmodule_mod_cordic38 <= 17'sd0;
		linienmodule_mod_cordic39 <= 17'sd0;
		linienmodule_mod_cordic40 <= 17'sd0;
		linienmodule_mod_cordic41 <= 17'sd0;
		linienmodule_mod_cordic42 <= 17'sd0;
		linienmodule_mod_cordic43 <= 17'sd0;
		linienmodule_mod_cordic44 <= 17'sd0;
		linienmodule_mod_cordic45 <= 17'sd0;
		linienmodule_mod_cordic46 <= 17'sd0;
		linienmodule_mod_cordic47 <= 17'sd0;
		linienmodule_sweep_y <= 14'sd0;
		linienmodule_sweep_step_storage_full <= 30'd0;
		linienmodule_sweep_step_re <= 1'd0;
		linienmodule_sweep_min_storage_full <= 14'd8192;
		linienmodule_sweep_min_re <= 1'd0;
		linienmodule_sweep_max_storage_full <= 14'd8191;
		linienmodule_sweep_max_re <= 1'd0;
		linienmodule_sweep_run_storage_full <= 1'd0;
		linienmodule_sweep_run_re <= 1'd0;
		linienmodule_sweep_pause_storage_full <= 1'd0;
		linienmodule_sweep_pause_re <= 1'd0;
		linienmodule_sweep_sweep_turn <= 1'd0;
		linienmodule_sweep_sweep_y <= 39'sd0;
		linienmodule_sweep_sweep_trigger <= 1'd0;
		linienmodule_sweep_sweep_turning <= 1'd0;
		linienmodule_sweep_sweep_dir <= 1'd0;
		linienmodule_sweep_limit_max <= 15'sd0;
		linienmodule_sweep_limit_min <= 15'sd0;
		linienmodule_limit_error_signal_limitcsr_y <= 25'sd0;
		linienmodule_limit_error_signal_limitcsr_error <= 1'd0;
		linienmodule_limit_error_signal_min_storage_full <= 25'd16777216;
		linienmodule_limit_error_signal_min_re <= 1'd0;
		linienmodule_limit_error_signal_max_storage_full <= 25'd16777215;
		linienmodule_limit_error_signal_max_re <= 1'd0;
		linienmodule_limit_error_signal_limit_max <= 29'sd0;
		linienmodule_limit_error_signal_limit_min <= 29'sd0;
		linienmodule_limit_fast1_limitcsr_y <= 14'sd0;
		linienmodule_limit_fast1_limitcsr_error <= 1'd0;
		linienmodule_limit_fast1_x <= 19'sd0;
		linienmodule_limit_fast1_min_storage_full <= 14'd8192;
		linienmodule_limit_fast1_min_re <= 1'd0;
		linienmodule_limit_fast1_max_storage_full <= 14'd8191;
		linienmodule_limit_fast1_max_re <= 1'd0;
		linienmodule_limit_fast1_limit_max <= 19'sd0;
		linienmodule_limit_fast1_limit_min <= 19'sd0;
		linienmodule_limit_fast2_limitcsr_y <= 14'sd0;
		linienmodule_limit_fast2_limitcsr_error <= 1'd0;
		linienmodule_limit_fast2_x <= 19'sd0;
		linienmodule_limit_fast2_min_storage_full <= 14'd8192;
		linienmodule_limit_fast2_min_re <= 1'd0;
		linienmodule_limit_fast2_max_storage_full <= 14'd8191;
		linienmodule_limit_fast2_max_re <= 1'd0;
		linienmodule_limit_fast2_limit_max <= 19'sd0;
		linienmodule_limit_fast2_limit_min <= 19'sd0;
		linienmodule_pid_setpoint_storage_full <= 25'd0;
		linienmodule_pid_setpoint_re <= 1'd0;
		linienmodule_pid_kp_storage_full <= 14'd0;
		linienmodule_pid_kp_re <= 1'd0;
		linienmodule_pid_ki_storage_full <= 14'd0;
		linienmodule_pid_ki_re <= 1'd0;
		linienmodule_pid_reset_storage_full <= 1'd0;
		linienmodule_pid_reset_re <= 1'd0;
		linienmodule_pid_int_reg <= 43'sd0;
		linienmodule_pid_kd_storage_full <= 14'd0;
		linienmodule_pid_kd_re <= 1'd0;
		linienmodule_pid_kd_reg <= 34'sd0;
		linienmodule_pid_kd_reg_r <= 34'sd0;
		linienmodule_pid_output_d <= 34'sd0;
		linienmodule_pid_pid_sum <= 84'sd0;
		linienmodule_autolock_fast_turn_on_lock <= 1'd0;
		linienmodule_autolock_fast_storage_full <= 14'd0;
		linienmodule_autolock_fast_re <= 1'd0;
		linienmodule_autolock_request_lock_storage_full <= 1'd0;
		linienmodule_autolock_request_lock_re <= 1'd0;
		linienmodule_autolock_autolock_mode_storage_full <= 2'd0;
		linienmodule_autolock_autolock_mode_re <= 1'd0;
		linienmodule_autolock_status <= 1'd0;
		linienmodule_sequenceexecutor_reset_seq_storage_full <= 1'd0;
		linienmodule_sequenceexecutor_reset_seq_re <= 1'd0;
		linienmodule_sequenceexecutor_arm_storage_full <= 4'd0;
		linienmodule_sequenceexecutor_arm_re <= 1'd0;
		linienmodule_sequenceexecutor_fsm_reg_addr_storage_full <= 9'd0;
		linienmodule_sequenceexecutor_fsm_reg_addr_re <= 1'd0;
		linienmodule_sequenceexecutor_fsm_reg_data_storage_full <= 32'd0;
		linienmodule_sequenceexecutor_fsm_reg_data_re <= 1'd0;
		linienmodule_sequenceexecutor_fsm_reg_wen_storage_full <= 1'd0;
		linienmodule_sequenceexecutor_fsm_reg_wen_re <= 1'd0;
		linienmodule_sequenceexecutor_awg_reg_addr_storage_full <= 10'd0;
		linienmodule_sequenceexecutor_awg_reg_addr_re <= 1'd0;
		linienmodule_sequenceexecutor_awg_reg_data_storage_full <= 14'd0;
		linienmodule_sequenceexecutor_awg_reg_data_re <= 1'd0;
		linienmodule_sequenceexecutor_awg_reg_wen_storage_full <= 1'd0;
		linienmodule_sequenceexecutor_awg_reg_wen_re <= 1'd0;
		linienmodule_sequenceexecutor_num_blocks_1_storage_full <= 4'd0;
		linienmodule_sequenceexecutor_num_blocks_1_re <= 1'd0;
		linienmodule_sequenceexecutor_num_blocks_2_storage_full <= 4'd0;
		linienmodule_sequenceexecutor_num_blocks_2_re <= 1'd0;
		linienmodule_sequenceexecutor_num_blocks_3_storage_full <= 4'd0;
		linienmodule_sequenceexecutor_num_blocks_3_re <= 1'd0;
		linienmodule_sequenceexecutor_num_blocks_4_storage_full <= 4'd0;
		linienmodule_sequenceexecutor_num_blocks_4_re <= 1'd0;
		linienmodule_sequenceexecutor_init_v_storage_full <= 14'd0;
		linienmodule_sequenceexecutor_init_v_re <= 1'd0;
		linienmodule_sequenceexecutor_o_saved_pid_out <= 14'sd0;
		linienmodule_sequenceexecutor_o_saved_integrator <= 25'sd0;
		linienmodule_sequenceexecutor_o_saved_sweep_pos <= 14'sd0;
		linienmodule_sequenceexecutor_o_saved_dac_out <= 14'sd0;
		linienmodule_sequenceexecutor_ttl_sync0 <= 4'd0;
		linienmodule_sequenceexecutor_ttl_sync1 <= 4'd0;
		linienmodule_sequenceexecutor_ttl_prev <= 4'd0;
		linienmodule_sequenceexecutor_o_active_offset <= 4'd0;
		linienmodule_raw_acquisition_iir_y0 <= 25'sd0;
		linienmodule_raw_acquisition_iir_error <= 1'd0;
		linienmodule_raw_acquisition_iir_storage_full <= 27'd0;
		linienmodule_raw_acquisition_iir_re <= 1'd0;
		linienmodule_raw_acquisition_iir_a1 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage0_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage0_re <= 1'd0;
		linienmodule_raw_acquisition_iir_a2 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage1_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage1_re <= 1'd0;
		linienmodule_raw_acquisition_iir_a3 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage2_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage2_re <= 1'd0;
		linienmodule_raw_acquisition_iir_a4 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage3_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage3_re <= 1'd0;
		linienmodule_raw_acquisition_iir_a5 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage4_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage4_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b0 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage5_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage5_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b1 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage6_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage6_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b2 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage7_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage7_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b3 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage8_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage8_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b4 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage9_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage9_re <= 1'd0;
		linienmodule_raw_acquisition_iir_b5 <= 25'sd0;
		linienmodule_raw_acquisition_iir_csrstorage10_storage_full <= 25'd0;
		linienmodule_raw_acquisition_iir_csrstorage10_re <= 1'd0;
		linienmodule_raw_acquisition_iir_z0r <= 50'sd0;
		linienmodule_raw_acquisition_iir_y1 <= 25'sd0;
		linienmodule_raw_acquisition_iir_zr0 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr1 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr2 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr3 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr4 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr5 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr6 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr7 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr8 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr9 <= 50'sd0;
		linienmodule_raw_acquisition_iir_zr10 <= 50'sd0;
		linienmodule_analog_adca <= 16'd0;
		linienmodule_analog_adcb <= 16'd0;
		linienmodule_analog_daca <= 14'd0;
		linienmodule_analog_dacb <= 14'd0;
		linienmodule_xadc_temp_status <= 12'd0;
		linienmodule_xadc_v_status <= 12'd0;
		linienmodule_xadc_a_status <= 12'd0;
		linienmodule_xadc_b_status <= 12'd0;
		linienmodule_xadc_c_status <= 12'd0;
		linienmodule_xadc_d_status <= 12'd0;
		linienmodule_gpio_n_o <= 8'd0;
		linienmodule_gpio_n_outs_storage_full <= 8'd0;
		linienmodule_gpio_n_outs_re <= 1'd0;
		linienmodule_gpio_n_oes_storage_full <= 8'd0;
		linienmodule_gpio_n_oes_re <= 1'd0;
		linienmodule_gpio_p_outs_storage_full <= 8'd0;
		linienmodule_gpio_p_outs_re <= 1'd0;
		linienmodule_gpio_p_oes_storage_full <= 8'd0;
		linienmodule_gpio_p_oes_re <= 1'd0;
		linienmodule_dna_status <= 64'd288230376151711744;
		linienmodule_dna_cnt <= 8'd0;
		linienmodule_fast_a_y_tap_storage_full <= 2'd0;
		linienmodule_fast_a_y_tap_re <= 1'd0;
		linienmodule_fast_a_invert_storage_full <= 1'd0;
		linienmodule_fast_a_invert_re <= 1'd0;
		linienmodule_fast_a_dx <= 25'sd0;
		linienmodule_fast_a_dy <= 25'sd0;
		linienmodule_fast_a_delay_storage_full <= 32'd0;
		linienmodule_fast_a_delay_re <= 1'd0;
		linienmodule_fast_a_multiplier_storage_full <= 4'd1;
		linienmodule_fast_a_multiplier_re <= 1'd0;
		linienmodule_fast_a_cordic1 <= 17'sd0;
		linienmodule_fast_a_cordic2 <= 17'sd0;
		linienmodule_fast_a_cordic3 <= 17'sd0;
		linienmodule_fast_a_cordic4 <= 17'sd0;
		linienmodule_fast_a_cordic5 <= 17'sd0;
		linienmodule_fast_a_cordic6 <= 17'sd0;
		linienmodule_fast_a_cordic7 <= 17'sd0;
		linienmodule_fast_a_cordic8 <= 17'sd0;
		linienmodule_fast_a_cordic9 <= 17'sd0;
		linienmodule_fast_a_cordic10 <= 17'sd0;
		linienmodule_fast_a_cordic11 <= 17'sd0;
		linienmodule_fast_a_cordic12 <= 17'sd0;
		linienmodule_fast_a_cordic13 <= 17'sd0;
		linienmodule_fast_a_cordic14 <= 17'sd0;
		linienmodule_fast_a_cordic15 <= 17'sd0;
		linienmodule_fast_a_cordic17 <= 17'sd0;
		linienmodule_fast_a_cordic18 <= 17'sd0;
		linienmodule_fast_a_cordic19 <= 17'sd0;
		linienmodule_fast_a_cordic20 <= 17'sd0;
		linienmodule_fast_a_cordic21 <= 17'sd0;
		linienmodule_fast_a_cordic22 <= 17'sd0;
		linienmodule_fast_a_cordic23 <= 17'sd0;
		linienmodule_fast_a_cordic24 <= 17'sd0;
		linienmodule_fast_a_cordic25 <= 17'sd0;
		linienmodule_fast_a_cordic26 <= 17'sd0;
		linienmodule_fast_a_cordic27 <= 17'sd0;
		linienmodule_fast_a_cordic28 <= 17'sd0;
		linienmodule_fast_a_cordic29 <= 17'sd0;
		linienmodule_fast_a_cordic30 <= 17'sd0;
		linienmodule_fast_a_cordic31 <= 17'sd0;
		linienmodule_fast_a_cordic33 <= 17'sd0;
		linienmodule_fast_a_cordic34 <= 17'sd0;
		linienmodule_fast_a_cordic35 <= 17'sd0;
		linienmodule_fast_a_cordic36 <= 17'sd0;
		linienmodule_fast_a_cordic37 <= 17'sd0;
		linienmodule_fast_a_cordic38 <= 17'sd0;
		linienmodule_fast_a_cordic39 <= 17'sd0;
		linienmodule_fast_a_cordic40 <= 17'sd0;
		linienmodule_fast_a_cordic41 <= 17'sd0;
		linienmodule_fast_a_cordic42 <= 17'sd0;
		linienmodule_fast_a_cordic43 <= 17'sd0;
		linienmodule_fast_a_cordic44 <= 17'sd0;
		linienmodule_fast_a_cordic45 <= 17'sd0;
		linienmodule_fast_a_cordic46 <= 17'sd0;
		linienmodule_fast_a_cordic47 <= 17'sd0;
		linienmodule_fast_a_ya <= 17'sd0;
		linienmodule_fast_a_limitcsr0_limitcsr0_y0 <= 25'sd0;
		linienmodule_fast_a_limitcsr0_limitcsr0_error0 <= 1'd0;
		linienmodule_fast_a_limitcsr0_min_storage_full0 <= 25'd16777216;
		linienmodule_fast_a_limitcsr0_min_re0 <= 1'd0;
		linienmodule_fast_a_limitcsr0_max_storage_full0 <= 25'd16777215;
		linienmodule_fast_a_limitcsr0_max_re0 <= 1'd0;
		linienmodule_fast_a_limitcsr0_limit_max0 <= 26'sd0;
		linienmodule_fast_a_limitcsr0_limit_min0 <= 26'sd0;
		linienmodule_fast_a_iir0_y0 <= 25'sd0;
		linienmodule_fast_a_iir0_error0 <= 1'd0;
		linienmodule_fast_a_iir0_storage_full0 <= 27'd0;
		linienmodule_fast_a_iir0_re0 <= 1'd0;
		linienmodule_fast_a_iir0_a10 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage0_storage_full0 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage0_re0 <= 1'd0;
		linienmodule_fast_a_iir0_b00 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage1_storage_full0 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage1_re0 <= 1'd0;
		linienmodule_fast_a_iir0_b10 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage2_storage_full0 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage2_re0 <= 1'd0;
		linienmodule_fast_a_iir0_z0r0 <= 50'sd0;
		linienmodule_fast_a_iir0_y1 <= 25'sd0;
		linienmodule_fast_a_iir0_zr0 <= 50'sd0;
		linienmodule_fast_a_iir0_zr1 <= 50'sd0;
		linienmodule_fast_a_iir0_zr2 <= 50'sd0;
		linienmodule_fast_a_iir0_y2 <= 25'sd0;
		linienmodule_fast_a_iir0_error1 <= 1'd0;
		linienmodule_fast_a_iir0_storage_full1 <= 27'd0;
		linienmodule_fast_a_iir0_re1 <= 1'd0;
		linienmodule_fast_a_iir0_a11 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage0_storage_full1 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage0_re1 <= 1'd0;
		linienmodule_fast_a_iir0_a2 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage1_storage_full1 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage1_re1 <= 1'd0;
		linienmodule_fast_a_iir0_b01 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage2_storage_full1 <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage2_re1 <= 1'd0;
		linienmodule_fast_a_iir0_b11 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage3_storage_full <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage3_re <= 1'd0;
		linienmodule_fast_a_iir0_b2 <= 25'sd0;
		linienmodule_fast_a_iir0_csrstorage4_storage_full <= 25'd0;
		linienmodule_fast_a_iir0_csrstorage4_re <= 1'd0;
		linienmodule_fast_a_iir0_z0r1 <= 50'sd0;
		linienmodule_fast_a_iir0_y3 <= 25'sd0;
		linienmodule_fast_a_iir0_zr3 <= 50'sd0;
		linienmodule_fast_a_iir0_zr4 <= 50'sd0;
		linienmodule_fast_a_iir0_zr5 <= 50'sd0;
		linienmodule_fast_a_iir0_zr6 <= 50'sd0;
		linienmodule_fast_a_iir0_zr7 <= 50'sd0;
		linienmodule_fast_a_limitcsr0_limitcsr0_y1 <= 25'sd0;
		linienmodule_fast_a_limitcsr0_limitcsr0_error1 <= 1'd0;
		linienmodule_fast_a_limitcsr0_min_storage_full1 <= 25'd16777216;
		linienmodule_fast_a_limitcsr0_min_re1 <= 1'd0;
		linienmodule_fast_a_limitcsr0_max_storage_full1 <= 25'd16777215;
		linienmodule_fast_a_limitcsr0_max_re1 <= 1'd0;
		linienmodule_fast_a_limitcsr0_limit_max1 <= 28'sd0;
		linienmodule_fast_a_limitcsr0_limit_min1 <= 28'sd0;
		linienmodule_fast_a_limitcsr1_limitcsr1_y0 <= 25'sd0;
		linienmodule_fast_a_limitcsr1_limitcsr1_error0 <= 1'd0;
		linienmodule_fast_a_limitcsr1_min_storage_full0 <= 25'd16777216;
		linienmodule_fast_a_limitcsr1_min_re0 <= 1'd0;
		linienmodule_fast_a_limitcsr1_max_storage_full0 <= 25'd16777215;
		linienmodule_fast_a_limitcsr1_max_re0 <= 1'd0;
		linienmodule_fast_a_limitcsr1_limit_max0 <= 26'sd0;
		linienmodule_fast_a_limitcsr1_limit_min0 <= 26'sd0;
		linienmodule_fast_a_iir1_y0 <= 25'sd0;
		linienmodule_fast_a_iir1_error0 <= 1'd0;
		linienmodule_fast_a_iir1_storage_full0 <= 27'd0;
		linienmodule_fast_a_iir1_re0 <= 1'd0;
		linienmodule_fast_a_iir1_a10 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage3_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage3_re <= 1'd0;
		linienmodule_fast_a_iir1_b00 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage4_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage4_re <= 1'd0;
		linienmodule_fast_a_iir1_b10 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage5_storage_full0 <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage5_re0 <= 1'd0;
		linienmodule_fast_a_iir1_z0r0 <= 50'sd0;
		linienmodule_fast_a_iir1_y1 <= 25'sd0;
		linienmodule_fast_a_iir1_zr0 <= 50'sd0;
		linienmodule_fast_a_iir1_zr1 <= 50'sd0;
		linienmodule_fast_a_iir1_zr2 <= 50'sd0;
		linienmodule_fast_a_iir1_y2 <= 25'sd0;
		linienmodule_fast_a_iir1_error1 <= 1'd0;
		linienmodule_fast_a_iir1_storage_full1 <= 27'd0;
		linienmodule_fast_a_iir1_re1 <= 1'd0;
		linienmodule_fast_a_iir1_a11 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage5_storage_full1 <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage5_re1 <= 1'd0;
		linienmodule_fast_a_iir1_a2 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage6_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage6_re <= 1'd0;
		linienmodule_fast_a_iir1_b01 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage7_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage7_re <= 1'd0;
		linienmodule_fast_a_iir1_b11 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage8_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage8_re <= 1'd0;
		linienmodule_fast_a_iir1_b2 <= 25'sd0;
		linienmodule_fast_a_iir1_csrstorage9_storage_full <= 25'd0;
		linienmodule_fast_a_iir1_csrstorage9_re <= 1'd0;
		linienmodule_fast_a_iir1_z0r1 <= 50'sd0;
		linienmodule_fast_a_iir1_y3 <= 25'sd0;
		linienmodule_fast_a_iir1_zr3 <= 50'sd0;
		linienmodule_fast_a_iir1_zr4 <= 50'sd0;
		linienmodule_fast_a_iir1_zr5 <= 50'sd0;
		linienmodule_fast_a_iir1_zr6 <= 50'sd0;
		linienmodule_fast_a_iir1_zr7 <= 50'sd0;
		linienmodule_fast_a_limitcsr1_limitcsr1_y1 <= 25'sd0;
		linienmodule_fast_a_limitcsr1_limitcsr1_error1 <= 1'd0;
		linienmodule_fast_a_limitcsr1_min_storage_full1 <= 25'd16777216;
		linienmodule_fast_a_limitcsr1_min_re1 <= 1'd0;
		linienmodule_fast_a_limitcsr1_max_storage_full1 <= 25'd16777215;
		linienmodule_fast_a_limitcsr1_max_re1 <= 1'd0;
		linienmodule_fast_a_limitcsr1_limit_max1 <= 28'sd0;
		linienmodule_fast_a_limitcsr1_limit_min1 <= 28'sd0;
		linienmodule_fast_b_y_tap_storage_full <= 2'd0;
		linienmodule_fast_b_y_tap_re <= 1'd0;
		linienmodule_fast_b_invert_storage_full <= 1'd0;
		linienmodule_fast_b_invert_re <= 1'd0;
		linienmodule_fast_b_dx <= 25'sd0;
		linienmodule_fast_b_dy <= 25'sd0;
		linienmodule_fast_b_delay_storage_full <= 32'd0;
		linienmodule_fast_b_delay_re <= 1'd0;
		linienmodule_fast_b_multiplier_storage_full <= 4'd1;
		linienmodule_fast_b_multiplier_re <= 1'd0;
		linienmodule_fast_b_cordic1 <= 17'sd0;
		linienmodule_fast_b_cordic2 <= 17'sd0;
		linienmodule_fast_b_cordic3 <= 17'sd0;
		linienmodule_fast_b_cordic4 <= 17'sd0;
		linienmodule_fast_b_cordic5 <= 17'sd0;
		linienmodule_fast_b_cordic6 <= 17'sd0;
		linienmodule_fast_b_cordic7 <= 17'sd0;
		linienmodule_fast_b_cordic8 <= 17'sd0;
		linienmodule_fast_b_cordic9 <= 17'sd0;
		linienmodule_fast_b_cordic10 <= 17'sd0;
		linienmodule_fast_b_cordic11 <= 17'sd0;
		linienmodule_fast_b_cordic12 <= 17'sd0;
		linienmodule_fast_b_cordic13 <= 17'sd0;
		linienmodule_fast_b_cordic14 <= 17'sd0;
		linienmodule_fast_b_cordic15 <= 17'sd0;
		linienmodule_fast_b_cordic17 <= 17'sd0;
		linienmodule_fast_b_cordic18 <= 17'sd0;
		linienmodule_fast_b_cordic19 <= 17'sd0;
		linienmodule_fast_b_cordic20 <= 17'sd0;
		linienmodule_fast_b_cordic21 <= 17'sd0;
		linienmodule_fast_b_cordic22 <= 17'sd0;
		linienmodule_fast_b_cordic23 <= 17'sd0;
		linienmodule_fast_b_cordic24 <= 17'sd0;
		linienmodule_fast_b_cordic25 <= 17'sd0;
		linienmodule_fast_b_cordic26 <= 17'sd0;
		linienmodule_fast_b_cordic27 <= 17'sd0;
		linienmodule_fast_b_cordic28 <= 17'sd0;
		linienmodule_fast_b_cordic29 <= 17'sd0;
		linienmodule_fast_b_cordic30 <= 17'sd0;
		linienmodule_fast_b_cordic31 <= 17'sd0;
		linienmodule_fast_b_cordic33 <= 17'sd0;
		linienmodule_fast_b_cordic34 <= 17'sd0;
		linienmodule_fast_b_cordic35 <= 17'sd0;
		linienmodule_fast_b_cordic36 <= 17'sd0;
		linienmodule_fast_b_cordic37 <= 17'sd0;
		linienmodule_fast_b_cordic38 <= 17'sd0;
		linienmodule_fast_b_cordic39 <= 17'sd0;
		linienmodule_fast_b_cordic40 <= 17'sd0;
		linienmodule_fast_b_cordic41 <= 17'sd0;
		linienmodule_fast_b_cordic42 <= 17'sd0;
		linienmodule_fast_b_cordic43 <= 17'sd0;
		linienmodule_fast_b_cordic44 <= 17'sd0;
		linienmodule_fast_b_cordic45 <= 17'sd0;
		linienmodule_fast_b_cordic46 <= 17'sd0;
		linienmodule_fast_b_cordic47 <= 17'sd0;
		linienmodule_fast_b_ya <= 17'sd0;
		linienmodule_fast_b_limitcsr0_limitcsr0_y0 <= 25'sd0;
		linienmodule_fast_b_limitcsr0_limitcsr0_error0 <= 1'd0;
		linienmodule_fast_b_limitcsr0_min_storage_full0 <= 25'd16777216;
		linienmodule_fast_b_limitcsr0_min_re0 <= 1'd0;
		linienmodule_fast_b_limitcsr0_max_storage_full0 <= 25'd16777215;
		linienmodule_fast_b_limitcsr0_max_re0 <= 1'd0;
		linienmodule_fast_b_limitcsr0_limit_max0 <= 26'sd0;
		linienmodule_fast_b_limitcsr0_limit_min0 <= 26'sd0;
		linienmodule_fast_b_iir0_y0 <= 25'sd0;
		linienmodule_fast_b_iir0_error0 <= 1'd0;
		linienmodule_fast_b_iir0_storage_full0 <= 27'd0;
		linienmodule_fast_b_iir0_re0 <= 1'd0;
		linienmodule_fast_b_iir0_a10 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage0_storage_full0 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage0_re0 <= 1'd0;
		linienmodule_fast_b_iir0_b00 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage1_storage_full0 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage1_re0 <= 1'd0;
		linienmodule_fast_b_iir0_b10 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage2_storage_full0 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage2_re0 <= 1'd0;
		linienmodule_fast_b_iir0_z0r0 <= 50'sd0;
		linienmodule_fast_b_iir0_y1 <= 25'sd0;
		linienmodule_fast_b_iir0_zr0 <= 50'sd0;
		linienmodule_fast_b_iir0_zr1 <= 50'sd0;
		linienmodule_fast_b_iir0_zr2 <= 50'sd0;
		linienmodule_fast_b_iir0_y2 <= 25'sd0;
		linienmodule_fast_b_iir0_error1 <= 1'd0;
		linienmodule_fast_b_iir0_storage_full1 <= 27'd0;
		linienmodule_fast_b_iir0_re1 <= 1'd0;
		linienmodule_fast_b_iir0_a11 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage0_storage_full1 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage0_re1 <= 1'd0;
		linienmodule_fast_b_iir0_a2 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage1_storage_full1 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage1_re1 <= 1'd0;
		linienmodule_fast_b_iir0_b01 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage2_storage_full1 <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage2_re1 <= 1'd0;
		linienmodule_fast_b_iir0_b11 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage3_storage_full <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage3_re <= 1'd0;
		linienmodule_fast_b_iir0_b2 <= 25'sd0;
		linienmodule_fast_b_iir0_csrstorage4_storage_full <= 25'd0;
		linienmodule_fast_b_iir0_csrstorage4_re <= 1'd0;
		linienmodule_fast_b_iir0_z0r1 <= 50'sd0;
		linienmodule_fast_b_iir0_y3 <= 25'sd0;
		linienmodule_fast_b_iir0_zr3 <= 50'sd0;
		linienmodule_fast_b_iir0_zr4 <= 50'sd0;
		linienmodule_fast_b_iir0_zr5 <= 50'sd0;
		linienmodule_fast_b_iir0_zr6 <= 50'sd0;
		linienmodule_fast_b_iir0_zr7 <= 50'sd0;
		linienmodule_fast_b_limitcsr0_limitcsr0_y1 <= 25'sd0;
		linienmodule_fast_b_limitcsr0_limitcsr0_error1 <= 1'd0;
		linienmodule_fast_b_limitcsr0_min_storage_full1 <= 25'd16777216;
		linienmodule_fast_b_limitcsr0_min_re1 <= 1'd0;
		linienmodule_fast_b_limitcsr0_max_storage_full1 <= 25'd16777215;
		linienmodule_fast_b_limitcsr0_max_re1 <= 1'd0;
		linienmodule_fast_b_limitcsr0_limit_max1 <= 28'sd0;
		linienmodule_fast_b_limitcsr0_limit_min1 <= 28'sd0;
		linienmodule_fast_b_limitcsr1_limitcsr1_y0 <= 25'sd0;
		linienmodule_fast_b_limitcsr1_limitcsr1_error0 <= 1'd0;
		linienmodule_fast_b_limitcsr1_min_storage_full0 <= 25'd16777216;
		linienmodule_fast_b_limitcsr1_min_re0 <= 1'd0;
		linienmodule_fast_b_limitcsr1_max_storage_full0 <= 25'd16777215;
		linienmodule_fast_b_limitcsr1_max_re0 <= 1'd0;
		linienmodule_fast_b_limitcsr1_limit_max0 <= 26'sd0;
		linienmodule_fast_b_limitcsr1_limit_min0 <= 26'sd0;
		linienmodule_fast_b_iir1_y0 <= 25'sd0;
		linienmodule_fast_b_iir1_error0 <= 1'd0;
		linienmodule_fast_b_iir1_storage_full0 <= 27'd0;
		linienmodule_fast_b_iir1_re0 <= 1'd0;
		linienmodule_fast_b_iir1_a10 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage3_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage3_re <= 1'd0;
		linienmodule_fast_b_iir1_b00 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage4_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage4_re <= 1'd0;
		linienmodule_fast_b_iir1_b10 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage5_storage_full0 <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage5_re0 <= 1'd0;
		linienmodule_fast_b_iir1_z0r0 <= 50'sd0;
		linienmodule_fast_b_iir1_y1 <= 25'sd0;
		linienmodule_fast_b_iir1_zr0 <= 50'sd0;
		linienmodule_fast_b_iir1_zr1 <= 50'sd0;
		linienmodule_fast_b_iir1_zr2 <= 50'sd0;
		linienmodule_fast_b_iir1_y2 <= 25'sd0;
		linienmodule_fast_b_iir1_error1 <= 1'd0;
		linienmodule_fast_b_iir1_storage_full1 <= 27'd0;
		linienmodule_fast_b_iir1_re1 <= 1'd0;
		linienmodule_fast_b_iir1_a11 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage5_storage_full1 <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage5_re1 <= 1'd0;
		linienmodule_fast_b_iir1_a2 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage6_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage6_re <= 1'd0;
		linienmodule_fast_b_iir1_b01 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage7_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage7_re <= 1'd0;
		linienmodule_fast_b_iir1_b11 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage8_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage8_re <= 1'd0;
		linienmodule_fast_b_iir1_b2 <= 25'sd0;
		linienmodule_fast_b_iir1_csrstorage9_storage_full <= 25'd0;
		linienmodule_fast_b_iir1_csrstorage9_re <= 1'd0;
		linienmodule_fast_b_iir1_z0r1 <= 50'sd0;
		linienmodule_fast_b_iir1_y3 <= 25'sd0;
		linienmodule_fast_b_iir1_zr3 <= 50'sd0;
		linienmodule_fast_b_iir1_zr4 <= 50'sd0;
		linienmodule_fast_b_iir1_zr5 <= 50'sd0;
		linienmodule_fast_b_iir1_zr6 <= 50'sd0;
		linienmodule_fast_b_iir1_zr7 <= 50'sd0;
		linienmodule_fast_b_limitcsr1_limitcsr1_y1 <= 25'sd0;
		linienmodule_fast_b_limitcsr1_limitcsr1_error1 <= 1'd0;
		linienmodule_fast_b_limitcsr1_min_storage_full1 <= 25'd16777216;
		linienmodule_fast_b_limitcsr1_min_re1 <= 1'd0;
		linienmodule_fast_b_limitcsr1_max_storage_full1 <= 25'd16777215;
		linienmodule_fast_b_limitcsr1_max_re1 <= 1'd0;
		linienmodule_fast_b_limitcsr1_limit_max1 <= 28'sd0;
		linienmodule_fast_b_limitcsr1_limit_min1 <= 28'sd0;
		linienmodule_slowchain_setpoint_storage_full <= 14'd0;
		linienmodule_slowchain_setpoint_re <= 1'd0;
		linienmodule_slowchain_kp_storage_full <= 14'd0;
		linienmodule_slowchain_kp_re <= 1'd0;
		linienmodule_slowchain_ki_storage_full <= 14'd0;
		linienmodule_slowchain_ki_re <= 1'd0;
		linienmodule_slowchain_reset_storage_full <= 1'd0;
		linienmodule_slowchain_reset_re <= 1'd0;
		linienmodule_slowchain_kd_storage_full <= 14'd0;
		linienmodule_slowchain_kd_re <= 1'd0;
		linienmodule_slowchain_min_storage_full <= 14'd8192;
		linienmodule_slowchain_min_re <= 1'd0;
		linienmodule_slowchain_max_storage_full <= 14'd8191;
		linienmodule_slowchain_max_re <= 1'd0;
		linienmodule_scopegen_automatic_trigger_signal <= 1'd0;
		linienmodule_scopegen_storage_full <= 1'd0;
		linienmodule_scopegen_re <= 1'd0;
		linienmodule_scopegen_adc_a <= 25'sd0;
		linienmodule_scopegen_adc_a_q <= 25'sd0;
		linienmodule_scopegen_adc_b <= 25'sd0;
		linienmodule_scopegen_adc_b_q <= 25'sd0;
		linienmodule_max_status0 <= 25'd0;
		linienmodule_min_status0 <= 25'd0;
		linienmodule_max_status1 <= 25'd0;
		linienmodule_min_status1 <= 25'd0;
		linienmodule_max_status2 <= 25'd0;
		linienmodule_min_status2 <= 25'd0;
		linienmodule_max_status3 <= 25'd0;
		linienmodule_min_status3 <= 25'd0;
		linienmodule_max_status4 <= 25'd0;
		linienmodule_min_status4 <= 25'd0;
		linienmodule_max_status5 <= 25'd0;
		linienmodule_min_status5 <= 25'd0;
		linienmodule_max_status7 <= 25'd0;
		linienmodule_min_status7 <= 25'd0;
		linienmodule_max_status8 <= 25'd0;
		linienmodule_min_status8 <= 25'd0;
		linienmodule_max_status9 <= 25'd0;
		linienmodule_min_status9 <= 25'd0;
		linienmodule_max_status10 <= 25'd0;
		linienmodule_min_status10 <= 25'd0;
		linienmodule_max_status11 <= 25'd0;
		linienmodule_min_status11 <= 25'd0;
		linienmodule_state_status <= 9'd0;
		linienmodule_csrstorage0_storage_full1 <= 9'd0;
		linienmodule_csrstorage0_re1 <= 1'd0;
		linienmodule_csrstorage1_storage_full1 <= 9'd0;
		linienmodule_csrstorage1_re1 <= 1'd0;
		linienmodule_csrstorage2_storage_full1 <= 9'd0;
		linienmodule_csrstorage2_re1 <= 1'd0;
		linienmodule_csrstorage3_storage_full <= 9'd0;
		linienmodule_csrstorage3_re <= 1'd0;
		linienmodule_csrstorage4_storage_full <= 9'd0;
		linienmodule_csrstorage4_re <= 1'd0;
		linienmodule_csrstorage5_storage_full <= 9'd0;
		linienmodule_csrstorage5_re <= 1'd0;
		linienmodule_csrstorage6_storage_full <= 9'd0;
		linienmodule_csrstorage6_re <= 1'd0;
		linienmodule_csrstorage7_storage_full <= 9'd0;
		linienmodule_csrstorage7_re <= 1'd0;
		linienmodule_csrstorage8_storage_full <= 4'd0;
		linienmodule_csrstorage8_re <= 1'd0;
		linienmodule_csrstorage9_storage_full <= 4'd0;
		linienmodule_csrstorage9_re <= 1'd0;
		linienmodule_csrstorage10_storage_full <= 4'd0;
		linienmodule_csrstorage10_re <= 1'd0;
		linienmodule_csrstorage11_storage_full <= 4'd0;
		linienmodule_csrstorage11_re <= 1'd0;
		linienmodule_csrstorage12_storage_full <= 4'd0;
		linienmodule_csrstorage12_re <= 1'd0;
		linienmodule_csrstorage13_storage_full <= 4'd0;
		linienmodule_csrstorage13_re <= 1'd0;
		linienmodule_csrstorage14_storage_full <= 4'd0;
		linienmodule_csrstorage14_re <= 1'd0;
		linienmodule_csrstorage15_storage_full <= 4'd0;
		linienmodule_csrstorage15_re <= 1'd0;
		linienmodule_interface0_bank_bus_dat_r <= 8'd0;
		linienmodule_interface1_bank_bus_dat_r <= 8'd0;
		linienmodule_interface2_bank_bus_dat_r <= 8'd0;
		linienmodule_interface3_bank_bus_dat_r <= 8'd0;
		linienmodule_interface4_bank_bus_dat_r <= 8'd0;
		linienmodule_interface5_bank_bus_dat_r <= 8'd0;
		linienmodule_interface6_bank_bus_dat_r <= 8'd0;
		linienmodule_interface7_bank_bus_dat_r <= 8'd0;
		linienmodule_interface8_bank_bus_dat_r <= 8'd0;
		linienmodule_csr_adr <= 14'd0;
		linienmodule_csr_we <= 1'd0;
		linienmodule_csr_dat_w <= 8'd0;
		linienmodule_sys_rdata <= 32'd0;
		linienmodule_sys_ack <= 1'd0;
		linienmodule_stb <= 1'd0;
		linienmodule_slow_out_shifted <= 15'd0;
		state <= 2'd0;
	end
	xilinxmultiregimpl0_xilinxmultiregimpl00 <= {linienmodule_gpio_n_tstriple7_i, linienmodule_gpio_n_tstriple6_i, linienmodule_gpio_n_tstriple5_i, linienmodule_gpio_n_tstriple4_i, linienmodule_gpio_n_tstriple3_i, linienmodule_gpio_n_tstriple2_i, linienmodule_gpio_n_tstriple1_i, linienmodule_gpio_n_tstriple0_i};
	xilinxmultiregimpl0_xilinxmultiregimpl01 <= xilinxmultiregimpl0_xilinxmultiregimpl00;
	xilinxmultiregimpl1_xilinxmultiregimpl10 <= {linienmodule_gpio_p_tstriple7_i, linienmodule_gpio_p_tstriple6_i, linienmodule_gpio_p_tstriple5_i, linienmodule_gpio_p_tstriple4_i, linienmodule_gpio_p_tstriple3_i, linienmodule_gpio_p_tstriple2_i, linienmodule_gpio_p_tstriple1_i, linienmodule_gpio_p_tstriple0_i};
	xilinxmultiregimpl1_xilinxmultiregimpl11 <= xilinxmultiregimpl1_xilinxmultiregimpl10;
end

always @(posedge sys_double_clk) begin
	linienmodule_deltasigma0_sigma <= ((linienmodule_deltasigma0_data - linienmodule_deltasigma0_delta) + linienmodule_deltasigma0_sigma);
	linienmodule_deltasigma1_sigma <= ((linienmodule_deltasigma1_data - linienmodule_deltasigma1_delta) + linienmodule_deltasigma1_sigma);
	linienmodule_deltasigma2_sigma <= ((linienmodule_deltasigma2_data - linienmodule_deltasigma2_delta) + linienmodule_deltasigma2_sigma);
	linienmodule_deltasigma3_sigma <= ((linienmodule_deltasigma3_data - linienmodule_deltasigma3_delta) + linienmodule_deltasigma3_sigma);
	linienmodule_decimate_decimation_counter <= (linienmodule_decimate_decimation_counter + 1'd1);
	linienmodule_decimate_output <= sync_self8;
end

always @(posedge sys_ps_clk) begin
	dummyhk_bank_bus_dat_r <= 1'd0;
	if (dummyhk_sel) begin
		case (dummyhk_bank_bus_adr[0])
			1'd0: begin
				dummyhk_bank_bus_dat_r <= dummyhk_id_w;
			end
		endcase
	end
	dummyhk_stb <= (dummyhk_sys_wen | dummyhk_sys_ren);
	dummyhk_csr_adr <= dummyhk_sys_addr[31:2];
	dummyhk_csr_we <= dummyhk_sys_wen;
	dummyhk_csr_dat_w <= dummyhk_sys_wdata;
	dummyhk_sys_ack <= dummyhk_stb;
	dummyhk_sys_rdata <= dummyhk_csr_dat_r;
	if (sys_ps_rst) begin
		dummyhk_bank_bus_dat_r <= 8'd0;
		dummyhk_csr_adr <= 14'd0;
		dummyhk_csr_we <= 1'd0;
		dummyhk_csr_dat_w <= 8'd0;
		dummyhk_sys_rdata <= 32'd0;
		dummyhk_sys_ack <= 1'd0;
		dummyhk_stb <= 1'd0;
	end
end

axi_slave #(
	.AXI_AW(6'd32),
	.AXI_DW(6'd32),
	.AXI_IW(4'd12)
) axi_slave (
	.axi_araddr_i(ps_axi_araddr),
	.axi_arburst_i(ps_axi_arburst),
	.axi_arcache_i(ps_axi_arcache),
	.axi_arid_i(ps_axi_arid),
	.axi_arlen_i(ps_axi_arlen),
	.axi_arlock_i(ps_axi_arlock),
	.axi_arprot_i(ps_axi_arprot),
	.axi_arsize_i(ps_axi_arsize),
	.axi_arvalid_i(ps_axi_arvalid),
	.axi_awaddr_i(ps_axi_awaddr),
	.axi_awburst_i(ps_axi_awburst),
	.axi_awcache_i(ps_axi_awcache),
	.axi_awid_i(ps_axi_awid),
	.axi_awlen_i(ps_axi_awlen),
	.axi_awlock_i(ps_axi_awlock),
	.axi_awprot_i(ps_axi_awprot),
	.axi_awsize_i(ps_axi_awsize),
	.axi_awvalid_i(ps_axi_awvalid),
	.axi_bready_i(ps_axi_bready),
	.axi_clk_i(ps_axi_aclk),
	.axi_rready_i(ps_axi_rready),
	.axi_rstn_i(ps_axi_arstn),
	.axi_wdata_i(ps_axi_wdata),
	.axi_wid_i(ps_axi_wid),
	.axi_wlast_i(ps_axi_wlast),
	.axi_wstrb_i(ps_axi_wstrb),
	.axi_wvalid_i(ps_axi_wvalid),
	.sys_ack_i(ps_sys_ack),
	.sys_err_i(ps_sys_err),
	.sys_rdata_i(ps_sys_rdata),
	.axi_arready_o(ps_axi_arready),
	.axi_awready_o(ps_axi_awready),
	.axi_bid_o(ps_axi_bid),
	.axi_bresp_o(ps_axi_bresp),
	.axi_bvalid_o(ps_axi_bvalid),
	.axi_rdata_o(ps_axi_rdata),
	.axi_rid_o(ps_axi_rid),
	.axi_rlast_o(ps_axi_rlast),
	.axi_rresp_o(ps_axi_rresp),
	.axi_rvalid_o(ps_axi_rvalid),
	.axi_wready_o(ps_axi_wready),
	.sys_addr_o(ps_sys_addr),
	.sys_ren_o(ps_sys_ren),
	.sys_sel_o(ps_sys_sel),
	.sys_wdata_o(ps_sys_wdata),
	.sys_wen_o(ps_sys_wen)
);

system_processing_system7_0_0 system_processing_system7_0_0(
	.M_AXI_GP0_ACLK(ps_axi_aclk),
	.M_AXI_GP0_ARREADY(ps_axi_arready),
	.M_AXI_GP0_AWREADY(ps_axi_awready),
	.M_AXI_GP0_BID(ps_axi_bid),
	.M_AXI_GP0_BRESP(ps_axi_bresp),
	.M_AXI_GP0_BVALID(ps_axi_bvalid),
	.M_AXI_GP0_RDATA(ps_axi_rdata),
	.M_AXI_GP0_RID(ps_axi_rid),
	.M_AXI_GP0_RLAST(ps_axi_rlast),
	.M_AXI_GP0_RRESP(ps_axi_rresp),
	.M_AXI_GP0_RVALID(ps_axi_rvalid),
	.M_AXI_GP0_WREADY(ps_axi_wready),
	.SPI0_MISO_I(1'd0),
	.SPI0_MOSI_I(1'd0),
	.SPI0_SCLK_I(1'd0),
	.SPI0_SS_I(1'd0),
	.USB0_VBUS_PWRFAULT(1'd0),
	.DDR_Addr(cpu_DDR_addr),
	.DDR_BankAddr(cpu_DDR_ba),
	.DDR_CAS_n(cpu_DDR_cas_n),
	.DDR_CKE(cpu_DDR_cke),
	.DDR_CS_n(cpu_DDR_cs_n),
	.DDR_Clk(cpu_DDR_ck_p),
	.DDR_Clk_n(cpu_DDR_ck_n),
	.DDR_DM(cpu_DDR_dm),
	.DDR_DQ(cpu_DDR_dq),
	.DDR_DQS(cpu_DDR_dqs_p),
	.DDR_DQS_n(cpu_DDR_dqs_n),
	.DDR_DRSTB(cpu_DDR_reset_n),
	.DDR_ODT(cpu_DDR_odt),
	.DDR_RAS_n(cpu_DDR_ras_n),
	.DDR_VRN(cpu_ddr_vrn),
	.DDR_VRP(cpu_ddr_vrp),
	.DDR_WEB(cpu_DDR_we_n),
	.MIO(cpu_mio),
	.PS_CLK(cpu_ps_clk),
	.PS_PORB(cpu_ps_porb),
	.PS_SRSTB(cpu_ps_srstb),
	.FCLK_CLK0(ps_fclk[0]),
	.FCLK_CLK1(ps_fclk[1]),
	.FCLK_CLK2(ps_fclk[2]),
	.FCLK_CLK3(ps_fclk[3]),
	.FCLK_RESET0_N(ps_frstn[0]),
	.FCLK_RESET1_N(ps_frstn[1]),
	.FCLK_RESET2_N(ps_frstn[2]),
	.FCLK_RESET3_N(ps_frstn[3]),
	.M_AXI_GP0_ARADDR(ps_axi_araddr),
	.M_AXI_GP0_ARBURST(ps_axi_arburst),
	.M_AXI_GP0_ARCACHE(ps_axi_arcache),
	.M_AXI_GP0_ARID(ps_axi_arid),
	.M_AXI_GP0_ARLEN(ps_axi_arlen),
	.M_AXI_GP0_ARLOCK(ps_axi_arlock),
	.M_AXI_GP0_ARPROT(ps_axi_arprot),
	.M_AXI_GP0_ARQOS(ps_axi_arqos),
	.M_AXI_GP0_ARSIZE(ps_axi_arsize),
	.M_AXI_GP0_ARVALID(ps_axi_arvalid),
	.M_AXI_GP0_AWADDR(ps_axi_awaddr),
	.M_AXI_GP0_AWBURST(ps_axi_awburst),
	.M_AXI_GP0_AWCACHE(ps_axi_awcache),
	.M_AXI_GP0_AWID(ps_axi_awid),
	.M_AXI_GP0_AWLEN(ps_axi_awlen),
	.M_AXI_GP0_AWLOCK(ps_axi_awlock),
	.M_AXI_GP0_AWPROT(ps_axi_awprot),
	.M_AXI_GP0_AWQOS(ps_axi_awqos),
	.M_AXI_GP0_AWSIZE(ps_axi_awsize),
	.M_AXI_GP0_AWVALID(ps_axi_awvalid),
	.M_AXI_GP0_BREADY(ps_axi_bready),
	.M_AXI_GP0_RREADY(ps_axi_rready),
	.M_AXI_GP0_WDATA(ps_axi_wdata),
	.M_AXI_GP0_WID(ps_axi_wid),
	.M_AXI_GP0_WLAST(ps_axi_wlast),
	.M_AXI_GP0_WSTRB(ps_axi_wstrb),
	.M_AXI_GP0_WVALID(ps_axi_wvalid)
);

IBUFGDS IBUFGDS(
	.I(clk125_p),
	.IB(clk125_n),
	.O(clk_adci)
);

BUFG BUFG(
	.I(clk_adci),
	.O(clk_adcb)
);

PLLE2_BASE #(
	.BANDWIDTH("OPTIMIZED"),
	.CLKFBOUT_MULT(4'd8),
	.CLKFBOUT_PHASE(0.0),
	.CLKIN1_PERIOD(8.0),
	.CLKOUT0_DIVIDE(2'd2),
	.CLKOUT0_DUTY_CYCLE(0.5),
	.CLKOUT0_PHASE(0.0),
	.CLKOUT1_DIVIDE(3'd4),
	.CLKOUT1_DUTY_CYCLE(0.5),
	.CLKOUT1_PHASE(0.0),
	.CLKOUT2_DIVIDE(4'd8),
	.CLKOUT2_DUTY_CYCLE(0.5),
	.CLKOUT2_PHASE(0.0),
	.CLKOUT3_DIVIDE(7'd120),
	.CLKOUT3_DUTY_CYCLE(0.5),
	.CLKOUT3_PHASE(0.0),
	.CLKOUT4_DIVIDE(3'd4),
	.CLKOUT4_DUTY_CYCLE(0.5),
	.CLKOUT4_PHASE(0.0),
	.CLKOUT5_DIVIDE(3'd4),
	.CLKOUT5_DUTY_CYCLE(0.5),
	.CLKOUT5_PHASE(0.0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_BASE (
	.CLKFBIN(clk_fbb),
	.CLKIN1(clk_adcb),
	.PWRDWN(1'd0),
	.RST((~ps_frstn[0])),
	.CLKFBOUT(clk_fb),
	.CLKOUT0(clk[0]),
	.CLKOUT1(clk[1]),
	.CLKOUT2(clk[2]),
	.CLKOUT3(clk[3]),
	.CLKOUT4(clk[4]),
	.CLKOUT5(clk[5]),
	.LOCKED(locked)
);

BUFG BUFG_1(
	.I(clk_fb),
	.O(clk_fbb)
);

BUFG BUFG_2(
	.I(clk[0]),
	.O(sys_quad_clk)
);

BUFG BUFG_3(
	.I(clk[1]),
	.O(sys_double_clk)
);

BUFG BUFG_4(
	.I(clk[2]),
	.O(sys_clk)
);

BUFG BUFG_5(
	.I(clk[3]),
	.O(sys_slow_clk)
);

FD #(
	.INIT(1'd1)
) FD (
	.C(sys_clk),
	.D((~locked)),
	.Q(sys_rst)
);

sequence_top #(
	.AWG_REGFILE_ADDR_WIDTH(4'd10),
	.DATA_WIDTH(6'd32),
	.FSM_REGFILE_ADDR_WIDTH(4'd9),
	.MAX_BLOCKS(5'd16),
	.NUM_BLOCK_TYPES(3'd6),
	.V_DATA_WIDTH(4'd14)
) sequence_top (
	.clk(sys_clk),
	.i_active(linienmodule_sequenceexecutor_active),
	.i_awg_reg_w_addr(linienmodule_sequenceexecutor_awg_reg_addr_storage),
	.i_awg_reg_w_data(linienmodule_sequenceexecutor_awg_reg_data_storage),
	.i_awg_reg_w_en(linienmodule_sequenceexecutor_awg_reg_wen_storage),
	.i_fsm_reg_w_addr(linienmodule_sequenceexecutor_fsm_reg_addr_storage),
	.i_fsm_reg_w_data(linienmodule_sequenceexecutor_fsm_reg_data_storage),
	.i_fsm_reg_w_en(linienmodule_sequenceexecutor_fsm_reg_wen_storage),
	.i_init_v(linienmodule_sequenceexecutor_o_saved_dac_out),
	.i_num_blocks(linienmodule_sequenceexecutor_num_blocks),
	.i_start(linienmodule_sequenceexecutor_o_fsm_start),
	.rst_n(((~sys_rst) & (~linienmodule_sequenceexecutor_reset_seq_storage))),
	.o_active(linienmodule_sequenceexecutor),
	.o_dac_drive(linienmodule_sequenceexecutor_o_dac_drive),
	.o_seq_done(linienmodule_sequenceexecutor_seq_done)
);

ODDR ODDR(
	.C(sys_double_clk),
	.CE(1'd1),
	.D1(1'd0),
	.D2(1'd1),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_clk)
);

ODDR ODDR_1(
	.C(sys_double_clk),
	.CE(1'd1),
	.D1(1'd0),
	.D2(1'd1),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_wrt)
);

ODDR ODDR_2(
	.C(sys_clk),
	.CE(1'd1),
	.D1(1'd0),
	.D2(1'd1),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_sel)
);

ODDR ODDR_3(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[0]),
	.D2(linienmodule_analog_dacb[0]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[0])
);

ODDR ODDR_4(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[1]),
	.D2(linienmodule_analog_dacb[1]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[1])
);

ODDR ODDR_5(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[2]),
	.D2(linienmodule_analog_dacb[2]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[2])
);

ODDR ODDR_6(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[3]),
	.D2(linienmodule_analog_dacb[3]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[3])
);

ODDR ODDR_7(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[4]),
	.D2(linienmodule_analog_dacb[4]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[4])
);

ODDR ODDR_8(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[5]),
	.D2(linienmodule_analog_dacb[5]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[5])
);

ODDR ODDR_9(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[6]),
	.D2(linienmodule_analog_dacb[6]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[6])
);

ODDR ODDR_10(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[7]),
	.D2(linienmodule_analog_dacb[7]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[7])
);

ODDR ODDR_11(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[8]),
	.D2(linienmodule_analog_dacb[8]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[8])
);

ODDR ODDR_12(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[9]),
	.D2(linienmodule_analog_dacb[9]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[9])
);

ODDR ODDR_13(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[10]),
	.D2(linienmodule_analog_dacb[10]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[10])
);

ODDR ODDR_14(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[11]),
	.D2(linienmodule_analog_dacb[11]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[11])
);

ODDR ODDR_15(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[12]),
	.D2(linienmodule_analog_dacb[12]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[12])
);

ODDR ODDR_16(
	.C(sys_clk),
	.CE(1'd1),
	.D1(linienmodule_analog_daca[13]),
	.D2(linienmodule_analog_dacb[13]),
	.R(1'd0),
	.S(1'd0),
	.Q(dac_data[13])
);

XADC #(
	.INIT_40(1'd0),
	.INIT_41(14'd12047),
	.INIT_42(11'd1024),
	.INIT_48(12'd2304),
	.INIT_49(10'd771),
	.INIT_4A(15'd18400),
	.INIT_4B(1'd0),
	.INIT_4C(12'd2048),
	.INIT_4D(10'd771),
	.INIT_4E(1'd0),
	.INIT_4F(1'd0),
	.INIT_50(16'd46573),
	.INIT_51(15'd22500),
	.INIT_52(16'd41287),
	.INIT_53(16'd51763),
	.INIT_54(16'd43322),
	.INIT_55(15'd21190),
	.INIT_56(16'd38229),
	.INIT_57(16'd44622),
	.INIT_58(15'd22937),
	.INIT_59(15'd21845),
	.INIT_5A(16'd39321),
	.INIT_5B(15'd27306),
	.INIT_5C(15'd20753),
	.INIT_5D(15'd20753),
	.INIT_5E(16'd37355),
	.INIT_5F(15'd26214)
) XADC (
	.CONVST(1'd0),
	.CONVSTCLK(1'd0),
	.DADDR(linienmodule_xadc_channel),
	.DCLK(sys_clk),
	.DEN(linienmodule_xadc_eoc),
	.DI(1'd0),
	.DWE(1'd0),
	.RESET(sys_rst),
	.VAUXN(slice_proxy0[15:0]),
	.VAUXP(slice_proxy1[15:0]),
	.VN(slice_proxy2[16]),
	.VP(slice_proxy3[16]),
	.ALM(linienmodule_xadc_alarm),
	.BUSY(linienmodule_xadc_busy),
	.CHANNEL(linienmodule_xadc_channel),
	.DO(linienmodule_xadc_data),
	.DRDY(linienmodule_xadc_drdy),
	.EOC(linienmodule_xadc_eoc),
	.EOS(linienmodule_xadc_eos),
	.OT(linienmodule_xadc_ot)
);

assign exp_n[0] = linienmodule_gpio_n_tstriple0_oe ? linienmodule_gpio_n_tstriple0_o : 1'bz;
assign linienmodule_gpio_n_tstriple0_i = exp_n[0];

assign exp_n[1] = linienmodule_gpio_n_tstriple1_oe ? linienmodule_gpio_n_tstriple1_o : 1'bz;
assign linienmodule_gpio_n_tstriple1_i = exp_n[1];

assign exp_n[2] = linienmodule_gpio_n_tstriple2_oe ? linienmodule_gpio_n_tstriple2_o : 1'bz;
assign linienmodule_gpio_n_tstriple2_i = exp_n[2];

assign exp_n[3] = linienmodule_gpio_n_tstriple3_oe ? linienmodule_gpio_n_tstriple3_o : 1'bz;
assign linienmodule_gpio_n_tstriple3_i = exp_n[3];

assign exp_n[4] = linienmodule_gpio_n_tstriple4_oe ? linienmodule_gpio_n_tstriple4_o : 1'bz;
assign linienmodule_gpio_n_tstriple4_i = exp_n[4];

assign exp_n[5] = linienmodule_gpio_n_tstriple5_oe ? linienmodule_gpio_n_tstriple5_o : 1'bz;
assign linienmodule_gpio_n_tstriple5_i = exp_n[5];

assign exp_n[6] = linienmodule_gpio_n_tstriple6_oe ? linienmodule_gpio_n_tstriple6_o : 1'bz;
assign linienmodule_gpio_n_tstriple6_i = exp_n[6];

assign exp_n[7] = linienmodule_gpio_n_tstriple7_oe ? linienmodule_gpio_n_tstriple7_o : 1'bz;
assign linienmodule_gpio_n_tstriple7_i = exp_n[7];

assign exp_p[0] = linienmodule_gpio_p_tstriple0_oe ? linienmodule_gpio_p_tstriple0_o : 1'bz;
assign linienmodule_gpio_p_tstriple0_i = exp_p[0];

assign exp_p[1] = linienmodule_gpio_p_tstriple1_oe ? linienmodule_gpio_p_tstriple1_o : 1'bz;
assign linienmodule_gpio_p_tstriple1_i = exp_p[1];

assign exp_p[2] = linienmodule_gpio_p_tstriple2_oe ? linienmodule_gpio_p_tstriple2_o : 1'bz;
assign linienmodule_gpio_p_tstriple2_i = exp_p[2];

assign exp_p[3] = linienmodule_gpio_p_tstriple3_oe ? linienmodule_gpio_p_tstriple3_o : 1'bz;
assign linienmodule_gpio_p_tstriple3_i = exp_p[3];

assign exp_p[4] = linienmodule_gpio_p_tstriple4_oe ? linienmodule_gpio_p_tstriple4_o : 1'bz;
assign linienmodule_gpio_p_tstriple4_i = exp_p[4];

assign exp_p[5] = linienmodule_gpio_p_tstriple5_oe ? linienmodule_gpio_p_tstriple5_o : 1'bz;
assign linienmodule_gpio_p_tstriple5_i = exp_p[5];

assign exp_p[6] = linienmodule_gpio_p_tstriple6_oe ? linienmodule_gpio_p_tstriple6_o : 1'bz;
assign linienmodule_gpio_p_tstriple6_i = exp_p[6];

assign exp_p[7] = linienmodule_gpio_p_tstriple7_oe ? linienmodule_gpio_p_tstriple7_o : 1'bz;
assign linienmodule_gpio_p_tstriple7_i = exp_p[7];

DNA_PORT DNA_PORT(
	.CLK(linienmodule_dna_cnt[0]),
	.DIN(linienmodule_dna_status[63]),
	.READ((linienmodule_dna_cnt < 2'd2)),
	.SHIFT(1'd1),
	.DOUT(linienmodule_dna_do)
);

red_pitaya_scope red_pitaya_scope(
	.adc_a_i((linienmodule_scopegen_adc_a >>> 4'd11)),
	.adc_a_q_i((linienmodule_scopegen_adc_a_q >>> 4'd11)),
	.adc_b_i((linienmodule_scopegen_adc_b >>> 4'd11)),
	.adc_b_q_i((linienmodule_scopegen_adc_b_q >>> 4'd11)),
	.adc_clk_i(sys_clk),
	.adc_rstn_i((~sys_rst)),
	.automatically_rearm_i(linienmodule_scopegen_automatically_rearm),
	.sys_addr_i(linienmodule_scopegen_scope_sys_addr),
	.sys_clk_i(linienmodule_scopegen_scope_sys_clk),
	.sys_ren_i(linienmodule_scopegen_scope_sys_ren),
	.sys_rstn_i(linienmodule_scopegen_scope_sys_rstn),
	.sys_sel_i(linienmodule_scopegen_scope_sys_sel),
	.sys_wdata_i(linienmodule_scopegen_scope_sys_wdata),
	.sys_wen_i(linienmodule_scopegen_scope_sys_wen),
	.trig_asg_i(linienmodule_scopegen_asg_trig),
	.trig_ext_i((self | linienmodule_scopegen_automatic_trigger_signal)),
	.scope_position(linienmodule_scopegen_scope_position),
	.scope_writing_now(linienmodule_scopegen_writing_data_now),
	.sys_ack_o(linienmodule_scopegen_scope_sys_ack),
	.sys_err_o(linienmodule_scopegen_scope_sys_err),
	.sys_rdata_o(linienmodule_scopegen_scope_sys_rdata),
	.written_data(linienmodule_scopegen_scope_written_data)
);

bus_clk_bridge bus_clk_bridge(
	.ack_i(linienmodule_target_ack),
	.clk_i(linienmodule_target_clk),
	.err_i(linienmodule_target_err),
	.rdata_i(linienmodule_target_rdata),
	.rstn_i(linienmodule_target_rstn),
	.sys_addr_i(linienmodule_source_addr),
	.sys_clk_i(linienmodule_source_clk),
	.sys_ren_i(linienmodule_source_ren),
	.sys_rstn_i(linienmodule_source_rstn),
	.sys_sel_i(linienmodule_source_sel),
	.sys_wdata_i(linienmodule_source_wdata),
	.sys_wen_i(linienmodule_source_wen),
	.addr_o(linienmodule_target_addr),
	.ren_o(linienmodule_target_ren),
	.sys_ack_o(linienmodule_source_ack),
	.sys_err_o(linienmodule_source_err),
	.sys_rdata_o(linienmodule_source_rdata),
	.wdata_o(linienmodule_target_wdata),
	.wen_o(linienmodule_target_wen)
);

endmodule
