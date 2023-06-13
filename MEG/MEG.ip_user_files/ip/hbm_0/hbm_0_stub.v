// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Nov 22 18:02:13 2019
// Host        : T5820 running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bangya/Reserved/RV-HTG937-v3.1/RV-HTG937-v3.1.srcs/sources_1/ip/hbm_0/hbm_0_stub.v
// Design      : hbm_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hbm_v1_0_3,Vivado 2019.1" *)
module hbm_0(HBM_REF_CLK_0, AXI_00_ACLK, AXI_00_ARESET_N, 
  AXI_00_ARADDR, AXI_00_ARBURST, AXI_00_ARID, AXI_00_ARLEN, AXI_00_ARSIZE, AXI_00_ARVALID, 
  AXI_00_AWADDR, AXI_00_AWBURST, AXI_00_AWID, AXI_00_AWLEN, AXI_00_AWSIZE, AXI_00_AWVALID, 
  AXI_00_RREADY, AXI_00_BREADY, AXI_00_WDATA, AXI_00_WLAST, AXI_00_WSTRB, 
  AXI_00_WDATA_PARITY, AXI_00_WVALID, AXI_01_ACLK, AXI_01_ARESET_N, AXI_01_ARADDR, 
  AXI_01_ARBURST, AXI_01_ARID, AXI_01_ARLEN, AXI_01_ARSIZE, AXI_01_ARVALID, AXI_01_AWADDR, 
  AXI_01_AWBURST, AXI_01_AWID, AXI_01_AWLEN, AXI_01_AWSIZE, AXI_01_AWVALID, AXI_01_RREADY, 
  AXI_01_BREADY, AXI_01_WDATA, AXI_01_WLAST, AXI_01_WSTRB, AXI_01_WDATA_PARITY, 
  AXI_01_WVALID, AXI_02_ACLK, AXI_02_ARESET_N, AXI_02_ARADDR, AXI_02_ARBURST, AXI_02_ARID, 
  AXI_02_ARLEN, AXI_02_ARSIZE, AXI_02_ARVALID, AXI_02_AWADDR, AXI_02_AWBURST, AXI_02_AWID, 
  AXI_02_AWLEN, AXI_02_AWSIZE, AXI_02_AWVALID, AXI_02_RREADY, AXI_02_BREADY, AXI_02_WDATA, 
  AXI_02_WLAST, AXI_02_WSTRB, AXI_02_WDATA_PARITY, AXI_02_WVALID, AXI_03_ACLK, 
  AXI_03_ARESET_N, AXI_03_ARADDR, AXI_03_ARBURST, AXI_03_ARID, AXI_03_ARLEN, AXI_03_ARSIZE, 
  AXI_03_ARVALID, AXI_03_AWADDR, AXI_03_AWBURST, AXI_03_AWID, AXI_03_AWLEN, AXI_03_AWSIZE, 
  AXI_03_AWVALID, AXI_03_RREADY, AXI_03_BREADY, AXI_03_WDATA, AXI_03_WLAST, AXI_03_WSTRB, 
  AXI_03_WDATA_PARITY, AXI_03_WVALID, AXI_04_ACLK, AXI_04_ARESET_N, AXI_04_ARADDR, 
  AXI_04_ARBURST, AXI_04_ARID, AXI_04_ARLEN, AXI_04_ARSIZE, AXI_04_ARVALID, AXI_04_AWADDR, 
  AXI_04_AWBURST, AXI_04_AWID, AXI_04_AWLEN, AXI_04_AWSIZE, AXI_04_AWVALID, AXI_04_RREADY, 
  AXI_04_BREADY, AXI_04_WDATA, AXI_04_WLAST, AXI_04_WSTRB, AXI_04_WDATA_PARITY, 
  AXI_04_WVALID, AXI_05_ACLK, AXI_05_ARESET_N, AXI_05_ARADDR, AXI_05_ARBURST, AXI_05_ARID, 
  AXI_05_ARLEN, AXI_05_ARSIZE, AXI_05_ARVALID, AXI_05_AWADDR, AXI_05_AWBURST, AXI_05_AWID, 
  AXI_05_AWLEN, AXI_05_AWSIZE, AXI_05_AWVALID, AXI_05_RREADY, AXI_05_BREADY, AXI_05_WDATA, 
  AXI_05_WLAST, AXI_05_WSTRB, AXI_05_WDATA_PARITY, AXI_05_WVALID, AXI_06_ACLK, 
  AXI_06_ARESET_N, AXI_06_ARADDR, AXI_06_ARBURST, AXI_06_ARID, AXI_06_ARLEN, AXI_06_ARSIZE, 
  AXI_06_ARVALID, AXI_06_AWADDR, AXI_06_AWBURST, AXI_06_AWID, AXI_06_AWLEN, AXI_06_AWSIZE, 
  AXI_06_AWVALID, AXI_06_RREADY, AXI_06_BREADY, AXI_06_WDATA, AXI_06_WLAST, AXI_06_WSTRB, 
  AXI_06_WDATA_PARITY, AXI_06_WVALID, AXI_07_ACLK, AXI_07_ARESET_N, AXI_07_ARADDR, 
  AXI_07_ARBURST, AXI_07_ARID, AXI_07_ARLEN, AXI_07_ARSIZE, AXI_07_ARVALID, AXI_07_AWADDR, 
  AXI_07_AWBURST, AXI_07_AWID, AXI_07_AWLEN, AXI_07_AWSIZE, AXI_07_AWVALID, AXI_07_RREADY, 
  AXI_07_BREADY, AXI_07_WDATA, AXI_07_WLAST, AXI_07_WSTRB, AXI_07_WDATA_PARITY, 
  AXI_07_WVALID, AXI_08_ACLK, AXI_08_ARESET_N, AXI_08_ARADDR, AXI_08_ARBURST, AXI_08_ARID, 
  AXI_08_ARLEN, AXI_08_ARSIZE, AXI_08_ARVALID, AXI_08_AWADDR, AXI_08_AWBURST, AXI_08_AWID, 
  AXI_08_AWLEN, AXI_08_AWSIZE, AXI_08_AWVALID, AXI_08_RREADY, AXI_08_BREADY, AXI_08_WDATA, 
  AXI_08_WLAST, AXI_08_WSTRB, AXI_08_WDATA_PARITY, AXI_08_WVALID, AXI_09_ACLK, 
  AXI_09_ARESET_N, AXI_09_ARADDR, AXI_09_ARBURST, AXI_09_ARID, AXI_09_ARLEN, AXI_09_ARSIZE, 
  AXI_09_ARVALID, AXI_09_AWADDR, AXI_09_AWBURST, AXI_09_AWID, AXI_09_AWLEN, AXI_09_AWSIZE, 
  AXI_09_AWVALID, AXI_09_RREADY, AXI_09_BREADY, AXI_09_WDATA, AXI_09_WLAST, AXI_09_WSTRB, 
  AXI_09_WDATA_PARITY, AXI_09_WVALID, AXI_10_ACLK, AXI_10_ARESET_N, AXI_10_ARADDR, 
  AXI_10_ARBURST, AXI_10_ARID, AXI_10_ARLEN, AXI_10_ARSIZE, AXI_10_ARVALID, AXI_10_AWADDR, 
  AXI_10_AWBURST, AXI_10_AWID, AXI_10_AWLEN, AXI_10_AWSIZE, AXI_10_AWVALID, AXI_10_RREADY, 
  AXI_10_BREADY, AXI_10_WDATA, AXI_10_WLAST, AXI_10_WSTRB, AXI_10_WDATA_PARITY, 
  AXI_10_WVALID, AXI_11_ACLK, AXI_11_ARESET_N, AXI_11_ARADDR, AXI_11_ARBURST, AXI_11_ARID, 
  AXI_11_ARLEN, AXI_11_ARSIZE, AXI_11_ARVALID, AXI_11_AWADDR, AXI_11_AWBURST, AXI_11_AWID, 
  AXI_11_AWLEN, AXI_11_AWSIZE, AXI_11_AWVALID, AXI_11_RREADY, AXI_11_BREADY, AXI_11_WDATA, 
  AXI_11_WLAST, AXI_11_WSTRB, AXI_11_WDATA_PARITY, AXI_11_WVALID, AXI_12_ACLK, 
  AXI_12_ARESET_N, AXI_12_ARADDR, AXI_12_ARBURST, AXI_12_ARID, AXI_12_ARLEN, AXI_12_ARSIZE, 
  AXI_12_ARVALID, AXI_12_AWADDR, AXI_12_AWBURST, AXI_12_AWID, AXI_12_AWLEN, AXI_12_AWSIZE, 
  AXI_12_AWVALID, AXI_12_RREADY, AXI_12_BREADY, AXI_12_WDATA, AXI_12_WLAST, AXI_12_WSTRB, 
  AXI_12_WDATA_PARITY, AXI_12_WVALID, AXI_13_ACLK, AXI_13_ARESET_N, AXI_13_ARADDR, 
  AXI_13_ARBURST, AXI_13_ARID, AXI_13_ARLEN, AXI_13_ARSIZE, AXI_13_ARVALID, AXI_13_AWADDR, 
  AXI_13_AWBURST, AXI_13_AWID, AXI_13_AWLEN, AXI_13_AWSIZE, AXI_13_AWVALID, AXI_13_RREADY, 
  AXI_13_BREADY, AXI_13_WDATA, AXI_13_WLAST, AXI_13_WSTRB, AXI_13_WDATA_PARITY, 
  AXI_13_WVALID, AXI_14_ACLK, AXI_14_ARESET_N, AXI_14_ARADDR, AXI_14_ARBURST, AXI_14_ARID, 
  AXI_14_ARLEN, AXI_14_ARSIZE, AXI_14_ARVALID, AXI_14_AWADDR, AXI_14_AWBURST, AXI_14_AWID, 
  AXI_14_AWLEN, AXI_14_AWSIZE, AXI_14_AWVALID, AXI_14_RREADY, AXI_14_BREADY, AXI_14_WDATA, 
  AXI_14_WLAST, AXI_14_WSTRB, AXI_14_WDATA_PARITY, AXI_14_WVALID, AXI_15_ACLK, 
  AXI_15_ARESET_N, AXI_15_ARADDR, AXI_15_ARBURST, AXI_15_ARID, AXI_15_ARLEN, AXI_15_ARSIZE, 
  AXI_15_ARVALID, AXI_15_AWADDR, AXI_15_AWBURST, AXI_15_AWID, AXI_15_AWLEN, AXI_15_AWSIZE, 
  AXI_15_AWVALID, AXI_15_RREADY, AXI_15_BREADY, AXI_15_WDATA, AXI_15_WLAST, AXI_15_WSTRB, 
  AXI_15_WDATA_PARITY, AXI_15_WVALID, APB_0_PWDATA, APB_0_PADDR, APB_0_PCLK, APB_0_PENABLE, 
  APB_0_PRESET_N, APB_0_PSEL, APB_0_PWRITE, AXI_00_ARREADY, AXI_00_AWREADY, 
  AXI_00_RDATA_PARITY, AXI_00_RDATA, AXI_00_RID, AXI_00_RLAST, AXI_00_RRESP, AXI_00_RVALID, 
  AXI_00_WREADY, AXI_00_BID, AXI_00_BRESP, AXI_00_BVALID, AXI_01_ARREADY, AXI_01_AWREADY, 
  AXI_01_RDATA_PARITY, AXI_01_RDATA, AXI_01_RID, AXI_01_RLAST, AXI_01_RRESP, AXI_01_RVALID, 
  AXI_01_WREADY, AXI_01_BID, AXI_01_BRESP, AXI_01_BVALID, AXI_02_ARREADY, AXI_02_AWREADY, 
  AXI_02_RDATA_PARITY, AXI_02_RDATA, AXI_02_RID, AXI_02_RLAST, AXI_02_RRESP, AXI_02_RVALID, 
  AXI_02_WREADY, AXI_02_BID, AXI_02_BRESP, AXI_02_BVALID, AXI_03_ARREADY, AXI_03_AWREADY, 
  AXI_03_RDATA_PARITY, AXI_03_RDATA, AXI_03_RID, AXI_03_RLAST, AXI_03_RRESP, AXI_03_RVALID, 
  AXI_03_WREADY, AXI_03_BID, AXI_03_BRESP, AXI_03_BVALID, AXI_04_ARREADY, AXI_04_AWREADY, 
  AXI_04_RDATA_PARITY, AXI_04_RDATA, AXI_04_RID, AXI_04_RLAST, AXI_04_RRESP, AXI_04_RVALID, 
  AXI_04_WREADY, AXI_04_BID, AXI_04_BRESP, AXI_04_BVALID, AXI_05_ARREADY, AXI_05_AWREADY, 
  AXI_05_RDATA_PARITY, AXI_05_RDATA, AXI_05_RID, AXI_05_RLAST, AXI_05_RRESP, AXI_05_RVALID, 
  AXI_05_WREADY, AXI_05_BID, AXI_05_BRESP, AXI_05_BVALID, AXI_06_ARREADY, AXI_06_AWREADY, 
  AXI_06_RDATA_PARITY, AXI_06_RDATA, AXI_06_RID, AXI_06_RLAST, AXI_06_RRESP, AXI_06_RVALID, 
  AXI_06_WREADY, AXI_06_BID, AXI_06_BRESP, AXI_06_BVALID, AXI_07_ARREADY, AXI_07_AWREADY, 
  AXI_07_RDATA_PARITY, AXI_07_RDATA, AXI_07_RID, AXI_07_RLAST, AXI_07_RRESP, AXI_07_RVALID, 
  AXI_07_WREADY, AXI_07_BID, AXI_07_BRESP, AXI_07_BVALID, AXI_08_ARREADY, AXI_08_AWREADY, 
  AXI_08_RDATA_PARITY, AXI_08_RDATA, AXI_08_RID, AXI_08_RLAST, AXI_08_RRESP, AXI_08_RVALID, 
  AXI_08_WREADY, AXI_08_BID, AXI_08_BRESP, AXI_08_BVALID, AXI_09_ARREADY, AXI_09_AWREADY, 
  AXI_09_RDATA_PARITY, AXI_09_RDATA, AXI_09_RID, AXI_09_RLAST, AXI_09_RRESP, AXI_09_RVALID, 
  AXI_09_WREADY, AXI_09_BID, AXI_09_BRESP, AXI_09_BVALID, AXI_10_ARREADY, AXI_10_AWREADY, 
  AXI_10_RDATA_PARITY, AXI_10_RDATA, AXI_10_RID, AXI_10_RLAST, AXI_10_RRESP, AXI_10_RVALID, 
  AXI_10_WREADY, AXI_10_BID, AXI_10_BRESP, AXI_10_BVALID, AXI_11_ARREADY, AXI_11_AWREADY, 
  AXI_11_RDATA_PARITY, AXI_11_RDATA, AXI_11_RID, AXI_11_RLAST, AXI_11_RRESP, AXI_11_RVALID, 
  AXI_11_WREADY, AXI_11_BID, AXI_11_BRESP, AXI_11_BVALID, AXI_12_ARREADY, AXI_12_AWREADY, 
  AXI_12_RDATA_PARITY, AXI_12_RDATA, AXI_12_RID, AXI_12_RLAST, AXI_12_RRESP, AXI_12_RVALID, 
  AXI_12_WREADY, AXI_12_BID, AXI_12_BRESP, AXI_12_BVALID, AXI_13_ARREADY, AXI_13_AWREADY, 
  AXI_13_RDATA_PARITY, AXI_13_RDATA, AXI_13_RID, AXI_13_RLAST, AXI_13_RRESP, AXI_13_RVALID, 
  AXI_13_WREADY, AXI_13_BID, AXI_13_BRESP, AXI_13_BVALID, AXI_14_ARREADY, AXI_14_AWREADY, 
  AXI_14_RDATA_PARITY, AXI_14_RDATA, AXI_14_RID, AXI_14_RLAST, AXI_14_RRESP, AXI_14_RVALID, 
  AXI_14_WREADY, AXI_14_BID, AXI_14_BRESP, AXI_14_BVALID, AXI_15_ARREADY, AXI_15_AWREADY, 
  AXI_15_RDATA_PARITY, AXI_15_RDATA, AXI_15_RID, AXI_15_RLAST, AXI_15_RRESP, AXI_15_RVALID, 
  AXI_15_WREADY, AXI_15_BID, AXI_15_BRESP, AXI_15_BVALID, APB_0_PRDATA, APB_0_PREADY, 
  APB_0_PSLVERR, apb_complete_0, DRAM_0_STAT_CATTRIP, DRAM_0_STAT_TEMP)
