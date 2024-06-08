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
// CREATED		"Fri Jun  7 16:52:47 2024"

module Clock_Design2(
	CLK,
	Reset,
	current_hours,
	current_mins,
	real_hrs,
	real_mins,
	Seg1,
	Seg2,
	Seg3,
	Seg4
);


input wire	CLK;
input wire	Reset;
input wire	[7:0] current_hours;
input wire	[7:0] current_mins;
output wire	[7:0] real_hrs;
output wire	[7:0] real_mins;
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
wire	[7:0] seconds;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;

assign	real_hrs = SYNTHESIZED_WIRE_5;
assign	real_mins = SYNTHESIZED_WIRE_4;




sync	b2v_inst(
	.clk(Clock50MHz),
	.d(SYNTHESIZED_WIRE_0),
	.q(min));

assign	SYNTHESIZED_WIRE_7 = min | RS;

assign	SYNTHESIZED_WIRE_1 =  ~Reset;

assign	RS = newDay | SYNTHESIZED_WIRE_1;


sevenseg	b2v_inst14(
	.data(SYNTHESIZED_WIRE_2),
	.segments(Seg4));


sevenseg	b2v_inst15(
	.data(SYNTHESIZED_WIRE_3),
	.segments(Seg2));


EightBitAdder	b2v_inst17(
	.A(minutes),
	.B(current_mins),
	.S(SYNTHESIZED_WIRE_4));


parser	b2v_inst18(
	.x(SYNTHESIZED_WIRE_4),
	.ones(SYNTHESIZED_WIRE_11),
	.tens(SYNTHESIZED_WIRE_3));


parser	b2v_inst19(
	.x(SYNTHESIZED_WIRE_5),
	.ones(SYNTHESIZED_WIRE_12),
	.tens(SYNTHESIZED_WIRE_2));


Clock_Divider_1Hz	b2v_inst2(
	.CLK50MHz(Clock50MHz),
	.Reset(RS),
	.CLK1Hz(SYNTHESIZED_WIRE_6));


EightBitAdder	b2v_inst20(
	.A(hours),
	.B(current_hours),
	.S(SYNTHESIZED_WIRE_5));


counter	b2v_inst28(
	.clk(SYNTHESIZED_WIRE_6),
	.reset(SYNTHESIZED_WIRE_7),
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
	.d(SYNTHESIZED_WIRE_8),
	.q(newDay));


counter	b2v_inst30(
	.clk(min),
	.reset(SYNTHESIZED_WIRE_9),
	.q(minutes));
	defparam	b2v_inst30.N = 8;


comparator	b2v_inst31(
	.a(minutes),
	.eq(SYNTHESIZED_WIRE_10)
	
	
	
	
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
	.eq(SYNTHESIZED_WIRE_8)
	
	
	
	
	);
	defparam	b2v_inst33.B = 24;
	defparam	b2v_inst33.N = 8;


sync	b2v_inst4(
	.clk(Clock50MHz),
	.d(SYNTHESIZED_WIRE_10),
	.q(hr));

assign	SYNTHESIZED_WIRE_9 = hr | RS;


sevenseg	b2v_inst7(
	.data(SYNTHESIZED_WIRE_11),
	.segments(Seg1));


sevenseg	b2v_inst9(
	.data(SYNTHESIZED_WIRE_12),
	.segments(Seg3));

assign	Clock50MHz = CLK;

endmodule
