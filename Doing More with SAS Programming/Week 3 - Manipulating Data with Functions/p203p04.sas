***********************************************************;
*  LESSON 3, PRACTICE 4                                   *;
*  a) Run the program and examine the data. Notice that   *;
*     ParkName includes a code at the end of each value   *;
*     that represents the park type. Also notice that     *;
*     some of the values for Location are in uppercase.   *;
*  b) Add a LENGTH statement to create a new              *;
*     five-character column named Type.                   *;
*  c) Add an assignment statement that uses the SCAN      *;
*     function to extract the last word from the ParkName *;
*     column and assigns the resulting value to Type.     *;
*  d) Add an assignment statement to use the UPCASE and   *;
*     COMPRESS functions to change the case of Region and *;
*     remove any blanks.                                  *;
*  e) Add an assignment statement to use the PROPCASE     *;
*     function to change the case of Location.            *;
***********************************************************;

%let path=~/EPG294/data;
libname PG2 "&path";

data clean_traffic;
    set pg2.np_monthlytraffic;
    drop Year;
    length Type $ 5;
    Type=scan(ParkName, -1);
    Region=upcase(compress(Region));
    Location=propcase(Location);
run;
