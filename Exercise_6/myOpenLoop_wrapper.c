
/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define y_width 1

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output function
 *
 */
void myOpenLoop_Outputs_wrapper(real_T *y0,
			const real_T *xC,
			const real_T *L, const int_T p_width0,
			const real_T *cm, const int_T p_width1,
			const real_T *J, const int_T p_width2,
			const real_T *D, const int_T p_width3,
			const real_T *R, const int_T p_width4)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This sample sets the output equal to the input
      y0[0] = u0[0]; 
 For complex signals use: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
 */

y0[0]=xC[1];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Derivatives function
 *
 */
void myOpenLoop_Derivatives_wrapper(const real_T *u0,
			real_T *y0,
			real_T *dx,
			real_T *xC,
			const real_T *L, const int_T p_width0,
			const real_T *cm, const int_T p_width1,
			const real_T *J, const int_T p_width2,
			const real_T *D, const int_T p_width3,
			const real_T *R, const int_T p_width4)
{
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_BEGIN --- EDIT HERE TO _END */
/*
 * Code example
 *   dx[0] = xC[0];
 */

//dx[0]=1/T[0]*(k[0]*u0[0]-xC[0]);

dx[0] = u0[0];

/*
double speed = 0;
double ut_out = 0;
double ut_integ = 0;
double ut_in = 0;
double dti = 0;
double pJ_1 = 0;

ut_out = u0[0] - ut_in - speed * cm[0];
ut_integ = (ut_out / L[0] + ut_out);
ut_in = ut_integ * R[0];

dti = ut_integ * cm[0];

pJ_1 = dti - speed * D[0];

speed = pJ_1 / J[0] + speed;
dx[0]=speed;

*/
 
/*
double speed = pJ_1 * 1/J;
double pJ_1 = dti * cm - speed * D;
double dti = ut * 1/L;
double ut = u0[0] - dti * R - speed * cm;


double pJ_1 + pJ_1 * 1/J * D = dti * cm ;
double dti = ut * 1/L;
double ut = u0[0] - dti * R - pJ_1 * 1/J * cm;

pJ_1 * (1 + D/J) = ut * 1/L * cm;


double speed = ((ut * 1/L) * cm - speed * D) * 1/J;
double ut = u0[0] - ut * 1/L * R - speed * cm;

ut + ut * 1/L * R = u0[0] - speed * cm;
ut * (1 + R/L) = u0[0] - speed * cm;
ut = (u0[0] - speed * cm) / (1 + R/L);


double speed = (dti * cm - speed * D) * 1/J;
double dti = ut * 1/L;
double ut = u0[0] - dti * R - speed * cm;

speed = (dti * cm - speed * D) * 1/J;
speed = (dti * cm) / J - (speed * D) / J;
speed + (speed * D) / J = (dti * cm) / J;
speed * (1 + D / J) = (dti * cm) / J;
speed = ((((u0[0] - speed * cm) / (1 + R/L)) * cm/L) / J) / (1 + D / J);
*/
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_END --- EDIT HERE TO _BEGIN */
}

