***********************************************************;
*  LESSON 4, PRACTICE 1                                   *;
*    a) Open the PG1.EU_OCC table and examine the column  *;
*       names and values.                                 *;
*    b) Modify the code to create a temporary table named *;
*       EU_OCC2016 and read PG1.EU_OCC.                   *;
*    c) Complete the WHERE statement to select only the   *;
*       stays that were reported in 2016. Notice that     *;
*       YearMon is a character column and the first four  *;
*       positions represent the year.                     *;
*    d) Complete the FORMAT statement in the DATA step to *;
*       apply the COMMA17. format to the Hotel,           *;
*       ShortStay, and Camp columns.                      *;
*    e) Complete the DROP statement to exclude Geo from   *;
*       the output table.                                 *;
***********************************************************;

libname pg1 base "~/EPG194/data";

data eu_occ2016;
	set pg1.eu_occ;
	where YearMon LIKE '2016%';
	format Hotel COMMA17. ShortStay COMMA17. Camp COMMA17.;
	drop Geo;
run;

/* Level 2 Practice: Subsetting by Multiple Conditions and Creating a Sorted SAS Table*/

libname out base "~/EPG194/output";

data out.fox;
	set pg1.np_species;
	where Category = 'Mammal' and Common_Names like '%Fox%' and Common_names not like '%Squirrel%';
	drop Category Record_Status Occurrence Nativeness;
run;

proc sort data=out.fox out=out.fox;
	by Common_Names;
run; 