set terminal epslatex
set out '../figures/eta.tex'

set xlabel '$T$ (en K)'
set ylabel '$\eta(T)$'

plot '../../night.res' u 1:6 t '' lc rgb 'black' w l



