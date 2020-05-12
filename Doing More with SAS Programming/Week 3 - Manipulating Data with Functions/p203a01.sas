***********************************************************;
*  Activity 3.01                                          *;
*  1) Run the program. Why does the DATA step fail?       *;
*     Correct the error by overwriting the value of the   *;
*     column Name in uppercase.                           *;
*  2) Examine the expressions for Mean1, Mean2, and       *;
*     Mean3. Each one is a method for specifying a list   *;
*     of columns as arguments in a function. Run the      *;
*     program and verify that the values in these three   *;
*     columns are the same.                               *;
*  3) In the expression for Mean2, delete the keyword OF  *;
*     and run the program. What do the values in Mean2    *;
*     represent?                                          *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data quiz_summary;
	set pg2.class_quiz;
	Name=upcase(Name);
	Mean1=mean(Quiz1, Quiz2, Quiz3, Quiz4, Quiz5);
	/* Numbered Range: col1-coln where n is a sequential number */ 
	Mean2=mean(Quiz1-Quiz5);
	/* Name Prefix: all columns that begin with the specified character string */ 
	Mean3=mean(of Q:);
run;
