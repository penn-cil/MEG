vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/drivers/hbm_acc_v1_0/src" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/drivers/hbm_acc_v1_0/src" \
"../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0_M00_AXI.v" \
"../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0_S00_AXI.v" \
"../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/hdl/hbm_acc_v1_0.v" \
"../../../../BOOM_on_HTG937.srcs/sources_1/ip/acc_hbm_access_1/sim/acc_hbm_access.v" \

vlog -work xil_defaultlib \
"glbl.v"

