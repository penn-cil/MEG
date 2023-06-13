`timescale 1ns/1ps
`include "macro.vh"

module chip_top 
( 
  input   clock_p,
  input   clock_n, 
  input   buttonresetn,
  
  //-----UART
  output  uart_TX,
  input   uart_RX,
  
  //-----LED
    output [8:1] led,

  //-----DDR4
      input   c0_sys_clk_p,
      input   c0_sys_clk_n,
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

   //----SD on spi
   inout         spi_cs,    //user io 1
   inout         spi_sclock,//user io 2
   inout         spi_mosi,  //user io 3
   inout         spi_miso,  //user io 4
   output        sd_gnd,    //user io 5
   output        sd_power   //user io 6  turn off the sdpower when it gets asserted
);

  
  wire sd_poweroff;
  assign sd_power = ~ sd_poweroff;
  assign sd_gnd = 0;

  wire  clock30;  //30m for spi
  wire  clock100; //100m
  wire  clock200; //200m
      
  //dut wires
  wire  dut_clock; 
  wire  dut_reset; 
  wire [1:0] dut_interrupts; 
  //debug module interface
  wire  dut_debug_clockeddmi_dmi_req_ready; 
  wire  dut_debug_clockeddmi_dmi_req_valid; 
  wire [6:0] dut_debug_clockeddmi_dmi_req_addr; 
  wire [31:0] dut_debug_clockeddmi_dmi_req_data; 
  wire [1:0] dut_debug_clockeddmi_dmi_req_op; 
  wire  dut_debug_clockeddmi_dmi_resp_ready; 
  wire  dut_debug_clockeddmi_dmi_resp_valid; 
  wire [31:0] dut_debug_clockeddmi_dmi_resp_data; 
  wire [1:0] dut_debug_clockeddmi_dmi_resp_resp; 
  wire  dut_debug_clockeddmi_dmiClock; 
  wire  dut_debug_clockeddmi_dmiReset; 
  wire  dut_debug_ndreset; 
  wire  dut_debug_dmactive; 
  //mem
  wire  dut_mem_axi4_0_aw_ready; 
  wire  dut_mem_axi4_0_aw_valid; 
  wire [3:0] dut_mem_axi4_0_aw_id; 
  wire [31:0] dut_mem_axi4_0_aw_addr; 
  wire [7:0] dut_mem_axi4_0_aw_len; 
  wire [2:0] dut_mem_axi4_0_aw_size; 
  wire [1:0] dut_mem_axi4_0_aw_burst; 
  wire  dut_mem_axi4_0_aw_lock; 
  wire [3:0] dut_mem_axi4_0_aw_cache; 
  wire [2:0] dut_mem_axi4_0_aw_prot; 
  wire [3:0] dut_mem_axi4_0_aw_qos; 
  wire  dut_mem_axi4_0_w_ready; 
  wire  dut_mem_axi4_0_w_valid; 
  wire [63:0] dut_mem_axi4_0_w_data; 
  wire [7:0] dut_mem_axi4_0_w_strb; 
  wire  dut_mem_axi4_0_w_last; 
  wire  dut_mem_axi4_0_b_ready; 
  wire  dut_mem_axi4_0_b_valid; 
  wire [3:0] dut_mem_axi4_0_b_id; 
  wire [1:0] dut_mem_axi4_0_b_resp; 
  wire  dut_mem_axi4_0_ar_ready; 
  wire  dut_mem_axi4_0_ar_valid; 
  wire [3:0] dut_mem_axi4_0_ar_id; 
  wire [31:0] dut_mem_axi4_0_ar_addr; 
  wire [7:0] dut_mem_axi4_0_ar_len; 
  wire [2:0] dut_mem_axi4_0_ar_size; 
  wire [1:0] dut_mem_axi4_0_ar_burst; 
  wire  dut_mem_axi4_0_ar_lock; 
  wire [3:0] dut_mem_axi4_0_ar_cache; 
  wire [2:0] dut_mem_axi4_0_ar_prot; 
  wire [3:0] dut_mem_axi4_0_ar_qos; 
  wire  dut_mem_axi4_0_r_ready; 
  wire  dut_mem_axi4_0_r_valid; 
  wire [3:0] dut_mem_axi4_0_r_id; 
  wire [63:0] dut_mem_axi4_0_r_data; 
  wire [1:0] dut_mem_axi4_0_r_resp; 
  wire  dut_mem_axi4_0_r_last; 
  //mmio
  wire  dut_mmio_axi4_0_aw_ready; 
  wire  dut_mmio_axi4_0_aw_valid; 
  wire [3:0] dut_mmio_axi4_0_aw_id; 
  wire [30:0] dut_mmio_axi4_0_aw_addr; 
  wire [7:0] dut_mmio_axi4_0_aw_len; 
  wire [2:0] dut_mmio_axi4_0_aw_size; 
  wire [1:0] dut_mmio_axi4_0_aw_burst; 
  wire  dut_mmio_axi4_0_aw_lock; 
  wire [3:0] dut_mmio_axi4_0_aw_cache; 
  wire [2:0] dut_mmio_axi4_0_aw_prot; 
  wire [3:0] dut_mmio_axi4_0_aw_qos; 
  wire  dut_mmio_axi4_0_w_ready; 
  wire  dut_mmio_axi4_0_w_valid; 
  wire [63:0] dut_mmio_axi4_0_w_data; 
  wire [7:0] dut_mmio_axi4_0_w_strb; 
  wire  dut_mmio_axi4_0_w_last; 
  wire  dut_mmio_axi4_0_b_ready; 
  wire  dut_mmio_axi4_0_b_valid; 
  wire [3:0] dut_mmio_axi4_0_b_id; 
  wire [1:0] dut_mmio_axi4_0_b_resp; 
  wire  dut_mmio_axi4_0_ar_ready; 
  wire  dut_mmio_axi4_0_ar_valid; 
  wire [3:0] dut_mmio_axi4_0_ar_id; 
  wire [30:0] dut_mmio_axi4_0_ar_addr; 
  wire [7:0] dut_mmio_axi4_0_ar_len; 
  wire [2:0] dut_mmio_axi4_0_ar_size; 
  wire [1:0] dut_mmio_axi4_0_ar_burst; 
  wire  dut_mmio_axi4_0_ar_lock; 
  wire [3:0] dut_mmio_axi4_0_ar_cache; 
  wire [2:0] dut_mmio_axi4_0_ar_prot; 
  wire [3:0] dut_mmio_axi4_0_ar_qos; 
  wire  dut_mmio_axi4_0_r_ready; 
  wire  dut_mmio_axi4_0_r_valid; 
  wire [3:0] dut_mmio_axi4_0_r_id; 
  wire [63:0] dut_mmio_axi4_0_r_data; 
  wire [1:0] dut_mmio_axi4_0_r_resp; 
  wire  dut_mmio_axi4_0_r_last; 
  //l2
  wire  dut_l2_frontend_bus_axi4_0_aw_ready; 
  wire  dut_l2_frontend_bus_axi4_0_aw_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_aw_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_aw_burst; 
  wire  dut_l2_frontend_bus_axi4_0_aw_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_qos; 
  wire  dut_l2_frontend_bus_axi4_0_w_ready; 
  wire  dut_l2_frontend_bus_axi4_0_w_valid; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_w_data; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_w_strb; 
  wire  dut_l2_frontend_bus_axi4_0_w_last; 
  wire  dut_l2_frontend_bus_axi4_0_b_ready; 
  wire  dut_l2_frontend_bus_axi4_0_b_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_b_id; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_b_resp; 
  wire  dut_l2_frontend_bus_axi4_0_ar_ready; 
  wire  dut_l2_frontend_bus_axi4_0_ar_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_ar_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_ar_burst; 
  wire  dut_l2_frontend_bus_axi4_0_ar_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_qos; 
  wire  dut_l2_frontend_bus_axi4_0_r_ready; 
  wire  dut_l2_frontend_bus_axi4_0_r_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_r_id; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_r_data; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_r_resp; 
  wire  dut_l2_frontend_bus_axi4_0_r_last; 
  // above: those wires connected to the dut module

  wire dut_serial_in_ready;
  wire dut_serial_in_valid;
  wire [31:0] dut_serial_in_bits;
  wire dut_serial_out_ready;
  wire dut_serial_out_valid;
  wire [31:0] dut_serial_out_bits;
  assign dut_serial_in_valid 	= 0;
  assign dut_serial_in_bits 	= 0;
  assign dut_serial_out_ready 	= 0;

  // below: wires connected to the respective peripheral
  // mem
  wire  mem_clock; 
  wire  mem_reset; 
  wire  mem_io_axi4_0_aw_ready; 
  wire  mem_io_axi4_0_aw_valid; 
  wire [3:0] mem_io_axi4_0_aw_id; 
  wire [31:0] mem_io_axi4_0_aw_addr; 
  wire [7:0] mem_io_axi4_0_aw_len; 
  wire [2:0] mem_io_axi4_0_aw_size; 
  wire [1:0] mem_io_axi4_0_aw_burst; 
  // add 4 signal
  wire  mem_io_axi4_0_aw_lock; 
  wire [3:0] mem_io_axi4_0_aw_cache; 
  wire [2:0] mem_io_axi4_0_aw_prot; 
  wire [3:0] mem_io_axi4_0_aw_qos; 
  //
  wire  mem_io_axi4_0_w_ready; 
  wire  mem_io_axi4_0_w_valid; 
  wire [63:0] mem_io_axi4_0_w_data; 
  wire [7:0] mem_io_axi4_0_w_strb; 
  wire  mem_io_axi4_0_w_last; 
  wire  mem_io_axi4_0_b_ready; 
  wire  mem_io_axi4_0_b_valid; 
  wire [3:0] mem_io_axi4_0_b_id; 
  wire [1:0] mem_io_axi4_0_b_resp; 
  wire  mem_io_axi4_0_ar_ready; 
  wire  mem_io_axi4_0_ar_valid; 
  wire [3:0] mem_io_axi4_0_ar_id; 
  wire [31:0] mem_io_axi4_0_ar_addr; 
  wire [7:0] mem_io_axi4_0_ar_len; 
  wire [2:0] mem_io_axi4_0_ar_size; 
  wire [1:0] mem_io_axi4_0_ar_burst; 
  // add 4 signal
  wire  mem_io_axi4_0_ar_lock; 
  wire [3:0] mem_io_axi4_0_ar_cache; 
  wire [2:0] mem_io_axi4_0_ar_prot; 
  wire [3:0] mem_io_axi4_0_ar_qos; 
  //
  wire  mem_io_axi4_0_r_ready; 
  wire  mem_io_axi4_0_r_valid; 
  wire [3:0] mem_io_axi4_0_r_id; 
  wire [63:0] mem_io_axi4_0_r_data; 
  wire [1:0] mem_io_axi4_0_r_resp; 
  wire  mem_io_axi4_0_r_last; 

  // mmio
  wire  mmio_clock; 
  wire  mmio_reset; 
  wire  mmio_io_axi4_0_aw_ready; 
  wire  mmio_io_axi4_0_aw_valid; 
  wire [3:0] mmio_io_axi4_0_aw_id; 
  wire [30:0] mmio_io_axi4_0_aw_addr; 
  wire [7:0] mmio_io_axi4_0_aw_len; 
  wire [2:0] mmio_io_axi4_0_aw_size; 
  wire [1:0] mmio_io_axi4_0_aw_burst; 
  wire  mmio_io_axi4_0_w_ready; 
  wire  mmio_io_axi4_0_w_valid; 
  wire [63:0] mmio_io_axi4_0_w_data; 
  wire [7:0] mmio_io_axi4_0_w_strb; 
  wire  mmio_io_axi4_0_w_last; 
  wire  mmio_io_axi4_0_b_ready; 
  wire  mmio_io_axi4_0_b_valid; 
  wire [3:0] mmio_io_axi4_0_b_id; 
  wire [1:0] mmio_io_axi4_0_b_resp; 
  wire  mmio_io_axi4_0_ar_ready; 
  wire  mmio_io_axi4_0_ar_valid; 
  wire [3:0] mmio_io_axi4_0_ar_id; 
  wire [30:0] mmio_io_axi4_0_ar_addr; 
  wire [7:0] mmio_io_axi4_0_ar_len; 
  wire [2:0] mmio_io_axi4_0_ar_size; 
  wire [1:0] mmio_io_axi4_0_ar_burst; 
  wire  mmio_io_axi4_0_r_ready; 
  wire  mmio_io_axi4_0_r_valid; 
  wire [3:0] mmio_io_axi4_0_r_id; 
  wire [63:0] mmio_io_axi4_0_r_data; 
  wire [1:0] mmio_io_axi4_0_r_resp; 
  wire  mmio_io_axi4_0_r_last; 

  // debug transport module (debug2jtag)
  wire  SimDTM_debug_req_ready; 
  wire  SimDTM_debug_req_valid; 
  wire [6:0] SimDTM_debug_req_addr; 
  wire [31:0] SimDTM_debug_req_data; 
  wire [1:0] SimDTM_debug_req_op; 
  wire  SimDTM_debug_resp_ready; 
  wire  SimDTM_debug_resp_valid; 
  wire [31:0] SimDTM_debug_resp_data; 
  wire [1:0] SimDTM_debug_resp_resp; 
  wire  SimDTM_reset; 
  wire  SimDTM_clock; 
  
  wire interrupt_spi;
  wire interrupt_uart;
