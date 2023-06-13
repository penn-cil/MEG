`timescale 1ns / 1ps
`include "macro.vh" 
module AXIMem (

      input clock,      
      input clock200, // 200m Hz to drive DDR ctrl
      input reset,    
      
      //ddr4 physical interface
      output                  c0_ddr4_act_n,
      output [16:0]           c0_ddr4_adr,
      output [1:0]            c0_ddr4_ba,
      output [1:0]            c0_ddr4_bg,
      output [0:0]            c0_ddr4_cke,
      output [0:0]            c0_ddr4_odt,
      output [0:0]            c0_ddr4_cs_n,
      output [0:0]            c0_ddr4_ck_t,
      output [0:0]            c0_ddr4_ck_c,
      output                  c0_ddr4_reset_n,
      inout  [7:0]            c0_ddr4_dm_dbi_n,
      inout  [63:0]           c0_ddr4_dq,
      inout  [7:0]            c0_ddr4_dqs_t,
      inout  [7:0]            c0_ddr4_dqs_c,
      
      input c0_sys_clk_p,
      input c0_sys_clk_n,
      input buttonresetn,
    
      // mem_bus
      output        io_axi4_0_aw_ready, 
      input         io_axi4_0_aw_valid, 
      input  [3:0]  io_axi4_0_aw_id, 
      input  [31:0] io_axi4_0_aw_addr, 
      input  [7:0]  io_axi4_0_aw_len, 
      input  [2:0]  io_axi4_0_aw_size, 
      input  [1:0]  io_axi4_0_aw_burst,
      input          io_axi4_0_aw_lock,
      input   [3:0]  io_axi4_0_aw_cache, 
      input   [2:0]  io_axi4_0_aw_prot, 
      input   [3:0]  io_axi4_0_aw_qos,
      output        io_axi4_0_w_ready, 
      input         io_axi4_0_w_valid, 
      input  [63:0] io_axi4_0_w_data, 
      input  [7:0]  io_axi4_0_w_strb, 
      input         io_axi4_0_w_last, 
      input         io_axi4_0_b_ready, 
      output        io_axi4_0_b_valid, 
      output [3:0]  io_axi4_0_b_id, 
      output [1:0]  io_axi4_0_b_resp, 
      output        io_axi4_0_ar_ready, 
      input         io_axi4_0_ar_valid, 
      input  [3:0]  io_axi4_0_ar_id, 
      input  [31:0] io_axi4_0_ar_addr, 
      input  [7:0]  io_axi4_0_ar_len, 
      input  [2:0]  io_axi4_0_ar_size, 
      input  [1:0]  io_axi4_0_ar_burst, 
      input          io_axi4_0_ar_lock, 
      input   [3:0]  io_axi4_0_ar_cache, 
      input   [2:0]  io_axi4_0_ar_prot, 
      input   [3:0]  io_axi4_0_ar_qos, 
      input         io_axi4_0_r_ready, 
      output        io_axi4_0_r_valid, 
      output [3:0]  io_axi4_0_r_id, 
      output [63:0] io_axi4_0_r_data, 
      output [1:0]  io_axi4_0_r_resp, 
      output        io_axi4_0_r_last, 

      input     [32  * 15 - 1  :0]    acc_axi3_256_100M_awaddr,
      input     [4   * 15 - 1  :0]    acc_axi3_256_100M_awlen,
      input     [3   * 15 - 1  :0]    acc_axi3_256_100M_awsize,
      input     [2   * 15 - 1  :0]    acc_axi3_256_100M_awburst,
      input     [6   * 15 - 1  :0]    acc_axi3_256_100M_awid,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_awvalid,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_awready,
      input     [256 * 15 - 1  :0]    acc_axi3_256_100M_wdata,
      input     [32  * 15 - 1  :0]    acc_axi3_256_100M_wstrb,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_wlast,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_wvalid,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_wready,
      output    [2   * 15 - 1  :0]    acc_axi3_256_100M_bresp,
      output    [6   * 15 - 1  :0]    acc_axi3_256_100M_bid,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_bvalid,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_bready,
      input     [32  * 15 - 1  :0]    acc_axi3_256_100M_araddr,
      input     [4   * 15 - 1  :0]    acc_axi3_256_100M_arlen,
      input     [3   * 15 - 1  :0]    acc_axi3_256_100M_arsize,
      input     [2   * 15 - 1  :0]    acc_axi3_256_100M_arburst,
      input     [6   * 15 - 1  :0]    acc_axi3_256_100M_arid,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_arvalid,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_arready,
      output    [256 * 15 - 1  :0]    acc_axi3_256_100M_rdata,
      output    [2   * 15 - 1  :0]    acc_axi3_256_100M_rresp,
      output    [6   * 15 - 1  :0]    acc_axi3_256_100M_rid,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_rlast,
      output    [1   * 15 - 1  :0]    acc_axi3_256_100M_rvalid,
      input     [1   * 15 - 1  :0]    acc_axi3_256_100M_rready
      
  );
  
    wire resetn;
    assign resetn = ~ reset;
  
 
