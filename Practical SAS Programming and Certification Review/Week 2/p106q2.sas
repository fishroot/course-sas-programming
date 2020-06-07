%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

ods pdf file="&outpath/truck.pdf" style=journal startpage=no;
ods noproctitle;
title "Truck Summary";
title2 "SASHELP.CARS Table";

proc freq data=sashelp.cars;
	  where Type="Truck";
	  tables Make / nocum;
run;

proc print data=sashelp.cars;
	  where Type="Truck";
	  id Make;
	  var Model MSRP MPG_City MPG_Highway;
run;
ods pdf close;