#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <vector>

#define PI (double(3.141592653589793238))

int main( int argc, const char* argv[] )
{
    const int steps = 5000;
    const int angles = 500;
    const double L = 8;
    const double R = 6400;
    const double xmax = 100;
    double angle[angles];
    double factor[angles];

    for(int i = 0; i < angles; ++i)
    {
        angle[i] = PI * double(i) / double(angles) / 2.0;
        factor[i] = 0;
        for(int j = 0; j < steps; ++j)
        {
            double x = xmax * double(j) / double(steps);
            factor[i] += exp(-x/L) * (x+R) / (sqrt( (x+R)*(x+R) - R*R * cos(angle[i]) * cos(angle[i]))) * xmax / double(steps);
        }
        factor[i] /= L;

        printf("%f %f %f\n", angle[i], angle[i] * 180 / PI, factor[i]);
    }
}
