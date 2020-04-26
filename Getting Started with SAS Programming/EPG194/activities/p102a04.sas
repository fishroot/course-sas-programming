***********************************************************;
*  Viewing Table and Column Attributes                    *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC CONTENTS DATA=data-set;                         *;
*    RUN;                                                 *; 
***********************************************************;

proc contents data="s:\workshop\data\class_birthdate.sas7bdat";
run;

***********************************************************;
*  Activity 2.04                                          *;
*    1) Write a PROC CONTENTS step to generate a report   *;
*       of the STORM_SUMMARY.SAS7BDAT table properties.   *;
*       Highlight the step and run only the selected      *;
*       code.                                             *;
*    2) How many observations are in the table?           *;
*    3) How is the table sorted?                          *;
***********************************************************;

*Write a PROC CONTENTS step reading storm_summary.sas7bdat;
