**************************************************;
*  Activity 5.08                                 *;
*    Run the program and examine the results to  *;
*    see examples of other procedures that       *;
*    analyze and report on the data.             *;
**************************************************;

%let Year=2016;
%let basin=NA;

**************************************************;
*  Creating a Map with PROC SGMAP                *;
*   Requires SAS 9.4M5 or later                  *;
**************************************************;

*Preparing the data for map labels;
data map;
	set pg1.storm_final;
	length maplabel $ 20;
	where season=&year and basin="&basin";
	if maxwindmph<100 then MapLabel=" ";
	else maplabel=cats(name,"-",maxwindmph,"mph");
	keep lat lon maplabel maxwindmph;
run;

*Creating the map;
title1 "Tropical Storms in &year Season";
title2 "Basin=&basin";
footnote1 "Storms with MaxWind>100mph are labeled";

proc sgmap plotdata=map;
    *openstreetmap;
    esrimap url='http://services.arcgisonline.com/arcgis/rest/services/World_Physical_Map';
            bubble x=lon y=lat size=maxwindmph / datalabel=maplabel datalabelattrs=(color=red size=8);
run;
title;footnote;

**************************************************;
*  Creating a Bar Chart with PROC SGPLOT         *;
**************************************************;
title "Number of Storms in &year";
proc sgplot data=pg1.storm_final;
	where season=&year;
	vbar BasinName / datalabel dataskin=matte categoryorder=respdesc;
	xaxis label="Basin";
	yaxis label="Number of Storms";
run;

**************************************************;
*  Creating a Line PLOT with PROC SGPLOT         *;
**************************************************;
title "Number of Storms By Season Since 2010";
proc sgplot data=pg1.storm_final;
	where Season>=2010;
	vline Season / group=BasinName lineattrs=(thickness=2);
	yaxis label="Number of Storms";
	xaxis label="Basin";
run;

**************************************************;
*  Creating a Report with PROC TABULATE          *;
**************************************************;

proc format;
    value count 25-high="lightsalmon";
    value maxwind 90-high="lightblue";
run;

title "Storm Summary since 2000";
footnote1 "Storm Counts 25+ Highlighted";
footnote2 "Max Wind 90+ Highlighted";

proc tabulate data=pg1.storm_final format=comma5.;
	where Season>=2000;
	var MaxWindMPH;
	class BasinName;
	class Season;
	table Season={label=""} all={label="Total"}*{style={background=white}},
		BasinName={LABEL="Basin"}*(MaxWindMPH={label=" "}*N={label="Number of Storms"}*{style={background=count.}} 
		MaxWindMPH={label=" "}*Mean={label="Average Max Wind"}*{style={background=maxwind.}}) 
		ALL={label="Total"  style={vjust=b}}*(MaxWindMPH={label=" "}*N={label="Number of Storms"} 
		MaxWindMPH={label=" "}*Mean={label="Average Max Wind"})/style_precedence=row;
run;
title;
footnote;
