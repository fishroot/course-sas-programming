%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;

/* Accessing Data */

libname tsa "&path";
options validvarname=v7;
proc import
		datafile="&path/TSAClaims2002_2017.csv"
		dbms=csv
		out=tsa.ClaimsImport
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

/*Preparing Data*/

proc sort
		data=tsa.Claimsimport
		out=tsa.Claims_NoDups noduprecs;
	by _all_;
run;

proc sort data=tsa.claims_nodups;
	by Incident_date;
run;

data tsa.claims_cleaned;
	set tsa.claims_nodups;
	
	/*Clean Claim_Sites*/
	if Claim_Site in ('-', '') then Claim_Site="Unknown";
	
	/*Clean Disposition*/
	if Disposition in ('-', '') then Disposition="Unknown";
	else if Disposition='Closed: Contractor Claim' then Disposition='Closed:Contractor Claim';
	else if Disposition='Closed: Canceled' then Disposition='Closed:Canceled';
	
	/*Clean Claim_Type*/
	if Claim_Type in ('-', '') then Claim_Type="Unknown";
	else if Claim_Type = 'Passanger Property Loss/Personal Injur' then Claim_Type='Passanger Property Loss';
	else if Claim_Type = 'Passanger Property Loss/Personal Injury' then Claim_Type='Passanger Property Loss';
	else if Claim_Type = 'Property Damags/Personal Injury' then Claim_Type='Property Damage';
	
	/*Clean State, StateName*/
	State=upcase(State);
	StateName=propcase(StateName);
	
	/*Date Issues*/
	if Incident_date > Date_Received
		or Incident_date = . or year(Incident_date) < 2002 or year(Incident_date) > 2017
		or Date_Received = . or year(Date_Received) < 2002 or year(Date_Received) > 2017 then Date_Issues='Needs Review';
 	
 	/*Labels and formats*/
 	format
 		Incident_date Date_Received DATE9.
 		Close_amount DOLLAR20.2;
 	label
 		Airport_Code = "Airport Code"
 		Airport_Name = "Airport Name"
 		Claim_Number = "Claim Number"
  		Claim_Site = "Claim Site"
  		Claim_Type = "Claim Type"
  		Close_Amount = "Close Amount"
  		Date_Issues = "Date Issues"
  		Date_Received = "Date Received"
  		Incident_Date = "Incident Date"
  		Item_Category = "Item Category";
  	
  	/*Drop*/
  	drop county city;
 run;
 
 proc freq data=tsa.Claims_cleaned order=freq;
 	tables Claim_Site Disposition Claim_Type Date_Issues / nocum nopercent;
 run;
 
/*Analyze Data*/

%let statename=Hawaii;

ods pdf file="&outpath/ClaimsReport&statename.pdf" style=meadow pdftoc=1;
ods noproctitle;

ods proclabel "Overall Date Issues";
title "Overall Date Issues in the data";
proc freq data=tsa.claims_cleaned;
	table date_issues /missing nocum nopercent;
run;
title;

ods graphics on;
ods proclabel "Overall Claims by Year";
title "Overall Claims by Year";
proc freq data=tsa.claims_cleaned;
	table Incident_Date /nocum nopercent plots=freqplot;
	format Incident_Date YEAR4.;
	where date_issues is null;
run;
title;

ods proclabel "&statename Claim Overview";
title "&statename Claim Types, Claim Sites and Disposition";
proc freq data=tsa.claims_cleaned order=freq;
	tables Claim_type Claim_site Disposition /nocum nopercent;
	where StateName = "&statename" and Date_issues is null;
run;
title;

ods proclabel "&statename Close Amount Statistics";
title "Close_Amount Statistics for &statename";
proc means data=tsa.claims_cleaned mean min max sum maxdec=0;
	var Close_amount;
	where StateName = "&statename" and Date_Issues is null;
run;
title;

ods pdf close;