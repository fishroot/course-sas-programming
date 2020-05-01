***********************************************************;
*  LESSON 2, PRACTICE 1                                   *;
*    a) Complete the PROC PRINT statement to list the     *;
*       first 20 observations in PG1.NP_SUMMARY.          *;
*    b) Add a VAR statement to include only the following *;
*       variables: Reg, Type, ParkName, DayVisits,        *;
*       TentCampers, and RVCampers. Highlight the step    *;
*       and run the selected code.                        *;
*       Do you observe any possible inconsistencies in    *;
*       the data?                                         *;
*    c) Copy the PROC PRINT step and paste it at the end  *;
*       of the program. Change PRINT to MEANS and remove  *;
*       the OBS= data set option. Modify the VAR          *;
*       statement to calculate summary statistics for     *;
*       DayVisits, TentCampers, and RVCampers. Highlight  *;
*       the step and run the selected code.               *;
*       What is the minimum value for tent campers? Is    *;
*       that value unexpected?                            *;
*    d) Copy the PROC MEANS step and paste it at the end  *;
*       of the program. Change MEANS to UNIVARIATE.       *;
*       Highlight the step and run the selected code.     *;
*       Are there negative values for any of the columns? *;
*    e) Copy the PROC UNIVARIATE step and paste it at the *;
*       end of the program. Change UNIVARIATE to FREQ.    *;
*       Change the VAR statement to a TABLES statement to *;
*       produce frequency tables for Reg and Type.        *;
*       Highlight the step and run the selected code.     *;
*       Are there any lowercase codes? Are there any      *;
*       codes that occur only once in the table?          *;
*    f) Add comments before each step to document the     *;
*       program. Save the program as np_validate.sas in   *;
*       the output folder.                                *;
***********************************************************;

/* Extend table namespace by library */
libname pg1 base "~/EPG194/data";

/* Level 1 Practice */
proc print data=pg1.np_summary (obs=20);
	VAR Reg Type ParkName DayVisits TentCampers RVCampers;
run;
proc means data=pg1.np_summary;
	VAR DayVisits TentCampers RVCampers;
run;
proc univariate data=pg1.np_summary;
	VAR DayVisits TentCampers RVCampers;
run;
proc freq data=pg1.np_summary;
	tables Reg Type;
run;

/* Level 2 Practice */
proc univariate data=pg1.np_summary;
	Var Acres;
run;
proc print data=pg1.np_summary (obs=6);
	VAR Reg Type ParkName DayVisits TentCampers RVCampers;
run;