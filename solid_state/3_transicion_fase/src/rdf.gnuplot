set title 'Radial Distribution Function '.dir
set key autotitle columnhead
unset key
set xlabel "r(Angstrom)"
plot dir.'/rdf.txt' w l

pause -1