//  /////////////////////////////////////////////////for debug
//  wire ddr_init_fine;
//  wire awr;
//  wire arr;
//  wire wr;
//  wire bvalid;
//  wire rvalid;
//  //////////////////////////////////////////////////
  
  wire  pll_locked;
  wire  reset;
  wire  clock, clock_unbuf;
  
  IBUFGDS clock_ds(
    .O(clock_unbuf),
    .I(clock_p),
    .IB(clock_n)
  );
  BUFG clock_buf(
    .O(clock),
    .I(clock_unbuf)
  );
  assign reset = ~ pll_locked;
  clk_wiz_0 clk_gen(
    .clk_in1(clock),
    .clk_out1(clock100),   //100m
    .clk_out2(clock200), //200m
    .clk_out3(clock30),
    .resetn(buttonresetn),
    .locked(pll_locked) // we use pll locked signal as resetn for ddr ctrl.
  );
   

  Top dut ( 
      .clock(dut_clock),
      .reset(dut_reset),
      .debug_clockeddmi_dmi_req_ready(dut_debug_clockeddmi_dmi_req_ready),
      .debug_clockeddmi_dmi_req_valid(dut_debug_clockeddmi_dmi_req_valid),
      .debug_clockeddmi_dmi_req_bits_addr(dut_debug_clockeddmi_dmi_req_addr),
      .debug_clockeddmi_dmi_req_bits_data(dut_debug_clockeddmi_dmi_req_data),
      .debug_clockeddmi_dmi_req_bits_op(dut_debug_clockeddmi_dmi_req_op),
      .debug_clockeddmi_dmi_resp_ready(dut_debug_clockeddmi_dmi_resp_ready),
      .debug_clockeddmi_dmi_resp_valid(dut_debug_clockeddmi_dmi_resp_valid),
      .debug_clockeddmi_dmi_resp_bits_data(dut_debug_clockeddmi_dmi_resp_data),
      .debug_clockeddmi_dmi_resp_bits_resp(dut_debug_clockeddmi_dmi_resp_resp),
      .debug_clockeddmi_dmiClock(dut_debug_clockeddmi_dmiClock),
      .debug_clockeddmi_dmiReset(dut_debug_clockeddmi_dmiReset),
      .debug_ndreset(dut_debug_ndreset),
      .debug_dmactive(dut_debug_dmactive),
      .interrupts(dut_interrupts),
      .mem_axi4_0_aw_ready(dut_mem_axi4_0_aw_ready),
      .mem_axi4_0_aw_valid(dut_mem_axi4_0_aw_valid),
      .mem_axi4_0_aw_bits_id(dut_mem_axi4_0_aw_id),
      .mem_axi4_0_aw_bits_addr(dut_mem_axi4_0_aw_addr),
      .mem_axi4_0_aw_bits_len(dut_mem_axi4_0_aw_len),
      .mem_axi4_0_aw_bits_size(dut_mem_axi4_0_aw_size),
      .mem_axi4_0_aw_bits_burst(dut_mem_axi4_0_aw_burst),
      .mem_axi4_0_aw_bits_lock(dut_mem_axi4_0_aw_lock),
      .mem_axi4_0_aw_bits_cache(dut_mem_axi4_0_aw_cache),
      .mem_axi4_0_aw_bits_prot(dut_mem_axi4_0_aw_prot),
      .mem_axi4_0_aw_bits_qos(dut_mem_axi4_0_aw_qos),
      .mem_axi4_0_w_ready(dut_mem_axi4_0_w_ready),
      .mem_axi4_0_w_valid(dut_mem_axi4_0_w_valid),
      .mem_axi4_0_w_bits_data(dut_mem_axi4_0_w_data),
      .mem_axi4_0_w_bits_strb(dut_mem_axi4_0_w_strb),
      .mem_axi4_0_w_bits_last(dut_mem_axi4_0_w_last),
      .mem_axi4_0_b_ready(dut_mem_axi4_0_b_ready),
      .mem_axi4_0_b_valid(dut_mem_axi4_0_b_valid),
      .mem_axi4_0_b_bits_id(dut_mem_axi4_0_b_id),
      .mem_axi4_0_b_bits_resp(dut_mem_axi4_0_b_resp),
      .mem_axi4_0_ar_ready(dut_mem_axi4_0_ar_ready),
      .mem_axi4_0_ar_valid(dut_mem_axi4_0_ar_valid),
      .mem_axi4_0_ar_bits_id(dut_mem_axi4_0_ar_id),
      .mem_axi4_0_ar_bits_addr(dut_mem_axi4_0_ar_addr),
      .mem_axi4_0_ar_bits_len(dut_mem_axi4_0_ar_len),
      .mem_axi4_0_ar_bits_size(dut_mem_axi4_0_ar_size),
      .mem_axi4_0_ar_bits_burst(dut_mem_axi4_0_ar_burst),
      .mem_axi4_0_ar_bits_lock(dut_mem_axi4_0_ar_lock),
      .mem_axi4_0_ar_bits_cache(dut_mem_axi4_0_ar_cache),
      .mem_axi4_0_ar_bits_prot(dut_mem_axi4_0_ar_prot),
      .mem_axi4_0_ar_bits_qos(dut_mem_axi4_0_ar_qos),
      .mem_axi4_0_r_ready(dut_mem_axi4_0_r_ready),
      .mem_axi4_0_r_valid(dut_mem_axi4_0_r_valid),
      .mem_axi4_0_r_bits_id(dut_mem_axi4_0_r_id),
      .mem_axi4_0_r_bits_data(dut_mem_axi4_0_r_data),
      .mem_axi4_0_r_bits_resp(dut_mem_axi4_0_r_resp),
      .mem_axi4_0_r_bits_last(dut_mem_axi4_0_r_last),
      .mmio_axi4_0_aw_ready(dut_mmio_axi4_0_aw_ready),
      .mmio_axi4_0_aw_valid(dut_mmio_axi4_0_aw_valid),
      .mmio_axi4_0_aw_bits_id(dut_mmio_axi4_0_aw_id),
      .mmio_axi4_0_aw_bits_addr(dut_mmio_axi4_0_aw_addr),
      .mmio_axi4_0_aw_bits_len(dut_mmio_axi4_0_aw_len),
      .mmio_axi4_0_aw_bits_size(dut_mmio_axi4_0_aw_size),
      .mmio_axi4_0_aw_bits_burst(dut_mmio_axi4_0_aw_burst),
      .mmio_axi4_0_aw_bits_lock(dut_mmio_axi4_0_aw_lock),
      .mmio_axi4_0_aw_bits_cache(dut_mmio_axi4_0_aw_cache),
      .mmio_axi4_0_aw_bits_prot(dut_mmio_axi4_0_aw_prot),
      .mmio_axi4_0_aw_bits_qos(dut_mmio_axi4_0_aw_qos),
      .mmio_axi4_0_w_ready(dut_mmio_axi4_0_w_ready),
      .mmio_axi4_0_w_valid(dut_mmio_axi4_0_w_valid),
      .mmio_axi4_0_w_bits_data(dut_mmio_axi4_0_w_data),
      .mmio_axi4_0_w_bits_strb(dut_mmio_axi4_0_w_strb),
      .mmio_axi4_0_w_bits_last(dut_mmio_axi4_0_w_last),
      .mmio_axi4_0_b_ready(dut_mmio_axi4_0_b_ready),
      .mmio_axi4_0_b_valid(dut_mmio_axi4_0_b_valid),
      .mmio_axi4_0_b_bits_id(dut_mmio_axi4_0_b_id),
      .mmio_axi4_0_b_bits_resp(dut_mmio_axi4_0_b_resp),
      .mmio_axi4_0_ar_ready(dut_mmio_axi4_0_ar_ready),
      .mmio_axi4_0_ar_valid(dut_mmio_axi4_0_ar_valid),
      .mmio_axi4_0_ar_bits_id(dut_mmio_axi4_0_ar_id),
      .mmio_axi4_0_ar_bits_addr(dut_mmio_axi4_0_ar_addr),
      .mmio_axi4_0_ar_bits_len(dut_mmio_axi4_0_ar_len),
      .mmio_axi4_0_ar_bits_size(dut_mmio_axi4_0_ar_size),
      .mmio_axi4_0_ar_bits_burst(dut_mmio_axi4_0_ar_burst),
      .mmio_axi4_0_ar_bits_lock(dut_mmio_axi4_0_ar_lock),
      .mmio_axi4_0_ar_bits_cache(dut_mmio_axi4_0_ar_cache),
      .mmio_axi4_0_ar_bits_prot(dut_mmio_axi4_0_ar_prot),
      .mmio_axi4_0_ar_bits_qos(dut_mmio_axi4_0_ar_qos),
      .mmio_axi4_0_r_ready(dut_mmio_axi4_0_r_ready),
      .mmio_axi4_0_r_valid(dut_mmio_axi4_0_r_valid),
      .mmio_axi4_0_r_bits_id(dut_mmio_axi4_0_r_id),
      .mmio_axi4_0_r_bits_data(dut_mmio_axi4_0_r_data),
      .mmio_axi4_0_r_bits_resp(dut_mmio_axi4_0_r_resp),
      .mmio_axi4_0_r_bits_last(dut_mmio_axi4_0_r_last),
      .l2_frontend_bus_axi4_0_aw_ready(dut_l2_frontend_bus_axi4_0_aw_ready),
      .l2_frontend_bus_axi4_0_aw_valid(dut_l2_frontend_bus_axi4_0_aw_valid),
      .l2_frontend_bus_axi4_0_aw_bits_id(dut_l2_frontend_bus_axi4_0_aw_id),
      .l2_frontend_bus_axi4_0_aw_bits_addr(dut_l2_frontend_bus_axi4_0_aw_addr),
      .l2_frontend_bus_axi4_0_aw_bits_len(dut_l2_frontend_bus_axi4_0_aw_len),
      .l2_frontend_bus_axi4_0_aw_bits_size(dut_l2_frontend_bus_axi4_0_aw_size),
      .l2_frontend_bus_axi4_0_aw_bits_burst(dut_l2_frontend_bus_axi4_0_aw_burst),
      .l2_frontend_bus_axi4_0_aw_bits_lock(dut_l2_frontend_bus_axi4_0_aw_lock),
      .l2_frontend_bus_axi4_0_aw_bits_cache(dut_l2_frontend_bus_axi4_0_aw_cache),
      .l2_frontend_bus_axi4_0_aw_bits_prot(dut_l2_frontend_bus_axi4_0_aw_prot),
      .l2_frontend_bus_axi4_0_aw_bits_qos(dut_l2_frontend_bus_axi4_0_aw_qos),
      .l2_frontend_bus_axi4_0_w_ready(dut_l2_frontend_bus_axi4_0_w_ready),
      .l2_frontend_bus_axi4_0_w_valid(dut_l2_frontend_bus_axi4_0_w_valid),
      .l2_frontend_bus_axi4_0_w_bits_data(dut_l2_frontend_bus_axi4_0_w_data),
      .l2_frontend_bus_axi4_0_w_bits_strb(dut_l2_frontend_bus_axi4_0_w_strb),
      .l2_frontend_bus_axi4_0_w_bits_last(dut_l2_frontend_bus_axi4_0_w_last),
      .l2_frontend_bus_axi4_0_b_ready(dut_l2_frontend_bus_axi4_0_b_ready),
      .l2_frontend_bus_axi4_0_b_valid(dut_l2_frontend_bus_axi4_0_b_valid),
      .l2_frontend_bus_axi4_0_b_bits_id(dut_l2_frontend_bus_axi4_0_b_id),
      .l2_frontend_bus_axi4_0_b_bits_resp(dut_l2_frontend_bus_axi4_0_b_resp),
      .l2_frontend_bus_axi4_0_ar_ready(dut_l2_frontend_bus_axi4_0_ar_ready),
      .l2_frontend_bus_axi4_0_ar_valid(dut_l2_frontend_bus_axi4_0_ar_valid),
      .l2_frontend_bus_axi4_0_ar_bits_id(dut_l2_frontend_bus_axi4_0_ar_id),
      .l2_frontend_bus_axi4_0_ar_bits_addr(dut_l2_frontend_bus_axi4_0_ar_addr),
      .l2_frontend_bus_axi4_0_ar_bits_len(dut_l2_frontend_bus_axi4_0_ar_len),
      .l2_frontend_bus_axi4_0_ar_bits_size(dut_l2_frontend_bus_axi4_0_ar_size),
      .l2_frontend_bus_axi4_0_ar_bits_burst(dut_l2_frontend_bus_axi4_0_ar_burst),
      .l2_frontend_bus_axi4_0_ar_bits_lock(dut_l2_frontend_bus_axi4_0_ar_lock),
      .l2_frontend_bus_axi4_0_ar_bits_cache(dut_l2_frontend_bus_axi4_0_ar_cache),
      .l2_frontend_bus_axi4_0_ar_bits_prot(dut_l2_frontend_bus_axi4_0_ar_prot),
      .l2_frontend_bus_axi4_0_ar_bits_qos(dut_l2_frontend_bus_axi4_0_ar_qos),
      .l2_frontend_bus_axi4_0_r_ready(dut_l2_frontend_bus_axi4_0_r_ready),
      .l2_frontend_bus_axi4_0_r_valid(dut_l2_frontend_bus_axi4_0_r_valid),
      .l2_frontend_bus_axi4_0_r_bits_id(dut_l2_frontend_bus_axi4_0_r_id),
      .l2_frontend_bus_axi4_0_r_bits_data(dut_l2_frontend_bus_axi4_0_r_data),
      .l2_frontend_bus_axi4_0_r_bits_resp(dut_l2_frontend_bus_axi4_0_r_resp),
      .l2_frontend_bus_axi4_0_r_bits_last(dut_l2_frontend_bus_axi4_0_r_last),
//
  	  .serial_in_ready(dut_serial_in_ready),
  	  .serial_in_valid(dut_serial_in_valid),
  	  .serial_in_bits(dut_serial_in_bits),
  	  .serial_out_ready(dut_serial_out_ready),
  	  .serial_out_valid(dut_serial_out_valid),
  	  .serial_out_bits(dut_serial_out_bits)
//

    );

  
  // --------------------------------------the mem ports bundle of Acc----------------------------------------
    wire    [32  * 15 - 1  :0]    acc_axi3_256_100M_awaddr;
    wire    [4   * 15 - 1  :0]    acc_axi3_256_100M_awlen;
    wire    [3   * 15 - 1  :0]    acc_axi3_256_100M_awsize;
    wire    [2   * 15 - 1  :0]    acc_axi3_256_100M_awburst;
    wire    [6   * 15 - 1  :0]    acc_axi3_256_100M_awid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_awvalid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_awready;
    wire    [256 * 15 - 1  :0]    acc_axi3_256_100M_wdata;
    wire    [32  * 15 - 1  :0]    acc_axi3_256_100M_wstrb;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_wlast;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_wvalid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_wready;
    wire    [2   * 15 - 1  :0]    acc_axi3_256_100M_bresp;
    wire    [6   * 15 - 1  :0]    acc_axi3_256_100M_bid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_bvalid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_bready;
    wire    [32  * 15 - 1  :0]    acc_axi3_256_100M_araddr;
    wire    [4   * 15 - 1  :0]    acc_axi3_256_100M_arlen;
    wire    [3   * 15 - 1  :0]    acc_axi3_256_100M_arsize;
    wire    [2   * 15 - 1  :0]    acc_axi3_256_100M_arburst;
    wire    [6   * 15 - 1  :0]    acc_axi3_256_100M_arid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_arvalid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_arready;
    wire    [256 * 15 - 1  :0]    acc_axi3_256_100M_rdata;
    wire    [2   * 15 - 1  :0]    acc_axi3_256_100M_rresp;
    wire    [6   * 15 - 1  :0]    acc_axi3_256_100M_rid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_rlast;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_rvalid;
    wire    [1   * 15 - 1  :0]    acc_axi3_256_100M_rready;
    //-----------------------------------------------------


