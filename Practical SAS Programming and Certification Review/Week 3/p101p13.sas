/* Define Makrovariables */
%let imppath = ~/ECRB94/data;
%let outpath = ~/ECRB94/output;

libname tsa "&imppath";

/* Import Data */
options validvarname=v7;

proc import datafile="&imppath/TSAClaims2002_2017.csv" out=SAClaims dbms=csv 
		replace;
	getnames=yes;
	GUESSINGROWS=MAX;
run;
