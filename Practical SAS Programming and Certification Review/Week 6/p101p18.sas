/* Part 1 */
/* 00. Define the cr library */
/* 01. Remove years _1995 through _2013 */
/* 02. Create Country_Name and Tourism_Type columns */

/* Part 2 */
/* 03. Convert values to uppercase for Series and convert '..' to midding values */
/* 04. Determine the conversion type */
/* 05. Change the data no available in _2014 to a single '.' */

/* Part 3 */
/* 06. Create the Y2014 column by explicitly converting character values in _2014 and multiplying by the conversation type */
/* 07. Create the new Category column and change the original values to the required values */
/* 08. Permanently format Y2014 */
/* 09. Remove unnecessary variables */

/* Part 4 */
/* 10. Create custom format for final Table */
/* 11. Merge matching rows with Country Info */

%let path=~/ECRB94/data;
%let outpath=~/ECRB94/output;
libname cr "&path";

data cleaned_tourism;
	length Country_Name $300 Tourism_Type $20;
	retain Country_Name "" Tourism_Type "";
	set cr.tourism(drop = _1995-_2013);
	if A ne . then Country_Name = Country;
	if lowcase(Country) = "inbound tourism" then Tourism_Type = "Inbound tourism";
	else if lowcase(Country) = "outbound tourism" then Tourism_Type = "Outbound tourism";
	if Country_Name ne Country;
	if Tourism_Type ne Country;
	Series = Upcase(Series);
	if Series = '..' then Series = "";
	ConversionType=scan(Country, -1, " ");
	if _2014 = ".." then _2014 = ".";
	if ConversionType = 'Mn' then do;
		if _2014 ne "." then Y2014 = input(_2014, 16.) * 1000000;
			else Y2014 = .;
		Category = cat(scan(Country, 1, '-', 'r'), ' - US$');
	end;
	else if ConversionType = 'Thousands' then do;
		if _2014 ne "." then Y2014 = input(_2014, 16.) * 1000;
			else Y2014 = .;
		Category = cat(scan(Country, 1, '-', 'r'));
	end;
	format y2014 comma25.;
	drop A ConversionType Country _2014;
run;

proc freq data=cleaned_tourism;
	tables Category Tourism_Type Series;
run;

proc means data=cleaned_tourism min mean max n maxdec=0;
	var Y2014;
run;

proc format;
	value contIDs
		1 = "North America"
		2 = "South America"
		3 = "Europe"
		4 = "Africa"
		5 = "Asia"
		6 = "Oceania"
		7 = "Antarctica";
run;

proc sort data=cr.country_info(rename=(Country=Country_Name)) out=country_sorted;
	by Country_Name;
run;

data final_tourism;
	merge cleaned_tourism(in=t) country_sorted(in=c);
	by country_name;
	if t=1 and c=1 then output final_tourism;
	format continent contIDs.;
run;

proc freq data=final_tourism nlevels;
	tables category series Tourism_type Continent /nocum nopercent;
run;

proc means data=final_tourism min mean max maxdec=0;
	var Y2014;
run;