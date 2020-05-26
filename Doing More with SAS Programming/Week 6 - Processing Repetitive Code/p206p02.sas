***********************************************************;
*  LESSON 6, PRACTICE 2                                   *;
*  a) Run the program and review the results. Notice that *;
*     the initial program is showing the forecasted value *;
*     for the next year. The next year is based on adding *;
*     one year to the year value of today's date.         *;
*     Depending on the current date, your NextYear value  *;
*     might be bigger than the NextYear value in the      *;
*     following results.                                  *;
*  b) Add an iterative DO loop around the conditional     *;
*     IF-THEN statements.                                 *;
*     1) The DO loop needs to iterate five times.         *;
*     2) In the DO statement, a new column named Year     *;
*        needs to be created that starts at the value of  *;
*        NextYear and stops at the value of NextYear plus *;
*        4.                                               *;
*     3) A row needs to be created for each year.         *;
*  c) Modify the KEEP statement to keep the column Year   *;
*     instead of NextYear.                                *;
*  d) Run the program and review the results.             *;
*  e) (Optional) Modify the OUTPUT statement to be a      *;
*     conditional statement that outputs only on the      *;
*     fifth iteration. Run the program and review the     *;
*     results.                                            *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data ForecastDayVisits;  
    set pg2.np_summary;
    where Reg='PW' and Type in ('NM','NP');
    ForecastDV=DayVisits;
    NextYear=year(today())+1;
    do Year = NextYear to NextYear+4;
       if Type='NM' then ForecastDV=ForecastDV*1.05;
       if Type='NP' then ForecastDV=ForecastDV*1.08;
       if Year=NextYear+4 then output;
    end;
    format ForecastDV comma12.;
    label ForecastDV='Forecasted Recreational Day Visitors';
    keep ParkName DayVisits ForecastDV Year;
run;

proc sort data=ForecastDayVisits;
    by ParkName;
run;

title 'Forecast of Recreational Day Visitors for Pacific West';
proc print data=ForecastDayVisits label;
run;
title