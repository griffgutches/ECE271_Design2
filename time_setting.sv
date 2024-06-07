module set_time_interface(
	input logic clk,
	input logic reset,
	input logic btn_set_time,
	input logic btn_inc_hours,
	input logic btn_inc_mins,
	output logic [7:0] current_hours,
	output logic [7:0] current_mins
);

	logic [2:0] state;
	
	//State Definitions
	localparam IDLE = 3'b000;
	localparam SET_CURRENT_HOURS = 3'b001;
	localparam SET_CURRENT_MINS = 3'b010;
	
	//State Register
	always_ff @(posedge clk or posedge reset) begin 
		if(reset)
			state <= IDLE;
		else begin 
			case(state)
				IDLE: begin 
					if(btn_set_time)
						state <= SET_CURRENT_HOURS;
				end 
				SET_CURRENT_HOURS: begin 
					if(btn_inc_hours)
						current_hours <= (current_hours + 1) % 24;
					else if(btn_set_time)
						state <= SET_CURRENT_MINS;
				end
				SET_CURRENT_MINS: begin 
					if(btn_inc_mins)
						current_mins <= (current_mins + 1) % 60;
					else if(btn_set_time)
						state <= IDLE;
				end
			endcase
		end
	end
	
endmodule