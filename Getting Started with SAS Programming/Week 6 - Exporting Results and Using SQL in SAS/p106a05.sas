***********************************************************;
*  Activity 6.05                                          *;
*    1) Run the program and open the pressure.pptx file.  *;
*    2) Modify the ODS statements to change the output    *;
*       destination to RTF. Change the style to sapphire. *;
*    3) Run the program and open the pressure.rtf file.   *;
*    4) Add the STARTPAGE=NO option in the first ODS RTF  *;
*       statement to eliminate the page break.            *;
*    5) Rerun the program and examine the results in      *;
*       Microsoft Word.                                   *;
***********************************************************;

libname pg1 base "~/EPG194/data";

ods rtf file="&outpath/pressure.pptx" style=sapphire STARTPAGE=NO;

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

ods rtf close;
