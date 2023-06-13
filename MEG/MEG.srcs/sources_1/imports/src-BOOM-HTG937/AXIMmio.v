 module AXIMmio ( 
   input clock, 
   //input spiclock,  //slower 30MHz
   input reset,    
   
   // outside pins
   input uart_RX,
   output uart_TX,
   inout         spi_cs,
   inout         spi_sclock,
   inout         spi_mosi,
   inout         spi_miso,
   output        sd_poweroff,
   output [8:1]  led,
   
   //outward acc mem bus, parallel to those outside pins its a bundle of 15 axi master interface

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
      output      [1   * 15 - 1  :0]      acc_axi3_256_100M_rready,
      
// the mimo control bus
       output        io_axi4_0_aw_ready, 
       input         io_axi4_0_aw_valid, 
       input  [3:0]  io_axi4_0_aw_id, 
       input  [30:0] io_axi4_0_aw_addr, 
       input  [7:0]  io_axi4_0_aw_len, 
       input  [2:0]  io_axi4_0_aw_size, 
       input  [1:0]  io_axi4_0_aw_burst, 
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
       input  [30:0] io_axi4_0_ar_addr, 
       input  [7:0]  io_axi4_0_ar_len, 
       input  [2:0]  io_axi4_0_ar_size, 
       input  [1:0]  io_axi4_0_ar_burst, 
       input         io_axi4_0_r_ready, 
       output        io_axi4_0_r_valid, 
       output [3:0]  io_axi4_0_r_id, 
       output [63:0] io_axi4_0_r_data, 
       output [1:0]  io_axi4_0_r_resp, 
       output        io_axi4_0_r_last,
       
       output        interrupt_uart,
       output        interrupt_spi
 );

   wire resetn;
   assign resetn = ~ reset;

   //crossbar IP  Slave1-uart Slave2-BRAM Slave3-SPI Slave4-LED, they have been merged into one bundle in the stupid IP
   wire [3:0]      peribundle_axi4_aw_ready;
   wire [3:0]      peribundle_axi4_aw_valid;
   wire [15:0]     peribundle_axi4_aw_id;
   wire [123:0]     peribundle_axi4_aw_addr;
   wire [31:0]     peribundle_axi4_aw_len;
   wire [11:0]      peribundle_axi4_aw_size;
   wire [7:0]      peribundle_axi4_aw_burst;
   wire [3:0]      peribundle_axi4_w_ready;
   wire [3:0]      peribundle_axi4_w_valid;
   wire [255:0]    peribundle_axi4_w_data;
   wire [31:0]     peribundle_axi4_w_strb;
   wire [3:0]      peribundle_axi4_w_last;
   wire [3:0]      peribundle_axi4_b_ready;
   wire [3:0]      peribundle_axi4_b_valid;
   wire [15:0]     peribundle_axi4_b_id;
   wire [7:0]      peribundle_axi4_b_resp;
   wire [3:0]      peribundle_axi4_ar_ready;
   wire [3:0]      peribundle_axi4_ar_valid;
   wire [15:0]     peribundle_axi4_ar_id;
   wire [123:0]     peribundle_axi4_ar_addr;
   wire [31:0]     peribundle_axi4_ar_len;
   wire [11:0]      peribundle_axi4_ar_size;
   wire [7:0]      peribundle_axi4_ar_burst;
   wire [3:0]      peribundle_axi4_r_ready;
   wire [3:0]      peribundle_axi4_r_valid;
   wire [15:0]     peribundle_axi4_r_id;
   wire [255:0]    peribundle_axi4_r_data;
   wire [7:0]      peribundle_axi4_r_resp;
   wire [3:0]      peribundle_axi4_r_last;

   axi_crossbar_0 peri_Xbar(
       .aclk           (clock),
       .aresetn        (resetn),

       .s_axi_awid     (io_axi4_0_aw_id),
       .s_axi_awaddr   (io_axi4_0_aw_addr),
       .s_axi_awlen    (io_axi4_0_aw_len),
       .s_axi_awsize   (io_axi4_0_aw_size),
       .s_axi_awburst  (io_axi4_0_aw_burst),
       .s_axi_awvalid  (io_axi4_0_aw_valid),
       .s_axi_awready  (io_axi4_0_aw_ready),
       .s_axi_wdata    (io_axi4_0_w_data),
       .s_axi_wstrb    (io_axi4_0_w_strb),
       .s_axi_wlast    (io_axi4_0_w_last),
       .s_axi_wvalid   (io_axi4_0_w_valid),
       .s_axi_wready   (io_axi4_0_w_ready),
       .s_axi_bid      (io_axi4_0_b_id),
       .s_axi_bresp    (io_axi4_0_b_resp),
       .s_axi_bvalid   (io_axi4_0_b_valid),
       .s_axi_bready   (io_axi4_0_b_ready),
       .s_axi_arid     (io_axi4_0_ar_id),
       .s_axi_araddr   (io_axi4_0_ar_addr),
       .s_axi_arlen    (io_axi4_0_ar_len),
       .s_axi_arsize   (io_axi4_0_ar_size),
       .s_axi_arburst  (io_axi4_0_ar_burst),
       .s_axi_arvalid  (io_axi4_0_ar_valid),
       .s_axi_arready  (io_axi4_0_ar_ready),
       .s_axi_rid      (io_axi4_0_r_id),
       .s_axi_rdata    (io_axi4_0_r_data),
       .s_axi_rresp    (io_axi4_0_r_resp),
       .s_axi_rlast    (io_axi4_0_r_last),
       .s_axi_rvalid   (io_axi4_0_r_valid),
       .s_axi_rready   (io_axi4_0_r_ready),

       .m_axi_awid     (peribundle_axi4_aw_id),
       .m_axi_awaddr   (peribundle_axi4_aw_addr),
       .m_axi_awlen    (peribundle_axi4_aw_len),
       .m_axi_awsize   (peribundle_axi4_aw_size),
       .m_axi_awburst  (peribundle_axi4_aw_burst),
       .m_axi_awvalid  (peribundle_axi4_aw_valid),
       .m_axi_awready  (peribundle_axi4_aw_ready),
       .m_axi_wdata    (peribundle_axi4_w_data),
       .m_axi_wstrb    (peribundle_axi4_w_strb),
       .m_axi_wlast    (peribundle_axi4_w_last),
       .m_axi_wvalid   (peribundle_axi4_w_valid),
       .m_axi_wready   (peribundle_axi4_w_ready),
       .m_axi_bid      (peribundle_axi4_b_id),
       .m_axi_bresp    (peribundle_axi4_b_resp),
       .m_axi_bvalid   (peribundle_axi4_b_valid),
       .m_axi_bready   (peribundle_axi4_b_ready),
       .m_axi_arid     (peribundle_axi4_ar_id),
       .m_axi_araddr   (peribundle_axi4_ar_addr),
       .m_axi_arlen    (peribundle_axi4_ar_len),
       .m_axi_arsize   (peribundle_axi4_ar_size),
       .m_axi_arburst  (peribundle_axi4_ar_burst),
       .m_axi_arvalid  (peribundle_axi4_ar_valid),
       .m_axi_arready  (peribundle_axi4_ar_ready),
       .m_axi_rid      (peribundle_axi4_r_id),
       .m_axi_rdata    (peribundle_axi4_r_data),
       .m_axi_rresp    (peribundle_axi4_r_resp),
       .m_axi_rlast    (peribundle_axi4_r_last),
       .m_axi_rvalid   (peribundle_axi4_r_valid),
       .m_axi_rready   (peribundle_axi4_r_ready) 
       );

   //0x60000000 - 0x60001fff
   uart uart_inst(

       .uart_axi4_aw_ready (peribundle_axi4_aw_ready[0]    ),
       .uart_axi4_aw_valid (peribundle_axi4_aw_valid[0]    ),
       .uart_axi4_aw_id    (peribundle_axi4_aw_id[3:0]     ),
       .uart_axi4_aw_addr  (peribundle_axi4_aw_addr[30:0]  ),
       .uart_axi4_aw_len   (peribundle_axi4_aw_len[7:0]    ),
       .uart_axi4_aw_size  (peribundle_axi4_aw_size[2:0]   ),
       .uart_axi4_aw_burst (peribundle_axi4_aw_burst[1:0]  ),
       .uart_axi4_w_ready  (peribundle_axi4_w_ready[0]     ),
       .uart_axi4_w_valid  (peribundle_axi4_w_valid[0]     ),
       .uart_axi4_w_data   (peribundle_axi4_w_data[63:0]   ),
       .uart_axi4_w_strb   (peribundle_axi4_w_strb[7:0]    ),
       .uart_axi4_w_last   (peribundle_axi4_w_last[0]      ),
       .uart_axi4_b_ready  (peribundle_axi4_b_ready[0]     ),
       .uart_axi4_b_valid  (peribundle_axi4_b_valid[0]     ),
       .uart_axi4_b_id     (peribundle_axi4_b_id[3:0]      ),
       .uart_axi4_b_resp   (peribundle_axi4_b_resp[1:0]    ),
       .uart_axi4_ar_ready (peribundle_axi4_ar_ready[0]    ),
       .uart_axi4_ar_valid (peribundle_axi4_ar_valid[0]    ),
       .uart_axi4_ar_id    (peribundle_axi4_ar_id[3:0]     ),
       .uart_axi4_ar_addr  (peribundle_axi4_ar_addr[30:0]  ),
       .uart_axi4_ar_len   (peribundle_axi4_ar_len[7:0]    ),
       .uart_axi4_ar_size  (peribundle_axi4_ar_size[2:0]   ),
       .uart_axi4_ar_burst (peribundle_axi4_ar_burst[1:0]  ),
       .uart_axi4_r_ready  (peribundle_axi4_r_ready[0]     ),
       .uart_axi4_r_valid  (peribundle_axi4_r_valid[0]     ),
       .uart_axi4_r_id     (peribundle_axi4_r_id[3:0]      ),
       .uart_axi4_r_data   (peribundle_axi4_r_data[63:0]   ),
       .uart_axi4_r_resp   (peribundle_axi4_r_resp[1:0]    ),
       .uart_axi4_r_last   (peribundle_axi4_r_last[0]      ),

       .clock(clock),
       .resetn(resetn),
       .uart_TX(uart_TX),
       .uart_RX(uart_RX),
       
       .interrupt(interrupt_uart)

       );

   //0x60010000 - 0x6001ffff , 64kB
   bram bram_inst(

       .bram_axi4_aw_ready (peribundle_axi4_aw_ready[1]    ),
       .bram_axi4_aw_valid (peribundle_axi4_aw_valid[1]    ),
       .bram_axi4_aw_id    (peribundle_axi4_aw_id[7:4]     ),
       .bram_axi4_aw_addr  (peribundle_axi4_aw_addr[61:31] ),
       .bram_axi4_aw_len   (peribundle_axi4_aw_len[15:8]   ),
       .bram_axi4_aw_size  (peribundle_axi4_aw_size[5:3]   ),
       .bram_axi4_aw_burst (peribundle_axi4_aw_burst[3:2]  ),
       .bram_axi4_w_ready  (peribundle_axi4_w_ready[1]     ),
       .bram_axi4_w_valid  (peribundle_axi4_w_valid[1]     ),
       .bram_axi4_w_data   (peribundle_axi4_w_data[127:64] ),
       .bram_axi4_w_strb   (peribundle_axi4_w_strb[15:8]   ),
       .bram_axi4_w_last   (peribundle_axi4_w_last[1]      ),
       .bram_axi4_b_ready  (peribundle_axi4_b_ready[1]     ),
       .bram_axi4_b_valid  (peribundle_axi4_b_valid[1]     ),
       .bram_axi4_b_id     (peribundle_axi4_b_id[7:4]      ),
       .bram_axi4_b_resp   (peribundle_axi4_b_resp[3:2]    ),
       .bram_axi4_ar_ready (peribundle_axi4_ar_ready[1]    ),
       .bram_axi4_ar_valid (peribundle_axi4_ar_valid[1]    ),
       .bram_axi4_ar_id    (peribundle_axi4_ar_id[7:4]     ),
       .bram_axi4_ar_addr  (peribundle_axi4_ar_addr[61:31] ),
       .bram_axi4_ar_len   (peribundle_axi4_ar_len[15:8]   ),
       .bram_axi4_ar_size  (peribundle_axi4_ar_size[5:3]   ),
       .bram_axi4_ar_burst (peribundle_axi4_ar_burst[3:2]  ),
       .bram_axi4_r_ready  (peribundle_axi4_r_ready[1]     ),
       .bram_axi4_r_valid  (peribundle_axi4_r_valid[1]     ),
       .bram_axi4_r_id     (peribundle_axi4_r_id[7:4]      ),
       .bram_axi4_r_data   (peribundle_axi4_r_data[127:64] ),
       .bram_axi4_r_resp   (peribundle_axi4_r_resp[3:2]    ),
       .bram_axi4_r_last   (peribundle_axi4_r_last[1]      ),

       .clock(clock),
       .resetn(resetn)

       );

   //TBA for the SPI-SD based at 0x60020000, a lesson is "ground all your unused signals", or the stupid vivado simulator will go insane 
    
    spi spi_inst(

       .spi_axi4_aw_ready (peribundle_axi4_aw_ready[2]    ),
       .spi_axi4_aw_valid (peribundle_axi4_aw_valid[2]    ),
       .spi_axi4_aw_id    (peribundle_axi4_aw_id[11:8]     ),
       .spi_axi4_aw_addr  (peribundle_axi4_aw_addr[92:62] ),
       .spi_axi4_aw_len   (peribundle_axi4_aw_len[23:16]   ),
       .spi_axi4_aw_size  (peribundle_axi4_aw_size[8:6]   ),
       .spi_axi4_aw_burst (peribundle_axi4_aw_burst[5:4]  ),
       .spi_axi4_w_ready  (peribundle_axi4_w_ready[2]     ),
       .spi_axi4_w_valid  (peribundle_axi4_w_valid[2]     ),
       .spi_axi4_w_data   (peribundle_axi4_w_data[191:128] ),
       .spi_axi4_w_strb   (peribundle_axi4_w_strb[23:16]   ),
       .spi_axi4_w_last   (peribundle_axi4_w_last[2]      ),
       .spi_axi4_b_ready  (peribundle_axi4_b_ready[2]     ),
       .spi_axi4_b_valid  (peribundle_axi4_b_valid[2]     ),
       .spi_axi4_b_id     (peribundle_axi4_b_id[11:8]      ),
       .spi_axi4_b_resp   (peribundle_axi4_b_resp[5:4]    ),
       .spi_axi4_ar_ready (peribundle_axi4_ar_ready[2]    ),
       .spi_axi4_ar_valid (peribundle_axi4_ar_valid[2]    ),
       .spi_axi4_ar_id    (peribundle_axi4_ar_id[11:8]     ),
       .spi_axi4_ar_addr  (peribundle_axi4_ar_addr[92:62] ),
       .spi_axi4_ar_len   (peribundle_axi4_ar_len[23:16]   ),
       .spi_axi4_ar_size  (peribundle_axi4_ar_size[8:6]   ),
       .spi_axi4_ar_burst (peribundle_axi4_ar_burst[5:4]  ),
       .spi_axi4_r_ready  (peribundle_axi4_r_ready[2]     ),
       .spi_axi4_r_valid  (peribundle_axi4_r_valid[2]     ),
       .spi_axi4_r_id     (peribundle_axi4_r_id[11:8]      ),
       .spi_axi4_r_data   (peribundle_axi4_r_data[191:128] ),
       .spi_axi4_r_resp   (peribundle_axi4_r_resp[5:4]    ),
       .spi_axi4_r_last   (peribundle_axi4_r_last[2]      ),

       .clock(clock),
       //.spiclock(spiclock),
       .resetn(resetn),

       .spi_mosi(spi_mosi),
       .spi_miso(spi_miso),
       .spi_sclock(spi_sclock),
       .spi_cs(spi_cs),
       .sd_poweroff(sd_poweroff),
       
       .interrupt(interrupt_spi)

      );
      
      // 0x60030000
    acc acc_inst(
        // control bus
       .acc_axi4_aw_ready (peribundle_axi4_aw_ready[3]    ),
       .acc_axi4_aw_valid (peribundle_axi4_aw_valid[3]    ),
       .acc_axi4_aw_id    (peribundle_axi4_aw_id[15:12]     ),
       .acc_axi4_aw_addr  (peribundle_axi4_aw_addr[123:93] ),
       .acc_axi4_aw_len   (peribundle_axi4_aw_len[31:24]   ),
       .acc_axi4_aw_size  (peribundle_axi4_aw_size[11:9]   ),
       .acc_axi4_aw_burst (peribundle_axi4_aw_burst[7:6]  ),
       .acc_axi4_w_ready  (peribundle_axi4_w_ready[3]     ),
       .acc_axi4_w_valid  (peribundle_axi4_w_valid[3]     ),
       .acc_axi4_w_data   (peribundle_axi4_w_data[255:192] ),
       .acc_axi4_w_strb   (peribundle_axi4_w_strb[31:24]   ),
       .acc_axi4_w_last   (peribundle_axi4_w_last[3]      ),
       .acc_axi4_b_ready  (peribundle_axi4_b_ready[3]     ),
       .acc_axi4_b_valid  (peribundle_axi4_b_valid[3]     ),
       .acc_axi4_b_id     (peribundle_axi4_b_id[15:12]      ),
       .acc_axi4_b_resp   (peribundle_axi4_b_resp[7:6]    ),
       .acc_axi4_ar_ready (peribundle_axi4_ar_ready[3]    ),
       .acc_axi4_ar_valid (peribundle_axi4_ar_valid[3]    ),
       .acc_axi4_ar_id    (peribundle_axi4_ar_id[15:12]     ),
       .acc_axi4_ar_addr  (peribundle_axi4_ar_addr[123:93] ),
       .acc_axi4_ar_len   (peribundle_axi4_ar_len[31:24]   ),
       .acc_axi4_ar_size  (peribundle_axi4_ar_size[11:9]   ),
       .acc_axi4_ar_burst (peribundle_axi4_ar_burst[7:6]  ),
       .acc_axi4_r_ready  (peribundle_axi4_r_ready[3]     ),
       .acc_axi4_r_valid  (peribundle_axi4_r_valid[3]     ),
       .acc_axi4_r_id     (peribundle_axi4_r_id[15:12]      ),
       .acc_axi4_r_data   (peribundle_axi4_r_data[255:192] ),
       .acc_axi4_r_resp   (peribundle_axi4_r_resp[7:6]    ),
       .acc_axi4_r_last   (peribundle_axi4_r_last[3]      ),
       
    //-----------------------channel for Acc mem access
    .acc_axi3_256_100M_awaddr(acc_axi3_256_100M_awaddr),
    .acc_axi3_256_100M_awlen(acc_axi3_256_100M_awlen),
    .acc_axi3_256_100M_awsize(acc_axi3_256_100M_awsize),
    .acc_axi3_256_100M_awburst(acc_axi3_256_100M_awburst),
    .acc_axi3_256_100M_awid(acc_axi3_256_100M_awid),
    .acc_axi3_256_100M_awvalid(acc_axi3_256_100M_awvalid),
    .acc_axi3_256_100M_awready(acc_axi3_256_100M_awready),
    .acc_axi3_256_100M_wdata(acc_axi3_256_100M_wdata),
    .acc_axi3_256_100M_wstrb(acc_axi3_256_100M_wstrb),
    .acc_axi3_256_100M_wlast(acc_axi3_256_100M_wlast),
    .acc_axi3_256_100M_wvalid(acc_axi3_256_100M_wvalid),
    .acc_axi3_256_100M_wready(acc_axi3_256_100M_wready),
    .acc_axi3_256_100M_bresp(acc_axi3_256_100M_bresp),
    .acc_axi3_256_100M_bid(acc_axi3_256_100M_bid),
    .acc_axi3_256_100M_bvalid(acc_axi3_256_100M_bvalid),
    .acc_axi3_256_100M_bready(acc_axi3_256_100M_bready),
    .acc_axi3_256_100M_araddr(acc_axi3_256_100M_araddr),
    .acc_axi3_256_100M_arlen(acc_axi3_256_100M_arlen),
    .acc_axi3_256_100M_arsize(acc_axi3_256_100M_arsize),
    .acc_axi3_256_100M_arburst(acc_axi3_256_100M_arburst),
    .acc_axi3_256_100M_arid(acc_axi3_256_100M_arid),
    .acc_axi3_256_100M_arvalid(acc_axi3_256_100M_arvalid),
    .acc_axi3_256_100M_arready(acc_axi3_256_100M_arready),
    .acc_axi3_256_100M_rdata(acc_axi3_256_100M_rdata),
    .acc_axi3_256_100M_rresp(acc_axi3_256_100M_rresp),
    .acc_axi3_256_100M_rlast(acc_axi3_256_100M_rlast),
    .acc_axi3_256_100M_rvalid(acc_axi3_256_100M_rvalid),
    .acc_axi3_256_100M_rid(acc_axi3_256_100M_rid),
    .acc_axi3_256_100M_rready(acc_axi3_256_100M_rready),
    
       .clock(clock),
       .resetn(resetn),

       .led(led)
        );
endmodule
