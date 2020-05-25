***********************************************************;
*  Activity 5.02                                          *;
*  1) Highlight the two PROC SORT steps and run the       *;
*     selected code. How many rows per Name are in the    *;
*     and TEACHERS_SORT and TEST2_SORT tables?            *;
*  2) Complete the DATA step to merge the sorted tables   *;
*     by Name. Run the DATA step and examine the log and  *;
*     results. How many rows are in the output table?     *;
***********************************************************;

proc sort data=pg2.class_teachers out=teachers_sort;
	by Name;
run;

proc sort data=pg2.class_test2 out=test2_sort;
	by Name;
run;

data class2;
	*Complete the MERGE and BY statements;
	merge ;
	by ;
run;


