***********************************************************;
*  LESSON 3, PRACTICE 2                                   *;
*  a) Run the program and notice that each row includes a *;
*     datetime value and rain amount. The                 *;
*     MonthlyRainTotal column represents a cumulative     *;
*     total of Rain for each value of Month.              *;
*  b) Uncomment the subsetting IF statement to continue   *;
*     processing a row only if it is the last row within  *;
*     each month. After the subsetting IF statement,      *;
*     create the following new columns:                   *;
*     1) Date - the date portion of the DateTime column   *;
*     2) MonthEnd - the last day of the month             *;
*  c) Format Date and MonthEnd as a date value and keep   *;
*     only the StationName, MonthlyRainTotal, Date, and   *;
*     MonthEnd columns.                                   *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data rainsummary;
    set pg2.np_hourlyrain;
    by Month;
    if first.Month=1 then MonthlyRainTotal=0;
    MonthlyRainTotal+Rain;
    if last.Month=1;
    Date=datepart(DateTime);
    MonthEnd=intnx('month',Date,0,'end');
    format Date MonthEnd date9.;
    keep StationName MonthlyRainTotal Date MonthEnd;
run;




