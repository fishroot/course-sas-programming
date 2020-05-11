data parkTypeTraffic;
    set pg2.np_yearlytraffic;
    where ParkType in ('National Monument', 'National Park');
    retain MonumentTraffic 0;
    retain ParkTraffic 0;
    format MonumentTraffic comma20.;
    format ParkTraffic comma20.;    
    if ParkType = 'National Monument' then MonumentTraffic = MonumentTraffic + Count;
    else ParkTraffic = ParkTraffic + Count;
run;

title 'Accumulating Traffic Totals for Park Types';
proc print data=work.parktypetraffic;
    var ParkType ParkName Location Count MonumentTraffic 
        ParkTraffic;
run;
title;