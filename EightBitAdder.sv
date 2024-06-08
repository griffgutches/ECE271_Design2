module EightBitAdder(
	input [7:0] A,
	input [7:0] B,
	output [7:0] S
);

	wire A0, A1, A2, A3, A4, A5, A6, A7;
	wire B0, B1, B2, B3, B4, B5, B6, B7;
	wire S0, S1, S2, S3, S4, S5, S6, S7;
	wire C0, C1; 
	
	assign {A7, A6, A5, A4, A3, A2, A1, A0} = A;
	assign {B7, B6, B5, B4, B3, B2, B1, B0} = B;
	
	FourBitAdder adder_low(
		.A0(A0),
		.A1(A1),
		.A2(A2),
		.A3(A3),
		.B0(B0),
		.B1(B1),
		.B2(B2),
		.B3(B3),
		.C0in(1'b0),
		.S0(S0),
		.S1(S1),
		.S2(S2),
		.S3(S3),
		.C(C0)
	);

	FourBitAdder adder_high(
		.A0(A4),
		.A1(A5),
		.A2(A6),
		.A3(A7),
		.B0(B4),
		.B1(B5),
		.B2(B6),
		.B3(B7),
		.C0in(C0),
		.S0(S4),
		.S1(S5),
		.S2(S6),
		.S3(S7),
		.C(C1)
	);
	
	assign S = {S7, S6, S5, S4, S3, S2, S1, S0};
	
endmodule