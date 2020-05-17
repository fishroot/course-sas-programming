***********************************************************;
*  LESSON 3, PRACTICE 1                                   *;
*  a) Highlight the PROC PRINT step and run the selected  *;
*     code. Examine the column names and the 10 rows      *;
*     printed from the np_lodging table.                  *;
*  b) Use the LARGEST function to create three new        *;
*     columns (Stay1, Stay2, and Stay3) whose values are  *;
*     the first, second, and third highest number of      *;
*     nights stayed from 2010 through 2017.               *;
*  c) Use the MEAN function to create a column named      *;
*     StayAvg that is the average number of nights stayed *;
*     for the years 2010 through 2017. Use the ROUND      *;
*     function to round values to the nearest integer.    *;
*  d) Add a subsetting IF statement to output only rows   *;
*     with StayAvg greater than zero. Highlight the DATA  *;
*     step and run the selected code.                     *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc print data=pg2.np_lodging(obs=10);
	where CL2010>0;
run;

data stays;
    set pg2.np_lodging;
    Stay1=largest(1, of CL:);
    Stay2=largest(2, of CL:);
    Stay3=largest(3, of CL:);
    StayAvg=round(mean(of CL:));
    if StayAvg > 0;
    format Stay: comma11.;
    keep Park Stay:;
run;
