***********************************************************;
*  Activity 3.06                                          *;
*  1) Complete the NewLocation assignment statement to    *;
*     use the COMPBL function to read Location and        *;
*     convert each occurrence of two or more consecutive  *;
*     blanks into a single blank.                         *;
*  2) Complete the NewStation assignment to use the       *;
*     COMPRESS function with Station as the only          *;
*     argument. Run the program. Which characters are     *;
*     removed in the NewStation column?                   *;
*  3) Add a second argument in the COMPRESS function to   *;
*     remove both the space and hyphen. Both characters   *;
*     should be enclosed in a single set of quotation     *;
*     marks. Run the program.                             *;
***********************************************************;
*  Syntax Help                                            *;
*     COMPBL(string)                                      *;
*     COMPRESS (string <, characters>)                    *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data weather_japan_clean;
    set pg2.weather_japan;
    NewLocation=COMPBL(Location);
    NewStation=COMPRESS(Station, '-', ' ');
run;
