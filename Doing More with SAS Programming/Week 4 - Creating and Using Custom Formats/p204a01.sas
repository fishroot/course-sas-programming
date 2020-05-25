***********************************************************;
*  Activity 4.01                                          *;
*  1) Add a FORMAT statement in the DATA step to format   *;
*     the following values:                               *;
*       Date => 3-letter month and 4-digit year (MONYY7.) *;
*       Volume => Add commas (COMMA12.)                   *;
*       CloseOpenDiff, HighLowDiff =>                     *;
*           Add dollar signs and include 2 decimal        *;
*           places (DOLLAR8.2)                            *;
*  2) Run the program and verify the formatted values in  *;
*     the PROC PRINT output.                              *;
*  3) Add a FORMAT statement in the PROC MEANS step to    *;
*     format the values of Date to show only a four-digit *;
*     year. Run the PROC MEANS step again.                *;
*  4) What is the advantage of adding a FORMAT statement  *;
*     to the DATA step versus the PROC step?              *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data work.stocks;
    set pg2.stocks;
    CloseOpenDiff=Close-Open;
    HighLowDiff=High-Low;
    format Date monyy7. Volume comma12.
       CloseOpenDiff HighLowDiff dollar8.2;
run;

proc print data=stocks (obs=5);
    var Stock Date Volume CloseOpenDiff HighLowDiff;
run;

proc means data=stocks maxdec=0 nonobs mean min max;
    class Stock Date;
    var Open; 
    format Date year4.;
run;