`ifdef SIM_ENABLE_DDR
  AXIMem mem (
    
    .clock(mem_clock),
    .clock200(clock200), // DDR driver 200MHz
    .reset(mem_reset),

    // channel for mem bus
    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mem_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mem_io_axi4_0_aw_addr & `LINUX_MEM_MASK),
    .io_axi4_0_aw_len(mem_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mem_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mem_io_axi4_0_aw_burst),
    // add 4 signals
    .io_axi4_0_aw_lock(mem_io_axi4_0_aw_lock),
    .io_axi4_0_aw_qos(mem_io_axi4_0_aw_qos),
    .io_axi4_0_aw_prot(mem_io_axi4_0_aw_prot),
    .io_axi4_0_aw_cache(mem_io_axi4_0_aw_cache),
    //
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mem_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mem_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mem_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mem_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mem_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mem_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mem_io_axi4_0_ar_addr & `LINUX_MEM_MASK),
    .io_axi4_0_ar_len(mem_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mem_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mem_io_axi4_0_ar_burst),
    // add 4 signals
    .io_axi4_0_ar_lock(mem_io_axi4_0_ar_lock),
    .io_axi4_0_ar_qos(mem_io_axi4_0_ar_qos),
    .io_axi4_0_ar_prot(mem_io_axi4_0_ar_prot),
    .io_axi4_0_ar_cache(mem_io_axi4_0_ar_cache),
    //
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mem_io_axi4_0_r_id),
    .io_axi4_0_r_data(mem_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mem_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mem_io_axi4_0_r_last),
    
    //-------------------channel bundle for Acc mem access
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

    // ddr physical wire
    .c0_ddr4_act_n    ( c0_ddr4_act_n    ),
    .c0_ddr4_adr      ( c0_ddr4_adr      ),
    .c0_ddr4_ba       ( c0_ddr4_ba       ),
    .c0_ddr4_bg       ( c0_ddr4_bg       ),
    .c0_ddr4_cke      ( c0_ddr4_cke      ),
    .c0_ddr4_odt      ( c0_ddr4_odt      ),
    .c0_ddr4_cs_n     ( c0_ddr4_cs_n     ),
    .c0_ddr4_ck_t     ( c0_ddr4_ck_t     ),
    .c0_ddr4_ck_c     ( c0_ddr4_ck_c     ),
    .c0_ddr4_reset_n  ( c0_ddr4_reset_n  ),
    .c0_ddr4_dm_dbi_n ( c0_ddr4_dm_dbi_n ),
    .c0_ddr4_dq       ( c0_ddr4_dq       ),
    .c0_ddr4_dqs_t    ( c0_ddr4_dqs_t    ),
    .c0_ddr4_dqs_c    ( c0_ddr4_dqs_c    ),
    
    // strange ddr control
    .c0_sys_clk_p(c0_sys_clk_p),
    .c0_sys_clk_n(c0_sys_clk_n),
    .buttonresetn(buttonresetn)

    // hbm physical wire
    // fortunately they are integrated inside the hbm_0 ip
    
  );
`else // else we do not have a memory
    assign mem_io_axi4_0_aw_ready   = 0;
    assign mem_io_axi4_0_w_ready    = 0;
    assign mem_io_axi4_0_b_valid    = 0;
    assign mem_io_axi4_0_b_id       = 0;
    assign mem_io_axi4_0_b_resp     = 0;
    assign mem_io_axi4_0_ar_ready   = 0;
    assign mem_io_axi4_0_r_valid    = 0;
    assign mem_io_axi4_0_r_id       = 0;
    assign mem_io_axi4_0_r_data     = 0;
    assign mem_io_axi4_0_r_resp     = 0;
    assign mem_io_axi4_0_r_last     = 0;
    

    assign acc_axi3_256_100M_awready = 0;
    assign acc_axi3_256_100M_wready = 0;
    assign acc_axi3_256_100M_bresp = 0;
    assign acc_axi3_256_100M_bvalid = 0;
    assign acc_axi3_256_100M_bid = 0;
    assign acc_axi3_256_100M_arready = 0;
    assign acc_axi3_256_100M_rdata = 0;
    assign acc_axi3_256_100M_rresp = 0;
    assign acc_axi3_256_100M_rlast = 0;
    assign acc_axi3_256_100M_rvalid = 0;
    assign acc_axi3_256_100M_rid = 0;


