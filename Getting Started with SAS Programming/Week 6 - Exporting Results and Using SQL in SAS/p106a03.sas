***********************************************************;
*  Activity 6.03                                          *;
*    1) Complete the LIBNAME statement using the XLSX     *;
*       engine to create an Excel workbook named          *;
*       storm.xlsx in the output folder.                  *;
*    2) Modify the DATA step to write the storm_final     *;
*       table to the storm.xlsx file.                     *;
*    3) After the DATA step, write a statement to clear   *;
*       the library.                                      *;
*    4) Run the program and view the log to confirm that  *;
*       storm.xlsx was exported with 3092 rows.           *;
*    5) If possible, open the storm.xlsx file. How do     *;
*       dates appear in the storm_final workbook?         *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    OPTIONS VALIDVARNAME=V7;                             *;
*    LIBNAME libref xlsx "path/file.xlsx";                *;
*     <use libref for output table(s)>                    *;
*    LIBNAME libref CLEAR;                                *; 
***********************************************************;

libname xl_lib xlsx "&outpath/storm.xlsx";

data xl_lib.storm_final;
    set pg1.storm_final;
    drop Lat Lon Basin OceanCode;
run;

libname xl_lib clear;