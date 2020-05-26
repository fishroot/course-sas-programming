***********************************************************;
*  LESSON 6, PRACTICE 1                                   *;
*  a) Add an iterative DO loop around the sum statement   *;
*     for Invest.                                         *;
*     1) Add a DO statement that creates the column Year  *;
*        with values ranging from 1 to 6.                 *;
*     2) Add an OUTPUT statement to show the value of the *;
*        retirement account for each year.                *;
*     3) Add an END statement.                            *;
*  b) Run the program and review the results.             *;
*  c) Add an inner iterative DO loop between the sum      *;
*     statement and the OUTPUT statement to include the   *;
*     accrued quarterly compounded interest based on an   *;
*     annual interest rate of 7.5%.                       *;
*     1) Add a DO statement that creates the column       *;
*        Quarter with values ranging from 1 to 4.         *;
*     2) Add a sum statement to add the accrued interest  *;
*        to the Invest value.                             *;
*            Invest+(Invest*(.075/4));                    *;
*     3) Add an END statement.                            *;
*  d) Run the program and review the results.             *;
*  e) Drop the Quarter column. Run the program and review *;
*     the results.                                        *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

/* Level 1 Practice: Using Nested Iterative DO Loops (DATA Step with No SET Statement) */

/* Task 1 */

data retirement;
    do Year = 1 to 6;
       Invest+10000;
       output;
    end;
run;

title1 'Retirement Account Balance per Year';
proc print data=retirement noobs;
    format Invest dollar12.2;
run;
title;


/* Task 2 + 3*/

data retirement;
    do Year = 1 to 6;
       Invest+10000;
       do Quarter = 1 to 4;
          Invest+(Invest*(.075/4));
       end;
       output;
    end;
    drop Quarter;
run;

title1 'Retirement Account Balance per Year';
proc print data=retirement noobs;
    format Invest dollar12.2;
run;
title;