`endif

  AXIMmio mmio ( 
    .clock(mmio_clock),
    //.spiclock(clock30),
    .reset(mmio_reset),
    
    // control bus for all the peripherals
    .io_axi4_0_aw_ready(mmio_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mmio_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mmio_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mmio_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mmio_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mmio_io_axi4_0_aw_burst),
    .io_axi4_0_w_ready(mmio_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mmio_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mmio_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mmio_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mmio_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mmio_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mmio_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mmio_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mmio_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mmio_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mmio_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mmio_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mmio_io_axi4_0_ar_burst),
    .io_axi4_0_r_ready(mmio_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mmio_io_axi4_0_r_id),
    .io_axi4_0_r_data(mmio_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mmio_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mmio_io_axi4_0_r_last),
    
    //external interrupt connecting
    .interrupt_uart(interrupt_uart),
    .interrupt_spi(interrupt_spi),
    
    //HW devices' pins
    .uart_TX(uart_TX),
    .uart_RX(uart_RX),

    .spi_cs(spi_cs),
    .spi_sclock(spi_sclock),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),
    .sd_poweroff(sd_poweroff),
    


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

    .led(led)
  );
  
  //////////////////////////////////debug
  
//  assign LED[13] = uart_TX;
//  assign LED[12] = uart_RX;
  
//  assign LED[15] = dut_reset;
//  assign LED[14] = dut_clock;
  
//  assign LED[4] = spi_miso;
//  assign LED[3] = spi_mosi;
//  assign LED[2] = spi_sclock;
//  assign LED[1] = spi_cs;
//  assign LED[0] = sd_poweroff;    


  //-------------------------connect all the module together----

  assign dut_clock = clock100; 
  assign dut_reset = reset | dut_debug_ndreset; 
  
  assign dut_interrupts[0] = interrupt_uart;
  assign dut_interrupts[1] = interrupt_spi;  // need to be connected with interrupts
  
  assign dut_debug_clockeddmi_dmiClock = clock100; 
  assign dut_debug_clockeddmi_dmiReset = reset; 

  //  ***** debug module *****
  // CR inheritance
  assign SimDTM_reset = reset; 
  assign SimDTM_clock = clock100; 
  //  drived by outside module
  assign dut_debug_clockeddmi_dmi_req_valid = SimDTM_debug_req_valid;
  assign dut_debug_clockeddmi_dmi_req_addr = SimDTM_debug_req_addr;
  assign dut_debug_clockeddmi_dmi_req_data = SimDTM_debug_req_data;
  assign dut_debug_clockeddmi_dmi_req_op = SimDTM_debug_req_op;
  assign dut_debug_clockeddmi_dmi_resp_ready = SimDTM_debug_resp_ready;
  //  output to outside module 
  assign SimDTM_debug_req_ready = dut_debug_clockeddmi_dmi_req_ready;
  assign SimDTM_debug_resp_valid = dut_debug_clockeddmi_dmi_resp_valid;
  assign SimDTM_debug_resp_data = dut_debug_clockeddmi_dmi_resp_data;
  assign SimDTM_debug_resp_resp = dut_debug_clockeddmi_dmi_resp_resp;


  //  ***** mem module *****
  // CR inheritance
  assign mem_clock = clock100; 
  assign mem_reset = reset; 
  //  drived by outside module
  assign dut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready; 
  assign dut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready; 
  assign dut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid; 
  assign dut_mem_axi4_0_b_id = mem_io_axi4_0_b_id; 
  assign dut_mem_axi4_0_b_resp = mem_io_axi4_0_b_resp; 
  assign dut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready; 
  assign dut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid; 
  assign dut_mem_axi4_0_r_id = mem_io_axi4_0_r_id; 
  assign dut_mem_axi4_0_r_data = mem_io_axi4_0_r_data; 
  assign dut_mem_axi4_0_r_resp = mem_io_axi4_0_r_resp; 
  assign dut_mem_axi4_0_r_last = mem_io_axi4_0_r_last; 
  //  output to outside module 
  assign mem_io_axi4_0_aw_valid = dut_mem_axi4_0_aw_valid; 
  assign mem_io_axi4_0_aw_id = dut_mem_axi4_0_aw_id; 
  assign mem_io_axi4_0_aw_addr = dut_mem_axi4_0_aw_addr; 
  assign mem_io_axi4_0_aw_len = dut_mem_axi4_0_aw_len; 
  assign mem_io_axi4_0_aw_size = dut_mem_axi4_0_aw_size; 
  assign mem_io_axi4_0_aw_burst = dut_mem_axi4_0_aw_burst; 
  // add 4 signals
  assign mem_io_axi4_0_aw_lock = dut_mem_axi4_0_aw_lock; 
  assign mem_io_axi4_0_aw_prot = dut_mem_axi4_0_aw_prot; 
  assign mem_io_axi4_0_aw_qos = dut_mem_axi4_0_aw_qos; 
  assign mem_io_axi4_0_aw_cache = dut_mem_axi4_0_aw_cache; 
  //
  assign mem_io_axi4_0_w_valid = dut_mem_axi4_0_w_valid; 
  assign mem_io_axi4_0_w_data = dut_mem_axi4_0_w_data; 
  assign mem_io_axi4_0_w_strb = dut_mem_axi4_0_w_strb; 
  assign mem_io_axi4_0_w_last = dut_mem_axi4_0_w_last; 
  assign mem_io_axi4_0_b_ready = dut_mem_axi4_0_b_ready; 
  assign mem_io_axi4_0_ar_valid = dut_mem_axi4_0_ar_valid; 
  assign mem_io_axi4_0_ar_id = dut_mem_axi4_0_ar_id; 
  assign mem_io_axi4_0_ar_addr = dut_mem_axi4_0_ar_addr; 
  assign mem_io_axi4_0_ar_len = dut_mem_axi4_0_ar_len; 
  assign mem_io_axi4_0_ar_size = dut_mem_axi4_0_ar_size; 
  assign mem_io_axi4_0_ar_burst = dut_mem_axi4_0_ar_burst; 
  // add 4 signals
  assign mem_io_axi4_0_ar_lock = dut_mem_axi4_0_ar_lock; 
  assign mem_io_axi4_0_ar_prot = dut_mem_axi4_0_ar_prot; 
  assign mem_io_axi4_0_ar_qos = dut_mem_axi4_0_ar_qos; 
  assign mem_io_axi4_0_ar_cache = dut_mem_axi4_0_ar_cache; 
  //
  assign mem_io_axi4_0_r_ready = dut_mem_axi4_0_r_ready; 
  

  //  ***** mmio module *****
  // CR inheritance 
  assign mmio_clock = clock100; 
  assign mmio_reset = reset; 
  //  drived by outside module
  assign dut_mmio_axi4_0_aw_ready = mmio_io_axi4_0_aw_ready; 
  assign dut_mmio_axi4_0_w_ready = mmio_io_axi4_0_w_ready; 
  assign dut_mmio_axi4_0_b_valid = mmio_io_axi4_0_b_valid; 
  assign dut_mmio_axi4_0_b_id = mmio_io_axi4_0_b_id; 
  assign dut_mmio_axi4_0_b_resp = mmio_io_axi4_0_b_resp; 
  assign dut_mmio_axi4_0_ar_ready = mmio_io_axi4_0_ar_ready; 
  assign dut_mmio_axi4_0_r_valid = mmio_io_axi4_0_r_valid; 
  assign dut_mmio_axi4_0_r_id = mmio_io_axi4_0_r_id; 
  assign dut_mmio_axi4_0_r_data = mmio_io_axi4_0_r_data; 
  assign dut_mmio_axi4_0_r_resp = mmio_io_axi4_0_r_resp; 
  assign dut_mmio_axi4_0_r_last = mmio_io_axi4_0_r_last; 
  //  output to outside module 
  assign mmio_io_axi4_0_aw_valid = dut_mmio_axi4_0_aw_valid; 
  assign mmio_io_axi4_0_aw_id = dut_mmio_axi4_0_aw_id; 
  assign mmio_io_axi4_0_aw_addr = dut_mmio_axi4_0_aw_addr; 
  assign mmio_io_axi4_0_aw_len = dut_mmio_axi4_0_aw_len; 
  assign mmio_io_axi4_0_aw_size = dut_mmio_axi4_0_aw_size; 
  assign mmio_io_axi4_0_aw_burst = dut_mmio_axi4_0_aw_burst; 
  assign mmio_io_axi4_0_w_valid = dut_mmio_axi4_0_w_valid; 
  assign mmio_io_axi4_0_w_data = dut_mmio_axi4_0_w_data; 
  assign mmio_io_axi4_0_w_strb = dut_mmio_axi4_0_w_strb; 
  assign mmio_io_axi4_0_w_last = dut_mmio_axi4_0_w_last; 
  assign mmio_io_axi4_0_b_ready = dut_mmio_axi4_0_b_ready; 
  assign mmio_io_axi4_0_ar_valid = dut_mmio_axi4_0_ar_valid; 
  assign mmio_io_axi4_0_ar_id = dut_mmio_axi4_0_ar_id; 
  assign mmio_io_axi4_0_ar_addr = dut_mmio_axi4_0_ar_addr; 
  assign mmio_io_axi4_0_ar_len = dut_mmio_axi4_0_ar_len; 
  assign mmio_io_axi4_0_ar_size = dut_mmio_axi4_0_ar_size; 
  assign mmio_io_axi4_0_ar_burst = dut_mmio_axi4_0_ar_burst; 
  assign mmio_io_axi4_0_r_ready = dut_mmio_axi4_0_r_ready; 


  //  ***** l2 frontend define - grounded *****
  assign dut_l2_frontend_bus_axi4_0_aw_valid = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_aw_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_w_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_w_data = 64'h0;
  assign dut_l2_frontend_bus_axi4_0_w_strb = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_w_last = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_b_ready = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_ar_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_r_ready = 1'h0; 

  //////////////////////////////////debug module disable
  
    assign SimDTM_debug_req_valid   = 0;
    assign SimDTM_debug_req_addr    = 0;
    assign SimDTM_debug_req_data    = 0;
    assign SimDTM_debug_req_op      = 0;
    assign SimDTM_debug_resp_ready  = 0;


endmodule //end of top
