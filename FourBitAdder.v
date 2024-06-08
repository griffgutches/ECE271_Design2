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
// CREATED		"Fri Jun  7 15:44:17 2024"

module FourBitAdder(
	A0,
	A1,
	A2,
	A3,
	B0,
	B1,
	B2,
	B3,
	C0in,
	S0,
	S1,
	S2,
	S3,
	C
);


input wire	A0;
input wire	A1;
input wire	A2;
input wire	A3;
input wire	B0;
input wire	B1;
input wire	B2;
input wire	B3;
input wire	C0in;
output wire	S0;
output wire	S1;
output wire	S2;
output wire	S3;
output wire	C;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





FullAdder	b2v_inst(
	.A(A0),
	.B(B0),
	.Cin(C0in),
	.S(S0),
	.Cout(SYNTHESIZED_WIRE_0));


FullAdder	b2v_inst2(
	.A(A1),
	.B(B1),
	.Cin(SYNTHESIZED_WIRE_0),
	.S(S1),
	.Cout(SYNTHESIZED_WIRE_1));


FullAdder	b2v_inst3(
	.A(A2),
	.B(B2),
	.Cin(SYNTHESIZED_WIRE_1),
	.S(S2),
	.Cout(SYNTHESIZED_WIRE_2));


FullAdder	b2v_inst4(
	.A(A3),
	.B(B3),
	.Cin(SYNTHESIZED_WIRE_2),
	.S(S3),
	.Cout(C));


endmodule
