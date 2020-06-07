%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

/*
Read the payroll.csv text file in the data folder and create a temporary SAS table named payroll.
Enable SAS to scan all the rows from the text file to determine column attributes in the payroll table.
*/

proc import datafile="&path/payroll.csv" out=payroll dbms=csv replace;
    guessingrows=max;
run;

/*
Generate a report of the descriptor portion of the payroll table.
*/

proc contents data=work.payroll;
run;