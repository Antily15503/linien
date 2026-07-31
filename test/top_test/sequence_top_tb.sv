module sequence_top_tb ();

  parameter int MAX_BLOCKS = 16;
  parameter int DATA_WIDTH = 32;
  parameter int V_DATA_WIDTH = 14;
  parameter int NUM_BLOCK_TYPES = 6;
  //dictates how many instructions there can be
  //assuming each instruction takes up 8 lines of memory; 1 line being 32
  //bits wide
  //total of 32 instructions?
  //test to see how large this can get lol
  parameter int FSM_REGFILE_ADDR_WIDTH = 9;
  parameter int AWG_REGFILE_ADDR_WIDTH = 10;
  parameter int BLOCK_IDX_WIDTH = $clog2(MAX_BLOCKS);
  parameter int BLOCK_TYPE_IDX_WIDTH = $clog2(NUM_BLOCK_TYPES);

  logic                              clk;
  logic                              rst_n;
  logic [FSM_REGFILE_ADDR_WIDTH-1:0] i_fsm_reg_w_addr;
  logic [            DATA_WIDTH-1:0] i_fsm_reg_w_data;
  logic                              i_fsm_reg_w_en;
  logic [AWG_REGFILE_ADDR_WIDTH-1:0] i_awg_reg_w_addr;
  logic [          V_DATA_WIDTH-1:0] i_awg_reg_w_data;
  logic                              i_awg_reg_w_en;
  logic [       BLOCK_IDX_WIDTH-1:0] i_num_blocks;  //last block index
  logic                              i_start;  //in ttl_handler, this is o_fsm_start
  logic [                      13:0] i_init_v;  //saved DAC voltage
  logic [                       3:0] i_active;  //signal for offset, COMES FROM TTL HANDLER
  logic                              o_seq_done;  //1 cycle pulse
  logic                              o_active;  //high when sequence is active
  logic [                      13:0] o_dac_drive;

  logic [                       3:0] sinusoid_reg_addr;
  logic [                      31:0] sinusoid_reg_data;
  logic [                       1:0] sinusoid_en_active;

  initial begin
    $dumpfile("sequence_top_tb.vcd");
    $dumpvars(0, sequence_top_tb);
  end
  sequence_top iDUT (
      .clk(clk),
      .rst_n(rst_n),
      .i_fsm_reg_w_addr(i_fsm_reg_w_addr),
      .i_fsm_reg_w_data(i_fsm_reg_w_data),
      .i_fsm_reg_w_en(i_fsm_reg_w_en),
      .i_awg_reg_w_addr(i_awg_reg_w_addr),
      .i_awg_reg_w_data(i_awg_reg_w_data),
      .i_awg_reg_w_en(i_awg_reg_w_en),
      .i_num_blocks(i_num_blocks),
      .i_start(i_start),
      .i_init_v(i_init_v),
      .i_active(i_active),
      .o_seq_done(o_seq_done),
      .o_active(o_active),
      .o_dac_drive(o_dac_drive),
      .sinusoid_reg_addr(sinusoid_reg_addr),
      .sinusoid_reg_data(sinusoid_reg_data),
      .sinusoid_en_active(sinusoid_en_active)
  );

endmodule
