module parser(input logic[7:0] x, output logic [3:0] ones, tens);
	
	always_comb begin
	ones = (x % 10);
	tens = ((x / 10) % 10);
	end
endmodule