vsim work.set_time_interface 

add wave *

force reset 0 @ 0 
force btn_set_time 0 @ 0
force btn_inc_hours 0 @ 0
force btn_inc_mins 0 @ 0


force clk 1 0, 0 {1 ps} -r 2

force reset 1 @ 1, 0 @ 3



force btn_set_time 1 @ 15, 0 @ 17

#set hour to 5
force btn_inc_hours 1 @ 18, 0 @ 20
force btn_inc_hours 1 @ 21, 0 @ 23
force btn_inc_hours 1 @ 24, 0 @ 26
force btn_inc_hours 1 @ 27, 0 @ 29
force btn_inc_hours 1 @ 30, 0 @ 32

force btn_set_time 1 @ 33, 0 @ 35

#set minute to 5
force btn_inc_mins 1 @ 36, 0 @ 38
force btn_inc_mins 1 @ 39, 0 @ 41
force btn_inc_mins 1 @ 42, 0 @ 44
force btn_inc_mins 1 @ 45, 0 @ 47
force btn_inc_mins 1 @ 48, 0 @ 50


force btn_set_time 1 @ 51, 0 @ 53


run 100
