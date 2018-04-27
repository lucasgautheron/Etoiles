set terminal epslatex
set out '../figures/theta_atmosphere.tex'

set xlabel '$T$ (en K)'
set ylabel '$\theta$ (mas)'

set xrange [1500:25000]

f(x) = 1.56887285063 * 10**(-6/5) * (9600/x)**2
g(x,y,m) = 1.56887285063 * 10**(-m/5) * sqrt(0.146/y) * (9600/x)**2

# vega
set object circle at 9600,(206265000/120710973) radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder
set label 'Vega' at 10000,1 front

# alpha centuri
set object circle at 5260,(206265000/62454321) radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label '$\alpha$ Centaure' at 2500,5 front

# proxima centuri
set object circle at 3040,0.5 radius char 0.25 \
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'P. Centaure' at 900,0.25 front


# EC A
set object circle at 15000,(0.42763) radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'Eta Carinae A' at 13500,0.8 front

# Deneb

set object circle at 8000,(1.2) radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'Deneb' at 6500,1.8 front

# Deneb

set object circle at 9940,(3.0) radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'Sirius' at 9000,4.0 front

# Rho Cassiopeiae
set object circle at 7500,(206265000/245733525.734) radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label '$\rho$ Cass.' at 5300,0.5 front

set object circle at 1830,102 radius char 0.25\
    front fillcolor rgb 'black' fillstyle solid 1.0 noborder

set label 'V762 Cas' at 1400,200 front

set grid front

#set xtics 20000

set logscale y

unset key
plot for [i=1:16] '../../night_el_'.(10+5*i).'.res' using 1:(206265000/$11) title ''.(10+5*i).' deg' w l lw 2, '' u 1:(g($1,$9,6)) w l lw 5 dt 5 lc rgb '#8B0000' t '$m_V = $ 6'



