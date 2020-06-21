%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc sort data=cr.employee_current out=emp_sort;
    by Department Salary;
run;

data dept_salary;
    set emp_sort;
    retain LowSalaryJob;
    by Department;
    if first.Department then do;
        TotalDeptSalary=0;
        LowSalaryJob=JobTitle;
    end;
    TotalDeptSalary+Salary;
    if last.department then do;
        HighSalaryJob=JobTitle;
        output;
    end;
    keep Department TotalDeptSalary HighSalaryJob LowSalaryJob;
    format TotalDeptSalary dollar12.;
run;