/* synthesis syn_black_box black_box_pad_pin="HBM_REF_CLK_0,AXI_00_ACLK,AXI_00_ARESET_N,AXI_00_ARADDR[32:0],AXI_00_ARBURST[1:0],AXI_00_ARID[5:0],AXI_00_ARLEN[3:0],AXI_00_ARSIZE[2:0],AXI_00_ARVALID,AXI_00_AWADDR[32:0],AXI_00_AWBURST[1:0],AXI_00_AWID[5:0],AXI_00_AWLEN[3:0],AXI_00_AWSIZE[2:0],AXI_00_AWVALID,AXI_00_RREADY,AXI_00_BREADY,AXI_00_WDATA[255:0],AXI_00_WLAST,AXI_00_WSTRB[31:0],AXI_00_WDATA_PARITY[31:0],AXI_00_WVALID,AXI_01_ACLK,AXI_01_ARESET_N,AXI_01_ARADDR[32:0],AXI_01_ARBURST[1:0],AXI_01_ARID[5:0],AXI_01_ARLEN[3:0],AXI_01_ARSIZE[2:0],AXI_01_ARVALID,AXI_01_AWADDR[32:0],AXI_01_AWBURST[1:0],AXI_01_AWID[5:0],AXI_01_AWLEN[3:0],AXI_01_AWSIZE[2:0],AXI_01_AWVALID,AXI_01_RREADY,AXI_01_BREADY,AXI_01_WDATA[255:0],AXI_01_WLAST,AXI_01_WSTRB[31:0],AXI_01_WDATA_PARITY[31:0],AXI_01_WVALID,AXI_02_ACLK,AXI_02_ARESET_N,AXI_02_ARADDR[32:0],AXI_02_ARBURST[1:0],AXI_02_ARID[5:0],AXI_02_ARLEN[3:0],AXI_02_ARSIZE[2:0],AXI_02_ARVALID,AXI_02_AWADDR[32:0],AXI_02_AWBURST[1:0],AXI_02_AWID[5:0],AXI_02_AWLEN[3:0],AXI_02_AWSIZE[2:0],AXI_02_AWVALID,AXI_02_RREADY,AXI_02_BREADY,AXI_02_WDATA[255:0],AXI_02_WLAST,AXI_02_WSTRB[31:0],AXI_02_WDATA_PARITY[31:0],AXI_02_WVALID,AXI_03_ACLK,AXI_03_ARESET_N,AXI_03_ARADDR[32:0],AXI_03_ARBURST[1:0],AXI_03_ARID[5:0],AXI_03_ARLEN[3:0],AXI_03_ARSIZE[2:0],AXI_03_ARVALID,AXI_03_AWADDR[32:0],AXI_03_AWBURST[1:0],AXI_03_AWID[5:0],AXI_03_AWLEN[3:0],AXI_03_AWSIZE[2:0],AXI_03_AWVALID,AXI_03_RREADY,AXI_03_BREADY,AXI_03_WDATA[255:0],AXI_03_WLAST,AXI_03_WSTRB[31:0],AXI_03_WDATA_PARITY[31:0],AXI_03_WVALID,AXI_04_ACLK,AXI_04_ARESET_N,AXI_04_ARADDR[32:0],AXI_04_ARBURST[1:0],AXI_04_ARID[5:0],AXI_04_ARLEN[3:0],AXI_04_ARSIZE[2:0],AXI_04_ARVALID,AXI_04_AWADDR[32:0],AXI_04_AWBURST[1:0],AXI_04_AWID[5:0],AXI_04_AWLEN[3:0],AXI_04_AWSIZE[2:0],AXI_04_AWVALID,AXI_04_RREADY,AXI_04_BREADY,AXI_04_WDATA[255:0],AXI_04_WLAST,AXI_04_WSTRB[31:0],AXI_04_WDATA_PARITY[31:0],AXI_04_WVALID,AXI_05_ACLK,AXI_05_ARESET_N,AXI_05_ARADDR[32:0],AXI_05_ARBURST[1:0],AXI_05_ARID[5:0],AXI_05_ARLEN[3:0],AXI_05_ARSIZE[2:0],AXI_05_ARVALID,AXI_05_AWADDR[32:0],AXI_05_AWBURST[1:0],AXI_05_AWID[5:0],AXI_05_AWLEN[3:0],AXI_05_AWSIZE[2:0],AXI_05_AWVALID,AXI_05_RREADY,AXI_05_BREADY,AXI_05_WDATA[255:0],AXI_05_WLAST,AXI_05_WSTRB[31:0],AXI_05_WDATA_PARITY[31:0],AXI_05_WVALID,AXI_06_ACLK,AXI_06_ARESET_N,AXI_06_ARADDR[32:0],AXI_06_ARBURST[1:0],AXI_06_ARID[5:0],AXI_06_ARLEN[3:0],AXI_06_ARSIZE[2:0],AXI_06_ARVALID,AXI_06_AWADDR[32:0],AXI_06_AWBURST[1:0],AXI_06_AWID[5:0],AXI_06_AWLEN[3:0],AXI_06_AWSIZE[2:0],AXI_06_AWVALID,AXI_06_RREADY,AXI_06_BREADY,AXI_06_WDATA[255:0],AXI_06_WLAST,AXI_06_WSTRB[31:0],AXI_06_WDATA_PARITY[31:0],AXI_06_WVALID,AXI_07_ACLK,AXI_07_ARESET_N,AXI_07_ARADDR[32:0],AXI_07_ARBURST[1:0],AXI_07_ARID[5:0],AXI_07_ARLEN[3:0],AXI_07_ARSIZE[2:0],AXI_07_ARVALID,AXI_07_AWADDR[32:0],AXI_07_AWBURST[1:0],AXI_07_AWID[5:0],AXI_07_AWLEN[3:0],AXI_07_AWSIZE[2:0],AXI_07_AWVALID,AXI_07_RREADY,AXI_07_BREADY,AXI_07_WDATA[255:0],AXI_07_WLAST,AXI_07_WSTRB[31:0],AXI_07_WDATA_PARITY[31:0],AXI_07_WVALID,AXI_08_ACLK,AXI_08_ARESET_N,AXI_08_ARADDR[32:0],AXI_08_ARBURST[1:0],AXI_08_ARID[5:0],AXI_08_ARLEN[3:0],AXI_08_ARSIZE[2:0],AXI_08_ARVALID,AXI_08_AWADDR[32:0],AXI_08_AWBURST[1:0],AXI_08_AWID[5:0],AXI_08_AWLEN[3:0],AXI_08_AWSIZE[2:0],AXI_08_AWVALID,AXI_08_RREADY,AXI_08_BREADY,AXI_08_WDATA[255:0],AXI_08_WLAST,AXI_08_WSTRB[31:0],AXI_08_WDATA_PARITY[31:0],AXI_08_WVALID,AXI_09_ACLK,AXI_09_ARESET_N,AXI_09_ARADDR[32:0],AXI_09_ARBURST[1:0],AXI_09_ARID[5:0],AXI_09_ARLEN[3:0],AXI_09_ARSIZE[2:0],AXI_09_ARVALID,AXI_09_AWADDR[32:0],AXI_09_AWBURST[1:0],AXI_09_AWID[5:0],AXI_09_AWLEN[3:0],AXI_09_AWSIZE[2:0],AXI_09_AWVALID,AXI_09_RREADY,AXI_09_BREADY,AXI_09_WDATA[255:0],AXI_09_WLAST,AXI_09_WSTRB[31:0],AXI_09_WDATA_PARITY[31:0],AXI_09_WVALID,AXI_10_ACLK,AXI_10_ARESET_N,AXI_10_ARADDR[32:0],AXI_10_ARBURST[1:0],AXI_10_ARID[5:0],AXI_10_ARLEN[3:0],AXI_10_ARSIZE[2:0],AXI_10_ARVALID,AXI_10_AWADDR[32:0],AXI_10_AWBURST[1:0],AXI_10_AWID[5:0],AXI_10_AWLEN[3:0],AXI_10_AWSIZE[2:0],AXI_10_AWVALID,AXI_10_RREADY,AXI_10_BREADY,AXI_10_WDATA[255:0],AXI_10_WLAST,AXI_10_WSTRB[31:0],AXI_10_WDATA_PARITY[31:0],AXI_10_WVALID,AXI_11_ACLK,AXI_11_ARESET_N,AXI_11_ARADDR[32:0],AXI_11_ARBURST[1:0],AXI_11_ARID[5:0],AXI_11_ARLEN[3:0],AXI_11_ARSIZE[2:0],AXI_11_ARVALID,AXI_11_AWADDR[32:0],AXI_11_AWBURST[1:0],AXI_11_AWID[5:0],AXI_11_AWLEN[3:0],AXI_11_AWSIZE[2:0],AXI_11_AWVALID,AXI_11_RREADY,AXI_11_BREADY,AXI_11_WDATA[255:0],AXI_11_WLAST,AXI_11_WSTRB[31:0],AXI_11_WDATA_PARITY[31:0],AXI_11_WVALID,AXI_12_ACLK,AXI_12_ARESET_N,AXI_12_ARADDR[32:0],AXI_12_ARBURST[1:0],AXI_12_ARID[5:0],AXI_12_ARLEN[3:0],AXI_12_ARSIZE[2:0],AXI_12_ARVALID,AXI_12_AWADDR[32:0],AXI_12_AWBURST[1:0],AXI_12_AWID[5:0],AXI_12_AWLEN[3:0],AXI_12_AWSIZE[2:0],AXI_12_AWVALID,AXI_12_RREADY,AXI_12_BREADY,AXI_12_WDATA[255:0],AXI_12_WLAST,AXI_12_WSTRB[31:0],AXI_12_WDATA_PARITY[31:0],AXI_12_WVALID,AXI_13_ACLK,AXI_13_ARESET_N,AXI_13_ARADDR[32:0],AXI_13_ARBURST[1:0],AXI_13_ARID[5:0],AXI_13_ARLEN[3:0],AXI_13_ARSIZE[2:0],AXI_13_ARVALID,AXI_13_AWADDR[32:0],AXI_13_AWBURST[1:0],AXI_13_AWID[5:0],AXI_13_AWLEN[3:0],AXI_13_AWSIZE[2:0],AXI_13_AWVALID,AXI_13_RREADY,AXI_13_BREADY,AXI_13_WDATA[255:0],AXI_13_WLAST,AXI_13_WSTRB[31:0],AXI_13_WDATA_PARITY[31:0],AXI_13_WVALID,AXI_14_ACLK,AXI_14_ARESET_N,AXI_14_ARADDR[32:0],AXI_14_ARBURST[1:0],AXI_14_ARID[5:0],AXI_14_ARLEN[3:0],AXI_14_ARSIZE[2:0],AXI_14_ARVALID,AXI_14_AWADDR[32:0],AXI_14_AWBURST[1:0],AXI_14_AWID[5:0],AXI_14_AWLEN[3:0],AXI_14_AWSIZE[2:0],AXI_14_AWVALID,AXI_14_RREADY,AXI_14_BREADY,AXI_14_WDATA[255:0],AXI_14_WLAST,AXI_14_WSTRB[31:0],AXI_14_WDATA_PARITY[31:0],AXI_14_WVALID,AXI_15_ACLK,AXI_15_ARESET_N,AXI_15_ARADDR[32:0],AXI_15_ARBURST[1:0],AXI_15_ARID[5:0],AXI_15_ARLEN[3:0],AXI_15_ARSIZE[2:0],AXI_15_ARVALID,AXI_15_AWADDR[32:0],AXI_15_AWBURST[1:0],AXI_15_AWID[5:0],AXI_15_AWLEN[3:0],AXI_15_AWSIZE[2:0],AXI_15_AWVALID,AXI_15_RREADY,AXI_15_BREADY,AXI_15_WDATA[255:0],AXI_15_WLAST,AXI_15_WSTRB[31:0],AXI_15_WDATA_PARITY[31:0],AXI_15_WVALID,APB_0_PWDATA[31:0],APB_0_PADDR[21:0],APB_0_PCLK,APB_0_PENABLE,APB_0_PRESET_N,APB_0_PSEL,APB_0_PWRITE,AXI_00_ARREADY,AXI_00_AWREADY,AXI_00_RDATA_PARITY[31:0],AXI_00_RDATA[255:0],AXI_00_RID[5:0],AXI_00_RLAST,AXI_00_RRESP[1:0],AXI_00_RVALID,AXI_00_WREADY,AXI_00_BID[5:0],AXI_00_BRESP[1:0],AXI_00_BVALID,AXI_01_ARREADY,AXI_01_AWREADY,AXI_01_RDATA_PARITY[31:0],AXI_01_RDATA[255:0],AXI_01_RID[5:0],AXI_01_RLAST,AXI_01_RRESP[1:0],AXI_01_RVALID,AXI_01_WREADY,AXI_01_BID[5:0],AXI_01_BRESP[1:0],AXI_01_BVALID,AXI_02_ARREADY,AXI_02_AWREADY,AXI_02_RDATA_PARITY[31:0],AXI_02_RDATA[255:0],AXI_02_RID[5:0],AXI_02_RLAST,AXI_02_RRESP[1:0],AXI_02_RVALID,AXI_02_WREADY,AXI_02_BID[5:0],AXI_02_BRESP[1:0],AXI_02_BVALID,AXI_03_ARREADY,AXI_03_AWREADY,AXI_03_RDATA_PARITY[31:0],AXI_03_RDATA[255:0],AXI_03_RID[5:0],AXI_03_RLAST,AXI_03_RRESP[1:0],AXI_03_RVALID,AXI_03_WREADY,AXI_03_BID[5:0],AXI_03_BRESP[1:0],AXI_03_BVALID,AXI_04_ARREADY,AXI_04_AWREADY,AXI_04_RDATA_PARITY[31:0],AXI_04_RDATA[255:0],AXI_04_RID[5:0],AXI_04_RLAST,AXI_04_RRESP[1:0],AXI_04_RVALID,AXI_04_WREADY,AXI_04_BID[5:0],AXI_04_BRESP[1:0],AXI_04_BVALID,AXI_05_ARREADY,AXI_05_AWREADY,AXI_05_RDATA_PARITY[31:0],AXI_05_RDATA[255:0],AXI_05_RID[5:0],AXI_05_RLAST,AXI_05_RRESP[1:0],AXI_05_RVALID,AXI_05_WREADY,AXI_05_BID[5:0],AXI_05_BRESP[1:0],AXI_05_BVALID,AXI_06_ARREADY,AXI_06_AWREADY,AXI_06_RDATA_PARITY[31:0],AXI_06_RDATA[255:0],AXI_06_RID[5:0],AXI_06_RLAST,AXI_06_RRESP[1:0],AXI_06_RVALID,AXI_06_WREADY,AXI_06_BID[5:0],AXI_06_BRESP[1:0],AXI_06_BVALID,AXI_07_ARREADY,AXI_07_AWREADY,AXI_07_RDATA_PARITY[31:0],AXI_07_RDATA[255:0],AXI_07_RID[5:0],AXI_07_RLAST,AXI_07_RRESP[1:0],AXI_07_RVALID,AXI_07_WREADY,AXI_07_BID[5:0],AXI_07_BRESP[1:0],AXI_07_BVALID,AXI_08_ARREADY,AXI_08_AWREADY,AXI_08_RDATA_PARITY[31:0],AXI_08_RDATA[255:0],AXI_08_RID[5:0],AXI_08_RLAST,AXI_08_RRESP[1:0],AXI_08_RVALID,AXI_08_WREADY,AXI_08_BID[5:0],AXI_08_BRESP[1:0],AXI_08_BVALID,AXI_09_ARREADY,AXI_09_AWREADY,AXI_09_RDATA_PARITY[31:0],AXI_09_RDATA[255:0],AXI_09_RID[5:0],AXI_09_RLAST,AXI_09_RRESP[1:0],AXI_09_RVALID,AXI_09_WREADY,AXI_09_BID[5:0],AXI_09_BRESP[1:0],AXI_09_BVALID,AXI_10_ARREADY,AXI_10_AWREADY,AXI_10_RDATA_PARITY[31:0],AXI_10_RDATA[255:0],AXI_10_RID[5:0],AXI_10_RLAST,AXI_10_RRESP[1:0],AXI_10_RVALID,AXI_10_WREADY,AXI_10_BID[5:0],AXI_10_BRESP[1:0],AXI_10_BVALID,AXI_11_ARREADY,AXI_11_AWREADY,AXI_11_RDATA_PARITY[31:0],AXI_11_RDATA[255:0],AXI_11_RID[5:0],AXI_11_RLAST,AXI_11_RRESP[1:0],AXI_11_RVALID,AXI_11_WREADY,AXI_11_BID[5:0],AXI_11_BRESP[1:0],AXI_11_BVALID,AXI_12_ARREADY,AXI_12_AWREADY,AXI_12_RDATA_PARITY[31:0],AXI_12_RDATA[255:0],AXI_12_RID[5:0],AXI_12_RLAST,AXI_12_RRESP[1:0],AXI_12_RVALID,AXI_12_WREADY,AXI_12_BID[5:0],AXI_12_BRESP[1:0],AXI_12_BVALID,AXI_13_ARREADY,AXI_13_AWREADY,AXI_13_RDATA_PARITY[31:0],AXI_13_RDATA[255:0],AXI_13_RID[5:0],AXI_13_RLAST,AXI_13_RRESP[1:0],AXI_13_RVALID,AXI_13_WREADY,AXI_13_BID[5:0],AXI_13_BRESP[1:0],AXI_13_BVALID,AXI_14_ARREADY,AXI_14_AWREADY,AXI_14_RDATA_PARITY[31:0],AXI_14_RDATA[255:0],AXI_14_RID[5:0],AXI_14_RLAST,AXI_14_RRESP[1:0],AXI_14_RVALID,AXI_14_WREADY,AXI_14_BID[5:0],AXI_14_BRESP[1:0],AXI_14_BVALID,AXI_15_ARREADY,AXI_15_AWREADY,AXI_15_RDATA_PARITY[31:0],AXI_15_RDATA[255:0],AXI_15_RID[5:0],AXI_15_RLAST,AXI_15_RRESP[1:0],AXI_15_RVALID,AXI_15_WREADY,AXI_15_BID[5:0],AXI_15_BRESP[1:0],AXI_15_BVALID,APB_0_PRDATA[31:0],APB_0_PREADY,APB_0_PSLVERR,apb_complete_0,DRAM_0_STAT_CATTRIP,DRAM_0_STAT_TEMP[6:0]" */;
  input HBM_REF_CLK_0;
  input AXI_00_ACLK;
  input AXI_00_ARESET_N;
  input [32:0]AXI_00_ARADDR;
  input [1:0]AXI_00_ARBURST;
  input [5:0]AXI_00_ARID;
  input [3:0]AXI_00_ARLEN;
  input [2:0]AXI_00_ARSIZE;
  input AXI_00_ARVALID;
  input [32:0]AXI_00_AWADDR;
  input [1:0]AXI_00_AWBURST;
  input [5:0]AXI_00_AWID;
  input [3:0]AXI_00_AWLEN;
  input [2:0]AXI_00_AWSIZE;
  input AXI_00_AWVALID;
  input AXI_00_RREADY;
  input AXI_00_BREADY;
  input [255:0]AXI_00_WDATA;
  input AXI_00_WLAST;
  input [31:0]AXI_00_WSTRB;
  input [31:0]AXI_00_WDATA_PARITY;
  input AXI_00_WVALID;
  input AXI_01_ACLK;
  input AXI_01_ARESET_N;
  input [32:0]AXI_01_ARADDR;
  input [1:0]AXI_01_ARBURST;
  input [5:0]AXI_01_ARID;
  input [3:0]AXI_01_ARLEN;
  input [2:0]AXI_01_ARSIZE;
  input AXI_01_ARVALID;
  input [32:0]AXI_01_AWADDR;
  input [1:0]AXI_01_AWBURST;
  input [5:0]AXI_01_AWID;
  input [3:0]AXI_01_AWLEN;
  input [2:0]AXI_01_AWSIZE;
  input AXI_01_AWVALID;
  input AXI_01_RREADY;
  input AXI_01_BREADY;
  input [255:0]AXI_01_WDATA;
  input AXI_01_WLAST;
  input [31:0]AXI_01_WSTRB;
  input [31:0]AXI_01_WDATA_PARITY;
  input AXI_01_WVALID;
  input AXI_02_ACLK;
  input AXI_02_ARESET_N;
  input [32:0]AXI_02_ARADDR;
  input [1:0]AXI_02_ARBURST;
  input [5:0]AXI_02_ARID;
  input [3:0]AXI_02_ARLEN;
  input [2:0]AXI_02_ARSIZE;
  input AXI_02_ARVALID;
  input [32:0]AXI_02_AWADDR;
  input [1:0]AXI_02_AWBURST;
  input [5:0]AXI_02_AWID;
  input [3:0]AXI_02_AWLEN;
  input [2:0]AXI_02_AWSIZE;
  input AXI_02_AWVALID;
  input AXI_02_RREADY;
  input AXI_02_BREADY;
  input [255:0]AXI_02_WDATA;
  input AXI_02_WLAST;
  input [31:0]AXI_02_WSTRB;
  input [31:0]AXI_02_WDATA_PARITY;
  input AXI_02_WVALID;
  input AXI_03_ACLK;
  input AXI_03_ARESET_N;
  input [32:0]AXI_03_ARADDR;
  input [1:0]AXI_03_ARBURST;
  input [5:0]AXI_03_ARID;
  input [3:0]AXI_03_ARLEN;
  input [2:0]AXI_03_ARSIZE;
  input AXI_03_ARVALID;
  input [32:0]AXI_03_AWADDR;
  input [1:0]AXI_03_AWBURST;
  input [5:0]AXI_03_AWID;
  input [3:0]AXI_03_AWLEN;
  input [2:0]AXI_03_AWSIZE;
  input AXI_03_AWVALID;
  input AXI_03_RREADY;
  input AXI_03_BREADY;
  input [255:0]AXI_03_WDATA;
  input AXI_03_WLAST;
  input [31:0]AXI_03_WSTRB;
  input [31:0]AXI_03_WDATA_PARITY;
  input AXI_03_WVALID;
  input AXI_04_ACLK;
  input AXI_04_ARESET_N;
  input [32:0]AXI_04_ARADDR;
  input [1:0]AXI_04_ARBURST;
  input [5:0]AXI_04_ARID;
  input [3:0]AXI_04_ARLEN;
  input [2:0]AXI_04_ARSIZE;
  input AXI_04_ARVALID;
  input [32:0]AXI_04_AWADDR;
  input [1:0]AXI_04_AWBURST;
  input [5:0]AXI_04_AWID;
  input [3:0]AXI_04_AWLEN;
  input [2:0]AXI_04_AWSIZE;
  input AXI_04_AWVALID;
  input AXI_04_RREADY;
  input AXI_04_BREADY;
  input [255:0]AXI_04_WDATA;
  input AXI_04_WLAST;
  input [31:0]AXI_04_WSTRB;
  input [31:0]AXI_04_WDATA_PARITY;
  input AXI_04_WVALID;
  input AXI_05_ACLK;
  input AXI_05_ARESET_N;
  input [32:0]AXI_05_ARADDR;
  input [1:0]AXI_05_ARBURST;
  input [5:0]AXI_05_ARID;
  input [3:0]AXI_05_ARLEN;
  input [2:0]AXI_05_ARSIZE;
  input AXI_05_ARVALID;
  input [32:0]AXI_05_AWADDR;
  input [1:0]AXI_05_AWBURST;
  input [5:0]AXI_05_AWID;
  input [3:0]AXI_05_AWLEN;
  input [2:0]AXI_05_AWSIZE;
  input AXI_05_AWVALID;
  input AXI_05_RREADY;
  input AXI_05_BREADY;
  input [255:0]AXI_05_WDATA;
  input AXI_05_WLAST;
  input [31:0]AXI_05_WSTRB;
  input [31:0]AXI_05_WDATA_PARITY;
  input AXI_05_WVALID;
  input AXI_06_ACLK;
  input AXI_06_ARESET_N;
  input [32:0]AXI_06_ARADDR;
  input [1:0]AXI_06_ARBURST;
  input [5:0]AXI_06_ARID;
  input [3:0]AXI_06_ARLEN;
  input [2:0]AXI_06_ARSIZE;
  input AXI_06_ARVALID;
  input [32:0]AXI_06_AWADDR;
  input [1:0]AXI_06_AWBURST;
  input [5:0]AXI_06_AWID;
  input [3:0]AXI_06_AWLEN;
  input [2:0]AXI_06_AWSIZE;
  input AXI_06_AWVALID;
  input AXI_06_RREADY;
  input AXI_06_BREADY;
  input [255:0]AXI_06_WDATA;
  input AXI_06_WLAST;
  input [31:0]AXI_06_WSTRB;
  input [31:0]AXI_06_WDATA_PARITY;
  input AXI_06_WVALID;
  input AXI_07_ACLK;
  input AXI_07_ARESET_N;
  input [32:0]AXI_07_ARADDR;
  input [1:0]AXI_07_ARBURST;
  input [5:0]AXI_07_ARID;
  input [3:0]AXI_07_ARLEN;
  input [2:0]AXI_07_ARSIZE;
  input AXI_07_ARVALID;
  input [32:0]AXI_07_AWADDR;
  input [1:0]AXI_07_AWBURST;
  input [5:0]AXI_07_AWID;
  input [3:0]AXI_07_AWLEN;
  input [2:0]AXI_07_AWSIZE;
  input AXI_07_AWVALID;
  input AXI_07_RREADY;
  input AXI_07_BREADY;
  input [255:0]AXI_07_WDATA;
  input AXI_07_WLAST;
  input [31:0]AXI_07_WSTRB;
  input [31:0]AXI_07_WDATA_PARITY;
  input AXI_07_WVALID;
  input AXI_08_ACLK;
  input AXI_08_ARESET_N;
  input [32:0]AXI_08_ARADDR;
  input [1:0]AXI_08_ARBURST;
  input [5:0]AXI_08_ARID;
  input [3:0]AXI_08_ARLEN;
  input [2:0]AXI_08_ARSIZE;
  input AXI_08_ARVALID;
  input [32:0]AXI_08_AWADDR;
  input [1:0]AXI_08_AWBURST;
  input [5:0]AXI_08_AWID;
  input [3:0]AXI_08_AWLEN;
  input [2:0]AXI_08_AWSIZE;
  input AXI_08_AWVALID;
  input AXI_08_RREADY;
  input AXI_08_BREADY;
  input [255:0]AXI_08_WDATA;
  input AXI_08_WLAST;
  input [31:0]AXI_08_WSTRB;
  input [31:0]AXI_08_WDATA_PARITY;
  input AXI_08_WVALID;
  input AXI_09_ACLK;
  input AXI_09_ARESET_N;
  input [32:0]AXI_09_ARADDR;
  input [1:0]AXI_09_ARBURST;
  input [5:0]AXI_09_ARID;
  input [3:0]AXI_09_ARLEN;
  input [2:0]AXI_09_ARSIZE;
  input AXI_09_ARVALID;
  input [32:0]AXI_09_AWADDR;
  input [1:0]AXI_09_AWBURST;
  input [5:0]AXI_09_AWID;
  input [3:0]AXI_09_AWLEN;
  input [2:0]AXI_09_AWSIZE;
  input AXI_09_AWVALID;
  input AXI_09_RREADY;
  input AXI_09_BREADY;
  input [255:0]AXI_09_WDATA;
  input AXI_09_WLAST;
  input [31:0]AXI_09_WSTRB;
  input [31:0]AXI_09_WDATA_PARITY;
  input AXI_09_WVALID;
  input AXI_10_ACLK;
  input AXI_10_ARESET_N;
  input [32:0]AXI_10_ARADDR;
  input [1:0]AXI_10_ARBURST;
  input [5:0]AXI_10_ARID;
  input [3:0]AXI_10_ARLEN;
  input [2:0]AXI_10_ARSIZE;
  input AXI_10_ARVALID;
  input [32:0]AXI_10_AWADDR;
  input [1:0]AXI_10_AWBURST;
  input [5:0]AXI_10_AWID;
  input [3:0]AXI_10_AWLEN;
  input [2:0]AXI_10_AWSIZE;
  input AXI_10_AWVALID;
  input AXI_10_RREADY;
  input AXI_10_BREADY;
  input [255:0]AXI_10_WDATA;
  input AXI_10_WLAST;
  input [31:0]AXI_10_WSTRB;
  input [31:0]AXI_10_WDATA_PARITY;
  input AXI_10_WVALID;
  input AXI_11_ACLK;
  input AXI_11_ARESET_N;
  input [32:0]AXI_11_ARADDR;
  input [1:0]AXI_11_ARBURST;
  input [5:0]AXI_11_ARID;
  input [3:0]AXI_11_ARLEN;
  input [2:0]AXI_11_ARSIZE;
  input AXI_11_ARVALID;
  input [32:0]AXI_11_AWADDR;
  input [1:0]AXI_11_AWBURST;
  input [5:0]AXI_11_AWID;
  input [3:0]AXI_11_AWLEN;
  input [2:0]AXI_11_AWSIZE;
  input AXI_11_AWVALID;
  input AXI_11_RREADY;
  input AXI_11_BREADY;
  input [255:0]AXI_11_WDATA;
  input AXI_11_WLAST;
  input [31:0]AXI_11_WSTRB;
  input [31:0]AXI_11_WDATA_PARITY;
  input AXI_11_WVALID;
  input AXI_12_ACLK;
  input AXI_12_ARESET_N;
  input [32:0]AXI_12_ARADDR;
  input [1:0]AXI_12_ARBURST;
  input [5:0]AXI_12_ARID;
  input [3:0]AXI_12_ARLEN;
  input [2:0]AXI_12_ARSIZE;
  input AXI_12_ARVALID;
  input [32:0]AXI_12_AWADDR;
  input [1:0]AXI_12_AWBURST;
  input [5:0]AXI_12_AWID;
  input [3:0]AXI_12_AWLEN;
  input [2:0]AXI_12_AWSIZE;
  input AXI_12_AWVALID;
  input AXI_12_RREADY;
  input AXI_12_BREADY;
  input [255:0]AXI_12_WDATA;
  input AXI_12_WLAST;
  input [31:0]AXI_12_WSTRB;
  input [31:0]AXI_12_WDATA_PARITY;
  input AXI_12_WVALID;
  input AXI_13_ACLK;
  input AXI_13_ARESET_N;
  input [32:0]AXI_13_ARADDR;
  input [1:0]AXI_13_ARBURST;
  input [5:0]AXI_13_ARID;
  input [3:0]AXI_13_ARLEN;
  input [2:0]AXI_13_ARSIZE;
  input AXI_13_ARVALID;
  input [32:0]AXI_13_AWADDR;
  input [1:0]AXI_13_AWBURST;
  input [5:0]AXI_13_AWID;
  input [3:0]AXI_13_AWLEN;
  input [2:0]AXI_13_AWSIZE;
  input AXI_13_AWVALID;
  input AXI_13_RREADY;
  input AXI_13_BREADY;
  input [255:0]AXI_13_WDATA;
  input AXI_13_WLAST;
  input [31:0]AXI_13_WSTRB;
  input [31:0]AXI_13_WDATA_PARITY;
  input AXI_13_WVALID;
  input AXI_14_ACLK;
  input AXI_14_ARESET_N;
  input [32:0]AXI_14_ARADDR;
  input [1:0]AXI_14_ARBURST;
  input [5:0]AXI_14_ARID;
  input [3:0]AXI_14_ARLEN;
  input [2:0]AXI_14_ARSIZE;
  input AXI_14_ARVALID;
  input [32:0]AXI_14_AWADDR;
  input [1:0]AXI_14_AWBURST;
  input [5:0]AXI_14_AWID;
  input [3:0]AXI_14_AWLEN;
  input [2:0]AXI_14_AWSIZE;
  input AXI_14_AWVALID;
  input AXI_14_RREADY;
  input AXI_14_BREADY;
  input [255:0]AXI_14_WDATA;
  input AXI_14_WLAST;
  input [31:0]AXI_14_WSTRB;
  input [31:0]AXI_14_WDATA_PARITY;
  input AXI_14_WVALID;
  input AXI_15_ACLK;
  input AXI_15_ARESET_N;
  input [32:0]AXI_15_ARADDR;
  input [1:0]AXI_15_ARBURST;
  input [5:0]AXI_15_ARID;
  input [3:0]AXI_15_ARLEN;
  input [2:0]AXI_15_ARSIZE;
  input AXI_15_ARVALID;
  input [32:0]AXI_15_AWADDR;
  input [1:0]AXI_15_AWBURST;
  input [5:0]AXI_15_AWID;
  input [3:0]AXI_15_AWLEN;
  input [2:0]AXI_15_AWSIZE;
  input AXI_15_AWVALID;
  input AXI_15_RREADY;
  input AXI_15_BREADY;
  input [255:0]AXI_15_WDATA;
  input AXI_15_WLAST;
  input [31:0]AXI_15_WSTRB;
  input [31:0]AXI_15_WDATA_PARITY;
  input AXI_15_WVALID;
  input [31:0]APB_0_PWDATA;
  input [21:0]APB_0_PADDR;
  input APB_0_PCLK;
  input APB_0_PENABLE;
  input APB_0_PRESET_N;
  input APB_0_PSEL;
  input APB_0_PWRITE;
  output AXI_00_ARREADY;
  output AXI_00_AWREADY;
  output [31:0]AXI_00_RDATA_PARITY;
  output [255:0]AXI_00_RDATA;
  output [5:0]AXI_00_RID;
  output AXI_00_RLAST;
  output [1:0]AXI_00_RRESP;
  output AXI_00_RVALID;
  output AXI_00_WREADY;
  output [5:0]AXI_00_BID;
  output [1:0]AXI_00_BRESP;
  output AXI_00_BVALID;
  output AXI_01_ARREADY;
  output AXI_01_AWREADY;
  output [31:0]AXI_01_RDATA_PARITY;
  output [255:0]AXI_01_RDATA;
  output [5:0]AXI_01_RID;
  output AXI_01_RLAST;
  output [1:0]AXI_01_RRESP;
  output AXI_01_RVALID;
  output AXI_01_WREADY;
  output [5:0]AXI_01_BID;
  output [1:0]AXI_01_BRESP;
  output AXI_01_BVALID;
  output AXI_02_ARREADY;
  output AXI_02_AWREADY;
  output [31:0]AXI_02_RDATA_PARITY;
  output [255:0]AXI_02_RDATA;
  output [5:0]AXI_02_RID;
  output AXI_02_RLAST;
  output [1:0]AXI_02_RRESP;
  output AXI_02_RVALID;
  output AXI_02_WREADY;
  output [5:0]AXI_02_BID;
  output [1:0]AXI_02_BRESP;
  output AXI_02_BVALID;
  output AXI_03_ARREADY;
  output AXI_03_AWREADY;
  output [31:0]AXI_03_RDATA_PARITY;
  output [255:0]AXI_03_RDATA;
  output [5:0]AXI_03_RID;
  output AXI_03_RLAST;
  output [1:0]AXI_03_RRESP;
  output AXI_03_RVALID;
  output AXI_03_WREADY;
  output [5:0]AXI_03_BID;
  output [1:0]AXI_03_BRESP;
  output AXI_03_BVALID;
  output AXI_04_ARREADY;
  output AXI_04_AWREADY;
  output [31:0]AXI_04_RDATA_PARITY;
  output [255:0]AXI_04_RDATA;
  output [5:0]AXI_04_RID;
  output AXI_04_RLAST;
  output [1:0]AXI_04_RRESP;
  output AXI_04_RVALID;
  output AXI_04_WREADY;
  output [5:0]AXI_04_BID;
  output [1:0]AXI_04_BRESP;
  output AXI_04_BVALID;
  output AXI_05_ARREADY;
  output AXI_05_AWREADY;
  output [31:0]AXI_05_RDATA_PARITY;
  output [255:0]AXI_05_RDATA;
  output [5:0]AXI_05_RID;
  output AXI_05_RLAST;
  output [1:0]AXI_05_RRESP;
  output AXI_05_RVALID;
  output AXI_05_WREADY;
  output [5:0]AXI_05_BID;
  output [1:0]AXI_05_BRESP;
  output AXI_05_BVALID;
  output AXI_06_ARREADY;
  output AXI_06_AWREADY;
  output [31:0]AXI_06_RDATA_PARITY;
  output [255:0]AXI_06_RDATA;
  output [5:0]AXI_06_RID;
  output AXI_06_RLAST;
  output [1:0]AXI_06_RRESP;
  output AXI_06_RVALID;
  output AXI_06_WREADY;
  output [5:0]AXI_06_BID;
  output [1:0]AXI_06_BRESP;
  output AXI_06_BVALID;
  output AXI_07_ARREADY;
  output AXI_07_AWREADY;
  output [31:0]AXI_07_RDATA_PARITY;
  output [255:0]AXI_07_RDATA;
  output [5:0]AXI_07_RID;
  output AXI_07_RLAST;
  output [1:0]AXI_07_RRESP;
  output AXI_07_RVALID;
  output AXI_07_WREADY;
  output [5:0]AXI_07_BID;
  output [1:0]AXI_07_BRESP;
  output AXI_07_BVALID;
  output AXI_08_ARREADY;
  output AXI_08_AWREADY;
  output [31:0]AXI_08_RDATA_PARITY;
  output [255:0]AXI_08_RDATA;
  output [5:0]AXI_08_RID;
  output AXI_08_RLAST;
  output [1:0]AXI_08_RRESP;
  output AXI_08_RVALID;
  output AXI_08_WREADY;
  output [5:0]AXI_08_BID;
  output [1:0]AXI_08_BRESP;
  output AXI_08_BVALID;
  output AXI_09_ARREADY;
  output AXI_09_AWREADY;
  output [31:0]AXI_09_RDATA_PARITY;
  output [255:0]AXI_09_RDATA;
  output [5:0]AXI_09_RID;
  output AXI_09_RLAST;
  output [1:0]AXI_09_RRESP;
  output AXI_09_RVALID;
  output AXI_09_WREADY;
  output [5:0]AXI_09_BID;
  output [1:0]AXI_09_BRESP;
  output AXI_09_BVALID;
  output AXI_10_ARREADY;
  output AXI_10_AWREADY;
  output [31:0]AXI_10_RDATA_PARITY;
  output [255:0]AXI_10_RDATA;
  output [5:0]AXI_10_RID;
  output AXI_10_RLAST;
  output [1:0]AXI_10_RRESP;
  output AXI_10_RVALID;
  output AXI_10_WREADY;
  output [5:0]AXI_10_BID;
  output [1:0]AXI_10_BRESP;
  output AXI_10_BVALID;
  output AXI_11_ARREADY;
  output AXI_11_AWREADY;
  output [31:0]AXI_11_RDATA_PARITY;
  output [255:0]AXI_11_RDATA;
  output [5:0]AXI_11_RID;
  output AXI_11_RLAST;
  output [1:0]AXI_11_RRESP;
  output AXI_11_RVALID;
  output AXI_11_WREADY;
  output [5:0]AXI_11_BID;
  output [1:0]AXI_11_BRESP;
  output AXI_11_BVALID;
  output AXI_12_ARREADY;
  output AXI_12_AWREADY;
  output [31:0]AXI_12_RDATA_PARITY;
  output [255:0]AXI_12_RDATA;
  output [5:0]AXI_12_RID;
  output AXI_12_RLAST;
  output [1:0]AXI_12_RRESP;
  output AXI_12_RVALID;
  output AXI_12_WREADY;
  output [5:0]AXI_12_BID;
  output [1:0]AXI_12_BRESP;
  output AXI_12_BVALID;
  output AXI_13_ARREADY;
  output AXI_13_AWREADY;
  output [31:0]AXI_13_RDATA_PARITY;
  output [255:0]AXI_13_RDATA;
  output [5:0]AXI_13_RID;
  output AXI_13_RLAST;
  output [1:0]AXI_13_RRESP;
  output AXI_13_RVALID;
  output AXI_13_WREADY;
  output [5:0]AXI_13_BID;
  output [1:0]AXI_13_BRESP;
  output AXI_13_BVALID;
  output AXI_14_ARREADY;
  output AXI_14_AWREADY;
  output [31:0]AXI_14_RDATA_PARITY;
  output [255:0]AXI_14_RDATA;
  output [5:0]AXI_14_RID;
  output AXI_14_RLAST;
  output [1:0]AXI_14_RRESP;
  output AXI_14_RVALID;
  output AXI_14_WREADY;
  output [5:0]AXI_14_BID;
  output [1:0]AXI_14_BRESP;
  output AXI_14_BVALID;
  output AXI_15_ARREADY;
  output AXI_15_AWREADY;
  output [31:0]AXI_15_RDATA_PARITY;
  output [255:0]AXI_15_RDATA;
  output [5:0]AXI_15_RID;
  output AXI_15_RLAST;
  output [1:0]AXI_15_RRESP;
  output AXI_15_RVALID;
  output AXI_15_WREADY;
  output [5:0]AXI_15_BID;
  output [1:0]AXI_15_BRESP;
  output AXI_15_BVALID;
  output [31:0]APB_0_PRDATA;
  output APB_0_PREADY;
  output APB_0_PSLVERR;
  output apb_complete_0;
  output DRAM_0_STAT_CATTRIP;
  output [6:0]DRAM_0_STAT_TEMP;
endmodule
