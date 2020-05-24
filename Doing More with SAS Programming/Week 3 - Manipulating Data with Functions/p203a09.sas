***********************************************************;
*  Activity 3.09                                          *;
*  1) Examine the assignment statements that use the CAT  *;
*     and CATS functions to create StormID1 and StormID2. *;
*     Run the program. How do the two columns differ?     *;
*  2) Add an assignment statement to create StormID3 that *;
*     uses the CATX function to concatenate Name, Season, *;
*     and Day with a hyphen inserted between each value.  *;
*     Run the program.                                    *;
*  3) Modify the StormID2 assignment statement to insert  *;
*     a hyphen only between Name and Season.              *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data storm_id;
	set pg2.storm_final;
	keep StormID: ;
	Day=StartDate-intnx('year', StartDate, 0);
	StormID1=cat(Name, Season, Day);
	StormID2=cats(Name, '-', Season, Day);
	StormID3=catx("-", Name, Season, Day);
run;
