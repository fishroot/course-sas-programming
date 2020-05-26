***********************************************************;
*  Activity 7.03                                          *;
*  1) Highlight the PROC PRINT step and run the selection.*;
*     Note how many rows are in the SASHELP.CLASS table.  *;
*  2) Highlight the PROC TRANSPOSE step and run the       *;
*     selection. Answer the following questions:          *;
*     Which columns from the input table are transposed   *;
*     into rows?                                          *;
*     What does each column in the output table represent?*;
*     What is the name of the output table?               *;
***********************************************************;

proc print data=sashelp.class;
run;

proc transpose data=sashelp.class;
run;

***********************************************************;
*  Activity 7.04                                          *;
*  1) Add the OUT= option on the PROC TRANSPOSE statement *;
*     (in the program above) to create an output table    *;
*     named CLASS_T.                                      *;
*  2) Add the following ID statement and run the step.    *;
*     What changes in the results?                        *;
*        id Name;                                         *;
*  3) Add the following VAR statement and run the step.   *;
*     What changes in the results?                        *;
*        var Height Weight;                               *;
***********************************************************;
