***********************************************************;
*  LESSON 4, PRACTICE 1                                   *;
*  a) Highlight the PROC FREQ step and run the selected   *;
*     code. Review the output. Notice that regional codes *;
*     are used, not descriptive values.                   *;
*  b) Add a VALUE statement to the PROC FORMAT step to    *;
*     create a format named $HIGHREG that defines the     *;
*     descriptive values shown below.                     *;
*     IM => Intermountain                                 *;
*     PW => Pacific West                                  *;
*     SE => Southeast                                     *;
*     other codes => All Other Regions                    *;
*  c) Add a FORMAT statement to the PROC FREQ step so     *;
*     that the $HIGHREG format is applied to the Reg      *;
*     column.                                             *;
*  d) Run the program and review the output. Verify that  *;
*     the descriptive values for the Reg column are       *;
*     displayed.                                          *;
***********************************************************;

proc format;

run;

title 'High Frequency Regions';
proc freq data=pg2.np_summary order=freq;
    tables Reg;
    label Reg='Region';

run;
title;
