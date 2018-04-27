set terminal epslatex
set out '../figures/eta.tex'

set xlabel '$T$ (en K)'
set ylabel '$\eta(T)$'

plot '../../night.res' u 1:6 t 'human eye' lc rgb 'black' w l, '' u 1:9 t 'V band' w l dt 4



