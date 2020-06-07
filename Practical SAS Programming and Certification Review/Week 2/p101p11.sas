%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc means data=cr.employee noprint;
    var Salary;
    class Department City;
    output out=salary_summary mean=AvgSalary sum=TotalSalary;
    ways 2;
run;