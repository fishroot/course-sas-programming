***********************************************************;
*  LESSON 4, PRACTICE 7                                   *;
*    a) Submit the program and view the generated output. *;
*    b) In the DATA step, use IF-THEN/ELSE statements to  *;
*       create a new column, ParkType, based on the value *;
*       of Type.                                          *;
*       NM -> Monument                                    *;
*       NP -> Park                                        *;
*       NPRE, PRE, or PRESERVE -> Preserve                *;
*       NS -> Seashore                                    *;
*       RVR or RIVERWAYS -> River                         *;
*    c) Modify the PROC FREQ step to generate a frequency *;
*       report for ParkType.                              *;
***********************************************************;

libname pg1 base "~/EPG194/data";

data park_type;
	set pg1.np_summary;
	length ParkType $10;
	keep ParkType ParkName;

	*Add IF-THEN-ELSE statements;
	if Type="NM" then ParkType="Monument";
	else if Type="NP" then ParkType="Park";
	else if Type="NPRE" or Type="PRE" or Type="PRESERVE" then ParkType="Preserve";
	else if Type="NS" then ParkType="Seashore";
	else if Type="RVR" or Type="RIVERWAYS" then ParkType="River";	
run;

proc freq data=park_type;
	tables ParkType;
run;

/* Level 2 Practice: Processing Statements Conditionally with DO Groups */
data parks monuments;
    set pg1.np_summary;
    where type in ('NM', 'NP');
    Campers=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
    format Campers comma17.;
    length ParkType $ 8;
    if type='NP' then do;
        ParkType='Park';
        output parks;
    end;
    else do;
        ParkType='Monument';
        output monuments;
    end;
    keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;