***********************************************************;
*  Activity 3.13                                          *;
*  1) Add to the RENAME= option to rename the input       *;
*     column Date as CharDate.                            *;
*  2) Add an assignment statement to create a numeric     *;
*     column Date from the character column CharDate. The *;
*     values of CharDate are stored as 01JAN2018.         *;
*  3) Modify the DROP statement to eliminate all columns  *;
*     that begin with Char from the output table.         *;
*  4) Run the program and verify that Volume and Date are *;
*     numeric columns.                                    *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data stocks2;
   set pg2.stocks2(rename=(Volume=CharVolume Date=CharDate));
   Volume=input(CharVolume,comma12.);
   Date=input(CharDate,date9.);
   drop Char: ;
run;

proc contents data=stocks2;
run;

