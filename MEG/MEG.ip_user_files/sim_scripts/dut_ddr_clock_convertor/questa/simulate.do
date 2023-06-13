onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dut_ddr_clock_convertor_opt

do {wave.do}

view wave
view structure
view signals

do {dut_ddr_clock_convertor.udo}

run -all

quit -force
