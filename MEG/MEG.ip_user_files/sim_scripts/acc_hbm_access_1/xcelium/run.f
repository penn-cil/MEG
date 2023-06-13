-makelib xcelium_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0_M00_AXI.v" \
  "../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0_S00_AXI.v" \
  "../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0.v" \
  "../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/sim/acc_hbm_access.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

