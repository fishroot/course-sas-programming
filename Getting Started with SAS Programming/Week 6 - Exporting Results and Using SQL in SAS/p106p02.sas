***********************************************************;
*  LESSON 6, PRACTICE 2                                   *;
*    a) Modify the program to write the output file to    *;
*       &outpath/ParkReport.rtf. Set the style for the    *;
*       output file to Journal and remove page breaks     *;
*       between procedure results. Suppress the printing  *;
*       of procedure titles.                              *;
*    b) Run the program. Open the output file in          *;
*       Microsoft Word. Notice that the Journal style is  *;
*       applied to the results, but the graph is now gray *;
*       scale instead of color. Also notice that the date *;
*       and time the program ran is printed in the upper  *;
*       right corner of the page. Close Microsoft Word.   *;
*    c) Modify your SAS program so that both tables are   *;
*       created using the Journal style, but the graph is *;
*       created using the SASDOCPRINTER style.            *;
*    d) Add an OPTIONS statement with the NODATE option   *;
*       at the beginning of the program to suppress the   *;
*       date and time in the RTF file. Restore the option *;
*       for future submissions by adding an OPTIONS       *;
*       statement with the DATE option at the end of the  *;
*       program.                                          *;
*    e) Run the program. Open the new output file using   *;
*       Microsoft Word. Ensure that the style for both    *;
*       tables is the same, but that the graph is now     *;
*       displayed in color. Close the report.             *;
***********************************************************;

ods rtf file="&outpath/ParkReport.rtf" style=Journal startpage=no;

ods noproctitle;
options nodate;

title "US National Park Regional Usage Summary";

proc freq data=pg1.np_final;
    tables Region /nocum;
run;

proc means data=pg1.np_final mean median max nonobs maxdec=0;
    class Region;
    var DayVisits Campers;
run;

ods rtf style=SASDocPrinter;

title2 'Day Vists vs. Camping';
proc sgplot data=pg1.np_final;
    vbar  Region / response=DayVisits;
    vline Region / response=Campers;
run;
title;

ods proctitle;
ods rtf close;
options date;





