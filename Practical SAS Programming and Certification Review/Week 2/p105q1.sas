proc sort data=sashelp.baseball out=baseball_sort;
	  by Team Name;
run;

title "Baseball Team Statistics";
proc print data=baseball_sort label;
	  by Team;
	  id Name;
	  var Position YrMajor nAtBat nHits nHome;
	  sum nAtBat nHits nHome;
run;

