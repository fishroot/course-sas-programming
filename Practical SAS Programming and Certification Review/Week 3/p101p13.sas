/* Accessing Data */
%let path=~/ECRB94/data;
libname tsa "&path";

options validvarname=v7;

proc import
		datafile="&path/TSAClaims2002_2017.csv"
		dbms=csv
		out=TSA.ClaimsImport
		replace;
	guessingrows=max;
run;