data CanadaSales;
	set sashelp.prdsale;
	Diff=Actual-Predict;
	where Country='CANADA' and Quarter=1;
run;
 
