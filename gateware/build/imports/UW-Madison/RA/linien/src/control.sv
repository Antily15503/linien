`default_nettype none

// control.sv - sequence execution FSM
//
// reads block parameters from reg_file (1-cycle sync read latency),
// loads them into the active functional block via a shared param bus,
// then starts the block and waits for the duration to elapse (via internal counter).
//
// relative voltage semantics (v_lock):
//   every block's v_drive output is treated as a SIGNED OFFSET from v_lock,
//   not an absolute DAC count. v_lock is the linien DAC value snapshotted by
//   ttl_handler at TTL trigger time, arriving here on i_init_v_drive. the FSM's
//   final v_drive output is sat14(block_offset + v_lock).
//
//   consequence: PS-side parameters (target voltages, ramp endpoints, AWG
//   samples, sinusoid v_mid, etc.) must be programmed as signed offsets from
//   v_lock. specifying an offset of 0 holds the laser at v_lock.
//
// integration notes:
//   - i_num_blocks is the INDEX of the last block (0 = one block, 15 = sixteen).
//     the PS writes this convention via regfile_adapter.num_blocks.
//   - i_init_v_drive comes from ttl_handler.o_saved_dac_out (DAC_WIDTH) and
//     stays stable for the duration of a sequence (ttl_handler is gated against
//     re-arming while o_active is high).
//   - o_active is high from FETCH_TYPE through CAPTURE_VDRIVE. it drops in DONE.
//     the DAC mux should use ttl_handler.o_active (which stays high until seq_done
//     is acknowledged) to avoid a 1-cycle glitch.
//   - o_seq_done pulses for 1 cycle in the DONE state. ttl_handler latches this.

module control #(
    // parameters
    parameter MAX_BLOCKS = 16,
    parameter DATA_WIDTH = 32,

    parameter NUM_BLOCK_TYPES = 6,
    parameter MAX_BLOCK_PARAMS = 7,  // max params any block type needs (chirp=6)
    //10 bits; 
    //lower 3 are allocated to indexing parameters
    //middle 4 are allocated to indexing blocks
    //upper 2 are used to index the 4 possible sequences. 
    //total of 9 bits
    parameter REGFILE_ADDR_WIDTH = 9,
    localparam int BLOCK_IDX_WIDTH = $clog2(MAX_BLOCKS),
    localparam int PARAM_IDX_WIDTH = $clog2(MAX_BLOCK_PARAMS),
    localparam int BLOCK_TYPE_IDX_WIDTH = $clog2(NUM_BLOCK_TYPES)
) (
    input wire clk,
    input wire rst_n,

    // top level control inputs
    input wire i_start,  // one cycle pulse from ttl_handler
    input wire [BLOCK_IDX_WIDTH-1:0] i_num_blocks,  // last block index (0 = one block)
    input wire [13:0]                  i_init_v_drive,   // v_lock: ttl snapshot of linien DAC (added to every block offset at output)

    // reg_file read port
    output logic [REGFILE_ADDR_WIDTH-1:0] o_regfile_addr,
    input  wire  [        DATA_WIDTH-1:0] i_regfile_data,

    // functional block drive (active block selected by cur_type)
    input wire [13:0] i_block_drive[NUM_BLOCK_TYPES],

    //ADDED: active from ttl_handler to infer offset
    input wire [3:0] i_active,

    // shared param bus to functional blocks
    output logic [DATA_WIDTH-1:0] o_param_data,
    output logic [           3:0] o_param_addr,

    // per-block one-hot enable, and start signals
    output logic [NUM_BLOCK_TYPES-1:0]    o_block_en, // <- enables parameter loading
    output logic [NUM_BLOCK_TYPES-1:0]    o_block_active, // <- enables execution

    // DAC output
    output logic [13:0] v_drive,

    // control outputs (to ttl_handler / relock)
    output logic o_seq_done,
    //NOTE: THIS O_ACTIVE IS IGNORED, INSTEAD USES DIRECTLY FROM TTL HANDLER
    output logic o_active,
    output logic o_en_dac_b
);

  // ========================= FSM encoding ==============================
  // add additional state in between fetch_type and load_init to read carrier
  // wave enable
  typedef enum logic [3:0] {
    IDLE           = 4'b0000,
    ENABLE_CARRIER = 4'b0001,            // issue reg_file read for carrier_en
    FETCH_TYPE     = 4'b0010,            //latch enable_carrier, issue fetch for type
    LOAD_INIT      = 4'b0010 + 4'b0001,  // latch type, issue read for first param
    LOAD_PARAMS    = 4'b0011 + 4'b0001,  // write params to block, 1 per cycle
    START_BLOCK    = 4'b0100 + 4'b0001,  // one-cycle start pulse (param_wr guaranteed low)
    WAIT_DONE      = 4'b0101 + 4'b0001,  // block executing, wait for done
    CAPTURE_VDRIVE = 4'b0110 + 4'b0001,  // latch final drive, advance block index
    DONE           = 4'b0111 + 4'b0001   // pulse seq_done, return to idle
  } state_t;
  state_t state, next_state;

  // ========================= Internal Registers ==============================
  logic [     BLOCK_IDX_WIDTH-1:0] block_idx;  // "program counter"
  logic [     PARAM_IDX_WIDTH-1:0] param_idx;  // current param being loaded
  logic [                    13:0] prev_v_drive;  // voltage to hold between blocks
  logic [BLOCK_TYPE_IDX_WIDTH-1:0] cur_type;  // current block type (opcode)
  logic [          DATA_WIDTH-1:0] dur;  //how long the current block should run
  logic [          DATA_WIDTH-1:0] count;  //counter - tracks how long current block has been on

  // ========================= Comb. Intermediates ==============================
  logic [     NUM_BLOCK_TYPES-1:0] type_onehot;
  logic [                    13:0] active_block_drive;
  logic [     PARAM_IDX_WIDTH-1:0] num_params;
  logic last_param, last_block;
  logic [REGFILE_ADDR_WIDTH-1:0] block_base_addr;
  logic                          timer_flag;

  // ========================= Current Block Calculations ==============================
  // "effectively" a 4 bit value; upper 0 doesn't do anything, and middle
  // 3 dictates location of block; can address 16 blocks. 
  // to access upper 16 blocks, set MSB to 1. 
  // to increase from 32 blocks to 64 (effectively 4 seperate sequences),
  // increase upper bit size to 2
  // hmmmm, given this is combinational it might just be easier to increase
  // the size of the o_active signal to 4 bits so the upper bits can be
  // combinationally determined?
  logic [                   1:0] active_to_binary;
  always_comb begin
    case (i_active)
      4'b0000: active_to_binary = 2'b00;
      4'b0001: active_to_binary = 2'b00;
      4'b0010: active_to_binary = 2'b01;
      4'b0100: active_to_binary = 2'b10;
      4'b1000: active_to_binary = 2'b11;
      default: active_to_binary = 2'b00;
    endcase
  end
  assign block_base_addr    = {active_to_binary, block_idx, 3'b000};  // block_idx * 8
  //based on cur_type, activates the relavant block by left shifting 'b1 by
  //the given type
  assign type_onehot        = NUM_BLOCK_TYPES'(1) << cur_type;
  assign active_block_drive = i_block_drive[cur_type];
  assign timer_flag         = (count >= dur);


  // param count LUT — how many params each block type needs (duration param doesn't go into the blocks though)
  //   type 0 (delay):       2  (hold_voltage, duration)
  //   type 1 (linear_ramp): 3  (v_start,v_step, clk_div, duration)
  //   type 2 (direct_jump): 2  (target_voltage, duration)
  //   type 3 (chirp):       5  (a, b, rate, raterate, duration)
  //   type 4 (sinusoid):    6  (v_mid, v_amp, v_min_cut, v_max_cut, phase_inc, duration)
  //   type 5 (arb_wfm):     4  (clk_div, length, duration) <- ps should calculate how long the awg will take (if it is used) and pass that into the fsm as duration signal.
  //   NOTE: for carrier wave purposes, all parameters are increased by 1
  always_comb begin
    case (cur_type)
      6'd0:    num_params = 3'd2; //delay
      6'd1:    num_params = 3'd4; //linear ramp
      6'd2:    num_params = 3'd2; //direct jump
      6'd3:    num_params = 3'd5; //chirp
      //NOTE: sinusoid can no longer be used in sequence (for the 7010 branch
      //at least).
      //6'd4:    num_params = 3'd6+3'd1; // sinusoid
      6'd5:    num_params = 3'd2; //arbitrary wave
      default: num_params = 3'd2;
    endcase
  end


  // boundary flags
  // NOTE: this needs to be asserted 1 clock cycle earlier due to latency of
  // reads from the regfile. 
  assign last_param = (param_idx == (num_params - PARAM_IDX_WIDTH'(1)));
  assign last_block = (block_idx == i_num_blocks);

  // ========================= FSM Next-State Logic ==============================
  always_comb begin
    next_state = state;

    case (state)
      IDLE: begin
        if (i_start) next_state = FETCH_TYPE;
        if (i_start) next_state = ENABLE_CARRIER;
      end
      ENABLE_CARRIER: next_state = FETCH_TYPE;
      FETCH_TYPE:     next_state = LOAD_INIT;
      LOAD_INIT:      next_state = LOAD_PARAMS;
      LOAD_PARAMS: begin
        if (last_param) next_state = START_BLOCK;
      end
      START_BLOCK:    next_state = WAIT_DONE;
      WAIT_DONE: begin
        if (timer_flag) next_state = CAPTURE_VDRIVE;
      end
      CAPTURE_VDRIVE: begin
        if (last_block) next_state = DONE;
        //else next_state = FETCH_TYPE;
        else
          next_state = ENABLE_CARRIER;
      end
      DONE:           next_state = IDLE;
      default:        next_state = IDLE;
    endcase
  end

  // state register (async reset)
  always_ff @(posedge clk) begin
    if (!rst_n) state <= IDLE;
    else state <= next_state;
  end

  reg carrier_en;
  always @(posedge clk) begin
    if (!rst_n) begin
      carrier_en <= 1'b0;
    end
    if (state == IDLE) carrier_en <= 1'b0;
    else begin
      if (state == FETCH_TYPE) carrier_en <= i_regfile_data;
    end
  end

  assign o_en_dac_b = carrier_en;



  // ========================= Datapath Registers (sync reset) ==============================
  // TODO: change block_idx to start at different "start" points, so that
  // multiple ttl_signals can trigger different sequences. 
  always_ff @(posedge clk) begin
    if (!rst_n) begin
      block_idx    <= '0;
      param_idx    <= '0;
      prev_v_drive <= '0;
      cur_type     <= '0;
      dur          <= '0;
      count        <= '0;
    end else begin
      case (state)
        IDLE: begin
          if (i_start) begin
            //change the block_idx depending on which signal was triggered. 
            block_idx    <= '0;
            param_idx    <= '0;
            // relative semantics: prev_v_drive holds the inter-block hold OFFSET.
            // 0 means "stay at v_lock" between sequence start and first block drive.
            prev_v_drive <= '0;
            count        <= '0;
          end
        end

        //if the current state is ENABLE_CARRIER, first index (param_idx==0)
        //should be relavant bit
        ENABLE_CARRIER: begin
          param_idx <= 'b0;
        end

        //type should be located at param_idx==1
        //1 clock cycle after showing regfile param_idx, signal should be
        //  valid. read into register?
        FETCH_TYPE: begin
          param_idx <= '0;
          count     <= '0;
        end

        LOAD_INIT: begin
          //on the load initial stage, the current type is decided by a 1-hot
          //encoded scheme. Here it only inspects the last-relavant set of LSB
          cur_type <= i_regfile_data[BLOCK_TYPE_IDX_WIDTH-1:0];
        end

        LOAD_PARAMS: begin
          if (last_param) begin
            dur <= i_regfile_data;
          end else begin
            param_idx <= param_idx + PARAM_IDX_WIDTH'(1);
          end
        end

        START_BLOCK: begin
          // start by setting count to 1
          count <= DATA_WIDTH'(1);
        end

        WAIT_DONE: begin
          // keep incrementing
          count <= count + DATA_WIDTH'(1);
        end

        CAPTURE_VDRIVE: begin
          prev_v_drive <= active_block_drive;
          count        <= '0;
          if (!last_block) block_idx <= block_idx + BLOCK_IDX_WIDTH'(1);
        end

        DONE: begin
          block_idx <= '0;
          param_idx <= '0;
          count     <= '0;
        end
      endcase
    end
  end

  // ========================= Reg-File Address Generation ==============================
  // NOTE: offset all indicies by 1 to account for enable_carrier variable
  always_comb begin
    case (state)
      ENABLE_CARRIER: o_regfile_addr = block_base_addr;
      FETCH_TYPE: o_regfile_addr = block_base_addr + 1'b1;  // offset 0: type
      LOAD_INIT:
      o_regfile_addr = block_base_addr + 8'd2;  // offset 1: first param (arrives next cycle)
      LOAD_PARAMS: o_regfile_addr = block_base_addr + 8'd3 + REGFILE_ADDR_WIDTH'(param_idx);
      default: o_regfile_addr = '0;
    endcase
  end

  // v_lock add: 14-bit signed offset (block or held) + 14-bit signed v_lock,
  // saturated back to 14-bit signed [-8192, 8191]. 15-bit intermediate prevents
  // wrap during the add.
  logic prev_abs;
  always @(posedge clk) begin
    if (~rst_n) prev_abs <= 1'b0;
    else if (state == CAPTURE_VDRIVE) prev_abs <= (cur_type == 3'd2);
  end
  logic signed [14:0] block_plus_lock;
  logic signed [14:0] held_plus_lock;

  assign block_plus_lock = $signed(
      {active_block_drive[13], active_block_drive}
  ) + $signed(
      {i_init_v_drive[13], i_init_v_drive}
  );
  assign held_plus_lock = $signed(
      {prev_v_drive[13], prev_v_drive}
  ) + $signed(
      {i_init_v_drive[13], i_init_v_drive}
  );
  logic [13:0] block_drive_sat;
  logic [13:0] held_drive_sat;
  // TODO: USE 551 LOGIC, i.e msb inspection for over/underflow or sm shi
  assign block_drive_sat =(cur_type==6'd2)?(active_block_drive):( (block_plus_lock > 15'sd8191)  ? 14'sd8191  :
                           (block_plus_lock < -15'sd8192) ? -14'sd8192 :
                                                            block_plus_lock[13:0]);
  assign held_drive_sat  = (prev_abs)?(prev_v_drive):((held_plus_lock  > 15'sd8191)  ? 14'sd8191  :
                           (held_plus_lock  < -15'sd8192) ? -14'sd8192 :
                                                            held_plus_lock[13:0]);
  always_comb begin
    // defaults
    o_param_data   = '0;
    o_param_addr   = '0;
    o_block_en     = '0;
    o_block_active = '0;
    v_drive        = held_drive_sat;
    o_seq_done     = 1'b0;
    o_active       = 1'b0;

    case (state)
      IDLE: begin
        // everything at defaults
      end

      ENABLE_CARRIER: begin
        //everything at default
      end

      FETCH_TYPE: begin
        o_active = 1'b1;
      end

      LOAD_INIT: begin
        o_active = 1'b1;
      end

      LOAD_PARAMS: begin
        o_active = 1'b1;
        if (!last_param) begin
          o_param_addr = 4'(param_idx);
          o_block_en   = type_onehot;
          o_param_data = i_regfile_data;  // data from previous cycle's read
        end
      end

      START_BLOCK: begin
        o_active       = 1'b1;
        o_block_en     = '0;
        o_block_active = type_onehot;
        v_drive        = block_drive_sat;
      end

      WAIT_DONE: begin
        o_active   = 1'b1;
        o_block_en = '0;
        o_block_active = type_onehot;
        v_drive    = block_drive_sat;
      end

      CAPTURE_VDRIVE: begin
        o_active   = 1'b1;
        o_block_active = type_onehot;
        v_drive    = block_drive_sat;
      end

      DONE: begin
        o_seq_done = 1'b1;
        // o_active intentionally 0 here. DAC mux uses ttl_handler.o_active
        // which stays high until it processes seq_done.
      end

      default: begin
        // safety
      end
    endcase
  end

endmodule
`default_nettype wire
