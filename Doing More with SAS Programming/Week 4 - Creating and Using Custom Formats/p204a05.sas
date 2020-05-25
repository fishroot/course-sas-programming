***********************************************************;
*  Activity 4.05                                          *;
*  1) In the PROC FORMAT statement, add the LIBRARY=      *;
*     option to save the formats to the PG2.FORMATS       *;
*     catalog.                                            *;
*  2) Run the PROC FORMAT step and verify in the log that *;
*     the two formats were created in a permanent         *;
*     location.                                           *;
*  3) Before the PROC PRINT step, add an OPTIONS          *;
*     statement so that SAS can find the two permanent    *;
*     formats.                                            *;
*         options fmtsearch=(pg2.formats);                *;
*  4) Run the OPTIONS statement and the PROC PRINT step.  *;
*     Are the Gender and Height values formatted?         *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc format library=pg2;
*/ OR proc format library=pg2.formats;  
    value $gender 'F'='Female'
                  'M'='Male'
                  other='Miscoded';
    value hght low-<58  = 'Below Average'
                58-60   = 'Average'
               60<-high = 'Above Average';
run;

options fmtsearch=(pg2);
*/ OR options fmtsearch=(pg2.formats); 

proc print data=pg2.class_birthdate noobs;
    where Age=12;
    var Name Gender Height;
    format Gender $gender. Height hght.;
run;
