%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc freq data=cr.employee order=freq nlevels;
    tables City Department JobTitle / nocum;
run;