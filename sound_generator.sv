module sound_interface(
	input logic clk,
	input logic alarm_trigger,
	output logic speaker_out
);

	parameter SAMPLE_RATE = 50_000_000;
	parameter NOTE1_FREQUENCY = 1_000;
	parameter NOTE2_FREQUENCY = 2_000;
	
	//Counter for Generating Sound Frequency for Note 1
	logic [$clog2(SAMPLE_RATE/NOTE1_FREQUENCY)-1:0] sound_counter_1;
	always_ff @ (posedge clk) begin 
		if(alarm_trigger) begin 
			sound_counter_1 <= sound_counter_1 + 1;
		end 
		else begin 
			sound_counter_1 <= 0;
		end
	end
	
	//Counter for Generating Sound Frequency for Note 2
	logic [$clog2(SAMPLE_RATE/NOTE2_FREQUENCY)-1:0] sound_counter_2;
	always_ff @ (posedge clk) begin 
		if(alarm_trigger) begin 
			sound_counter_2 <= sound_counter_2 + 1;
		end 
		else begin 
			sound_counter_2 <= 0;
		end
	end
	
	assign speaker_out = (sound_counter_1 < (SAMPLE_RATE/NOTE1_FREQUENCY)/2) ||
								(sound_counter_2 < (SAMPLE_RATE/NOTE2_FREQUENCY)/2);
								
endmodule