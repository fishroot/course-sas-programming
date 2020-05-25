***********************************************************;
*  LESSON 5, PRACTICE 3                                   *;
*  a) Submit the two PROC SORT steps. Determine the name  *;
*     of the common column in the sorted tables.          *;
*  b) Modify the second PROC SORT step to use the RENAME= *;
*     option after the PG2.NP_2016TRAFFIC table to rename *;
*     Code to ParkCode. Modify the BY statement to sort   *;
*     by the new column name.                             *;
*  c) Write a DATA step to merge the sorted tables by the *;
*     common column to create a new table,                *;
*     WORK.TRAFFICSTATS. Drop the Name_Code column from   *;
*     the output table.                                   *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

proc sort data=pg2.np_codelookup out=work.codesort;
    by ParkCode;
run;

proc sort data=pg2.np_2016traffic(rename=(Code=ParkCode)) 
          out=work.traf2016Sort;
    by ParkCode month;
run;

data work.trafficstats;
    merge work.traf2016Sort 
          work.codesort;
    by ParkCode;
    drop Name_Code;
run;

/* Level 2 Practice: Writing Matches and Nonmatches to Separate Tables */

proc sort data=pg2.np_CodeLookup
          out=work.sortedCodes;
    by ParkCode;
run;

proc sort data=pg2.np_2016
          out=work.sorted_code_2016;
    by ParkCode;
run;

data work.parkStats(keep=ParkCode ParkName Year Month DayVisits)
     work.parkOther(keep=ParkCode ParkName);
    merge work.sorted_code_2016(in=inStats) work.sortedCodes;
    by ParkCode;
    if inStats=1 then output work.parkStats;
    else output work.parkOther;
run;