#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define CONST_CELERITY (double(299792458.0))
#define CONST_BOLTZMANN (double(1.3806503e-23))
#define CONST_PLANCK (double(1.054571726e-34))
#define CONST_PI (double(3.141592653589793238))
#define CONST_STEFAN (double(5.670400e-8))
#define CONST_MAXSTEPS (100000)
//#define CONST_SPECTRAL_LUM (double(683.0)) // day
#define CONST_SPECTRAL_LUM (double(1700.0)) // night

#define CONST_CALC (CONST_PLANCK/(CONST_PI*CONST_PI*CONST_CELERITY*CONST_CELERITY))
#define CONST_WAVELENGTH (4*CONST_PI*CONST_PI*CONST_PLANCK*CONST_CELERITY*CONST_CELERITY)

// find the pulsation matching to a given wavelength in the vacuum
#define omega(l) (2*CONST_PI*CONST_CELERITY/l)
#define wavelength(o) (2*CONST_PI*CONST_CELERITY/o)

#define I(t,o) (o*o*o/(exp(CONST_PLANCK*o/(CONST_BOLTZMANN*t))-1))

// gaussian approximation
//#define V(o) (exp(-pow((wavelength(o)-559.1e-9)/42.4e-9, 2.0)/2)) // day
#define V(o) (exp(-pow((wavelength(o)-502.8e-9)/39.5e-9, 2.0)/2)) // night

#define F(i,o) (i*V(o))

int main( int argc, const char* argv[] )
{
    if(argc < 5) 
    {
        printf("missing parameters");
        return 1;
    }

    double temperature = strtod(argv[1], NULL), om_from = omega(strtod(argv[2], NULL)), om_to = omega(strtod(argv[3], NULL));
    if(om_from > om_to) { double aux = om_from; om_from = om_to; om_to = aux; }
    int steps = atoi(argv[4]);
    if(steps < 100) steps = 100;

    double power = 0, power_coef = 0, cur = 0, cur_coef = 0;
    double step = (om_to-om_from)/double((steps <= CONST_MAXSTEPS ? steps : CONST_MAXSTEPS));

    int delta = steps/150;
    int saved = steps/delta; 

    double *pulsations = new double[saved+1], *powers = new double[saved+1], *powers_coef = new double[saved+1];

    
    int i = 0, k = delta;
    for(double omega = om_from; omega < om_to; omega += step)
    {
        cur = (1.0/4.0)*I(temperature, omega);
        cur_coef = F(cur, omega);
        power += cur;
        power_coef += cur_coef;

        if(k == delta) 
        {
            pulsations[i] = omega;
            powers[i] = cur;
            powers_coef[i] = cur_coef;
            ++i;
            k = 0;
        }
        ++k;
    }

    power *= CONST_CALC * step;
    power_coef *= CONST_CALC * step;
    double lum = CONST_SPECTRAL_LUM * power_coef;

    double total = CONST_STEFAN * temperature * temperature * temperature * temperature;

    // power.calculated(W/m²)   total.power(W/m²)   error   visible.power(W/m²) visible.power/total, efficiency(L/W) 
    printf("%lf %lf %lf %lf %lf %lf", power, total, power/total, power_coef, power_coef/total, lum/total);

    /*char filename[32] = "";
    sprintf(filename, "data/%d.dat", (int)temperature);
    FILE *fp = fopen(filename, "w+");
    if(fp) for(int i = 0; i < saved; ++i)
    {
       double wavelength = wavelength(pulsations[i]);
       double emit = powers[i]/(pow(pulsations[i], 3.0)*pow(wavelength, 5)) * CONST_WAVELENGTH;
       double emit_coef = powers_coef[i]/(pow(pulsations[i], 3.0)*pow(wavelength, 5)) * CONST_WAVELENGTH * CONST_SPECTRAL_LUM;
       fprintf(fp, "%.5e;%.5e;%.5e\n", wavelength(pulsations[i])*1e9, emit, emit_coef);
    }
    fclose(fp);*/
}
