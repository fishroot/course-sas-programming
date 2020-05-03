***********************************************************;
*  Activity 2.07                                          *;
*    1) Complete the OPTIONS statement to ensure that the *;
*       column names follow SAS naming conventions.       *;
*    2) Complete the LIBNAME statement to create a        *;
*       library named NP that reads NP_INFO.XLSX in the   *;
*       data folder.                                      *;
*    3) Highlight the OPTIONS and LIBNAME statements and  *;
*       run the selection.                                *;
*    4) Navigate to your list of libraries and open the   *;
*       NP library. Open each table and view the data.    *;
***********************************************************;
* Syntax                                                  *;
*                                                         *;
*    OPTIONS VALIDVARNAME=V7;                             *;
*    LIBNAME libref XLSX "path/filename.xlsx";            *;
*    LIBNAME libref CLEAR;                                *; 
***********************************************************;


options ;

libname ;