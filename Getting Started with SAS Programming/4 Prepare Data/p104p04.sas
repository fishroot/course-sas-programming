***********************************************************;
*  LESSON 4, PRACTICE 4                                   *;
*    a) Create a new column named SqMiles by multiplying  *;
*       Acres by .0015625.                                *;
*    b) Create a new column named Camping as the sum of   *;
*       OtherCamping, TentCampers, RVCampers, and         *;
*       BackcountryCampers.                               *;
*    c) Format SqMiles and Camping to include commas and  *;
*       zero decimal places.                              *;
*    d) Modify the KEEP statement to include the new      *;
*       columns. Run the program.                         *;
***********************************************************;

libname pg1 base "~/EPG194/data";

data np_summary_update;
	set pg1.np_summary;
	keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;	
	*Add assignment statements;
	SqMiles = Acres * .0015625;
	Camping = SUM(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	Format SqMiles Camping 10.;
run;

/* Level 2 Practice: Creating New Columns with Character and Date Functions */

data eu_occ_total ;
	set pg1.eu_occ;
	Year = substr(YearMon, 1, 4);
	Month = substr(YearMon, 6, 2);
	ReportDate = MDY(Month, 1, Year);
	Total = sum(Hotel, ShortStay, Camp);
	format Hotel ShortStay Camp Total comma14.2;
	format ReportDate monyy7.;
	Keep Country Hotel ShortStay Camp ReportDate Total;
run;