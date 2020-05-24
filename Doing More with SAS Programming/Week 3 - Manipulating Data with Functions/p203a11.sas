***********************************************************;
*  Activity 3.11                                          *;
*  1) Examine and run the program. In the output table,   *;
*     verify that Date2 is created as numeric. Notice     *;
*     that the table contains a character column named    *;
*     Volume.                                             *;
*  2) Add an assignment statement to create a column      *;
*     named Volume2. Use the INPUT function to read       *;
*     Volume using the COMMA12. informat. Run the program *;
*     and verify that Volume2 is created as a numeric     *;
*     column.                                             *;
*  3) In the assignment statement, change Volume2 to      *;
*     Volume so that you update the value of the existing *;
*     column.                                             *;
*  4) Run the program and notice that Volume is still     *;
*     character. Why is the assignment statement not      *;
*     changing the column type?                           *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data work.stocks2;
    set pg2.stocks2;
    Date2=input(Date,date9.);
    Volume=input(Volume,comma12.);
run;
