proc sort data=sashelp.baseball out=baseball_Sort;
	by Team Name;
run;

proc print data=work.baseball_Sort;
	where Team in("San Francisco", "Los Angeles", "Oakland");
	keep Name Team Salary Cr : ;
run;

proc freq data=work.baseball_Sort order=freq;
	tables Position;
run;

proc means data=baseball_Sort maxdec=0 sum mean;
	var Salary;
run;