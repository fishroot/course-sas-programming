%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

data emp_US emp_AU;
	set cr.employee(keep=EmpID Name JobTitle Salary Department TermDate Country);
	where TermDate=.;
	Country=upcase(Country);
	if Country="US" then output emp_US;
	else if Country="AU" then output emp_AU;
run;