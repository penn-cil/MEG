onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+acc_hbm_access -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.acc_hbm_access xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {acc_hbm_access.udo}

run -all

endsim

quit -force
