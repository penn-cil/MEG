onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+dut_ddr_clock_convertor -L xil_defaultlib -L xpm -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_4 -L axi_clock_converter_v2_1_18 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dut_ddr_clock_convertor xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {dut_ddr_clock_convertor.udo}

run -all

endsim

quit -force
