**************************************************;
*  LESSON 7, PRACTICE 4                          *;
**************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

title "Storm Wide";
proc print data=pg2.storm_top4_wide(obs=5);
run;

proc transpose data=pg2.np_2017camping
               out=work.camping2017_t;
    by ParkName;
    var Tent RV;
run;

title "Storm Narrow";
proc print data=work.camping2017_t(obs=10);
run;
title;

/* Level 2 Practice: Restructuring a Table Using PROC TRANSPOSE: Narrow to Wide */

/* 1 */

proc transpose data=pg2.np_2016camping 
               out=work.camping2016_transposed(drop=_name_);
    by ParkName;
    id CampType;
    var CampCount;
run;

/* 2 */

proc transpose data=pg2.np_2016camping 
               out=work.camping2016_transposed(drop=_name_);
    by ParkName;
    id CampType;
    var CampCount;
run;