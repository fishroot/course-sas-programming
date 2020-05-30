%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc freq data=cr.employee_raw order=freq nlevels ;
    tables EmpID Country Department;	
run;

proc print data=cr.employee_raw;
    where TermDate ne . and HireDate>TermDate;
    format salary dollar10. TermDate HireDate BirthDate date9.;
run;
