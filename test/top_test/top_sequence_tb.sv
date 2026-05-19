module top_sequence_test();
    parameter int MAX_BLOCKS = 16;
    parameter int DATA_WIDTH = 32;
    parameter int V_DATA_WIDTH = 14;
    parameter int NUM_BLOCK_TYPES = 6;
    //dictates how many instructions there can be
    //assuming each instruction takes up 8 lines of memory; 1 line being 32
    //bits wide
    //total of 32 instructions?
    //test to see how large this can get lol
    parameter int FSM_REGFILE_ADDR_WIDTH = 8;
    parameter int AWG_REGFILE_ADDR_WIDTH = 10;
    parameter int BLOCK_IDX_WIDTH = $clog2(MAX_BLOCKS);

    // NOTES FOR MULTI TTL IMPLEMENTATION:
    // assume contiguous block of memory, where the "start index" is changed 
    // depending on which ttl signal is encountered. 
    // i.e, control.sv will need a total of 4 ttl inputs for 4 different
    // "sequences". 
    // based on this, the i_num_blocks will need to be changed to execute the
    // corrent number of blocks. 
    // also change it to 4 outputs (o_active->o_active[0:3]) so they can be
    // differentiated?

     logic clk;
     logic rst_n;
     logic [FSM_REGFILE_ADDR_WIDTH-1:0] i_fsm_reg_w_addr;
     logic [DATA_WIDTH-1:0] i_fsm_reg_w_data;
     logic i_fsm_reg_w_en;
     logic [AWG_REGFILE_ADDR_WIDTH-1:0] i_awg_reg_w_addr;
     logic [V_DATA_WIDTH-1:0] i_awg_reg_w_data;
     logic i_awg_reg_w_en;
     logic [BLOCK_IDX_WIDTH-1:0] i_num_blocks;   //last block index
     logic                     i_start;         //in ttl_handler, this is o_fsm_start
     logic [13:0]              i_init_v;        //saved DAC voltage
     logic                    o_seq_done;      //1 cycle pulse
     logic                    o_active;        //high when sequence is active
     logic [13:0]             o_dac_drive;

     //dut instantiation

     sequence_top iDUT(
        .*
       );


endmodule
