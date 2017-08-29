data midterm;
input name $ midscore;
datalines;
Wendy 32
Andy 38
John 27
David 34
;
run;
proc sort data=midterm;
by name;
run;
data final;
input name $ finalscore;
datalines;
John 91
Wendy 73
Andy 82
Robert 75
;
run;
proc sort data=final;
by name;
run;
data allsections;
     merge midterm 
	       final;
	by name;
run;
proc print;
title 'All sections 1';
run;

/*When you use IN= with BY-group processing, 
and when a data set contributes an observation for the current BY group, 
the IN= value is 1.*/
data allsections;
     merge midterm (in=Inmidterm)
	       final (in=Infinal);
	by name;
    IfInMid=Inmidterm;
	IfInFinal=Infinal;
if Inmidterm and Infinal;
run;
proc print;
title 'All sections 2';
run;