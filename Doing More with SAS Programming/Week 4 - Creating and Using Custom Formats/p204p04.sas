***********************************************************;
*  LESSON 4, PRACTICE 4                                   *;
*  a) Highlight the PROC MEANS step and run the selected  *;
*     code. Review the output. Notice that the traffic    *;
*     statistics are listed by a four-letter park code.   *;
*  b) Open the PG2.NP_CODELOOKUP table. Notice that       *;
*     ParkCode contains the four-letter park code and     *;
*     Type contains the type of park.                     *;
*  c) Modify the DATA step.                               *;
*     1) Add a RENAME= data set option to the SET         *;
*        statement to rename the ParkCode column to Start *;
*        and the Type column to Label.                    *;
*     2) Add a RETAIN statement before the SET statement  *;
*        to create the FmtName column with a value of     *;
*        $TypeFmt (without a period at the end).          *;
*  d) In the PROC FORMAT statement, add a CNTLIN= option  *;
*     to build a format from the type_lookup table.       *;
*  e) In the PROC MEANS step, add a FORMAT statement so   *;
*     that the $TypeFmt format is applied to the ParkCode *;
*     column.                                             *;
*  f) Run the program and review the results. Verify that *;
*     the data is grouped by park types.                  *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data type_lookup;
    retain FmtName '$TypeFmt';
    set pg2.np_codeLookup(rename=(ParkCode=Start Type=Label));
    keep Start Label FmtName;
run;

proc format cntlin=type_lookup;
run;

title 'Traffic Statistics';
proc means data=pg2.np_monthlyTraffic maxdec=0 mean sum nonobs;
    var Count;
    class ParkCode Month;
    label ParkCode='Name';
    format ParkCode $TypeFmt.;
run;
title;