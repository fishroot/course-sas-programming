***********************************************************;
*  Activity 5.01                                          *;
*  1) Notice the SET statement concatenates the           *;
*     SASHELP.CLASS and PG2.CLASS_NEW2 tables. Highlight  *;
*     the DATA step and run the selected code. What       *;
*     differences do you observe between the first 19     *;
*     rows and the last 3 rows?                           *;
*  2) Use the RENAME= data set option to change Student   *;
*     to Name in the PG2.CLASS_NEW2 table. Highlight the  *;
*     DATA step and run the selected code. What warning   *;
*     is issued in the log?                               *;
*  3) Highlight the two PROC CONTENTS steps and run the   *;
*     selected code. What is the length of Name in        *;
*     SASHELP.CLASS and Student in PG2.CLASS_NEW2?        *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data class_current;
    set sashelp.class 
        pg2.class_new2(rename=(Student=Name));
run;

proc contents data=sashelp.class;
run;

proc contents data=pg2.class_new2;
run;
