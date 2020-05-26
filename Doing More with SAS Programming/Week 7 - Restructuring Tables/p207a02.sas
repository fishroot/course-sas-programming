***********************************************************;
*  Activity 7.02                                          *;
*  1) Examine the DATA step code and run the program.     *;
*     Uncomment the RETAIN statement and run the program  *;
*     again. Why is the RETAIN statement necessary?       *;
*  2) Add a subsetting IF statement to include only the   *;
*     last row per student in the output table. Run the   *;
*     program.                                            *;
*  3) What must be true of the input table for the DATA   *;
*     step to work?                                       *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data class_wide;
	set pg2.class_test_narrow;
	by Name;
	retain Name Math Reading;
	keep Name Math Reading;
	if TestSubject="Math" then Math=TestScore;
	else if TestSubject="Reading" then Reading=TestScore;
run;
