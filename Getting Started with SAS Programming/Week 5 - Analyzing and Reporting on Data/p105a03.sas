***********************************************************;
*  Activity 5.03                                          *;
*    1) This code creates a macro variable named oc that  *;
*       stores the text string Pacific. The oc macro      *;
*       variable is then used in the WHERE statement to   *;
*       subset the data.                                  *;
*    2) Update the TITLE2 statement to use the macro      *;
*       variable. Run the program.                        *;
*    3) Change the value of the macro variable to         *;
*       Atlantic and run the program again.               *;
***********************************************************;

libname pg1 base "~/EPG194/data";

%let oc=Atlantic;

ods noproctitle;
title 'Storm Analysis';
title2 "&oc Ocean";

proc means data=pg1.storm_final;
	where Ocean="&oc";
	var MaxWindMPH MinPressure;
run;

ods proctitle;
title;






