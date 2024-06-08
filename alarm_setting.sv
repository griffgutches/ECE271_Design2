module set_alarm_interface(
	input logic clk,
	input logic reset,
	input logic btn_set_alarm,
	input logic btn_inc_hours,
	input logic btn_inc_mins,
	input logic btn_disable_alarm,
	input logic [7:0] real_hours,
	input logic [7:0] real_mins,
	output logic [7:0] alarm_hours,
	output logic [7:0] alarm_mins,
	output logic alarm_enabled,
	output logic alarm_triggered,
	output logic speaker_out
);

	logic [2:0] state;
	
	//State Definitions
	localparam IDLE = 3'b000;
	localparam SET_HOURS = 3'b001;
	localparam SET_MINS = 3'b010;
	localparam ALARM_ON = 3'b011;
	localparam ALARM_TRIGGERED = 3'b100;
	localparam ALARM_OFF = 3'b101;
	
	//Instantiate Sound Module
	sound_interface sound_inst(
		.clk(clk),
		.alarm_trigger(alarm_triggered),
		.speaker_out(speaker_out)
	);
		
	
	//State Register
	always_ff @(posedge clk or posedge reset) begin 
		if(reset)
			state <= IDLE;
		else begin 
			case(state)
				IDLE: begin 
					if(btn_set_alarm)
						state <= SET_HOURS;
				end 
				SET_HOURS: begin 
					if(btn_inc_hours)
						alarm_hours <= (alarm_hours + 1) % 24;
					else if(btn_set_alarm)
						state <= SET_MINS;
				end
				SET_MINS: begin 
					if(btn_inc_mins)
						alarm_mins <= (alarm_mins + 1) % 60;
					else if(btn_set_alarm)
						state <= ALARM_ON;
				end
				ALARM_ON: begin 
					if(btn_disable_alarm)
						state <= ALARM_OFF;
					else if((alarm_hours == real_hours) && (alarm_mins == real_mins))
						state <= ALARM_TRIGGERED;
				end
				ALARM_TRIGGERED: begin
					state <= ALARM_OFF;
				end
				ALARM_OFF: begin 
					alarm_hours <= 0;
					alarm_mins <= 0;
					state <= IDLE;
				end
			endcase
		end
	end
	
	assign alarm_enabled = (state == ALARM_ON);
	assign alarm_triggered = (state == ALARM_TRIGGERED);
	
endmodule