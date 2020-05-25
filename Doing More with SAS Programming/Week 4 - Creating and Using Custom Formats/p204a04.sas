***********************************************************;
*  Activity 4.04                                          *;
*  1) Run the program to create the $SBFMT and CATFMT     *;
*     formats. View the log to confirm both were output.  *;
*  2) Uncomment the PROC FORMAT step at the end of the    *;
*     program. Highlight the step and run the selected    *;
*     code. A report for all formats in the WORK library  *;
*     is generated.                                       *;
*  3) Add the following statement in the last PROC FORMAT *;
*     step to limit the report to selected formats. Run   *;
*     the step.                                           *;
*           select $sbfmt catfmt;                         *;
*  4) What are the default lengths for the $SBFMT and     *;
*     CATFMT formats?                                     *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

/*Create the $SBFMT format for subbasin codes*/
data sbdata;
    retain FmtName '$sbfmt';
    set pg2.storm_subbasincodes(rename=(Sub_Basin=Start 
                                        SubBasin_Name=Label));
    keep Start Label FmtName;
run;

proc format cntlin=sbdata;
run;

/*Create the CATFMT format for storm categories*/
data catdata;
    retain FmtName "catfmt";
    set pg2.storm_categories(rename=(Low=Start 
                                     High=End
                                     Category=Label));
    keep FmtName Start End Label;
run;

proc format cntlin=catdata;
run;

proc format fmtlib library=work;
	 select $sbfmt catfmt;
run;
