***********************************************************;
*  LESSON 3, PRACTICE 5                                   *;
*  a) Notice that the DATA step creates a table named     *;
*     PARKS and reads only those rows where ParkName ends *;
*     with NP.                                            *;
*  b) Modify the DATA step to create or modify the        *;
*     following columns:                                  *;
*     1) Use the SUBSTR function to create a new column   *;
*        named Park that reads each ParkName value and    *;
*        excludes the NP code at the end of the string.   *;
*        Note: Use the FIND function to identify the      *;
*        position number of the NP string. That value can *;
*        be used as the third argument of the SUBSTR      *;
*        function to specify how many characters to read. *;
*     2) Convert the Location column to proper case. Use  *;
*        the COMPBL function to remove any extra blanks   *;
*        between words.                                   *;
*     3) Use the TRANWRD function to create a new column  *;
*        named Gate that reads Location and converts the  *;
*        string Traffic Count At to a blank.              *;
*     4) Create a new column names GateCode that          *;
*        concatenates ParkCode and Gate together with a   *;
*        single hyphen between the strings.               *;
***********************************************************;

data parks;
	set pg2.np_monthlytraffic;
	where ParkName like '%NP';

run;

proc print data=parks;
	var Park GateCode Month Count;
run;
