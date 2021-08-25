set xlabel "x (Angstrom)"
set ylabel "y (Angstrom)"
set size square


set key autotitle columnhead
unset key
stats dir.'/dinamica.txt' nooutput
set xrange [0:STATS_max_x]
set yrange [0:STATS_max_y]
M=(180/STATS_max_x)
plot dir.'/dinamica.txt' every ::2::201 w p pt 7 ps M t ""; pause 2

N = floor(STATS_records/200.)
do for [i=2:N] {plot dir.'/dinamica.txt' every ::(i-1)*200+2::i*200+1 w p pt 7 ps M t ""; pause 0.2} 

pause -1
