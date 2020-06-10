/* Define Makrovariables */
%let importpath = ./ECRB94/data;
%let outputpath = ./ECRB94/output;

/* Import Data */
options validvarname=v7;

proc import datafile="&importpath/SAClaims2002_2017.csv" out=SAClaims dbms=csv 
		replace;
	getnames=yes;
run;