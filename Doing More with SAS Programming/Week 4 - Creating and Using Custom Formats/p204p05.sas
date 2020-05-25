***********************************************************;
*  LESSON 4, PRACTICE 5                                   *;
*  a) Modify the first DATA step to create the NP_LOOKUP  *;
*     table that will be used to build a custom format.   *;
*     1) Add a RETAIN statement to create the FmtName     *;
*        column with a value of $RegLbl.                  *;
*     2) Add a RENAME= data set option to the SET         *;
*        statement to rename the ParkCode column to       *;
*        Start.                                           *;
*     3) Add conditional statements to create the Label   *;
*        column. The Label column is equal to the Region  *;
*        column unless the region is missing. In that     *;
*        case, the Label column is equal to a value of    *;
*        Unknown.                                         *;
*     4) Add a KEEP statement to include the Start,       *;
*        Label, and FmtName columns.                      *;
*  b) Highlight the first DATA step and run the selected  *;
*     code. Verify the output table.                      *;
*  c) Modify the PROC FORMAT step to read in the          *;
*     NP_LOOKUP table.                                    *;
*  d) In the second DATA step, create a new column named  *;
*     Region. Use the PUT function to create the new      *;
*     column based on using the $RegLbl format on the     *;
*     ParkCode column. Run the program and confirm the    *;
*     results in the PROC FREQ output.                    *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data np_lookup;
    retain FmtName '$RegLbl';
    set pg2.np_codeLookup(rename=(ParkCode=Start));
    if Region ne ' ' then Label=Region;
    else Label='Unknown';
    keep Start Label FmtName;
run;

proc format cntlin=np_lookup;
run;

data np_endanger;
    set pg2.np_species;
    where Conservation_Status='Endangered';
    Region=put(ParkCode,$RegLbl.);
run;

title 'Number of Endangered Species by Region';
proc freq data=np_endanger;
    tables Region / nocum;
run;
title;
