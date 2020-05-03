***********************************************************;
*  Activity 2.08                                          *;
*    1) If necessary, update the path of the course files *;
*       in the LIBNAME statement.                         *;
*    2) Complete the PROC CONTENTS step to read the parks *;
*       table in the NP library.                          *;
*    3) Complete the LIBNAME statement to clear the NP    *;
*       library.                                          *;
*    4) Run the program and examine the log. Which column *;
*       names were modified to follow SAS naming          *;
*       conventions?                                      *;
***********************************************************;

options validvarname=v7;

*Update the location of the course files if necessary;
libname np xlsx "s:/workshop/data/np_info.xlsx";

proc contents data= ;
run;

libname ;
