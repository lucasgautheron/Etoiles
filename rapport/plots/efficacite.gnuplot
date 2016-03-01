set terminal epslatex
set out '../figures/efficacite.tex'

set xlabel '$\lambda$ (en nm)'
set ylabel '$V(\lambda)$'

gauss(x) = exp(-(x-m)**2/(2*s**2))

m=505
s=40

fit gauss(x) '../../scotopique' u 1:2 via m,s

plot '../../scotopique' u 1:2 t 'donnees' lc rgb 'black', gauss(x) t 'fit gaussien'



