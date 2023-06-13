module axi_channel(
      input clock,		
      input clock200, // 200m Hz to drive DDR ctrl
      input reset,    
    
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

      // converted wide/high-freq/axi3 bus

 	  output 	[31:0]	axi3_256_200M_awaddr,
 	  output 	[3:0]	axi3_256_200M_awlen,
 	  output 	[2:0]	axi3_256_200M_awsize,
 	  output 	[1:0]	axi3_256_200M_awburst,
 	  output 			axi3_256_200M_awlock,
 	  output 	[3:0]	axi3_256_200M_awcache,
 	  output 	[2:0]	axi3_256_200M_awprot,
 	  output 	[3:0]	axi3_256_200M_awqos,
 	  output 			axi3_256_200M_awvalid,
 	  input 			axi3_256_200M_awready,

 	  output 	[255:0]	axi3_256_200M_wdata,
 	  output 	[31:0]	axi3_256_200M_wstrb,
 	  output 			axi3_256_200M_wlast,
 	  output 			axi3_256_200M_wvalid,
 	  input 			axi3_256_200M_wready,

 	  input 	[1:0]	axi3_256_200M_bresp,
 	  input 			axi3_256_200M_bvalid,
 	  output 			axi3_256_200M_bready,

 	  output 	[31:0]	axi3_256_200M_araddr,
 	  output 	[3:0]	axi3_256_200M_arlen,
 	  output 	[2:0]	axi3_256_200M_arsize,
 	  output 	[1:0]	axi3_256_200M_arburst,
 	  output 			axi3_256_200M_arlock,
 	  output 	[3:0]	axi3_256_200M_arcache,
 	  output 	[2:0]	axi3_256_200M_arprot,
 	  output 	[3:0]	axi3_256_200M_arqos,
 	  output 			axi3_256_200M_arvalid,
 	  input 			axi3_256_200M_arready,
 	  
 	  input 	[255:0]	axi3_256_200M_rdata,
 	  input 	[1:0]	axi3_256_200M_rresp,
 	  input 			axi3_256_200M_rlast,
 	  input 			axi3_256_200M_rvalid,
 	  output 			axi3_256_200M_rready

      );

      wire resetn; 
      assign resetn = ! reset;



	  wire 	[3:0] 	axi3_64_100M_awid;
	  wire 	[31:0]	axi3_64_100M_awaddr;
	  wire 	[7:0]	axi3_64_100M_awlen;
	  wire 	[2:0]	axi3_64_100M_awsize;
	  wire 	[1:0]	axi3_64_100M_awburst;
	  wire 			axi3_64_100M_awlock;
	  wire 	[3:0]	axi3_64_100M_awcache;
	  wire 	[2:0]	axi3_64_100M_awprot;
	  wire 	[3:0]	axi3_64_100M_awqos;
	  wire 			axi3_64_100M_awvalid;
	  wire 			axi3_64_100M_awready;
	  //
	  wire 	[3:0]	axi3_64_100M_wid;
	  wire 	[63:0]	axi3_64_100M_wdata;
	  wire 	[7:0]	axi3_64_100M_wstrb;
	  wire 			axi3_64_100M_wlast;
	  wire 			axi3_64_100M_wvalid;
	  wire 			axi3_64_100M_wready;
	  //
	  wire 	[3:0]	axi3_64_100M_bid;
	  wire 	[1:0]	axi3_64_100M_bresp;
	  wire 			axi3_64_100M_bvalid;
	  wire 			axi3_64_100M_bready;
	  //
	  wire 	[3:0]	axi3_64_100M_arid;
	  wire 	[31:0]	axi3_64_100M_araddr;
	  wire 	[7:0]	axi3_64_100M_arlen;
	  wire 	[2:0]	axi3_64_100M_arsize;
	  wire 	[1:0]	axi3_64_100M_arburst;
	  wire 			axi3_64_100M_arlock;
	  wire 	[3:0]	axi3_64_100M_arcache;
	  wire 	[2:0]	axi3_64_100M_arprot;
	  wire 	[3:0]	axi3_64_100M_arqos;
	  wire 			axi3_64_100M_arvalid;
	  wire 			axi3_64_100M_arready;
	  //
	  wire 	[3:0]	axi3_64_100M_rid;
	  wire 	[63:0]	axi3_64_100M_rdata;
	  wire 	[1:0]	axi3_64_100M_rresp;
	  wire 			axi3_64_100M_rlast;
	  wire 			axi3_64_100M_rvalid;
	  wire 			axi3_64_100M_rready;

      axi_protocol_converter_0 axi4_to_axi3(

  		.aclk ( clock ),
  		.aresetn ( resetn ),
  		//
  		.s_axi_awid ( io_axi4_0_aw_id ),
  		.s_axi_awaddr ( io_axi4_0_aw_addr ),
  		.s_axi_awlen ( io_axi4_0_aw_len ),
  		.s_axi_awsize ( io_axi4_0_aw_size ),
  		.s_axi_awburst ( io_axi4_0_aw_burst ),
  		.s_axi_awlock ( io_axi4_0_aw_lock ),
  		.s_axi_awcache ( io_axi4_0_aw_cache ),
  		.s_axi_awprot ( io_axi4_0_aw_prot ),
  		.s_axi_awregion ( 0 ),					// we do not have region signal from the dut
  		.s_axi_awqos ( io_axi4_0_aw_qos ),
  		.s_axi_awvalid ( io_axi4_0_aw_valid ),
  		.s_axi_awready ( io_axi4_0_aw_ready ),
  		//
  		.s_axi_wdata ( io_axi4_0_w_data ),
  		.s_axi_wstrb ( io_axi4_0_w_strb ),
  		.s_axi_wlast ( io_axi4_0_w_last ),
  		.s_axi_wvalid ( io_axi4_0_w_valid ),
  		.s_axi_wready ( io_axi4_0_w_ready ),
  		//
  		.s_axi_bid ( io_axi4_0_b_id ),
  		.s_axi_bresp ( io_axi4_0_b_resp ),
  		.s_axi_bvalid ( io_axi4_0_b_valid ),
  		.s_axi_bready ( io_axi4_0_b_ready ),
  		//
  		.s_axi_arid ( io_axi4_0_ar_id ),
  		.s_axi_araddr ( io_axi4_0_ar_addr ),
  		.s_axi_arlen ( io_axi4_0_ar_len ),
  		.s_axi_arsize ( io_axi4_0_ar_size ),
  		.s_axi_arburst ( io_axi4_0_ar_burst ),
  		.s_axi_arlock ( io_axi4_0_ar_lock ),
  		.s_axi_arcache ( io_axi4_0_ar_cache ),
  		.s_axi_arprot ( io_axi4_0_ar_prot ),
  		.s_axi_arregion ( 0 ),       			// we do not have region signal
  		.s_axi_arqos ( io_axi4_0_ar_qos ),
  		.s_axi_arvalid ( io_axi4_0_ar_valid ),
  		.s_axi_arready ( io_axi4_0_ar_ready ),
  		//
  		.s_axi_rid ( io_axi4_0_r_id ),
  		.s_axi_rdata ( io_axi4_0_r_data ),
  		.s_axi_rresp ( io_axi4_0_r_resp ),
  		.s_axi_rlast ( io_axi4_0_r_last ),
  		.s_axi_rvalid ( io_axi4_0_r_valid ),
  		.s_axi_rready ( io_axi4_0_r_ready ),
  		//
  		//--
  		//
  		.m_axi_awid ( axi3_64_100M_awid ),
  		.m_axi_awaddr ( axi3_64_100M_awaddr ),
  		.m_axi_awlen ( axi3_64_100M_awlen ),
  		.m_axi_awsize ( axi3_64_100M_awsize ),
  		.m_axi_awburst ( axi3_64_100M_awburst ),
  		.m_axi_awlock ( axi3_64_100M_awlock ),
  		.m_axi_awcache ( axi3_64_100M_awcache ),
  		.m_axi_awprot ( axi3_64_100M_awprot ),
  		.m_axi_awqos ( axi3_64_100M_awqos ),
  		.m_axi_awvalid ( axi3_64_100M_awvalid ),
  		.m_axi_awready ( axi3_64_100M_awready ),
  		//
  		.m_axi_wid ( axi3_64_100M_wid ),		// it is abandoned in the downstream module
  		.m_axi_wdata ( axi3_64_100M_wdata ),
  		.m_axi_wstrb ( axi3_64_100M_wstrb ),
  		.m_axi_wlast ( axi3_64_100M_wlast ),
  		.m_axi_wvalid ( axi3_64_100M_wvalid ),
  		.m_axi_wready ( axi3_64_100M_wready ),
  		//
  		.m_axi_bid ( axi3_64_100M_bid ),
  		.m_axi_bresp ( axi3_64_100M_bresp ),
  		.m_axi_bvalid ( axi3_64_100M_bvalid ),
  		.m_axi_bready ( axi3_64_100M_bready ),
  		//
  		.m_axi_arid ( axi3_64_100M_arid ),
  		.m_axi_araddr ( axi3_64_100M_araddr ),
  		.m_axi_arlen ( axi3_64_100M_arlen ),
  		.m_axi_arsize ( axi3_64_100M_arsize ),
  		.m_axi_arburst ( axi3_64_100M_arburst ),
  		.m_axi_arlock ( axi3_64_100M_arlock ),
  		.m_axi_arcache ( axi3_64_100M_arcache ),
  		.m_axi_arprot ( axi3_64_100M_arprot ),
  		.m_axi_arqos ( axi3_64_100M_arqos ),
  		.m_axi_arvalid ( axi3_64_100M_arvalid ),
  		.m_axi_arready ( axi3_64_100M_arready ),
  		//
  		.m_axi_rid ( axi3_64_100M_rid ),
  		.m_axi_rdata ( axi3_64_100M_rdata ),
  		.m_axi_rresp ( axi3_64_100M_rresp ),
  		.m_axi_rlast ( axi3_64_100M_rlast ),
  		.m_axi_rvalid ( axi3_64_100M_rvalid ),
  		.m_axi_rready ( axi3_64_100M_rready )

      	);

      
      width_clock_converter width_clock_converter_ins(

  		.s_axi_aclk ( clock ),
  		.s_axi_aresetn ( resetn ), 

  		.s_axi_awid ( axi3_64_100M_awid ),
  		.s_axi_awaddr ( axi3_64_100M_awaddr ),
  		.s_axi_awlen ( axi3_64_100M_awlen ),
  		.s_axi_awsize ( axi3_64_100M_awsize ),
  		.s_axi_awburst ( axi3_64_100M_awburst ),
  		.s_axi_awlock ( axi3_64_100M_awlock ),
  		.s_axi_awcache ( axi3_64_100M_awcache ),
  		.s_axi_awprot ( axi3_64_100M_awprot ),
  		.s_axi_awqos ( axi3_64_100M_awqos ),
  		.s_axi_awvalid ( axi3_64_100M_awvalid ),
  		.s_axi_awready ( axi3_64_100M_awready ),
  		//
  		.s_axi_wdata ( axi3_64_100M_wdata ),
  		.s_axi_wstrb ( axi3_64_100M_wstrb ),
  		.s_axi_wlast ( axi3_64_100M_wlast ),
  		.s_axi_wvalid ( axi3_64_100M_wvalid ),
  		.s_axi_wready ( axi3_64_100M_wready ),
  		//
  		.s_axi_bid ( axi3_64_100M_bid ),
  		.s_axi_bresp ( axi3_64_100M_bresp ),
  		.s_axi_bvalid ( axi3_64_100M_bvalid ),
  		.s_axi_bready ( axi3_64_100M_bready ),
  		//
  		.s_axi_arid ( axi3_64_100M_arid ),
  		.s_axi_araddr ( axi3_64_100M_araddr ),
  		.s_axi_arlen ( axi3_64_100M_arlen ),
  		.s_axi_arsize ( axi3_64_100M_arsize ),
  		.s_axi_arburst ( axi3_64_100M_arburst ),
  		.s_axi_arlock ( axi3_64_100M_arlock ),
  		.s_axi_arcache ( axi3_64_100M_arcache ),
  		.s_axi_arprot ( axi3_64_100M_arprot ),
  		.s_axi_arqos ( axi3_64_100M_arqos ),
  		.s_axi_arvalid ( axi3_64_100M_arvalid ),
  		.s_axi_arready ( axi3_64_100M_arready ),
  		//
  		.s_axi_rid ( axi3_64_100M_rid ),
  		.s_axi_rdata ( axi3_64_100M_rdata ),
  		.s_axi_rresp ( axi3_64_100M_rresp ),
  		.s_axi_rlast ( axi3_64_100M_rlast ),
  		.s_axi_rvalid ( axi3_64_100M_rvalid ),
  		.s_axi_rready ( axi3_64_100M_rready ),
  		//
  		//--
  		//
  		.m_axi_aclk ( clock200 ),
  		.m_axi_aresetn ( resetn ),
  		//
  		.m_axi_awaddr ( axi3_256_200M_awaddr ),			// id signals are all eliminated, accord to PG059 page70
  		.m_axi_awlen ( axi3_256_200M_awlen ),
  		.m_axi_awsize ( axi3_256_200M_awsize ),
  		.m_axi_awburst ( axi3_256_200M_awburst ),
  		.m_axi_awlock ( axi3_256_200M_awlock ),
  		.m_axi_awcache ( axi3_256_200M_awcache ),
  		.m_axi_awprot ( axi3_256_200M_awprot ),
  		.m_axi_awqos ( axi3_256_200M_awqos ),
  		.m_axi_awvalid ( axi3_256_200M_awvalid ),
  		.m_axi_awready ( axi3_256_200M_awready ),
  		//
  		.m_axi_wdata ( axi3_256_200M_wdata ),
  		.m_axi_wstrb ( axi3_256_200M_wstrb ),
  		.m_axi_wlast ( axi3_256_200M_wlast ),
  		.m_axi_wvalid ( axi3_256_200M_wvalid ),
  		.m_axi_wready ( axi3_256_200M_wready ),
  		//
  		.m_axi_bresp ( axi3_256_200M_bresp ),
  		.m_axi_bvalid ( axi3_256_200M_bvalid ),
  		.m_axi_bready ( axi3_256_200M_bready ),
  		//
  		.m_axi_araddr ( axi3_256_200M_araddr ),
  		.m_axi_arlen ( axi3_256_200M_arlen ),
  		.m_axi_arsize ( axi3_256_200M_arsize ),
  		.m_axi_arburst ( axi3_256_200M_arburst ),
  		.m_axi_arlock ( axi3_256_200M_arlock ),
  		.m_axi_arcache ( axi3_256_200M_arcache ),
  		.m_axi_arprot ( axi3_256_200M_arprot ),
  		.m_axi_arqos ( axi3_256_200M_arqos ),
  		.m_axi_arvalid ( axi3_256_200M_arvalid ),
  		.m_axi_arready ( axi3_256_200M_arready ),
  		//
  		.m_axi_rdata ( axi3_256_200M_rdata ),
  		.m_axi_rresp ( axi3_256_200M_rresp ),
  		.m_axi_rlast ( axi3_256_200M_rlast ),
  		.m_axi_rvalid ( axi3_256_200M_rvalid ),
  		.m_axi_rready ( axi3_256_200M_rready ) 

      	);
endmodule