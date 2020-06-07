data holiday2019;
	set sashelp.holiday;
	where end=. and rule=0;
	CountryCode=substr(Category,4,2);
	Date=mdy(month, day, 2019);
	keep Desc CountryCode Date;
run;

