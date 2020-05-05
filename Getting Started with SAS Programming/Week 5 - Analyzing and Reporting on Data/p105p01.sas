libname pg1 base "~/EPG194/data";

/*
ods graphics on;

proc freq data=pg1.np_species ORDER=FREQ;
	where Species_ID like "EVER%" and Category ^= "Vascular Plant";
	tables Category / NOCUM;
run;
*/

title1 'Park Types by Region';
proc freq data=pg1.np_codelookup order=freq;
    tables Type*Region / nocol;
    where Type not like '%Other%';
run;

title1 'Selected Park Types by Region';
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
    tables Type*Region /  nocol crosslist 
           plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
    where Type in ('National Historic Site', 'National Monument', 'National Park');
run;
title;