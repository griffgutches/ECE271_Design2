vsim work.set_alarm_interface 

add wave *

force reset 0 @ 0 
force btn_set_alarm 0 @ 0
force btn_inc_hours 0 @ 0
force btn_inc_mins 0 @ 0
force btn_disable_alarm 0 @ 0




force clk 1 0, 0 {1 ps} -r 2

force reset 1 @ 1, 0 @ 3



force btn_set_alarm 1 @ 15, 0 @ 17

#set hour to 3
force btn_inc_hours 1 @ 18, 0 @ 20
force btn_inc_hours 1 @ 21, 0 @ 23
force btn_inc_hours 1 @ 24, 0 @ 26

force btn_set_alarm 1 @ 27, 0 @ 29

#set minute to 2
force btn_inc_mins 1 @ 30, 0 @ 32
force btn_inc_mins 1 @ 33, 0 @ 35

force btn_set_alarm 1 @ 36, 0 @ 38

force real_hours 00000011 @ 60
force real_mins 00000010 @ 60

run 100
