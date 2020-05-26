**************************************************;
*  LESSON 6, PRACTICE 4                          *;
**************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

/* 2 */

data IncreaseDayVisits;  
    set pg2.np_summary;
    where Reg='NE' and DayVisits<100000;
    IncrDayVisits=DayVisits;
    do until (IncrDayVisits>100000);
       IncrDayVisits=IncrDayVisits*1.06;
       output;
    end;
    format IncrDayVisits comma12.;
    keep ParkName DayVisits IncrDayVisits;
run;

proc sort data=IncreaseDayVisits;
    by ParkName;
run;

title1 'Years Until Northeast National Monuments Exceed 100,000 Visitors';
title2 'Based on Annual Increase of 6%';
proc print data=IncreaseDayVisits label;
    label DayVisits='Current Day Visitors'
          IncrDayVisits='Increased Day Visitors';
run;
title;

/* 2 */

data IncreaseDayVisits;  
    set pg2.np_summary;
    where Reg='NE' and DayVisits<100000;
    IncrDayVisits=DayVisits;
    Year=0;
    do until (IncrDayVisits>100000);
       Year+1;
       IncrDayVisits=IncrDayVisits*1.06;
       output;
    end;
    format IncrDayVisits comma12.;
    keep ParkName DayVisits IncrDayVisits Year;
run;

proc sort data=IncreaseDayVisits;
    by ParkName;
run;

title1 'Years Until Northeast National Monuments Exceed 100,000 Visitors';
title2 'Based on Annual Increase of 6%';
proc print data=IncreaseDayVisits label;
    label DayVisits='Current Day Visitors'
          IncrDayVisits='Increased Day Visitors';
run;
title