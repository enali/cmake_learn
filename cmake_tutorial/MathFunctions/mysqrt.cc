#ifndef MATH_H
#define MATH_H
#include <math.h>
#endif

double mysqrt(double val) {
#if defined (HAVE_LOG) && defined (HAVE_EXP)
  return exp(log(val)*0.5);
#else
  return sqrt(val);
#endif
}
