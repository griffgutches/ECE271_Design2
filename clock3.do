vsim work.Clock_Design2

add wave *

force Reset 0 @ 0

force current_hours 00000101 @ 0 
force current_mins 00000101  @ 0 
 
force Reset 1 @ 1, 0 @ 3

force CLK 1 0, 0 {1 ps} -r 2

run 500

