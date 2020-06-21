proc sort data=sashelp.shoes out=highlow;
    by Product Sales;
run;

data highlow;
    length HighLow $ 4;
    set highlow;
    by Product;
    if first.product then do;
        HighLow="Low";
        output;
    end;
    if last.product then do;
        HighLow="High";
        output;
    end;
    keep Region Product HighLow Sales Subsidiary;
run;