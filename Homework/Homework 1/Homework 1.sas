/* Homework 1, Part 3
PSTAT 130
Raleigh Littles */

* Load in the data from your folder;
libname hw1_data '/folders/myshortcuts/SAS/';
Options nodate ls = 72;
Options pageno = 99;
title1 'SFO Passenger Data';
title2 'Unformatted Listing';
run;
proc print data= hw1_data.passngrs;
run;

libname hw1_data '/folders/myshortcuts/SAS/';
Options nodate ls=72; *Set line size to 72, hide date;
title1 'SFO Passenger Data';
title2 'Formatted Listing';
run;


proc print data=hw1_data.passngrs label;
label			Dest='Trip Destination'
				Depart='Flight Departure Date'
				FClass='First Class'
				BClass='Business Class'
				EClass='Economy Class' ;

format Depart MMDDYY10;
format FClass BClass EClass COMMA12.2;

run;



