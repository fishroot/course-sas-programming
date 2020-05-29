/* Write and submit a program that generates a report
that lists the tables in the cr library. You do not
need to examine the full descriptor portion of each table.*/

%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

proc contents data=cr._all_ nods;
run;
