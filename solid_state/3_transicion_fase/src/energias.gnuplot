set title 'Potential Energy '.dir
set xlabel "Step"
set ylabel "Energy (eV)"
set key autotitle columnhead
unset key
plot dir.'/energias.txt' u 2

pause -1
