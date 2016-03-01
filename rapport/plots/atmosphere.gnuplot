set terminal epslatex
set out '../figures/atmosphere.tex'

set xlabel '$\lambda$ (en nm)'
set ylabel '$A$'

set xrange [270:900]
set yrange [0:1.1]

plot '../../atmosphere.res' u 1:5 t 'Transmission' lc rgb 'black' w l



