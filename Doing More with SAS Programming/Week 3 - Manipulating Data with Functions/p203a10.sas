***********************************************************;
*  Activity 3.10                                          *;
*  1) Highlight the PROC CONTENTS step and run the        *;
*     selected code. What is the type of High, Low, and   *;
*     Volume?                                             *;
*  2) Highlight the DATA and PROC PRINT steps and run the *;
*     selected code. Notice that although High is a       *;
*     character column, the Range column is accurately    *;
*     calculated.                                         *;
*  3) Open the log. Read the note printed immediately     *;
*     after the DATA step.                                *;
*  4) Uncomment the DailyVol assignment statement and run *;
*     the program. Is DailyVol created successfully?      *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc contents data=pg2.stocks2;
run;

data work.stocks2;
   set pg2.stocks2;
   Range=High-Low;
   DailyVol=Volume/30;
run;

proc print data=stocks2(obs=10);
run;


