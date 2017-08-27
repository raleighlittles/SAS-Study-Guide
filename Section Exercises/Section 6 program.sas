/*Question 1*/
data students; 

* Use column pointer control to read in data;
input Name $6. +2 Age 2. +2 Enroll date9.; 
datalines; 
David   19  13JUN1998
Amelia  17  02AUG2000
;
run;
proc print data=students;
format enroll date9.;
run;


/*Question 2*/
libname mylib 'C:\Users\SSMS1301-01\Desktop';

DATA LOWSUVMPG;
SET mylib.cars;
if MPG_CITY < 20 then MPG='Low';
else if 20 <= MPG_CITY <= 25 then MPG= 'Medium';
else MPG='High';
/* above statement is equivalent to
if MPG_CITY < 20 then MPG='Low';
if 20 <= MPG_CITY <= 25 then MPG= 'Medium';
if MPG_CITY > 25 then MPG='High';
*/
if MPG='Low' and TYPE='SUV'; /* apply if statememt to subset of the dataset*/
keep ORIGIN MAKE TYPE MPG MPG_CITY MPG_HIGHWAY; 
RUN;
proc print data=LOWSUVMPG;
run;


/*Question3*/
proc contents data=mylib.spec1;
run;
proc contents data=mylib.spec2;
run;

data work.spec;
* Make new set with renamed variables;
set mylib.spec1(rename=(animal=Species number=Count))
mylib.spec2;
TotalCount=Count*10;
run;
proc print data=work.spec;
run;

/*Question 4*/
* We've created two datasets, now we need to sort them before we can merge;
proc sort data=mylib.spec1 out=work.sort1;
by Common;
run;
proc sort data=mylib.spec2 out=work.sort2;
by Common;
run;

* Merge two datasets on a common variable;
data work.merged;
merge work.sort1 work.sort2;
by Common;
run;

proc print data=work.merged;
run;


	




