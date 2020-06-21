%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc means data=cr.employee_current noprint;
    var Salary;
    class Department;
    output out=salary sum=TotalSalary;
    ways 1;
run;

data salaryforecast;
    set salary;
    format TotalSalary dollar12.;
    Year=1;
    TotalSalary=TotalSalary*1.03;
    output;
    Year=2;
    TotalSalary=TotalSalary*1.03;
    output;
    Year=3;
    TotalSalary=TotalSalary*1.03;
    output;
run;