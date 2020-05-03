***********************************************************;
*  LESSON 3, PRACTICE 4                                   *;
*  a) Add a WHERE statement to print only the rows where  *;
*     ParkName includes Preserve.                         *;
*  b) Submit the program and verify the generated output. *;
*     Which codes are used for Preserves?                 *;
***********************************************************;

libname PG1 base "~/EPG194/data";

/* Level 1 Practice: Filtering Rows in a Listing Report Using Character Data */

proc print data=pg1.np_summary;
	where ParkName like '%Preserve%';
	var Type ParkName;
run;

/* Level 2 Practice: Using Macro Variables to Subset Data in Procedures */

%LET ParkCode=YOSE;
%LET SpeciesCat=Mammal;

proc freq data=pg1.np_species;
	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	tables Abundance Conservation_Status;
run;

proc print data=pg1.np_species;
	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	var Species_ID Category Scientific_Name Common_Names;
run;

%LET ParkCode=ZION;
%LET SpeciesCat=Bird;

proc freq data=pg1.np_species;
	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	tables Abundance Conservation_Status;
run;

proc print data=pg1.np_species;
	where Species_ID like "&ParkCode%" and Category = "&SpeciesCat";
	var Species_ID Category Scientific_Name Common_Names;
run;