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

%let path=~/EPG294/data;
libname PG2 "&path";

proc format;
    value psize low-<10000='Small'
                10000-<500000='Average'
                500000-high='Large';
run;

data np_parksize;
    set pg2.np_acres;
    ParkSize=put(GrossAcres,psize.);
    format GrossAcres comma16.;
run;
	
