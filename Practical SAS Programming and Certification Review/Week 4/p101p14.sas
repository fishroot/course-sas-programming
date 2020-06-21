data dead alive(drop=DeathCause AgeAtDeath);
	set sashelp.heart;
	if Status='Dead' then output dead;
	else output alive;
	drop Status;
run;