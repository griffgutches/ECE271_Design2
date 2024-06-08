// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Fri Jun  7 17:18:25 2024"

module Clock_Divider_1Hz(
	Reset,
	CLK50MHz,
	CLK1Hz
);


input wire	Reset;
input wire	CLK50MHz;
output wire	CLK1Hz;

wire	Clock_1Hz;
wire	[25:0] SYNTHESIZED_WIRE_0;





counter	b2v_inst10(
	.clk(CLK50MHz),
	.reset(Reset),
	.q(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst10.N = 26;


comparator	b2v_inst8(
	.a(SYNTHESIZED_WIRE_0),
	.eq(Clock_1Hz)
	
	
	
	
	);
	defparam	b2v_inst8.B = 50000000;
	defparam	b2v_inst8.N = 26;

assign	CLK1Hz = Clock_1Hz;

endmodule
