`include "axi_interfaces.vh"
module huge_acc 
	#(
		MEM_PORTS_NUM = 15, 
        CTRL_PORTS_NUM = 2
	)
	(
		input logic aclk,
		input logic aresetn,
		axi3_simple.master mem_port [MEM_PORTS_NUM - 1: 0],
		lite_simple.slave ctrl_port [CTRL_PORTS_NUM - 1: 0]
	);
	// ...
	
	// the logic of your accelerator
	
	// ...
endmodule : huge_acc

