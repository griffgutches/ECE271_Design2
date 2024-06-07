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
// CREATED		"Thu Jun  6 20:30:50 2024"

module Clock_Design2(
	CLK,
	Reset,
	Seg1,
	Seg2,
	Seg3,
	Seg4
);


input wire	CLK;
input wire	Reset;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;
output wire	[6:0] Seg4;

wire	Clock50MHz;
wire	[7:0] hours;
wire	hr;
wire	min;
wire	[7:0] minutes;
wire	newDay;
wire	RS;
wire	sec_wire;
wire	[7:0] seconds;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[25:0] SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;





sync	b2v_inst(
	.clk(Clock50MHz),
	.d(SYNTHESIZED_WIRE_0),
	.q(min));

assign	SYNTHESIZED_WIRE_4 = min | RS;


counter	b2v_inst10(
	.clk(Clock50MHz),
	.reset(RS),
	.q(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst10.N = 26;

assign	SYNTHESIZED_WIRE_1 =  ~Reset;

assign	RS = newDay | SYNTHESIZED_WIRE_1;


sevenseg	b2v_inst14(
	.data(SYNTHESIZED_WIRE_2),
	.segments(Seg4));


sevenseg	b2v_inst15(
	.data(SYNTHESIZED_WIRE_3),
	.segments(Seg2));


parser	b2v_inst18(
	.x(minutes),
	.ones(SYNTHESIZED_WIRE_8),
	.tens(SYNTHESIZED_WIRE_3));


parser	b2v_inst19(
	.x(hours),
	.ones(SYNTHESIZED_WIRE_10),
	.tens(SYNTHESIZED_WIRE_2));


counter	b2v_inst28(
	.clk(sec_wire),
	.reset(SYNTHESIZED_WIRE_4),
	.q(seconds));
	defparam	b2v_inst28.N = 8;


comparator	b2v_inst29(
	.a(seconds),
	.eq(SYNTHESIZED_WIRE_0)
	
	
	
	
	);
	defparam	b2v_inst29.B = 60;
	defparam	b2v_inst29.N = 8;


sync	b2v_inst3(
	.clk(Clock50MHz),
	.d(SYNTHESIZED_WIRE_5),
	.q(newDay));


counter	b2v_inst30(
	.clk(min),
	.reset(SYNTHESIZED_WIRE_6),
	.q(minutes));
	defparam	b2v_inst30.N = 8;


comparator	b2v_inst31(
	.a(minutes),
	.eq(SYNTHESIZED_WIRE_7)
	
	
	
	
	);
	defparam	b2v_inst31.B = 60;
	defparam	b2v_inst31.N = 8;


counter	b2v_inst32(
	.clk(hr),
	.reset(RS),
	.q(hours));
	defparam	b2v_inst32.N = 8;


comparator	b2v_inst33(
	.a(hours),
	.eq(SYNTHESIZED_WIRE_5)
	
	
	
	
	);
	defparam	b2v_inst33.B = 24;
	defparam	b2v_inst33.N = 8;


sync	b2v_inst4(
	.clk(Clock50MHz),
	.d(SYNTHESIZED_WIRE_7),
	.q(hr));

assign	SYNTHESIZED_WIRE_6 = hr | RS;


sevenseg	b2v_inst7(
	.data(SYNTHESIZED_WIRE_8),
	.segments(Seg1));


comparator	b2v_inst8(
	.a(SYNTHESIZED_WIRE_9),
	.eq(sec_wire)
	
	
	
	
	);
	defparam	b2v_inst8.B = 50000000;
	defparam	b2v_inst8.N = 26;


sevenseg	b2v_inst9(
	.data(SYNTHESIZED_WIRE_10),
	.segments(Seg3));

assign	Clock50MHz = CLK;

endmodule
