/*This program analyzes blood pressure
in the SASHELP.HEART table.*/

proc freq data=sashelp.heart;
    table BP_Status;
run;

proc means data=sashelp.heart min max mean maxdec=0;
    var systolic diastolic;
    class BP_Status;
run;


