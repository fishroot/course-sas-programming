%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc means data=cr.employee sum mean min max maxdec=0;	
    where Department="Sales";
    var Salary;
    class JobTitle;
    ways 0 1;
run;