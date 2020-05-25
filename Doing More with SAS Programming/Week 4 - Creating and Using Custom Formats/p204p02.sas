***********************************************************;
*  LESSON 4, PRACTICE 2                                   *;
*  a) Before the DATA step, add a PROC FORMAT step to     *;
*     create a format named PSIZE that categorizes parks  *;
*     based on the gross acres. Use the ranges and values *;
*     as identified below.                                *;
*     Less than 10,000 acres => Small                     *;
*     10,000 through less than 500,000 acres => Average   *;
*     500,000 and more acres => Large                     *;
*  b) In the DATA step, add an assignment statement to    *;
*     create a new column named ParkSize. Use the PUT     *;
*     function to create the new column based on the      *;
*     formatted values of GrossAcres.                     *;
*  c) Run the program and view the output table. Verify   *;
*     the values of the ParkSize column.                  *;
***********************************************************;

/* Add a PROC FORMAT Step */

data np_parksize;
    set pg2.np_acres;

    format GrossAcres comma16.;
run;
	
