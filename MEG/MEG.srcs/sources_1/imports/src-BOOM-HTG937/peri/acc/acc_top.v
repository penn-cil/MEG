`include "macro.vh"
module acc(
       input clock,
       input resetn,
       output [8:1] led,

       // CONTROL BUS of ACC - axi4 slave port from crossbar - 31`addr 64`data 4`id
        output        acc_axi4_aw_ready, 
        input         acc_axi4_aw_valid, 
        input  [3:0]  acc_axi4_aw_id, 
        input  [30:0] acc_axi4_aw_addr, 
        input  [7:0]  acc_axi4_aw_len, 
        input  [2:0]  acc_axi4_aw_size, 
        input  [1:0]  acc_axi4_aw_burst, 
        output        acc_axi4_w_ready, 
        input         acc_axi4_w_valid, 
        input  [63:0] acc_axi4_w_data, 
        input  [7:0]  acc_axi4_w_strb, 
        input         acc_axi4_w_last, 
        input         acc_axi4_b_ready, 
        output        acc_axi4_b_valid, 
        output [3:0]  acc_axi4_b_id, 
        output [1:0]  acc_axi4_b_resp, 
        output        acc_axi4_ar_ready, 
        input         acc_axi4_ar_valid, 
        input  [3:0]  acc_axi4_ar_id, 
        input  [30:0] acc_axi4_ar_addr, 
        input  [7:0]  acc_axi4_ar_len, 
        input  [2:0]  acc_axi4_ar_size, 
        input  [1:0]  acc_axi4_ar_burst, 
        input         acc_axi4_r_ready, 
        output        acc_axi4_r_valid, 
        output [3:0]  acc_axi4_r_id, 
        output [63:0] acc_axi4_r_data, 
        output [1:0]  acc_axi4_r_resp, 
        output        acc_axi4_r_last,
    

      output      [32  * 15 - 1  :0]      acc_axi3_256_100M_awaddr,
      output      [4   * 15 - 1  :0]      acc_axi3_256_100M_awlen,
      output      [3   * 15 - 1  :0]      acc_axi3_256_100M_awsize,
      output      [2   * 15 - 1  :0]      acc_axi3_256_100M_awburst,
      output      [6   * 15 - 1  :0]      acc_axi3_256_100M_awid,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_awvalid,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_awready,
      output      [256 * 15 - 1  :0]      acc_axi3_256_100M_wdata,
      output      [32  * 15 - 1  :0]      acc_axi3_256_100M_wstrb,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_wlast,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_wvalid,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_wready,
      input       [2   * 15 - 1  :0]      acc_axi3_256_100M_bresp,
      input       [6   * 15 - 1  :0]      acc_axi3_256_100M_bid,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_bvalid,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_bready,
      output      [32  * 15 - 1  :0]      acc_axi3_256_100M_araddr,
      output      [4   * 15 - 1  :0]      acc_axi3_256_100M_arlen,
      output      [3   * 15 - 1  :0]      acc_axi3_256_100M_arsize,
      output      [2   * 15 - 1  :0]      acc_axi3_256_100M_arburst,
      output      [6   * 15 - 1  :0]      acc_axi3_256_100M_arid,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_arvalid,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_arready,
      input       [256 * 15 - 1  :0]      acc_axi3_256_100M_rdata,
      input       [2   * 15 - 1  :0]      acc_axi3_256_100M_rresp,
      input       [6   * 15 - 1  :0]      acc_axi3_256_100M_rid,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_rlast,
      input       [1   * 15 - 1  :0]      acc_axi3_256_100M_rvalid,
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_rready
      
       );
    //--------------------------------------------------------------------------------------------
       // CONTROL BUS: AXI4 to AXI-LITE, and lite_crossbar bundle
        wire [30:0] lite_ar_addr;
        wire        lite_ar_valid;
        wire        lite_ar_ready;
        wire [2:0]  lite_ar_prot;
        wire [63:0] lite_r_data;
        wire [1:0]  lite_r_resp;
        wire        lite_r_valid;
        wire        lite_r_ready;
        wire [30:0] lite_aw_addr;
        wire        lite_aw_valid;
        wire        lite_aw_ready;
        wire [2:0]  lite_aw_prot;
        wire [63:0] lite_w_data;
        wire [7:0]  lite_w_strb;
        wire        lite_w_valid;
        wire        lite_w_ready;
        wire [1:0]  lite_b_resp;
        wire        lite_b_valid;
        wire        lite_b_ready;
        
        wire [61:0]     lite_bundle_ar_addr;
        wire [1:0]      lite_bundle_ar_valid;
        wire [1:0]      lite_bundle_ar_ready;
        wire [5:0]      lite_bundle_ar_prot;
        wire [127:0]    lite_bundle_r_data;
        wire [3:0]      lite_bundle_r_resp;
        wire [1:0]      lite_bundle_r_valid;
        wire [1:0]      lite_bundle_r_ready;
        wire [61:0]     lite_bundle_aw_addr;
        wire [1:0]      lite_bundle_aw_valid;
        wire [1:0]      lite_bundle_aw_ready;
        wire [5:0]      lite_bundle_aw_prot;
        wire [127:0]    lite_bundle_w_data;
        wire [7:0]      lite_bundle_w_strb;
        wire [1:0]      lite_bundle_w_valid;
        wire [1:0]      lite_bundle_w_ready;
        wire [3:0]      lite_bundle_b_resp;
        wire [1:0]      lite_bundle_b_valid;
        wire [1:0]      lite_bundle_b_ready;
        
        
  axi_lite_bridge acc_axi_lite_bridge(
    .aclk( clock ),
    .aresetn( resetn ), 
    .s_axi_awid         ( acc_axi4_aw_id    ),
    .s_axi_awaddr       ( acc_axi4_aw_addr  ),
    .s_axi_awlen        ( acc_axi4_aw_len   ),
    .s_axi_awsize       ( acc_axi4_aw_size  ),
    .s_axi_awburst      ( acc_axi4_aw_burst ),
    .s_axi_awvalid      ( acc_axi4_aw_valid ),
    .s_axi_awprot       ( 3'b0 ),
    .s_axi_awready      ( acc_axi4_aw_ready ),
    .s_axi_arid         ( acc_axi4_ar_id    ),
    .s_axi_araddr       ( acc_axi4_ar_addr  ), 
    .s_axi_arlen        ( acc_axi4_ar_len   ),
    .s_axi_arsize       ( acc_axi4_ar_size  ),
    .s_axi_arburst      ( acc_axi4_ar_burst ),
    .s_axi_arvalid      ( acc_axi4_ar_valid ),
    .s_axi_arprot       ( 3'b0  ),
    .s_axi_arready      ( acc_axi4_ar_ready ),
    .s_axi_wdata        ( acc_axi4_w_data   ),
    .s_axi_wstrb        ( acc_axi4_w_strb   ),
    .s_axi_wlast        ( acc_axi4_w_last   ),
    .s_axi_wvalid       ( acc_axi4_w_valid  ),
    .s_axi_wready       ( acc_axi4_w_ready  ),
    .s_axi_bid          ( acc_axi4_b_id     ),
    .s_axi_bresp        ( acc_axi4_b_resp   ),
    .s_axi_bvalid       ( acc_axi4_b_valid  ),
    .s_axi_bready       ( acc_axi4_b_ready  ),
    .s_axi_rid          ( acc_axi4_r_id     ),
    .s_axi_rdata        ( acc_axi4_r_data   ),
    .s_axi_rresp        ( acc_axi4_r_resp   ),
    .s_axi_rlast        ( acc_axi4_r_last   ),
    .s_axi_rvalid       ( acc_axi4_r_valid  ),
    .s_axi_rready       ( acc_axi4_r_ready  ),
    .m_axi_awaddr       ( lite_aw_addr      ),
    .m_axi_awvalid      ( lite_aw_valid     ),
    .m_axi_awready      ( lite_aw_ready     ),
    .m_axi_awprot       ( lite_aw_prot      ),
    .m_axi_araddr       ( lite_ar_addr      ),
    .m_axi_arvalid      ( lite_ar_valid     ),
    .m_axi_arready      ( lite_ar_ready     ),
    .m_axi_arprot       ( lite_ar_prot      ),
    .m_axi_wdata        ( lite_w_data       ),
    .m_axi_wstrb        ( lite_w_strb       ),
    .m_axi_wvalid       ( lite_w_valid      ),
    .m_axi_wready       ( lite_w_ready      ),
    .m_axi_bresp        ( lite_b_resp       ),
    .m_axi_bvalid       ( lite_b_valid      ),
    .m_axi_bready       ( lite_b_ready      ),
    .m_axi_rdata        ( lite_r_data       ),
    .m_axi_rresp        ( lite_r_resp       ),
    .m_axi_rvalid       ( lite_r_valid      ),
    .m_axi_rready       ( lite_r_ready      )

  );
  
    
    lite_Xbar (
      .aclk(clock),
      .aresetn(resetn),
      .s_axi_awaddr      ( lite_aw_addr ),
      .s_axi_awprot      ( lite_aw_prot ),
      .s_axi_awvalid     ( lite_aw_valid ),
      .s_axi_awready     ( lite_aw_ready ),
      .s_axi_wdata       ( lite_w_data ),
      .s_axi_wstrb       ( lite_w_strb ),
      .s_axi_wvalid      ( lite_w_valid ),
      .s_axi_wready      ( lite_w_ready ),
      .s_axi_bresp       ( lite_b_resp ),
      .s_axi_bvalid      ( lite_b_valid ),
      .s_axi_bready      ( lite_b_ready ),
      .s_axi_araddr      ( lite_ar_addr ),
      .s_axi_arprot      ( lite_ar_prot ),
      .s_axi_arvalid     ( lite_ar_valid ),
      .s_axi_arready     ( lite_ar_ready ),
      .s_axi_rdata       ( lite_r_data ),
      .s_axi_rresp       ( lite_r_resp ),
      .s_axi_rvalid      ( lite_r_valid ),
      .s_axi_rready      ( lite_r_ready ),
      .m_axi_awaddr      ( lite_bundle_aw_addr ),
      .m_axi_awprot      ( lite_bundle_aw_prot ),
      .m_axi_awvalid     ( lite_bundle_aw_valid ),
      .m_axi_awready     ( lite_bundle_aw_ready ),
      .m_axi_wdata       ( lite_bundle_w_data ),
      .m_axi_wstrb       ( lite_bundle_w_strb ),
      .m_axi_wvalid      ( lite_bundle_w_valid ),
      .m_axi_wready      ( lite_bundle_w_ready ),
      .m_axi_bresp       ( lite_bundle_b_resp ),
      .m_axi_bvalid      ( lite_bundle_b_valid ),
      .m_axi_bready      ( lite_bundle_b_ready ),
      .m_axi_araddr      ( lite_bundle_ar_addr ),
      .m_axi_arprot      ( lite_bundle_ar_prot ),
      .m_axi_arvalid     ( lite_bundle_ar_valid ),
      .m_axi_arready     ( lite_bundle_ar_ready ),
      .m_axi_rdata       ( lite_bundle_r_data ),
      .m_axi_rresp       ( lite_bundle_r_resp ),
      .m_axi_rvalid      ( lite_bundle_r_valid ),
      .m_axi_rready      ( lite_bundle_r_ready )
    );
    

`ifdef ALT_ACC

      wire [31:0]    acc_axi4_256_100M_awaddr   ;
      wire [3:0]     acc_axi4_256_100M_awlen    ;
      wire [2:0]     acc_axi4_256_100M_awsize   ;
      wire [1:0]     acc_axi4_256_100M_awburst  ;
      wire           acc_axi4_256_100M_awvalid  ;
      wire           acc_axi4_256_100M_awready  ;
      wire [255:0]   acc_axi4_256_100M_wdata    ;
      wire [31:0]    acc_axi4_256_100M_wstrb    ;
      wire           acc_axi4_256_100M_wlast    ;
      wire           acc_axi4_256_100M_wvalid   ;
      wire           acc_axi4_256_100M_wready   ;
      wire [1:0]     acc_axi4_256_100M_bresp    ;
      wire           acc_axi4_256_100M_bvalid   ;
      wire           acc_axi4_256_100M_bready   ;
      wire [31:0]    acc_axi4_256_100M_araddr   ;
      wire [3:0]     acc_axi4_256_100M_arlen    ;
      wire [2:0]     acc_axi4_256_100M_arsize   ;
      wire [1:0]     acc_axi4_256_100M_arburst  ;
      wire           acc_axi4_256_100M_arvalid  ;
      wire           acc_axi4_256_100M_arready  ;
      wire [255:0]   acc_axi4_256_100M_rdata    ;
      wire [1:0]     acc_axi4_256_100M_rresp    ;
      wire           acc_axi4_256_100M_rlast    ;
      wire           acc_axi4_256_100M_rvalid   ;
      wire           acc_axi4_256_100M_rready   ;
      
        assign lite_bundle_ar_ready   [1] 	= 0;
        assign lite_bundle_r_data   [127:64]   = 0;
        assign lite_bundle_r_resp   [3:2]  	= 0;
        assign lite_bundle_r_valid    [1]	  = 0;
        assign lite_bundle_aw_ready   [1] 	= 0;
        assign lite_bundle_w_ready    [1]	  = 0;
        assign lite_bundle_b_resp   [3:2]  	= 0;
        assign lite_bundle_b_valid    [1]	  = 0;
        
       acc_hbm_access acc_inst(

        .s00_axi_aclk     (clock),
        .s00_axi_aresetn  (resetn),
        
        .s00_axi_araddr   (lite_bundle_ar_addr    [6:0]      ), // 0x10000 range
        .s00_axi_arvalid  (lite_bundle_ar_valid   [0]         ),
        .s00_axi_arready  (lite_bundle_ar_ready   [0]         ),
        .s00_axi_arprot   (lite_bundle_ar_prot    [2:0]       ),
        .s00_axi_rdata    (lite_bundle_r_data     [63:0]      ),
        .s00_axi_rresp    (lite_bundle_r_resp     [1:0]       ),
        .s00_axi_rvalid   (lite_bundle_r_valid    [0]         ),
        .s00_axi_rready   (lite_bundle_r_ready    [0]         ),
        .s00_axi_awaddr   (lite_bundle_aw_addr    [6:0]      ), // 0x10000 range
        .s00_axi_awvalid  (lite_bundle_aw_valid   [0]         ),
        .s00_axi_awready  (lite_bundle_aw_ready   [0]         ),
        .s00_axi_awprot   (lite_bundle_aw_prot    [2:0]       ),
        .s00_axi_wdata    (lite_bundle_w_data     [63:0]      ),
        .s00_axi_wstrb    (lite_bundle_w_strb     [7:0]       ),
        .s00_axi_wvalid   (lite_bundle_w_valid    [0]         ),
        .s00_axi_wready   (lite_bundle_w_ready    [0]         ),
        .s00_axi_bresp    (lite_bundle_b_resp     [1:0]       ),
        .s00_axi_bvalid   (lite_bundle_b_valid    [0]         ),
        .s00_axi_bready   (lite_bundle_b_ready    [0]         ),
        
        .m00_axi_aclk     (clock),
        .m00_axi_aresetn  (resetn),
        
        .m00_axi_awaddr         (acc_axi4_256_100M_awaddr),
        .m00_axi_awlen          (acc_axi4_256_100M_awlen),
        .m00_axi_awsize         (acc_axi4_256_100M_awsize),
        .m00_axi_awburst        (acc_axi4_256_100M_awburst),
        .m00_axi_awvalid        (acc_axi4_256_100M_awvalid),
        .m00_axi_awready        (acc_axi4_256_100M_awready),
        .m00_axi_wdata          (acc_axi4_256_100M_wdata),      
        .m00_axi_wstrb          (acc_axi4_256_100M_wstrb),
        .m00_axi_wlast          (acc_axi4_256_100M_wlast),
        .m00_axi_wvalid         (acc_axi4_256_100M_wvalid),
        .m00_axi_wready         (acc_axi4_256_100M_wready),
        .m00_axi_bresp          (acc_axi4_256_100M_bresp),
        .m00_axi_bvalid         (acc_axi4_256_100M_bvalid),
        .m00_axi_bready         (acc_axi4_256_100M_bready),
        .m00_axi_araddr         (acc_axi4_256_100M_araddr),
        .m00_axi_arlen          (acc_axi4_256_100M_arlen),
        .m00_axi_arsize         (acc_axi4_256_100M_arsize),
        .m00_axi_arburst        (acc_axi4_256_100M_arburst),
        .m00_axi_arvalid        (acc_axi4_256_100M_arvalid),
        .m00_axi_arready        (acc_axi4_256_100M_arready),
        .m00_axi_rdata          (acc_axi4_256_100M_rdata),
        .m00_axi_rresp          (acc_axi4_256_100M_rresp),
        .m00_axi_rlast          (acc_axi4_256_100M_rlast),
        .m00_axi_rvalid         (acc_axi4_256_100M_rvalid),
        .m00_axi_rready         (acc_axi4_256_100M_rready)

        );

      // MEM BUS: AXI4 to AXI3 
      axi4_axi3_bridge acc_mem_bridge(
        
        .aclk(clock),
        .aresetn(resetn),
        .s_axi_awaddr     (acc_axi4_256_100M_awaddr),
        .s_axi_awlen      (acc_axi4_256_100M_awlen),
        .s_axi_awsize     (acc_axi4_256_100M_awsize),
        .s_axi_awburst    (acc_axi4_256_100M_awburst),
        .s_axi_awvalid    (acc_axi4_256_100M_awvalid),
        .s_axi_awready    (acc_axi4_256_100M_awready),
        .s_axi_wdata      (acc_axi4_256_100M_wdata),
        .s_axi_wstrb      (acc_axi4_256_100M_wstrb),
        .s_axi_wlast      (acc_axi4_256_100M_wlast),
        .s_axi_wvalid     (acc_axi4_256_100M_wvalid),
        .s_axi_wready     (acc_axi4_256_100M_wready),
        .s_axi_bresp      (acc_axi4_256_100M_bresp),
        .s_axi_bvalid     (acc_axi4_256_100M_bvalid),
        .s_axi_bready     (acc_axi4_256_100M_bready),
        .s_axi_araddr     (acc_axi4_256_100M_araddr),
        .s_axi_arlen      (acc_axi4_256_100M_arlen),
        .s_axi_arsize     (acc_axi4_256_100M_arsize),
        .s_axi_arburst    (acc_axi4_256_100M_arburst),
        .s_axi_arvalid    (acc_axi4_256_100M_arvalid),
        .s_axi_arready    (acc_axi4_256_100M_arready),
        .s_axi_rdata      (acc_axi4_256_100M_rdata),
        .s_axi_rresp      (acc_axi4_256_100M_rresp),
        .s_axi_rlast      (acc_axi4_256_100M_rlast),
        .s_axi_rvalid     (acc_axi4_256_100M_rvalid),
        .s_axi_rready     (acc_axi4_256_100M_rready),
        
        .m_axi_awaddr   (acc_axi3_256_100M_awaddr     [31 :0]   ),
        .m_axi_awlen    (acc_axi3_256_100M_awlen      [3  :0]   ),
        .m_axi_awsize   (acc_axi3_256_100M_awsize     [2  :0]   ),
        .m_axi_awburst  (acc_axi3_256_100M_awburst    [1  :0]   ),
        .m_axi_awvalid  (acc_axi3_256_100M_awvalid    [0]       ),
        .m_axi_awready  (acc_axi3_256_100M_awready    [0]       ),
        .m_axi_wdata    (acc_axi3_256_100M_wdata      [255:0]   ),
        .m_axi_wstrb    (acc_axi3_256_100M_wstrb      [31 :0]   ),
        .m_axi_wlast    (acc_axi3_256_100M_wlast      [0]       ),
        .m_axi_wvalid   (acc_axi3_256_100M_wvalid     [0]       ),
        .m_axi_wready   (acc_axi3_256_100M_wready     [0]       ),
        .m_axi_bresp    (acc_axi3_256_100M_bresp      [1  :0]   ),
        .m_axi_bvalid   (acc_axi3_256_100M_bvalid     [0]       ),
        .m_axi_bready   (acc_axi3_256_100M_bready     [0]       ),
        .m_axi_araddr   (acc_axi3_256_100M_araddr     [31 :0]   ),
        .m_axi_arlen    (acc_axi3_256_100M_arlen      [3  :0]   ),
        .m_axi_arsize   (acc_axi3_256_100M_arsize     [2  :0]   ),
        .m_axi_arburst  (acc_axi3_256_100M_arburst    [1  :0]   ),
        .m_axi_arvalid  (acc_axi3_256_100M_arvalid    [0]       ),
        .m_axi_arready  (acc_axi3_256_100M_arready    [0]       ),
        .m_axi_rdata    (acc_axi3_256_100M_rdata      [255:0]   ),
        .m_axi_rresp    (acc_axi3_256_100M_rresp      [1  :0]   ),
        .m_axi_rlast    (acc_axi3_256_100M_rlast      [0]       ),
        .m_axi_rvalid   (acc_axi3_256_100M_rvalid     [0]       ),
        .m_axi_rready   (acc_axi3_256_100M_rready     [0]       ) // extra wires of acc_HBM_mem_bundle has beeen ignored
        
        );

`else  

     acc_wrapper acc_wrapper_inst#(
                        .MEM_PORTS_NUM(`MEM_PORTS_NUM), 
                        .CTRL_PORTS_NUM(`CTRL_PORTS_NUM)
                )( 

        .aclk    (clock),
        .aresetn (resetn),
        .s_lite_bundle_araddr  ( lite_bundle_ar_addr ), //2 ctrlites
        .s_lite_bundle_arvalid ( lite_bundle_ar_valid ),
        .s_lite_bundle_arprot  ( lite_bundle_ar_prot ),
        .s_lite_bundle_arready ( lite_bundle_ar_ready ),
        .s_lite_bundle_rdata   ( lite_bundle_r_data ),
        .s_lite_bundle_rresp   ( lite_bundle_r_resp ),
        .s_lite_bundle_rvalid  ( lite_bundle_r_valid ),
        .s_lite_bundle_rready  ( lite_bundle_r_ready ),
        .s_lite_bundle_awaddr  ( lite_bundle_aw_addr ),
        .s_lite_bundle_awvalid ( lite_bundle_aw_valid ),
        .s_lite_bundle_awprot  ( lite_bundle_aw_prot ),
        .s_lite_bundle_awready ( lite_bundle_aw_ready ),
        .s_lite_bundle_wdata   ( lite_bundle_w_data ),
        .s_lite_bundle_wstrb   ( lite_bundle_w_strb ),
        .s_lite_bundle_wvalid  ( lite_bundle_w_valid ),
        .s_lite_bundle_wready  ( lite_bundle_w_ready ),
        .s_lite_bundle_bresp   ( lite_bundle_b_resp ),
        .s_lite_bundle_bvalid  ( lite_bundle_b_valid ),
        .s_lite_bundle_bready  ( lite_bundle_b_ready ),
        .m_axi3_bundle_awaddr  ( acc_axi3_256_100M_awaddr ),//15 mems
        .m_axi3_bundle_awlen   ( acc_axi3_256_100M_awlen ),
        .m_axi3_bundle_awsize  ( acc_axi3_256_100M_awsize ),
        .m_axi3_bundle_awburst ( acc_axi3_256_100M_awburst ),
        .m_axi3_bundle_awid    ( acc_axi3_256_100M_awid ),
        .m_axi3_bundle_awvalid ( acc_axi3_256_100M_awvalid ),
        .m_axi3_bundle_awready ( acc_axi3_256_100M_awready ),
        .m_axi3_bundle_wdata   ( acc_axi3_256_100M_wdata ),
        .m_axi3_bundle_wstrb   ( acc_axi3_256_100M_wstrb ),
        .m_axi3_bundle_wlast   ( acc_axi3_256_100M_wlast ),
        .m_axi3_bundle_wvalid  ( acc_axi3_256_100M_wvalid ),
        .m_axi3_bundle_wready  ( acc_axi3_256_100M_wready ),
        .m_axi3_bundle_bresp   ( acc_axi3_256_100M_bresp ),
        .m_axi3_bundle_bid     ( acc_axi3_256_100M_bid ),
        .m_axi3_bundle_bvalid  ( acc_axi3_256_100M_bvalid ),
        .m_axi3_bundle_bready  ( acc_axi3_256_100M_bready ),
        .m_axi3_bundle_araddr  ( acc_axi3_256_100M_araddr ),
        .m_axi3_bundle_arlen   ( acc_axi3_256_100M_arlen ),
        .m_axi3_bundle_arsize  ( acc_axi3_256_100M_arsize ),
        .m_axi3_bundle_arburst ( acc_axi3_256_100M_arburst ),
        .m_axi3_bundle_arid    ( acc_axi3_256_100M_arid ),
        .m_axi3_bundle_arvalid ( acc_axi3_256_100M_arvalid ),
        .m_axi3_bundle_arready ( acc_axi3_256_100M_arready ),
        .m_axi3_bundle_rdata   ( acc_axi3_256_100M_rdata ),
        .m_axi3_bundle_rresp   ( acc_axi3_256_100M_rresp ),
        .m_axi3_bundle_rid     ( acc_axi3_256_100M_rid ),
        .m_axi3_bundle_rlast   ( acc_axi3_256_100M_rlast ),
        .m_axi3_bundle_rvalid  ( acc_axi3_256_100M_rvalid ),
        .m_axi3_bundle_rready  ( acc_axi3_256_100M_rready )

        );   
`endif
        
endmodule