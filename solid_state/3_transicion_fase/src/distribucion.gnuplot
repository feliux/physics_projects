set title 'Espatial Distribution'.dir
set key autotitle columnhead
unset key
set pm3d map
set dgrid3d 51,51
set size square
set palette model CMY rgbformulae 7,5,15
set xlabel "y (Angstrom)"
set ylabel "x (Angstrom)"
splot dir.'/distribucion.txt' t ""

pause -1
