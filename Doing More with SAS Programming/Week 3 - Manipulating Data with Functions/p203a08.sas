***********************************************************;
*  Activity 3.08                                          *;
*  1) Notice that the assignment statement for            *;
*     CategoryLoc uses the FIND function to search for    *;
*     category within each value of the Summary column.   *;
*     Run the program.                                    *;
*  2) Examine the PROC PRINT report. Why is CategoryLoc   *;
*     equal to 0 in row 1? Why is CategoryLoc equal to 0  *;
*     in row 15?                                          *;
*  3) Modify the FIND function to make the search case    *;
*     insensitive. Uncomment the IF-THEN statement to     *;
*     create a new column named Category. Run the program *;
*     and examine the results.                            *;
***********************************************************;
*  Syntax Help                                            *;
*     FIND(string, substring <, 'modifiers'>)             *;
*         Modifiers:                                      *;
*             'I'=case insensitive search                 *;
*             'T'=trim leading and training blanks from   *;
*			     string and substring                     *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data storm_damage2;
    set pg2.storm_damage;
    drop Date Cost Deaths;
    CategoryLoc=find(Summary, 'Category', 'i');
    if CategoryLoc > 0 then 
       Category=substr(Summary, CategoryLoc, 10);
run;

proc print data=storm_damage2;
	var Summary Cat:;
run;

