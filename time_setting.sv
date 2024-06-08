module set_time_interface(
	input logic clk,
	input logic reset,
	input logic btn_set_time,
	input logic btn_inc_hours,
	input logic btn_inc_mins,
	output logic [7:0] set_hours,
	output logic [7:0] set_mins
);

	logic [2:0] state;
	
	//State Definitions
	localparam IDLE = 3'b000;
	localparam SET_CURRENT_HOURS = 3'b001;
	localparam SET_CURRENT_MINS = 3'b010;
	
	//State Register
	always_ff @(posedge clk or posedge reset) begin 
		if(reset) begin
			state <= IDLE;
			set_hours <= 8'b0000_0000;
			set_mins <= 8'b0000_0000;
		end else begin 
			case(state)
				IDLE: begin 
					if(btn_set_time)
						state <= SET_CURRENT_HOURS;
				end 
				SET_CURRENT_HOURS: begin 
					if(btn_inc_hours)
						set_hours <= (set_hours + 1) % 24;
					else if(btn_set_time)
						state <= SET_CURRENT_MINS;
				end
				SET_CURRENT_MINS: begin 
					if(btn_inc_mins)
						set_mins <= (set_mins + 1) % 60;
					else if(btn_set_time)
						state <= IDLE;
				end
			endcase
		end
	end
	
endmodule