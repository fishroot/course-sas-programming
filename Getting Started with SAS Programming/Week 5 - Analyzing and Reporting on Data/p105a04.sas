***********************************************************;
*  Activity 5.04                                          *;
*    1) Modify the LABEL statement in the DATA step to    *;
*       label the Invoice column as Invoice Price.        *;
*    2) Run the program. Why do the labels appear in the  *;
*       PROC MEANS report but not in the PROC PRINT       *;
*       report? Fix the program and run it again.         *;
***********************************************************;

data cars_update;
    set sashelp.cars;
	keep Make Model MSRP Invoice AvgMPG;
	AvgMPG=mean(MPG_Highway, MPG_City);
	label MSRP="Manufacturer Suggested Retail Price"
          AvgMPG="Average Miles per Gallon"
          Invoice="Invoice Price";
run;

proc means data=cars_update min mean max;
    var MSRP Invoice;
run;

proc print data=cars_update;
    var Make Model MSRP Invoice AvgMPG;
run;


