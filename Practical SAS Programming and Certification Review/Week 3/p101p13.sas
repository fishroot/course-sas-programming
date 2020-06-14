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

/*Explore Data*/
proc print data=tsa.ClaimsImport (obs=20);
run;

proc contents data=tsa.ClaimsImport varnum;
run;

proc freq data=tsa.Claimsimport;
	tables
		claim_site disposition claim_type date_received
		incident_date / nocum nopercent;
	format incident_date date_received year4.;
run;

proc print data=tsa.Claimsimport;
	where date_received < incident_date;
	format date_received incident_date date9.;
run;