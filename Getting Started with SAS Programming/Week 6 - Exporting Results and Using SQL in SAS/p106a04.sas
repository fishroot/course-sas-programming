***********************************************************;
*  Activity 6.04                                          *;
*    1) Add ODS statements to create an Excel file named  *;
*       pressure.xlsx in the output folder. Be sure to    *;
*       close the ODS location at the end of the program. *;
*       Run the program and open the Excel file.          *;
*       * SAS Studio: Navigate to the output folder in    *;
*       the Files and Folders section of the navigation   *;
*       pane. Select pressure.xlsx and click Download.    *;
*       * Enterprise Guide: Click the Results - Excel tab *;
*       and click Download.                               *;
*    2) Add the STYLE=ANALYSIS option in the first ODS    *;
*       EXCEL statement. Run the program again and open   *;
*       the Excel file.                                   *;
***********************************************************;

*Add ODS statement;

ods excel file="&outpath/pressure.xlsx" style=analysis;

title "Minimum Pressure Statistics by Basin";
ods noproctitle;
proc means data=pg1.storm_final mean median min maxdec=0;
    class BasinName;
    var MinPressure;
run;

title "Correlation of Minimum Pressure and Maximum Wind";
proc sgscatter data=pg1.storm_final;
	plot minpressure*maxwindmph;
run;
title;  

ods proctitle;
ods excel close;

