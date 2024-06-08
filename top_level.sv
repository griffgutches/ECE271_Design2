module top_level(
	input logic clk,
	input logic reset,
	input logic btn_set_alarm,
	input logic btn_inc_alarm_hours,
	input logic btn_inc_alarm_mins,
	input logic btn_disable_alarm,
	input logic btn_set_time,
	input logic btn_inc_time_hours,
	input logic btn_inc_time_mins,
	output logic [6:0] seg1, //Display Minutes 1's
	output logic [6:0] seg2, //Display Minutes 10's
	output logic [6:0] seg3, //Display Hours 1's
	output logic [6:0] seg4, //Display Minutes 10's
	output logic speaker_out
);

	logic [7:0] current_hours;
	logic [7:0] current_mins;
	logic [7:0] real_hours;
	logic [7:0] real_mins;
	logic [7:0] alarm_hours;
	logic [7:0] alarm_mins;
	logic alarm_enabled;
	logic alarm_triggered;
	
	set_alarm_interface set_alarm_inst(
		.clk(clk),
		.reset(reset),
		.btn_set_alarm(btn_set_alarm),
		.btn_inc_hours(btn_inc_alarm_hours),
		.btn_inc_mins(btn_inc_alarm_mins),
		.btn_disable_alarm(btn_disable_alarm),
		.real_hours(real_hours),
		.real_mins(real_mins),
		.alarm_hours(alarm_hours),
		.alarm_mins(alarm_mins),
		.alarm_enabled(alarm_enabled),
		.alarm_triggered(alarm_triggered),
		.speaker_out(speaker_out)
	);
	
	set_time_interface set_time_inst(
		.clk(clk),
		.reset(reset),
		.btn_set_time(btn_set_time),
		.btn_inc_hours(btn_inc_time_hours),
		.btn_inc_mins(btn_inc_time_mins),
		.set_hours(current_hours),
		.set_mins(current_mins)
	);
	
	
	
	
	Clock_Design2 clock_inst(
		.clk(clk),
		.Reset(reset),
		.current_hours(current_hours),
		.current_mins(current_mins),
		.real_hrs(real_hours),
		.real_mins(real_mins),
		.Seg1(seg1),
		.Seg2(seg2),
		.Seg3(seg3),
		.Seg4(seg4)
);
	
	
endmodule