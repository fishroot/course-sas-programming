***********************************************************;
*  LESSON 5, PRACTICE 1                                   *;
*  a) Complete the SET statement to concatenate the       *;
*     PG2.NP_2015 and PG2.NP_2016 tables to create a new  *;
*     table, NP_COMBINE.                                  *;
*  b) Use a WHERE statement to include only rows where    *;
*     Month is 6, 7, or 8.                                *;
*  c) Create a new column named CampTotal that is the sum *;
*     of CampingOther, CampingTent, CampingRV, and        *;
*     CampingBackcountry. Format the new column with      *;
*     commas.                                             *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data work.np_combine;
    set pg2.np_2015 pg2.np_2016;
    CampTotal=sum(of Camping:);
    where Month in(6, 7, 8);
    format CampTotal comma15.;
    drop Camping:;
run;

proc sort data=work.np_combine;
	by ParkCode;
run;

/* Level 2 Practice: Concatenating Unlike-Structured Tables */

data work.np_combine;
    set pg2.np_2014(rename=(Park=ParkCode Type=ParkType))
        pg2.np_2015 
        pg2.np_2016;
    CampTotal=sum(of Camping:);
    where Month in(6, 7, 8) and ParkType="National Park";
    format CampTotal comma15.;
    drop Camping:;
run;


proc sort data=np_combine;
    by ParkType ParkCode Year Month;
run;