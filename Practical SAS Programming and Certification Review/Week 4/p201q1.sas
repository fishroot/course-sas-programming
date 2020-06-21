%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";


data emp_US emp_AU;
	set cr.employee(keep=EmpID Name JobTitle Salary Department TermDate);
	if TermDate is missing and Country="US" then output emp_US;
	else output emp_AU;
	Country=upcase(country);
run;