// ddr control module - it will always be here nomatter whether is used----------------------------------------------------------------------------------
  wire          ddr_calib_complete;
  wire          ui_clk;         // axi clk for domain bridge
  wire          ui_sync_rst; 
     
  // axi wires after domain conversion
  wire              ddr_axi4_0_aw_ready;   
  wire              ddr_axi4_0_aw_valid;   
  wire   [3:0]      ddr_axi4_0_aw_id;   
  wire   [31:0]      ddr_axi4_0_aw_addr;   
  wire   [7:0]      ddr_axi4_0_aw_len;   
  wire   [2:0]      ddr_axi4_0_aw_size;   
  wire   [1:0]      ddr_axi4_0_aw_burst;  
  wire              ddr_axi4_0_aw_lock;  
  wire    [3:0]     ddr_axi4_0_aw_cache;   
  wire    [2:0]     ddr_axi4_0_aw_prot;   
  wire    [3:0]     ddr_axi4_0_aw_qos;  
  wire              ddr_axi4_0_w_ready;   
  wire              ddr_axi4_0_w_valid;   
  wire   [63:0]      ddr_axi4_0_w_data;   
  wire   [7:0]      ddr_axi4_0_w_strb;   
  wire              ddr_axi4_0_w_last;   
  wire              ddr_axi4_0_b_ready;   
  wire              ddr_axi4_0_b_valid;   
  wire   [3:0]      ddr_axi4_0_b_id;   
  wire   [1:0]      ddr_axi4_0_b_resp;   
  wire              ddr_axi4_0_ar_ready;   
  wire              ddr_axi4_0_ar_valid;   
  wire   [3:0]      ddr_axi4_0_ar_id;   
  wire   [31:0]      ddr_axi4_0_ar_addr;   
  wire   [7:0]      ddr_axi4_0_ar_len;   
  wire   [2:0]      ddr_axi4_0_ar_size;   
  wire   [1:0]      ddr_axi4_0_ar_burst;   
  wire              ddr_axi4_0_ar_lock;   
  wire    [3:0]     ddr_axi4_0_ar_cache;   
  wire    [2:0]     ddr_axi4_0_ar_prot;   
  wire    [3:0]     ddr_axi4_0_ar_qos;   
  wire              ddr_axi4_0_r_ready;   
  wire              ddr_axi4_0_r_valid;   
  wire   [3:0]      ddr_axi4_0_r_id;   
  wire   [63:0]      ddr_axi4_0_r_data;   
  wire   [1:0]      ddr_axi4_0_r_resp;   
  wire              ddr_axi4_0_r_last;   

  ddr4_0 ddr4_inst(
    
    //clk and reset
    .c0_sys_clk_n           (c0_sys_clk_n),  // 200 MHz n
    .c0_sys_clk_p           (c0_sys_clk_p),
    .sys_rst                (~ buttonresetn), //reset of the ddr controller
    
    // other output wires
    //.dbg_clk              (),       
    //.dbg_bus              (dbg_bus),
    .c0_ddr4_ui_clk         (ui_clk),
    .c0_ddr4_ui_clk_sync_rst(ui_sync_rst),
    .c0_init_calib_complete (ddr_calib_complete),
    
    // C0_DDR4 physical wires
    .c0_ddr4_act_n          (c0_ddr4_act_n),
    .c0_ddr4_adr            (c0_ddr4_adr),
    .c0_ddr4_ba             (c0_ddr4_ba),
    .c0_ddr4_bg             (c0_ddr4_bg),
    .c0_ddr4_cke            (c0_ddr4_cke),
    .c0_ddr4_odt            (c0_ddr4_odt),
    .c0_ddr4_cs_n           (c0_ddr4_cs_n),
    .c0_ddr4_ck_t           (c0_ddr4_ck_t),
    .c0_ddr4_ck_c           (c0_ddr4_ck_c),
    .c0_ddr4_reset_n        (c0_ddr4_reset_n),
    .c0_ddr4_dm_dbi_n       (c0_ddr4_dm_dbi_n),
    .c0_ddr4_dq             (c0_ddr4_dq),
    .c0_ddr4_dqs_c          (c0_ddr4_dqs_c),
    .c0_ddr4_dqs_t          (c0_ddr4_dqs_t),

    // axi4 interface
    .c0_ddr4_aresetn           (resetn), //reset of axi interface
    .c0_ddr4_s_axi_awready     ( ddr_axi4_0_aw_ready    ),     
    .c0_ddr4_s_axi_awvalid     ( ddr_axi4_0_aw_valid    ),     
    .c0_ddr4_s_axi_awid        ( ddr_axi4_0_aw_id       ),     
    .c0_ddr4_s_axi_awaddr      ( ddr_axi4_0_aw_addr     ),     // mem map
    .c0_ddr4_s_axi_awlen       ( ddr_axi4_0_aw_len      ),     
    .c0_ddr4_s_axi_awsize      ( ddr_axi4_0_aw_size     ),     
    .c0_ddr4_s_axi_awburst     ( ddr_axi4_0_aw_burst    ),    
    .c0_ddr4_s_axi_awlock      ( ddr_axi4_0_aw_lock     ),    
    .c0_ddr4_s_axi_awcache     ( ddr_axi4_0_aw_cache    ),     
    .c0_ddr4_s_axi_awprot      ( ddr_axi4_0_aw_prot     ),     
    .c0_ddr4_s_axi_awqos       ( ddr_axi4_0_aw_qos      ),    
    .c0_ddr4_s_axi_wready      ( ddr_axi4_0_w_ready     ),     
    .c0_ddr4_s_axi_wvalid      ( ddr_axi4_0_w_valid     ),     
    .c0_ddr4_s_axi_wdata       ( ddr_axi4_0_w_data      ),     
    .c0_ddr4_s_axi_wstrb       ( ddr_axi4_0_w_strb      ),     
    .c0_ddr4_s_axi_wlast       ( ddr_axi4_0_w_last      ),     
    .c0_ddr4_s_axi_bready      ( ddr_axi4_0_b_ready     ),     
    .c0_ddr4_s_axi_bvalid      ( ddr_axi4_0_b_valid     ),     
    .c0_ddr4_s_axi_bid         ( ddr_axi4_0_b_id        ),     
    .c0_ddr4_s_axi_bresp       ( ddr_axi4_0_b_resp      ),     
    .c0_ddr4_s_axi_arready     ( ddr_axi4_0_ar_ready    ),     // mem map
    .c0_ddr4_s_axi_arvalid     ( ddr_axi4_0_ar_valid    ),     
    .c0_ddr4_s_axi_arid        ( ddr_axi4_0_ar_id       ),     
    .c0_ddr4_s_axi_araddr      ( ddr_axi4_0_ar_addr     ),     
    .c0_ddr4_s_axi_arlen       ( ddr_axi4_0_ar_len      ),     
    .c0_ddr4_s_axi_arsize      ( ddr_axi4_0_ar_size     ),     
    .c0_ddr4_s_axi_arburst     ( ddr_axi4_0_ar_burst    ),     
    .c0_ddr4_s_axi_arlock      ( ddr_axi4_0_ar_lock     ),     
    .c0_ddr4_s_axi_arcache     ( ddr_axi4_0_ar_cache    ),     
    .c0_ddr4_s_axi_arprot      ( ddr_axi4_0_ar_prot     ),     
    .c0_ddr4_s_axi_arqos       ( ddr_axi4_0_ar_qos      ),     
    .c0_ddr4_s_axi_rready      ( ddr_axi4_0_r_ready     ),     
    .c0_ddr4_s_axi_rvalid      ( ddr_axi4_0_r_valid     ),     
    .c0_ddr4_s_axi_rid         ( ddr_axi4_0_r_id        ),     
    .c0_ddr4_s_axi_rdata       ( ddr_axi4_0_r_data      ),     
    .c0_ddr4_s_axi_rresp       ( ddr_axi4_0_r_resp      ),     
    .c0_ddr4_s_axi_rlast       ( ddr_axi4_0_r_last      )
  );
 //// end of ddr module --------------------------------------------------------------------------------------------------------------------------------------
 
 
 /// hbm module ----------------------------------------------------------------------------------------------------------------------------------------------
       // linux memory bus wire when use HBM_port0 as main memory
        wire      [31:0]      hbm_port0_200M_awaddr;
        wire      [3:0]       hbm_port0_200M_awlen;
        wire      [2:0]       hbm_port0_200M_awsize;
        wire      [1:0]       hbm_port0_200M_awburst;
        wire                  hbm_port0_200M_awvalid;
        wire                  hbm_port0_200M_awready;
        wire                  hbm_port0_200M_awlock;
        wire      [3:0]       hbm_port0_200M_awcache;
        wire      [2:0]       hbm_port0_200M_awprot;
        wire      [3:0]       hbm_port0_200M_awqos;

        wire      [255:0]     hbm_port0_200M_wdata;
        wire      [31:0]      hbm_port0_200M_wstrb;
        wire                  hbm_port0_200M_wlast;
        wire                  hbm_port0_200M_wvalid;
        wire                  hbm_port0_200M_wready;

        wire      [1:0]       hbm_port0_200M_bresp;
        wire                  hbm_port0_200M_bvalid;
        wire                  hbm_port0_200M_bready;

        wire      [31:0]      hbm_port0_200M_araddr;
        wire      [3:0]       hbm_port0_200M_arlen;
        wire      [2:0]       hbm_port0_200M_arsize;
        wire      [1:0]       hbm_port0_200M_arburst;
        wire                  hbm_port0_200M_arvalid;
        wire                  hbm_port0_200M_arready;
        wire                  hbm_port0_200M_arlock;
        wire      [3:0]       hbm_port0_200M_arcache;
        wire      [2:0]       hbm_port0_200M_arprot;
        wire      [3:0]       hbm_port0_200M_arqos;

        wire      [255:0]     hbm_port0_200M_rdata;
        wire      [1:0]       hbm_port0_200M_rresp;
        wire                  hbm_port0_200M_rlast;
        wire                  hbm_port0_200M_rvalid;
        wire                  hbm_port0_200M_rready;

      wire          flag_compelet;
      wire          flag_cattrip;
      wire [6:0]    flag_temp;

      wire [31:0]   apb_wdata;
      wire [21:0]   apb_addr;
      wire          apb_clock;
      wire          apb_enable;
      wire          apb_resetn;
      wire          apb_select;
      wire          apb_write;
      wire [31:0]   apb_rdata;
      wire          apb_ready;
      wire          apb_transfer_error;

      // we not gonna to utilize the apb interface 
      assign apb_wdata = 0;
      assign apb_addr = 0;
      assign apb_clock = clock;
      assign apb_enable = 0;
      assign apb_resetn = resetn;
      assign apb_select = 0;
      assign apb_write = 0;

      hbm_0 hbm_ins(
 
        .HBM_REF_CLK_0 ( clock ),

        // axi_00 reserved for the cpu, if defined
        .AXI_00_ACLK ( clock200 ),
        .AXI_00_ARESET_N ( resetn ),
        //
        .AXI_00_ARADDR ( hbm_port0_200M_araddr   ),
        .AXI_00_ARBURST ( hbm_port0_200M_arburst ),
        .AXI_00_ARID ( 0 ),                             // single id
        .AXI_00_ARLEN ( hbm_port0_200M_arlen ),
        .AXI_00_ARSIZE ( hbm_port0_200M_arsize ),
        .AXI_00_ARVALID ( hbm_port0_200M_arvalid ),
        .AXI_00_ARREADY ( hbm_port0_200M_arready ),
        //
        .AXI_00_AWADDR ( hbm_port0_200M_awaddr  ),
        .AXI_00_AWBURST ( hbm_port0_200M_awburst ),
        .AXI_00_AWID ( 0 ),                             // single id
        .AXI_00_AWLEN ( hbm_port0_200M_awlen ),
        .AXI_00_AWSIZE ( hbm_port0_200M_awsize ),
        .AXI_00_AWVALID ( hbm_port0_200M_awvalid ),
        .AXI_00_AWREADY ( hbm_port0_200M_awready ),
        //
        .AXI_00_WDATA ( hbm_port0_200M_wdata ),
        .AXI_00_WLAST ( hbm_port0_200M_wlast ),
        .AXI_00_WSTRB ( hbm_port0_200M_wstrb ),
        .AXI_00_WDATA_PARITY ( 0 ),                     //we do not need parity
        .AXI_00_WVALID ( hbm_port0_200M_wvalid ),
        .AXI_00_WREADY ( hbm_port0_200M_wready ),
        //
        //.AXI_00_RDATA_PARITY ( hbm_port0_200M_rdata_parity_dummy ), // we do not need parity
        .AXI_00_RDATA ( hbm_port0_200M_rdata ),
        .AXI_00_RLAST ( hbm_port0_200M_rlast ),
        .AXI_00_RRESP ( hbm_port0_200M_rresp ),
        .AXI_00_RVALID ( hbm_port0_200M_rvalid ),
        .AXI_00_RREADY ( hbm_port0_200M_rready ),
        //
        //.AXI_00_BID ( hbm_port0_200M_bid_dummy ),   // we do not need that, we are of single id 
        .AXI_00_BRESP ( hbm_port0_200M_bresp ),
        .AXI_00_BVALID ( hbm_port0_200M_bvalid ),
        .AXI_00_BREADY ( hbm_port0_200M_bready ),
 
      // axi_01 ~ axi_15 for accelerator
      // the vivado will ground some of HBM's axi ports if they are not connected.???
      //------------axi_01-------------------------------------------------------------------------------------------
      .AXI_01_ACLK      ( clock ),
      .AXI_01_ARESET_N  ( resetn ),
      .AXI_01_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 01 - 1 : 32  * (01 - 1) ]),
      .AXI_01_ARBURST   ( acc_axi3_256_100M_arburst [2   * 01 - 1 : 2   * (01 - 1) ]),
      .AXI_01_ARID      ( acc_axi3_256_100M_arid    [6   * 01 - 1 : 6   * (01 - 1) ]),
      .AXI_01_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 01 - 1 : 4   * (01 - 1) ]),
      .AXI_01_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 01 - 1 : 3   * (01 - 1) ]),
      .AXI_01_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_ARREADY   ( acc_axi3_256_100M_arready [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 01 - 1 : 32  * (01 - 1) ]),
      .AXI_01_AWBURST   ( acc_axi3_256_100M_awburst [2   * 01 - 1 : 2   * (01 - 1) ]),
      .AXI_01_AWID      ( acc_axi3_256_100M_awid    [6   * 01 - 1 : 6   * (01 - 1) ]),
      .AXI_01_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 01 - 1 : 4   * (01 - 1) ]),
      .AXI_01_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 01 - 1 : 3   * (01 - 1) ]),
      .AXI_01_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_AWREADY   ( acc_axi3_256_100M_awready [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_WDATA     ( acc_axi3_256_100M_wdata   [256 * 01 - 1 : 256 * (01 - 1) ]),
      .AXI_01_WLAST     ( acc_axi3_256_100M_wlast   [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 01 - 1 : 32  * (01 - 1) ]),
      .AXI_01_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_WREADY    ( acc_axi3_256_100M_wready  [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_RID       ( acc_axi3_256_100M_rid     [6   * 01 - 1 : 6   * (01 - 1) ]),
      .AXI_01_RDATA     ( acc_axi3_256_100M_rdata   [256 * 01 - 1 : 256 * (01 - 1) ]),
      .AXI_01_RLAST     ( acc_axi3_256_100M_rlast   [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_RRESP     ( acc_axi3_256_100M_rresp   [2   * 01 - 1 : 2   * (01 - 1) ]),
      .AXI_01_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_RREADY    ( acc_axi3_256_100M_rready  [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_BID       ( acc_axi3_256_100M_bid     [6   * 01 - 1 : 6   * (01 - 1) ]),
      .AXI_01_BRESP     ( acc_axi3_256_100M_bresp   [2   * 01 - 1 : 2   * (01 - 1) ]),
      .AXI_01_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 01 - 1 : 1   * (01 - 1) ]),
      .AXI_01_BREADY    ( acc_axi3_256_100M_bready  [1   * 01 - 1 : 1   * (01 - 1) ]),
      //------------axi_02-------------------------------------------------------------------------------------------
      .AXI_02_ACLK      ( clock ),
      .AXI_02_ARESET_N  ( resetn ),
      .AXI_02_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 02 - 1 : 32  * (02 - 1) ]),
      .AXI_02_ARBURST   ( acc_axi3_256_100M_arburst [2   * 02 - 1 : 2   * (02 - 1) ]),
      .AXI_02_ARID      ( acc_axi3_256_100M_arid    [6   * 02 - 1 : 6   * (02 - 1) ]),
      .AXI_02_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 02 - 1 : 4   * (02 - 1) ]),
      .AXI_02_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 02 - 1 : 3   * (02 - 1) ]),
      .AXI_02_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_ARREADY   ( acc_axi3_256_100M_arready [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 02 - 1 : 32  * (02 - 1) ]),
      .AXI_02_AWBURST   ( acc_axi3_256_100M_awburst [2   * 02 - 1 : 2   * (02 - 1) ]),
      .AXI_02_AWID      ( acc_axi3_256_100M_awid    [6   * 02 - 1 : 6   * (02 - 1) ]),
      .AXI_02_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 02 - 1 : 4   * (02 - 1) ]),
      .AXI_02_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 02 - 1 : 3   * (02 - 1) ]),
      .AXI_02_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_AWREADY   ( acc_axi3_256_100M_awready [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_WDATA     ( acc_axi3_256_100M_wdata   [256 * 02 - 1 : 256 * (02 - 1) ]),
      .AXI_02_WLAST     ( acc_axi3_256_100M_wlast   [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 02 - 1 : 32  * (02 - 1) ]),
      .AXI_02_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_WREADY    ( acc_axi3_256_100M_wready  [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_RID       ( acc_axi3_256_100M_rid     [6   * 02 - 1 : 6   * (02 - 1) ]),
      .AXI_02_RDATA     ( acc_axi3_256_100M_rdata   [256 * 02 - 1 : 256 * (02 - 1) ]),
      .AXI_02_RLAST     ( acc_axi3_256_100M_rlast   [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_RRESP     ( acc_axi3_256_100M_rresp   [2   * 02 - 1 : 2   * (02 - 1) ]),
      .AXI_02_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_RREADY    ( acc_axi3_256_100M_rready  [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_BID       ( acc_axi3_256_100M_bid     [6   * 02 - 1 : 6   * (02 - 1) ]),
      .AXI_02_BRESP     ( acc_axi3_256_100M_bresp   [2   * 02 - 1 : 2   * (02 - 1) ]),
      .AXI_02_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 02 - 1 : 1   * (02 - 1) ]),
      .AXI_02_BREADY    ( acc_axi3_256_100M_bready  [1   * 02 - 1 : 1   * (02 - 1) ]),
      //------------axi_03-------------------------------------------------------------------------------------------
      .AXI_03_ACLK      ( clock ),
      .AXI_03_ARESET_N  ( resetn ),
      .AXI_03_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 03 - 1 : 32  * (03 - 1) ]),
      .AXI_03_ARBURST   ( acc_axi3_256_100M_arburst [2   * 03 - 1 : 2   * (03 - 1) ]),
      .AXI_03_ARID      ( acc_axi3_256_100M_arid    [6   * 03 - 1 : 6   * (03 - 1) ]),
      .AXI_03_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 03 - 1 : 4   * (03 - 1) ]),
      .AXI_03_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 03 - 1 : 3   * (03 - 1) ]),
      .AXI_03_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_ARREADY   ( acc_axi3_256_100M_arready [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 03 - 1 : 32  * (03 - 1) ]),
      .AXI_03_AWBURST   ( acc_axi3_256_100M_awburst [2   * 03 - 1 : 2   * (03 - 1) ]),
      .AXI_03_AWID      ( acc_axi3_256_100M_awid    [6   * 03 - 1 : 6   * (03 - 1) ]),
      .AXI_03_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 03 - 1 : 4   * (03 - 1) ]),
      .AXI_03_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 03 - 1 : 3   * (03 - 1) ]),
      .AXI_03_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_AWREADY   ( acc_axi3_256_100M_awready [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_WDATA     ( acc_axi3_256_100M_wdata   [256 * 03 - 1 : 256 * (03 - 1) ]),
      .AXI_03_WLAST     ( acc_axi3_256_100M_wlast   [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 03 - 1 : 32  * (03 - 1) ]),
      .AXI_03_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_WREADY    ( acc_axi3_256_100M_wready  [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_RID       ( acc_axi3_256_100M_rid     [6   * 03 - 1 : 6   * (03 - 1) ]),
      .AXI_03_RDATA     ( acc_axi3_256_100M_rdata   [256 * 03 - 1 : 256 * (03 - 1) ]),
      .AXI_03_RLAST     ( acc_axi3_256_100M_rlast   [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_RRESP     ( acc_axi3_256_100M_rresp   [2   * 03 - 1 : 2   * (03 - 1) ]),
      .AXI_03_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_RREADY    ( acc_axi3_256_100M_rready  [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_BID       ( acc_axi3_256_100M_bid     [6   * 03 - 1 : 6   * (03 - 1) ]),
      .AXI_03_BRESP     ( acc_axi3_256_100M_bresp   [2   * 03 - 1 : 2   * (03 - 1) ]),
      .AXI_03_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 03 - 1 : 1   * (03 - 1) ]),
      .AXI_03_BREADY    ( acc_axi3_256_100M_bready  [1   * 03 - 1 : 1   * (03 - 1) ]),
      //------------axi_04-------------------------------------------------------------------------------------------
      .AXI_04_ACLK      ( clock ),
      .AXI_04_ARESET_N  ( resetn ),
      .AXI_04_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 04 - 1 : 32  * (04 - 1) ]),
      .AXI_04_ARBURST   ( acc_axi3_256_100M_arburst [2   * 04 - 1 : 2   * (04 - 1) ]),
      .AXI_04_ARID      ( acc_axi3_256_100M_arid    [6   * 04 - 1 : 6   * (04 - 1) ]),
      .AXI_04_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 04 - 1 : 4   * (04 - 1) ]),
      .AXI_04_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 04 - 1 : 3   * (04 - 1) ]),
      .AXI_04_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_ARREADY   ( acc_axi3_256_100M_arready [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 04 - 1 : 32  * (04 - 1) ]),
      .AXI_04_AWBURST   ( acc_axi3_256_100M_awburst [2   * 04 - 1 : 2   * (04 - 1) ]),
      .AXI_04_AWID      ( acc_axi3_256_100M_awid    [6   * 04 - 1 : 6   * (04 - 1) ]),
      .AXI_04_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 04 - 1 : 4   * (04 - 1) ]),
      .AXI_04_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 04 - 1 : 3   * (04 - 1) ]),
      .AXI_04_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_AWREADY   ( acc_axi3_256_100M_awready [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_WDATA     ( acc_axi3_256_100M_wdata   [256 * 04 - 1 : 256 * (04 - 1) ]),
      .AXI_04_WLAST     ( acc_axi3_256_100M_wlast   [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 04 - 1 : 32  * (04 - 1) ]),
      .AXI_04_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_WREADY    ( acc_axi3_256_100M_wready  [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_RID       ( acc_axi3_256_100M_rid     [6   * 04 - 1 : 6   * (04 - 1) ]),
      .AXI_04_RDATA     ( acc_axi3_256_100M_rdata   [256 * 04 - 1 : 256 * (04 - 1) ]),
      .AXI_04_RLAST     ( acc_axi3_256_100M_rlast   [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_RRESP     ( acc_axi3_256_100M_rresp   [2   * 04 - 1 : 2   * (04 - 1) ]),
      .AXI_04_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_RREADY    ( acc_axi3_256_100M_rready  [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_BID       ( acc_axi3_256_100M_bid     [6   * 04 - 1 : 6   * (04 - 1) ]),
      .AXI_04_BRESP     ( acc_axi3_256_100M_bresp   [2   * 04 - 1 : 2   * (04 - 1) ]),
      .AXI_04_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 04 - 1 : 1   * (04 - 1) ]),
      .AXI_04_BREADY    ( acc_axi3_256_100M_bready  [1   * 04 - 1 : 1   * (04 - 1) ]),
      //------------axi_05-------------------------------------------------------------------------------------------
      .AXI_05_ACLK      ( clock ),
      .AXI_05_ARESET_N  ( resetn ),
      .AXI_05_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 05 - 1 : 32  * (05 - 1) ]),
      .AXI_05_ARBURST   ( acc_axi3_256_100M_arburst [2   * 05 - 1 : 2   * (05 - 1) ]),
      .AXI_05_ARID      ( acc_axi3_256_100M_arid    [6   * 05 - 1 : 6   * (05 - 1) ]),
      .AXI_05_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 05 - 1 : 4   * (05 - 1) ]),
      .AXI_05_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 05 - 1 : 3   * (05 - 1) ]),
      .AXI_05_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_ARREADY   ( acc_axi3_256_100M_arready [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 05 - 1 : 32  * (05 - 1) ]),
      .AXI_05_AWBURST   ( acc_axi3_256_100M_awburst [2   * 05 - 1 : 2   * (05 - 1) ]),
      .AXI_05_AWID      ( acc_axi3_256_100M_awid    [6   * 05 - 1 : 6   * (05 - 1) ]),
      .AXI_05_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 05 - 1 : 4   * (05 - 1) ]),
      .AXI_05_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 05 - 1 : 3   * (05 - 1) ]),
      .AXI_05_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_AWREADY   ( acc_axi3_256_100M_awready [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_WDATA     ( acc_axi3_256_100M_wdata   [256 * 05 - 1 : 256 * (05 - 1) ]),
      .AXI_05_WLAST     ( acc_axi3_256_100M_wlast   [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 05 - 1 : 32  * (05 - 1) ]),
      .AXI_05_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_WREADY    ( acc_axi3_256_100M_wready  [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_RID       ( acc_axi3_256_100M_rid     [6   * 05 - 1 : 6   * (05 - 1) ]),
      .AXI_05_RDATA     ( acc_axi3_256_100M_rdata   [256 * 05 - 1 : 256 * (05 - 1) ]),
      .AXI_05_RLAST     ( acc_axi3_256_100M_rlast   [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_RRESP     ( acc_axi3_256_100M_rresp   [2   * 05 - 1 : 2   * (05 - 1) ]),
      .AXI_05_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_RREADY    ( acc_axi3_256_100M_rready  [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_BID       ( acc_axi3_256_100M_bid     [6   * 05 - 1 : 6   * (05 - 1) ]),
      .AXI_05_BRESP     ( acc_axi3_256_100M_bresp   [2   * 05 - 1 : 2   * (05 - 1) ]),
      .AXI_05_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 05 - 1 : 1   * (05 - 1) ]),
      .AXI_05_BREADY    ( acc_axi3_256_100M_bready  [1   * 05 - 1 : 1   * (05 - 1) ]),
      //------------axi_06-------------------------------------------------------------------------------------------
      .AXI_06_ACLK      ( clock ),
      .AXI_06_ARESET_N  ( resetn ),
      .AXI_06_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 06 - 1 : 32  * (06 - 1) ]),
      .AXI_06_ARBURST   ( acc_axi3_256_100M_arburst [2   * 06 - 1 : 2   * (06 - 1) ]),
      .AXI_06_ARID      ( acc_axi3_256_100M_arid    [6   * 06 - 1 : 6   * (06 - 1) ]),
      .AXI_06_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 06 - 1 : 4   * (06 - 1) ]),
      .AXI_06_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 06 - 1 : 3   * (06 - 1) ]),
      .AXI_06_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_ARREADY   ( acc_axi3_256_100M_arready [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 06 - 1 : 32  * (06 - 1) ]),
      .AXI_06_AWBURST   ( acc_axi3_256_100M_awburst [2   * 06 - 1 : 2   * (06 - 1) ]),
      .AXI_06_AWID      ( acc_axi3_256_100M_awid    [6   * 06 - 1 : 6   * (06 - 1) ]),
      .AXI_06_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 06 - 1 : 4   * (06 - 1) ]),
      .AXI_06_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 06 - 1 : 3   * (06 - 1) ]),
      .AXI_06_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_AWREADY   ( acc_axi3_256_100M_awready [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_WDATA     ( acc_axi3_256_100M_wdata   [256 * 06 - 1 : 256 * (06 - 1) ]),
      .AXI_06_WLAST     ( acc_axi3_256_100M_wlast   [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 06 - 1 : 32  * (06 - 1) ]),
      .AXI_06_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_WREADY    ( acc_axi3_256_100M_wready  [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_RID       ( acc_axi3_256_100M_rid     [6   * 06 - 1 : 6   * (06 - 1) ]),
      .AXI_06_RDATA     ( acc_axi3_256_100M_rdata   [256 * 06 - 1 : 256 * (06 - 1) ]),
      .AXI_06_RLAST     ( acc_axi3_256_100M_rlast   [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_RRESP     ( acc_axi3_256_100M_rresp   [2   * 06 - 1 : 2   * (06 - 1) ]),
      .AXI_06_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_RREADY    ( acc_axi3_256_100M_rready  [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_BID       ( acc_axi3_256_100M_bid     [6   * 06 - 1 : 6   * (06 - 1) ]),
      .AXI_06_BRESP     ( acc_axi3_256_100M_bresp   [2   * 06 - 1 : 2   * (06 - 1) ]),
      .AXI_06_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 06 - 1 : 1   * (06 - 1) ]),
      .AXI_06_BREADY    ( acc_axi3_256_100M_bready  [1   * 06 - 1 : 1   * (06 - 1) ]),
      //------------axi_07-------------------------------------------------------------------------------------------
      .AXI_07_ACLK      ( clock ),
      .AXI_07_ARESET_N  ( resetn ),
      .AXI_07_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 07 - 1 : 32  * (07 - 1) ]),
      .AXI_07_ARBURST   ( acc_axi3_256_100M_arburst [2   * 07 - 1 : 2   * (07 - 1) ]),
      .AXI_07_ARID      ( acc_axi3_256_100M_arid    [6   * 07 - 1 : 6   * (07 - 1) ]),
      .AXI_07_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 07 - 1 : 4   * (07 - 1) ]),
      .AXI_07_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 07 - 1 : 3   * (07 - 1) ]),
      .AXI_07_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_ARREADY   ( acc_axi3_256_100M_arready [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 07 - 1 : 32  * (07 - 1) ]),
      .AXI_07_AWBURST   ( acc_axi3_256_100M_awburst [2   * 07 - 1 : 2   * (07 - 1) ]),
      .AXI_07_AWID      ( acc_axi3_256_100M_awid    [6   * 07 - 1 : 6   * (07 - 1) ]),
      .AXI_07_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 07 - 1 : 4   * (07 - 1) ]),
      .AXI_07_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 07 - 1 : 3   * (07 - 1) ]),
      .AXI_07_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_AWREADY   ( acc_axi3_256_100M_awready [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_WDATA     ( acc_axi3_256_100M_wdata   [256 * 07 - 1 : 256 * (07 - 1) ]),
      .AXI_07_WLAST     ( acc_axi3_256_100M_wlast   [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 07 - 1 : 32  * (07 - 1) ]),
      .AXI_07_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_WREADY    ( acc_axi3_256_100M_wready  [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_RID       ( acc_axi3_256_100M_rid     [6   * 07 - 1 : 6   * (07 - 1) ]),
      .AXI_07_RDATA     ( acc_axi3_256_100M_rdata   [256 * 07 - 1 : 256 * (07 - 1) ]),
      .AXI_07_RLAST     ( acc_axi3_256_100M_rlast   [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_RRESP     ( acc_axi3_256_100M_rresp   [2   * 07 - 1 : 2   * (07 - 1) ]),
      .AXI_07_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_RREADY    ( acc_axi3_256_100M_rready  [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_BID       ( acc_axi3_256_100M_bid     [6   * 07 - 1 : 6   * (07 - 1) ]),
      .AXI_07_BRESP     ( acc_axi3_256_100M_bresp   [2   * 07 - 1 : 2   * (07 - 1) ]),
      .AXI_07_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 07 - 1 : 1   * (07 - 1) ]),
      .AXI_07_BREADY    ( acc_axi3_256_100M_bready  [1   * 07 - 1 : 1   * (07 - 1) ]),
      //------------axi_08-------------------------------------------------------------------------------------------
      .AXI_08_ACLK      ( clock ),
      .AXI_08_ARESET_N  ( resetn ),
      .AXI_08_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 08 - 1 : 32  * (08 - 1) ]),
      .AXI_08_ARBURST   ( acc_axi3_256_100M_arburst [2   * 08 - 1 : 2   * (08 - 1) ]),
      .AXI_08_ARID      ( acc_axi3_256_100M_arid    [6   * 08 - 1 : 6   * (08 - 1) ]),
      .AXI_08_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 08 - 1 : 4   * (08 - 1) ]),
      .AXI_08_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 08 - 1 : 3   * (08 - 1) ]),
      .AXI_08_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_ARREADY   ( acc_axi3_256_100M_arready [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 08 - 1 : 32  * (08 - 1) ]),
      .AXI_08_AWBURST   ( acc_axi3_256_100M_awburst [2   * 08 - 1 : 2   * (08 - 1) ]),
      .AXI_08_AWID      ( acc_axi3_256_100M_awid    [6   * 08 - 1 : 6   * (08 - 1) ]),
      .AXI_08_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 08 - 1 : 4   * (08 - 1) ]),
      .AXI_08_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 08 - 1 : 3   * (08 - 1) ]),
      .AXI_08_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_AWREADY   ( acc_axi3_256_100M_awready [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_WDATA     ( acc_axi3_256_100M_wdata   [256 * 08 - 1 : 256 * (08 - 1) ]),
      .AXI_08_WLAST     ( acc_axi3_256_100M_wlast   [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 08 - 1 : 32  * (08 - 1) ]),
      .AXI_08_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_WREADY    ( acc_axi3_256_100M_wready  [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_RID       ( acc_axi3_256_100M_rid     [6   * 08 - 1 : 6   * (08 - 1) ]),
      .AXI_08_RDATA     ( acc_axi3_256_100M_rdata   [256 * 08 - 1 : 256 * (08 - 1) ]),
      .AXI_08_RLAST     ( acc_axi3_256_100M_rlast   [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_RRESP     ( acc_axi3_256_100M_rresp   [2   * 08 - 1 : 2   * (08 - 1) ]),
      .AXI_08_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_RREADY    ( acc_axi3_256_100M_rready  [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_BID       ( acc_axi3_256_100M_bid     [6   * 08 - 1 : 6   * (08 - 1) ]),
      .AXI_08_BRESP     ( acc_axi3_256_100M_bresp   [2   * 08 - 1 : 2   * (08 - 1) ]),
      .AXI_08_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 08 - 1 : 1   * (08 - 1) ]),
      .AXI_08_BREADY    ( acc_axi3_256_100M_bready  [1   * 08 - 1 : 1   * (08 - 1) ]),
      //------------axi_09-------------------------------------------------------------------------------------------
      .AXI_09_ACLK      ( clock ),
      .AXI_09_ARESET_N  ( resetn ),
      .AXI_09_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 09 - 1 : 32  * (09 - 1) ]),
      .AXI_09_ARBURST   ( acc_axi3_256_100M_arburst [2   * 09 - 1 : 2   * (09 - 1) ]),
      .AXI_09_ARID      ( acc_axi3_256_100M_arid    [6   * 09 - 1 : 6   * (09 - 1) ]),
      .AXI_09_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 09 - 1 : 4   * (09 - 1) ]),
      .AXI_09_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 09 - 1 : 3   * (09 - 1) ]),
      .AXI_09_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_ARREADY   ( acc_axi3_256_100M_arready [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 09 - 1 : 32  * (09 - 1) ]),
      .AXI_09_AWBURST   ( acc_axi3_256_100M_awburst [2   * 09 - 1 : 2   * (09 - 1) ]),
      .AXI_09_AWID      ( acc_axi3_256_100M_awid    [6   * 09 - 1 : 6   * (09 - 1) ]),
      .AXI_09_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 09 - 1 : 4   * (09 - 1) ]),
      .AXI_09_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 09 - 1 : 3   * (09 - 1) ]),
      .AXI_09_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_AWREADY   ( acc_axi3_256_100M_awready [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_WDATA     ( acc_axi3_256_100M_wdata   [256 * 09 - 1 : 256 * (09 - 1) ]),
      .AXI_09_WLAST     ( acc_axi3_256_100M_wlast   [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 09 - 1 : 32  * (09 - 1) ]),
      .AXI_09_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_WREADY    ( acc_axi3_256_100M_wready  [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_RID       ( acc_axi3_256_100M_rid     [6   * 09 - 1 : 6   * (09 - 1) ]),
      .AXI_09_RDATA     ( acc_axi3_256_100M_rdata   [256 * 09 - 1 : 256 * (09 - 1) ]),
      .AXI_09_RLAST     ( acc_axi3_256_100M_rlast   [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_RRESP     ( acc_axi3_256_100M_rresp   [2   * 09 - 1 : 2   * (09 - 1) ]),
      .AXI_09_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_RREADY    ( acc_axi3_256_100M_rready  [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_BID       ( acc_axi3_256_100M_bid     [6   * 09 - 1 : 6   * (09 - 1) ]),
      .AXI_09_BRESP     ( acc_axi3_256_100M_bresp   [2   * 09 - 1 : 2   * (09 - 1) ]),
      .AXI_09_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 09 - 1 : 1   * (09 - 1) ]),
      .AXI_09_BREADY    ( acc_axi3_256_100M_bready  [1   * 09 - 1 : 1   * (09 - 1) ]),
      //------------axi_10-------------------------------------------------------------------------------------------
      .AXI_10_ACLK      ( clock ),
      .AXI_10_ARESET_N  ( resetn ),
      .AXI_10_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 10 - 1 : 32  * (10 - 1) ]),
      .AXI_10_ARBURST   ( acc_axi3_256_100M_arburst [2   * 10 - 1 : 2   * (10 - 1) ]),
      .AXI_10_ARID      ( acc_axi3_256_100M_arid    [6   * 10 - 1 : 6   * (10 - 1) ]),
      .AXI_10_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 10 - 1 : 4   * (10 - 1) ]),
      .AXI_10_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 10 - 1 : 3   * (10 - 1) ]),
      .AXI_10_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_ARREADY   ( acc_axi3_256_100M_arready [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 10 - 1 : 32  * (10 - 1) ]),
      .AXI_10_AWBURST   ( acc_axi3_256_100M_awburst [2   * 10 - 1 : 2   * (10 - 1) ]),
      .AXI_10_AWID      ( acc_axi3_256_100M_awid    [6   * 10 - 1 : 6   * (10 - 1) ]),
      .AXI_10_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 10 - 1 : 4   * (10 - 1) ]),
      .AXI_10_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 10 - 1 : 3   * (10 - 1) ]),
      .AXI_10_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_AWREADY   ( acc_axi3_256_100M_awready [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_WDATA     ( acc_axi3_256_100M_wdata   [256 * 10 - 1 : 256 * (10 - 1) ]),
      .AXI_10_WLAST     ( acc_axi3_256_100M_wlast   [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 10 - 1 : 32  * (10 - 1) ]),
      .AXI_10_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_WREADY    ( acc_axi3_256_100M_wready  [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_RID       ( acc_axi3_256_100M_rid     [6   * 10 - 1 : 6   * (10 - 1) ]),
      .AXI_10_RDATA     ( acc_axi3_256_100M_rdata   [256 * 10 - 1 : 256 * (10 - 1) ]),
      .AXI_10_RLAST     ( acc_axi3_256_100M_rlast   [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_RRESP     ( acc_axi3_256_100M_rresp   [2   * 10 - 1 : 2   * (10 - 1) ]),
      .AXI_10_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_RREADY    ( acc_axi3_256_100M_rready  [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_BID       ( acc_axi3_256_100M_bid     [6   * 10 - 1 : 6   * (10 - 1) ]),
      .AXI_10_BRESP     ( acc_axi3_256_100M_bresp   [2   * 10 - 1 : 2   * (10 - 1) ]),
      .AXI_10_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 10 - 1 : 1   * (10 - 1) ]),
      .AXI_10_BREADY    ( acc_axi3_256_100M_bready  [1   * 10 - 1 : 1   * (10 - 1) ]),
      //------------axi_11-------------------------------------------------------------------------------------------
      .AXI_11_ACLK      ( clock ),
      .AXI_11_ARESET_N  ( resetn ),
      .AXI_11_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 11 - 1 : 32  * (11 - 1) ]),
      .AXI_11_ARBURST   ( acc_axi3_256_100M_arburst [2   * 11 - 1 : 2   * (11 - 1) ]),
      .AXI_11_ARID      ( acc_axi3_256_100M_arid    [6   * 11 - 1 : 6   * (11 - 1) ]),
      .AXI_11_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 11 - 1 : 4   * (11 - 1) ]),
      .AXI_11_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 11 - 1 : 3   * (11 - 1) ]),
      .AXI_11_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_ARREADY   ( acc_axi3_256_100M_arready [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 11 - 1 : 32  * (11 - 1) ]),
      .AXI_11_AWBURST   ( acc_axi3_256_100M_awburst [2   * 11 - 1 : 2   * (11 - 1) ]),
      .AXI_11_AWID      ( acc_axi3_256_100M_awid    [6   * 11 - 1 : 6   * (11 - 1) ]),
      .AXI_11_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 11 - 1 : 4   * (11 - 1) ]),
      .AXI_11_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 11 - 1 : 3   * (11 - 1) ]),
      .AXI_11_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_AWREADY   ( acc_axi3_256_100M_awready [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_WDATA     ( acc_axi3_256_100M_wdata   [256 * 11 - 1 : 256 * (11 - 1) ]),
      .AXI_11_WLAST     ( acc_axi3_256_100M_wlast   [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 11 - 1 : 32  * (11 - 1) ]),
      .AXI_11_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_WREADY    ( acc_axi3_256_100M_wready  [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_RID       ( acc_axi3_256_100M_rid     [6   * 11 - 1 : 6   * (11 - 1) ]),
      .AXI_11_RDATA     ( acc_axi3_256_100M_rdata   [256 * 11 - 1 : 256 * (11 - 1) ]),
      .AXI_11_RLAST     ( acc_axi3_256_100M_rlast   [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_RRESP     ( acc_axi3_256_100M_rresp   [2   * 11 - 1 : 2   * (11 - 1) ]),
      .AXI_11_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_RREADY    ( acc_axi3_256_100M_rready  [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_BID       ( acc_axi3_256_100M_bid     [6   * 11 - 1 : 6   * (11 - 1) ]),
      .AXI_11_BRESP     ( acc_axi3_256_100M_bresp   [2   * 11 - 1 : 2   * (11 - 1) ]),
      .AXI_11_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 11 - 1 : 1   * (11 - 1) ]),
      .AXI_11_BREADY    ( acc_axi3_256_100M_bready  [1   * 11 - 1 : 1   * (11 - 1) ]),
      //------------axi_12-------------------------------------------------------------------------------------------
      .AXI_12_ACLK      ( clock ),
      .AXI_12_ARESET_N  ( resetn ),
      .AXI_12_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 12 - 1 : 32  * (12 - 1) ]),
      .AXI_12_ARBURST   ( acc_axi3_256_100M_arburst [2   * 12 - 1 : 2   * (12 - 1) ]),
      .AXI_12_ARID      ( acc_axi3_256_100M_arid    [6   * 12 - 1 : 6   * (12 - 1) ]),
      .AXI_12_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 12 - 1 : 4   * (12 - 1) ]),
      .AXI_12_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 12 - 1 : 3   * (12 - 1) ]),
      .AXI_12_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_ARREADY   ( acc_axi3_256_100M_arready [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 12 - 1 : 32  * (12 - 1) ]),
      .AXI_12_AWBURST   ( acc_axi3_256_100M_awburst [2   * 12 - 1 : 2   * (12 - 1) ]),
      .AXI_12_AWID      ( acc_axi3_256_100M_awid    [6   * 12 - 1 : 6   * (12 - 1) ]),
      .AXI_12_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 12 - 1 : 4   * (12 - 1) ]),
      .AXI_12_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 12 - 1 : 3   * (12 - 1) ]),
      .AXI_12_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_AWREADY   ( acc_axi3_256_100M_awready [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_WDATA     ( acc_axi3_256_100M_wdata   [256 * 12 - 1 : 256 * (12 - 1) ]),
      .AXI_12_WLAST     ( acc_axi3_256_100M_wlast   [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 12 - 1 : 32  * (12 - 1) ]),
      .AXI_12_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_WREADY    ( acc_axi3_256_100M_wready  [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_RID       ( acc_axi3_256_100M_rid     [6   * 12 - 1 : 6   * (12 - 1) ]),
      .AXI_12_RDATA     ( acc_axi3_256_100M_rdata   [256 * 12 - 1 : 256 * (12 - 1) ]),
      .AXI_12_RLAST     ( acc_axi3_256_100M_rlast   [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_RRESP     ( acc_axi3_256_100M_rresp   [2   * 12 - 1 : 2   * (12 - 1) ]),
      .AXI_12_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_RREADY    ( acc_axi3_256_100M_rready  [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_BID       ( acc_axi3_256_100M_bid     [6   * 12 - 1 : 6   * (12 - 1) ]),
      .AXI_12_BRESP     ( acc_axi3_256_100M_bresp   [2   * 12 - 1 : 2   * (12 - 1) ]),
      .AXI_12_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 12 - 1 : 1   * (12 - 1) ]),
      .AXI_12_BREADY    ( acc_axi3_256_100M_bready  [1   * 12 - 1 : 1   * (12 - 1) ]),
      //------------axi_13-------------------------------------------------------------------------------------------
      .AXI_13_ACLK      ( clock ),
      .AXI_13_ARESET_N  ( resetn ),
      .AXI_13_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 13 - 1 : 32  * (13 - 1) ]),
      .AXI_13_ARBURST   ( acc_axi3_256_100M_arburst [2   * 13 - 1 : 2   * (13 - 1) ]),
      .AXI_13_ARID      ( acc_axi3_256_100M_arid    [6   * 13 - 1 : 6   * (13 - 1) ]),
      .AXI_13_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 13 - 1 : 4   * (13 - 1) ]),
      .AXI_13_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 13 - 1 : 3   * (13 - 1) ]),
      .AXI_13_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_ARREADY   ( acc_axi3_256_100M_arready [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 13 - 1 : 32  * (13 - 1) ]),
      .AXI_13_AWBURST   ( acc_axi3_256_100M_awburst [2   * 13 - 1 : 2   * (13 - 1) ]),
      .AXI_13_AWID      ( acc_axi3_256_100M_awid    [6   * 13 - 1 : 6   * (13 - 1) ]),
      .AXI_13_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 13 - 1 : 4   * (13 - 1) ]),
      .AXI_13_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 13 - 1 : 3   * (13 - 1) ]),
      .AXI_13_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_AWREADY   ( acc_axi3_256_100M_awready [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_WDATA     ( acc_axi3_256_100M_wdata   [256 * 13 - 1 : 256 * (13 - 1) ]),
      .AXI_13_WLAST     ( acc_axi3_256_100M_wlast   [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 13 - 1 : 32  * (13 - 1) ]),
      .AXI_13_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_WREADY    ( acc_axi3_256_100M_wready  [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_RID       ( acc_axi3_256_100M_rid     [6   * 13 - 1 : 6   * (13 - 1) ]),
      .AXI_13_RDATA     ( acc_axi3_256_100M_rdata   [256 * 13 - 1 : 256 * (13 - 1) ]),
      .AXI_13_RLAST     ( acc_axi3_256_100M_rlast   [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_RRESP     ( acc_axi3_256_100M_rresp   [2   * 13 - 1 : 2   * (13 - 1) ]),
      .AXI_13_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_RREADY    ( acc_axi3_256_100M_rready  [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_BID       ( acc_axi3_256_100M_bid     [6   * 13 - 1 : 6   * (13 - 1) ]),
      .AXI_13_BRESP     ( acc_axi3_256_100M_bresp   [2   * 13 - 1 : 2   * (13 - 1) ]),
      .AXI_13_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 13 - 1 : 1   * (13 - 1) ]),
      .AXI_13_BREADY    ( acc_axi3_256_100M_bready  [1   * 13 - 1 : 1   * (13 - 1) ]),
      //------------axi_14-------------------------------------------------------------------------------------------
      .AXI_14_ACLK      ( clock ),
      .AXI_14_ARESET_N  ( resetn ),
      .AXI_14_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 14 - 1 : 32  * (14 - 1) ]),
      .AXI_14_ARBURST   ( acc_axi3_256_100M_arburst [2   * 14 - 1 : 2   * (14 - 1) ]),
      .AXI_14_ARID      ( acc_axi3_256_100M_arid    [6   * 14 - 1 : 6   * (14 - 1) ]),
      .AXI_14_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 14 - 1 : 4   * (14 - 1) ]),
      .AXI_14_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 14 - 1 : 3   * (14 - 1) ]),
      .AXI_14_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_ARREADY   ( acc_axi3_256_100M_arready [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 14 - 1 : 32  * (14 - 1) ]),
      .AXI_14_AWBURST   ( acc_axi3_256_100M_awburst [2   * 14 - 1 : 2   * (14 - 1) ]),
      .AXI_14_AWID      ( acc_axi3_256_100M_awid    [6   * 14 - 1 : 6   * (14 - 1) ]),
      .AXI_14_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 14 - 1 : 4   * (14 - 1) ]),
      .AXI_14_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 14 - 1 : 3   * (14 - 1) ]),
      .AXI_14_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_AWREADY   ( acc_axi3_256_100M_awready [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_WDATA     ( acc_axi3_256_100M_wdata   [256 * 14 - 1 : 256 * (14 - 1) ]),
      .AXI_14_WLAST     ( acc_axi3_256_100M_wlast   [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 14 - 1 : 32  * (14 - 1) ]),
      .AXI_14_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_WREADY    ( acc_axi3_256_100M_wready  [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_RID       ( acc_axi3_256_100M_rid     [6   * 14 - 1 : 6   * (14 - 1) ]),
      .AXI_14_RDATA     ( acc_axi3_256_100M_rdata   [256 * 14 - 1 : 256 * (14 - 1) ]),
      .AXI_14_RLAST     ( acc_axi3_256_100M_rlast   [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_RRESP     ( acc_axi3_256_100M_rresp   [2   * 14 - 1 : 2   * (14 - 1) ]),
      .AXI_14_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_RREADY    ( acc_axi3_256_100M_rready  [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_BID       ( acc_axi3_256_100M_bid     [6   * 14 - 1 : 6   * (14 - 1) ]),
      .AXI_14_BRESP     ( acc_axi3_256_100M_bresp   [2   * 14 - 1 : 2   * (14 - 1) ]),
      .AXI_14_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 14 - 1 : 1   * (14 - 1) ]),
      .AXI_14_BREADY    ( acc_axi3_256_100M_bready  [1   * 14 - 1 : 1   * (14 - 1) ]),
      //------------axi_15-------------------------------------------------------------------------------------------
      .AXI_15_ACLK      ( clock ),
      .AXI_15_ARESET_N  ( resetn ),
      .AXI_15_ARADDR    ( acc_axi3_256_100M_araddr  [32  * 15 - 1 : 32  * (15 - 1) ]),
      .AXI_15_ARBURST   ( acc_axi3_256_100M_arburst [2   * 15 - 1 : 2   * (15 - 1) ]),
      .AXI_15_ARID      ( acc_axi3_256_100M_arid    [6   * 15 - 1 : 6   * (15 - 1) ]),
      .AXI_15_ARLEN     ( acc_axi3_256_100M_arlen   [4   * 15 - 1 : 4   * (15 - 1) ]),
      .AXI_15_ARSIZE    ( acc_axi3_256_100M_arsize  [3   * 15 - 1 : 3   * (15 - 1) ]),
      .AXI_15_ARVALID   ( acc_axi3_256_100M_arvalid [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_ARREADY   ( acc_axi3_256_100M_arready [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_AWADDR    ( acc_axi3_256_100M_awaddr  [32  * 15 - 1 : 32  * (15 - 1) ]),
      .AXI_15_AWBURST   ( acc_axi3_256_100M_awburst [2   * 15 - 1 : 2   * (15 - 1) ]),
      .AXI_15_AWID      ( acc_axi3_256_100M_awid    [6   * 15 - 1 : 6   * (15 - 1) ]),
      .AXI_15_AWLEN     ( acc_axi3_256_100M_awlen   [4   * 15 - 1 : 4   * (15 - 1) ]),
      .AXI_15_AWSIZE    ( acc_axi3_256_100M_awsize  [3   * 15 - 1 : 3   * (15 - 1) ]),
      .AXI_15_AWVALID   ( acc_axi3_256_100M_awvalid [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_AWREADY   ( acc_axi3_256_100M_awready [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_WDATA     ( acc_axi3_256_100M_wdata   [256 * 15 - 1 : 256 * (15 - 1) ]),
      .AXI_15_WLAST     ( acc_axi3_256_100M_wlast   [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_WSTRB     ( acc_axi3_256_100M_wstrb   [32  * 15 - 1 : 32  * (15 - 1) ]),
      .AXI_15_WVALID    ( acc_axi3_256_100M_wvalid  [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_WREADY    ( acc_axi3_256_100M_wready  [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_RID       ( acc_axi3_256_100M_rid     [6   * 15 - 1 : 6   * (15 - 1) ]),
      .AXI_15_RDATA     ( acc_axi3_256_100M_rdata   [256 * 15 - 1 : 256 * (15 - 1) ]),
      .AXI_15_RLAST     ( acc_axi3_256_100M_rlast   [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_RRESP     ( acc_axi3_256_100M_rresp   [2   * 15 - 1 : 2   * (15 - 1) ]),
      .AXI_15_RVALID    ( acc_axi3_256_100M_rvalid  [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_RREADY    ( acc_axi3_256_100M_rready  [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_BID       ( acc_axi3_256_100M_bid     [6   * 15 - 1 : 6   * (15 - 1) ]),
      .AXI_15_BRESP     ( acc_axi3_256_100M_bresp   [2   * 15 - 1 : 2   * (15 - 1) ]),
      .AXI_15_BVALID    ( acc_axi3_256_100M_bvalid  [1   * 15 - 1 : 1   * (15 - 1) ]),
      .AXI_15_BREADY    ( acc_axi3_256_100M_bready  [1   * 15 - 1 : 1   * (15 - 1) ]),
      //--------------------------------------------------------------------------------------------------------
        //
        .APB_0_PWDATA ( apb_wdata ),
        .APB_0_PADDR ( apb_addr ),
        .APB_0_PCLK ( apb_clock ),
        .APB_0_PENABLE ( apb_enable ),
        .APB_0_PRESET_N ( apb_resetn ),
        .APB_0_PSEL ( apb_select ),
        .APB_0_PWRITE ( apb_write ),
        .APB_0_PRDATA ( apb_rdata ),
        .APB_0_PREADY ( apb_ready ),
        .APB_0_PSLVERR ( apb_transfer_error ),
        //
        .apb_complete_0 ( flag_compelet ),
        .DRAM_0_STAT_CATTRIP ( flag_cattrip ),
        .DRAM_0_STAT_TEMP ( flag_temp )

        );
     
     // end of hbm module     --------------------------------------------------------------------------------------------------------
     
`ifdef USE_DDR4_AS_LINUX_MEMORY

 // we gonna add a clock domain bridge inside
 dut_ddr_clock_convertor(
 
    .s_axi_aclk        ( clock ),
    .s_axi_aresetn     ( resetn ),

    .s_axi_awready     ( io_axi4_0_aw_ready    ),     
    .s_axi_awvalid     ( io_axi4_0_aw_valid    ),     
    .s_axi_awid        ( io_axi4_0_aw_id       ),     
    .s_axi_awaddr      ( io_axi4_0_aw_addr     ),     
    .s_axi_awlen       ( io_axi4_0_aw_len      ),     
    .s_axi_awsize      ( io_axi4_0_aw_size     ),     
    .s_axi_awburst     ( io_axi4_0_aw_burst    ),    
    .s_axi_awlock      ( io_axi4_0_aw_lock     ),    
    .s_axi_awcache     ( io_axi4_0_aw_cache    ),     
    .s_axi_awprot      ( io_axi4_0_aw_prot     ),     
    .s_axi_awqos       ( io_axi4_0_aw_qos      ),
    //.s_axi_awregion    ( io_axi4_0_aw_region   ),
    .s_axi_wready      ( io_axi4_0_w_ready     ),     
    .s_axi_wvalid      ( io_axi4_0_w_valid     ),     
    .s_axi_wdata       ( io_axi4_0_w_data      ),     
    .s_axi_wstrb       ( io_axi4_0_w_strb      ),     
    .s_axi_wlast       ( io_axi4_0_w_last      ),     
    .s_axi_bready      ( io_axi4_0_b_ready     ),     
    .s_axi_bvalid      ( io_axi4_0_b_valid     ),     
    .s_axi_bid         ( io_axi4_0_b_id        ),     
    .s_axi_bresp       ( io_axi4_0_b_resp      ),     
    .s_axi_arready     ( io_axi4_0_ar_ready    ),     
    .s_axi_arvalid     ( io_axi4_0_ar_valid    ),     
    .s_axi_arid        ( io_axi4_0_ar_id       ),     
    .s_axi_araddr      ( io_axi4_0_ar_addr     ),     
    .s_axi_arlen       ( io_axi4_0_ar_len      ),     
    .s_axi_arsize      ( io_axi4_0_ar_size     ),     
    .s_axi_arburst     ( io_axi4_0_ar_burst    ),     
    .s_axi_arlock      ( io_axi4_0_ar_lock     ),     
    .s_axi_arcache     ( io_axi4_0_ar_cache    ),     
    .s_axi_arprot      ( io_axi4_0_ar_prot     ),     
    .s_axi_arqos       ( io_axi4_0_ar_qos      ),  
    //.s_axi_arregion    ( io_axi4_0_ar_region   ),   
    .s_axi_rready      ( io_axi4_0_r_ready     ),     
    .s_axi_rvalid      ( io_axi4_0_r_valid     ),     
    .s_axi_rid         ( io_axi4_0_r_id        ),     
    .s_axi_rdata       ( io_axi4_0_r_data      ),     
    .s_axi_rresp       ( io_axi4_0_r_resp      ),     
    .s_axi_rlast       ( io_axi4_0_r_last      ),

    .m_axi_aclk        ( ui_clk ),
    .m_axi_aresetn     ( ~ui_sync_rst),

    .m_axi_awready     ( ddr_axi4_0_aw_ready    ),      
    .m_axi_awvalid     ( ddr_axi4_0_aw_valid    ),      
    .m_axi_awid        ( ddr_axi4_0_aw_id       ),      
    .m_axi_awaddr      ( ddr_axi4_0_aw_addr     ),      
    .m_axi_awlen       ( ddr_axi4_0_aw_len      ),     
    .m_axi_awsize      ( ddr_axi4_0_aw_size     ),      
    .m_axi_awburst     ( ddr_axi4_0_aw_burst    ),     
    .m_axi_awlock      ( ddr_axi4_0_aw_lock     ),     
    .m_axi_awcache     ( ddr_axi4_0_aw_cache    ),      
    .m_axi_awprot      ( ddr_axi4_0_aw_prot     ),      
    .m_axi_awqos       ( ddr_axi4_0_aw_qos      ), 
    //.m_axi_awregion    ( ddr_axi4_0_aw_region   ), 
    .m_axi_wready      ( ddr_axi4_0_w_ready     ),      
    .m_axi_wvalid      ( ddr_axi4_0_w_valid     ),      
    .m_axi_wdata       ( ddr_axi4_0_w_data      ),      
    .m_axi_wstrb       ( ddr_axi4_0_w_strb      ),      
    .m_axi_wlast       ( ddr_axi4_0_w_last      ),      
    .m_axi_bready      ( ddr_axi4_0_b_ready     ),      
    .m_axi_bvalid      ( ddr_axi4_0_b_valid     ),      
    .m_axi_bid         ( ddr_axi4_0_b_id        ),      
    .m_axi_bresp       ( ddr_axi4_0_b_resp      ),      
    .m_axi_arready     ( ddr_axi4_0_ar_ready    ),      
    .m_axi_arvalid     ( ddr_axi4_0_ar_valid    ),      
    .m_axi_arid        ( ddr_axi4_0_ar_id       ),      
    .m_axi_araddr      ( ddr_axi4_0_ar_addr     ),      
    .m_axi_arlen       ( ddr_axi4_0_ar_len      ),      
    .m_axi_arsize      ( ddr_axi4_0_ar_size     ),      
    .m_axi_arburst     ( ddr_axi4_0_ar_burst    ),      
    .m_axi_arlock      ( ddr_axi4_0_ar_lock     ),      
    .m_axi_arcache     ( ddr_axi4_0_ar_cache    ),      
    .m_axi_arprot      ( ddr_axi4_0_ar_prot     ),      
    .m_axi_arqos       ( ddr_axi4_0_ar_qos      ),   
    //.m_axi_arregion    ( ddr_axi4_0_ar_region   ),    
    .m_axi_rready      ( ddr_axi4_0_r_ready     ),      
    .m_axi_rvalid      ( ddr_axi4_0_r_valid     ),      
    .m_axi_rid         ( ddr_axi4_0_r_id        ),      
    .m_axi_rdata       ( ddr_axi4_0_r_data      ),      
    .m_axi_rresp       ( ddr_axi4_0_r_resp      ),      
    .m_axi_rlast       ( ddr_axi4_0_r_last      )
 );
 
    //abandon the hbm port_0 
    assign hbm_port0_200M_awaddr     = 0;
    assign hbm_port0_200M_awlen      = 0;
    assign hbm_port0_200M_awsize     = 0;
    assign hbm_port0_200M_awburst    = 0;
    assign hbm_port0_200M_awlock     = 0;
    assign hbm_port0_200M_awcache    = 0;
    assign hbm_port0_200M_awprot     = 0;
    assign hbm_port0_200M_awqos      = 0;
    assign hbm_port0_200M_awvalid    = 0;
    assign hbm_port0_200M_wdata      = 0;
    assign hbm_port0_200M_wstrb      = 0;
    assign hbm_port0_200M_wlast      = 0;
    assign hbm_port0_200M_wvalid     = 0;
    assign hbm_port0_200M_bready     = 0;
    assign hbm_port0_200M_araddr     = 0;
    assign hbm_port0_200M_arlen      = 0;
    assign hbm_port0_200M_arsize     = 0;
    assign hbm_port0_200M_arburst    = 0;
    assign hbm_port0_200M_arlock     = 0;
    assign hbm_port0_200M_arcache    = 0;
    assign hbm_port0_200M_arprot     = 0;
    assign hbm_port0_200M_arqos      = 0;
    assign hbm_port0_200M_arvalid    = 0;
    assign hbm_port0_200M_rready     = 0;
  
`else // we use the HBM_port1 as linux memory bus  
  // io_axi4_100 => axi3_256_200M mem_bus
  axi_channel mem_bus_channel(
      .clock(clock),   
      .clock200(clock200), 
      .reset(reset),    
      .io_axi4_0_aw_ready(  io_axi4_0_aw_ready ),
      .io_axi4_0_aw_valid(  io_axi4_0_aw_valid ),
      .io_axi4_0_aw_id(  io_axi4_0_aw_id ),
      .io_axi4_0_aw_addr(  io_axi4_0_aw_addr ),
      .io_axi4_0_aw_len(  io_axi4_0_aw_len ),
      .io_axi4_0_aw_size(  io_axi4_0_aw_size ),
      .io_axi4_0_aw_burst( io_axi4_0_aw_burst  ),
      .io_axi4_0_aw_lock( io_axi4_0_aw_lock  ),
      .io_axi4_0_aw_cache(  io_axi4_0_aw_cache ),
      .io_axi4_0_aw_prot(  io_axi4_0_aw_prot ),
      .io_axi4_0_aw_qos( io_axi4_0_aw_qos  ),
      .io_axi4_0_w_ready(  io_axi4_0_w_ready ),
      .io_axi4_0_w_valid(  io_axi4_0_w_valid ),
      .io_axi4_0_w_data(  io_axi4_0_w_data ),
      .io_axi4_0_w_strb(  io_axi4_0_w_strb ),
      .io_axi4_0_w_last(  io_axi4_0_w_last ),
      .io_axi4_0_b_ready(  io_axi4_0_b_ready ),
      .io_axi4_0_b_valid(  io_axi4_0_b_valid ),
      .io_axi4_0_b_id(  io_axi4_0_b_id ),
      .io_axi4_0_b_resp(  io_axi4_0_b_resp ),
      .io_axi4_0_ar_ready(  io_axi4_0_ar_ready ),
      .io_axi4_0_ar_valid(  io_axi4_0_ar_valid ),
      .io_axi4_0_ar_id(  io_axi4_0_ar_id ),
      .io_axi4_0_ar_addr(  io_axi4_0_ar_addr ),
      .io_axi4_0_ar_len(  io_axi4_0_ar_len ),
      .io_axi4_0_ar_size(  io_axi4_0_ar_size ),
      .io_axi4_0_ar_burst(  io_axi4_0_ar_burst ),
      .io_axi4_0_ar_lock(  io_axi4_0_ar_lock ),
      .io_axi4_0_ar_cache(  io_axi4_0_ar_cache ),
      .io_axi4_0_ar_prot(  io_axi4_0_ar_prot ),
      .io_axi4_0_ar_qos(  io_axi4_0_ar_qos ),
      .io_axi4_0_r_ready(  io_axi4_0_r_ready ),
      .io_axi4_0_r_valid(  io_axi4_0_r_valid ),
      .io_axi4_0_r_id(  io_axi4_0_r_id ),
      .io_axi4_0_r_data(  io_axi4_0_r_data ),
      .io_axi4_0_r_resp(  io_axi4_0_r_resp ),
      .io_axi4_0_r_last( io_axi4_0_r_last ),

      .axi3_256_200M_awaddr( hbm_port0_200M_awaddr ),
      .axi3_256_200M_awlen( hbm_port0_200M_awlen ),
      .axi3_256_200M_awsize( hbm_port0_200M_awsize ),
      .axi3_256_200M_awburst( hbm_port0_200M_awburst ),
      .axi3_256_200M_awlock( hbm_port0_200M_awlock ),
      .axi3_256_200M_awcache( hbm_port0_200M_awcache ),
      .axi3_256_200M_awprot( hbm_port0_200M_awprot ),
      .axi3_256_200M_awqos( hbm_port0_200M_awqos ),
      .axi3_256_200M_awvalid( hbm_port0_200M_awvalid ),
      .axi3_256_200M_awready( hbm_port0_200M_awready ),
      .axi3_256_200M_wdata( hbm_port0_200M_wdata ),
      .axi3_256_200M_wstrb( hbm_port0_200M_wstrb ),
      .axi3_256_200M_wlast( hbm_port0_200M_wlast ),
      .axi3_256_200M_wvalid( hbm_port0_200M_wvalid ),
      .axi3_256_200M_wready( hbm_port0_200M_wready ),
      .axi3_256_200M_bresp( hbm_port0_200M_bresp ),
      .axi3_256_200M_bvalid( hbm_port0_200M_bvalid ),
      .axi3_256_200M_bready( hbm_port0_200M_bready ),
      .axi3_256_200M_araddr( hbm_port0_200M_araddr ),
      .axi3_256_200M_arlen( hbm_port0_200M_arlen ),
      .axi3_256_200M_arsize( hbm_port0_200M_arsize ),
      .axi3_256_200M_arburst( hbm_port0_200M_arburst ),
      .axi3_256_200M_arlock( hbm_port0_200M_arlock ),
      .axi3_256_200M_arcache( hbm_port0_200M_arcache ),
      .axi3_256_200M_arprot( hbm_port0_200M_arprot ),
      .axi3_256_200M_arqos( hbm_port0_200M_arqos ),
      .axi3_256_200M_arvalid( hbm_port0_200M_arvalid ),
      .axi3_256_200M_arready( hbm_port0_200M_arready ),
      .axi3_256_200M_rdata( hbm_port0_200M_rdata ),
      .axi3_256_200M_rresp( hbm_port0_200M_rresp ),
      .axi3_256_200M_rlast( hbm_port0_200M_rlast ),
      .axi3_256_200M_rvalid( hbm_port0_200M_rvalid ),
      .axi3_256_200M_rready( hbm_port0_200M_rready )
    );
    
    // abadon the ddr bus
    assign ddr_axi4_0_aw_valid    = 0;
    assign ddr_axi4_0_aw_id       = 0;
    assign ddr_axi4_0_aw_addr     = 0;
    assign ddr_axi4_0_aw_len      = 0;
    assign ddr_axi4_0_aw_size     = 0;
    assign ddr_axi4_0_aw_burst    = 0;
    assign ddr_axi4_0_aw_lock     = 0;
    assign ddr_axi4_0_aw_cache    = 0;
    assign ddr_axi4_0_aw_prot     = 0;
    assign ddr_axi4_0_aw_qos      = 0;
    assign ddr_axi4_0_w_valid     = 0;
    assign ddr_axi4_0_w_data      = 0;
    assign ddr_axi4_0_w_strb      = 0;
    assign ddr_axi4_0_w_last      = 0;
    assign ddr_axi4_0_b_ready     = 0;
    assign ddr_axi4_0_ar_valid    = 0;
    assign ddr_axi4_0_ar_id       = 0;
    assign ddr_axi4_0_ar_addr     = 0;
    assign ddr_axi4_0_ar_len      = 0;
    assign ddr_axi4_0_ar_size     = 0;
    assign ddr_axi4_0_ar_burst    = 0;
    assign ddr_axi4_0_ar_lock     = 0;
    assign ddr_axi4_0_ar_cache    = 0;
    assign ddr_axi4_0_ar_prot     = 0;
    assign ddr_axi4_0_ar_qos      = 0;
    assign ddr_axi4_0_r_ready     = 0;
    
`endif

endmodule