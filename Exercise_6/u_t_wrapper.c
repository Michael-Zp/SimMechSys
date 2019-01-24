
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
void u_t_Outputs_wrapper(const real_T *u0,
			real_T *speed,
			const real_T *xC,
			const real_T *L, const int_T p_width0,
			const real_T *cm, const int_T p_width1,
			const real_T *J, const int_T p_width2,
			const real_T *R, const int_T p_width3,
			const real_T *D, const int_T p_width4)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This sample sets the output equal to the input
      y0[0] = u0[0]; 
 For complex signals use: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
 */

speed[0]=xC[0];
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Derivatives function
 *
 */
void u_t_Derivatives_wrapper(const real_T *u0,
			real_T *speed,
			real_T *dx,
			real_T *xC,
			const real_T *L, const int_T p_width0,
			const real_T *cm, const int_T p_width1,
			const real_T *J, const int_T p_width2,
			const real_T *R, const int_T p_width3,
			const real_T *D, const int_T p_width4)
{
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_BEGIN --- EDIT HERE TO _END */
/*
 * Code example
 *   dx[0] = xC[0];
 */

dx[0] = (u0[0] - xC[1] * R[0] - xC[0] * cm[0]) / L[0];
dx[1] = (xC[1] * cm[0] - xC[0] * D[0]) / J[0];
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_END --- EDIT HERE TO _BEGIN */
}

