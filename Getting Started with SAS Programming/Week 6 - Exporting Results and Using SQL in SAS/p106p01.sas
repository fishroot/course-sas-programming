***********************************************************;
*  LESSON 6, PRACTICE 1                                   *;
*    a) Before the PROC MEANS step, add an ODS EXCEL      *;
*       statement to do the following:                    *;
*       1) Write the output file to                       *;
*          "&outpath/StormStats.xlsx".                    *;
*       2) Set the style for the Excel file to snow.      *;
*       3) Set the sheet name for the first tab to South  *;
*          Pacific Summary.                               *;
*    b) Turn off the procedure titles and report titles   *;
*       at the start of the program. Turn the procedure   *;
*       titles on at the end of the program.              *;
*    c) Immediately before the PROC PRINT step, add an    *;
*       ODS EXCEL statement to set the sheet name to      *;
*       Detail.                                           *;
*    d) At the end of the program, add an ODS EXCEL       *;
*       statement to close the Excel destination.         *;
*    e) Submit the program. If possible, open the         *;
*       StormStats.xlsx workbook in Excel.                *;
***********************************************************;

ods excel file="&outpath/StormStats.xlsx"
    style=snow
    options(sheet_name='South Pacific Summary');
ods noproctitle;

proc means data=pg1.storm_detail maxdec=0 median max;
    class Season;
    var Wind;
    where Basin='SP' and Season in (2014,2015,2016);
run;

ods excel options(sheet_name='Detail');

proc print data=pg1.storm_detail noobs;
    where Basin='SP' and Season in (2014,2015,2016);
    by Season;
run;

ods excel close;
ods proctitle;
