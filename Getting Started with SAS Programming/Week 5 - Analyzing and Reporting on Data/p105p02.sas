libname pg1 base "~/EPG194/data";

/* Level 1 Practice: Producing a Descriptive Statistics Report */

title "Weather Statistics by Year and Park";
proc means data=pg1.np_westweather mean min max maxdec=2;
	var Precip Snow TempMin TempMax;
	class Year Name;
	ways 2;
	output out=wind_stats mean=AvgWind max=MaxWind;
run;
title;

/* Level 2 Practice: Creating an Output Table with Custom Columns */
proc means data=pg1.np_westweather noprint maxdec=2;
	var Precip Snow TempMin TempMax;
	where Precip ^= 0;
	class Year Name;
	ways 2;
	output out=work.rainstats N=RainDays sum=TotalRain;
run;

title "Rain Statistics by Year and Park";
proc print data=work.rainstats noobs;
	var Name Year RainDays TotalRain;
	label Name='Park Name' RainDays='Number of Days Raining' TotalRain='Total Rain Amount (inches)';
run;
title;