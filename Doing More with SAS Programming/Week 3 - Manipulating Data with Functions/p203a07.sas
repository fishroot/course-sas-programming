***********************************************************;
*  Activity 3.07                                          *;
*  1) Notice the subsetting IF statement that writes rows *;
*     to output only if Prefecture is Tokyo. Run the      *;
*     program and notice that the output table does not   *;
*     include any rows.                                   *;
*  2) Either use the DATA step debugger in Enterprise     *;
*     Guide or uncomment the PUTLOG statement to view the *;
*     values of Prefecture as the step executes. Why is   *;
*     the subsetting IF condition always false?           *;
*  3) Modify the program to correct the logic error. Run  *;
*     the program and confirm that four rows are          *;
*     returned.                                           *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=propcase(scan(Location, 1, ','), ' ');
	Prefecture=strip(scan(Location, 2, ','));
	putlog Prefecture $quote20.;
	if Prefecture="Tokyo";
run;

