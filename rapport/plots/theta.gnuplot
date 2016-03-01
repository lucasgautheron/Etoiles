set terminal epslatex
set out '../figures/theta.tex'

set xlabel '$T$ (en K)'
set ylabel '$\theta(T)$'

# vega
set object circle at 9600,120710973 radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder
set label 'Vega' at 8400,205710973 front

# alpha centuri
set object circle at 5260,62454321 radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label '$\alpha$ Centaure' at 2500,154022988 front

# Sirius
set object circle at 24800,591329952 radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'Sirius A' at 22000,677592968 front

# Sirius B
set object circle at 24800,591329952 radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'Sirius A' at 22000,677592968 front

# R-Doradus
#set object circle at 2700,6497359 radius char 0.2\
#    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

#set label 'R-Dor.' at 1500,14497359 front

# Deneb
set object circle at 15000,482348111 radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'E. C. Majoris' at 14000,602348111 front

set grid front

plot '../../night.res' u 1:9 t '' lc rgb 'green' w filledcurves y1=0 \
fs transparent solid 0.25



