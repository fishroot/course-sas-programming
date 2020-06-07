%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc export data=cr.employee_current    
            outfile="&outpath/emp_current.csv" dbms=csv replace;
run;