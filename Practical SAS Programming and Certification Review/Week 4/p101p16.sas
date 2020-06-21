proc sort data=sashelp.stocks out=stocks_sort;
    by Stock Date;
    where year(Date)=2005;
run;

data stocks_total;
    set stocks_sort;
    by Stock;
    if first.Stock then YTDVolume=0;
    YTDVolume+Volume;
    format YTDVolume comma15.;
run;