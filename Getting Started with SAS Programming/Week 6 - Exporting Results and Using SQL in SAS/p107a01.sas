***********************************************************;
*  Activity 7.01                                          *;
*    1) What are the similarities and differences in the  *;
*       syntax of the two steps?                          *;
*    2) Run the program. What are the similarities and    *;
*       differences in the results?                       *;
***********************************************************;

title "PROC PRINT Output";
proc print data=pg1.class_birthdate;
	var Name Age Height Birthdate;
	format Birthdate date9.;
run;

title "PROC SQL Output";
proc sql;
select Name, Age, Height*2.54 as HeightCM format=5.1, Birthdate format=date9.
    from pg1.class_birthdate;
quit;

title;
