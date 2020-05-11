proc sort data=sashelp.shoes out=sort_shoes;
    by Region Product;
run;

data profitsummary;
    set sort_shoes;
    by Region Product;
    Profit=Sales-Returns;
    if first.Product then TotalProfit=0;
    TotalProfit+Profit;
    if last.Product=1;
    keep Region Product TotalProfit;
    format TotalProfit dollar12.;
run;