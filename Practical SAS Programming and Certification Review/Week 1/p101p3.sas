%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

/*
Directly read the employee.xlsx file in the data folder.
Ensure that column names follow the recommended SAS naming rules.
*/

options validvarname=v7;
libname employee xlsx "&path/employee.xlsx";

/*
proc import datafile="&path/employee.xlsx" out=employee dbms=xls replace;
    guessingrows=max;
run;
*/

/*
Generate a report of the descriptor portion for each table read from the employee.xlsx file.
*/

proc contents data=employee._all_;
run;