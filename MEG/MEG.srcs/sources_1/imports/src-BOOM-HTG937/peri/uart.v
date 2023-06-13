module uart(
	input clock,
	input resetn,
	//full axi4 port from crossbar
    output        uart_axi4_aw_ready, 
    input         uart_axi4_aw_valid, 
    input  [3:0]  uart_axi4_aw_id, 
    input  [30:0] uart_axi4_aw_addr, 
    input  [7:0]  uart_axi4_aw_len, 
    input  [2:0]  uart_axi4_aw_size, 
    input  [1:0]  uart_axi4_aw_burst, 
    output        uart_axi4_w_ready, 
    input         uart_axi4_w_valid, 
    input  [63:0] uart_axi4_w_data, 
    input  [7:0]  uart_axi4_w_strb, 
    input         uart_axi4_w_last, 
    input         uart_axi4_b_ready, 
    output        uart_axi4_b_valid, 
    output [3:0]  uart_axi4_b_id, 
    output [1:0]  uart_axi4_b_resp, 
    output        uart_axi4_ar_ready, 
    input         uart_axi4_ar_valid, 
    input  [3:0]  uart_axi4_ar_id, 
    input  [30:0] uart_axi4_ar_addr, 
    input  [7:0]  uart_axi4_ar_len, 
    input  [2:0]  uart_axi4_ar_size, 
    input  [1:0]  uart_axi4_ar_burst, 
    input         uart_axi4_r_ready, 
    output        uart_axi4_r_valid, 
    output [3:0]  uart_axi4_r_id, 
    output [63:0] uart_axi4_r_data, 
    output [1:0]  uart_axi4_r_resp, 
    output        uart_axi4_r_last,

    output interrupt,

    input uart_RX,
    output uart_TX
	);
    
    // provided ip is axilite, transform axi4 to axilite
    wire    [30:0]  lite_ar_addr;        
    wire            lite_ar_valid;       
    wire            lite_ar_ready;  
    wire    [3:0]   lite_r_id;           // =0
    wire    [63:0]  lite_r_data;         
    wire    [1:0]   lite_r_resp;         
    wire            lite_r_valid;        
    wire            lite_r_ready;   
    wire    [30:0]  lite_aw_addr;       
    wire            lite_aw_valid;       
    wire            lite_aw_ready;    
    wire    [63:0]  lite_w_data;         
    wire    [7:0]   lite_w_strb;         
    wire            lite_w_valid;        
    wire            lite_w_ready;    
    wire    [1:0]   lite_b_resp;         
    wire            lite_b_valid;        
    wire            lite_b_ready;        

  axi_lite_bridge uart_axi_lite_bridge(
    .aclk( clock ),
    .aresetn( resetn ),
    .s_axi_awid         ( uart_axi4_aw_id    ),
    .s_axi_awaddr       ( uart_axi4_aw_addr  ),
    .s_axi_awlen        ( uart_axi4_aw_len   ),
    .s_axi_awsize       ( uart_axi4_aw_size  ),
    .s_axi_awburst      ( uart_axi4_aw_burst ),
    .s_axi_awvalid      ( uart_axi4_aw_valid ),
    .s_axi_awready      ( uart_axi4_aw_ready ),
    .s_axi_arid         ( uart_axi4_ar_id    ),
    .s_axi_araddr       ( uart_axi4_ar_addr  ),
    .s_axi_arlen        ( uart_axi4_ar_len   ),
    .s_axi_arsize       ( uart_axi4_ar_size  ),
    .s_axi_arburst      ( uart_axi4_ar_burst ),
    .s_axi_arvalid      ( uart_axi4_ar_valid ),
    .s_axi_arready      ( uart_axi4_ar_ready ),
    .s_axi_wdata        ( uart_axi4_w_data   ),
    .s_axi_wstrb        ( uart_axi4_w_strb   ),
    .s_axi_wlast        ( uart_axi4_w_last   ),
    .s_axi_wvalid       ( uart_axi4_w_valid  ),
    .s_axi_wready       ( uart_axi4_w_ready  ),
    .s_axi_bid          ( uart_axi4_b_id     ),
    .s_axi_bresp        ( uart_axi4_b_resp   ),
    .s_axi_bvalid       ( uart_axi4_b_valid  ),
    .s_axi_bready       ( uart_axi4_b_ready  ),
    .s_axi_rid          ( uart_axi4_r_id     ),
    .s_axi_rdata        ( uart_axi4_r_data   ),
    .s_axi_rresp        ( uart_axi4_r_resp   ),
    .s_axi_rlast        ( uart_axi4_r_last   ),
    .s_axi_rvalid       ( uart_axi4_r_valid  ),
    .s_axi_rready       ( uart_axi4_r_ready  ),
    .m_axi_awaddr       ( lite_aw_addr  ),
    .m_axi_awvalid      ( lite_aw_valid ),
    .m_axi_awready      ( lite_aw_ready ),
    .m_axi_araddr       ( lite_ar_addr  ),
    .m_axi_arvalid      ( lite_ar_valid ),
    .m_axi_arready      ( lite_ar_ready ),
    .m_axi_wdata        ( lite_w_data   ),
    .m_axi_wstrb        ( lite_w_strb   ),
    .m_axi_wvalid       ( lite_w_valid  ),
    .m_axi_wready       ( lite_w_ready  ),
    .m_axi_bresp        ( lite_b_resp   ),
    .m_axi_bvalid       ( lite_b_valid  ),
    .m_axi_bready       ( lite_b_ready  ),
    .m_axi_rdata        ( lite_r_data   ),
    .m_axi_rresp        ( lite_r_resp   ),
    .m_axi_rvalid       ( lite_r_valid  ),
    .m_axi_rready       ( lite_r_ready  )
  );
  
   wire [3:0]    lite_w_strb_half;
   wire [31:0]   lite_w_data_half;
   wire [31:0]   lite_r_data_half; 
   narrower spi_narrower(
       .r_data_64  (lite_r_data),
       .w_data_64  (lite_w_data),
       .w_strb_8   (lite_w_strb),
       .r_data_32  (lite_r_data_half),
       .w_data_32  (lite_w_data_half),
       .w_strb_4   (lite_w_strb_half)
   );
    
    axi_uart16550_0 uart16550_inst(

    .s_axi_aclk     (clock),
    .s_axi_aresetn  (resetn),
    .s_axi_awaddr   (lite_aw_addr[12:0]),
    .s_axi_awvalid  (lite_aw_valid),
    .s_axi_awready  (lite_aw_ready),
    .s_axi_wdata    (lite_w_data_half),
    .s_axi_wstrb    (lite_w_strb_half),
    .s_axi_wvalid   (lite_w_valid),
    .s_axi_wready   (lite_w_ready),
    .s_axi_bresp    (lite_b_resp),
    .s_axi_bvalid   (lite_b_valid),
    .s_axi_bready   (lite_b_ready),
    .s_axi_araddr   (lite_ar_addr[12:0]),
    .s_axi_arvalid  (lite_ar_valid),
    .s_axi_arready  (lite_ar_ready),
    .s_axi_rdata    (lite_r_data_half),
    .s_axi_rresp    (lite_r_resp),
    .s_axi_rvalid   (lite_r_valid),
    .s_axi_rready   (lite_r_ready),

    .sin (uart_RX),
    .sout (uart_TX),
    .ip2intc_irpt (interrupt),
    
    .freeze (1'b0),
    .rin (1'b1),
    .dcdn (1'b1),
    .dsrn (1'b1)
    
    );
endmodule
