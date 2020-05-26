**************************************************;
*  LESSON 6, PRACTICE 4                          *;
**************************************************;

data IncreaseDayVisits;  
    set pg2.np_summary;
    where Reg='NE' and DayVisits<100000;
    IncrDayVisits=DayVisits;

    IncrDayVisits=IncrDayVisits*1.06;

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
