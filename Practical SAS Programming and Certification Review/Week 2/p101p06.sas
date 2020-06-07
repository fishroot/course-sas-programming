%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

/*
Create a new table named sales and read cr.employee.
Include only employees in the Sales Department with no termination date (TermDate).
*/

/*
Create a new column named SalesLevel based on the following values of JobTitle:
JobTitle	SalesLevel
Sales Rep. I 	Entry
Sales Rep. II or Sales Rep. III	Middle
Sales Rep. IV 	Senior
*/

data sales;
	set cr.employee;
	length SalesLevel $6;
	where Department='Sales' and TermDate=.;
	if JobTitle='Sales Rep. I' then SalesLevel='Entry';
	else if JobTitle='Sales Rep. II' or JobTitle='Sales Rep. III' then SalesLevel='Middle';
	else if JobTitle='Sales Rep. IV' then SalesLevel='Senior';
	else SalesLevel=.;
run;

/*
Generate a report that includes the number of Sales employees in each level.
*/
proc sort data=work.sales out=salesSorted;
	by SalesLevel;
run;

proc freq data=work.salesSorted;
	by SalesLevel;
	tables SalesLevel;
run;