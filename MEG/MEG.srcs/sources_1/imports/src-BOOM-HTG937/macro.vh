//********** MODIFIABLE PART **********

`define ALT_ACC 
// define it when use demo
// comment this if use acc

`define USE_DDR4_AS_LINUX_MEMORY 
// define it to use ddr4 
// comment this to use HBM

`define MEM_PORTS_NUM 15
// number of your acc mem ports(axi3-master) that will connect to HBM axi3-slave
// 1 -15 
// 32'addr, 6'id, 256'data

`define CTRL_PORTS_NUM 2
// number of your acc ctrl bus(lite-slave) that will be hanged onto MMIO bus
// 1 - 2
// 16'addr, 64'data , lite1:0x60040000 - 0x60050000; lite2:0x60050000 - 0x60060000

//************* FIXED PART ************

`define SIM_ENABLE_DDR
// define it to enable memory for linux system (must define!)

`define LINUX_MEM_MASK 32'h07FFFFFFF
// the linux memory range is 0x80000000 - 0xFFFFFFFF
// it will be mapped to 0x00000000 - 0x7FFFFFFF in either of DDR4 or HBM 