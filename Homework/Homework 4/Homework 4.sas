/* Homework #4, 
PSTAT 130, Raleigh Littles */

LIBNAME mylib '/folders/myshortcuts/SAS_VirtualBox/';

DATA mylib.report;
SET mylib.sanfran;
run;

* Part 1a;
PROC FREQ data = mylib.sanfran;
TITLE1 'Flights from San Francisco';
TABLES Destination;
run;

PROC FREQ data = mylib.sanfran; 
TITLE1 'Flights from San Francisco by Day of Week';
TABLES DepartDay;
run;

* Part 1b;
PROC FREQ data = mylib.sanfran;
TITLE1 'Flights from San Francisco';
TABLES Destination / NOCUM;
run;

PROC FREQ data = mylib.sanfran; 
TITLE1 'Flights from San Francisco by Day of Week';
TABLES DepartDay / NOCUM;
run;


* Part 1c;
PROC FREQ data = mylib.sanfran;
TITLE1 'Flights from San Francisco';
TABLES DepartDay * Destination;
run;

* ---------;

* Part 2a;

PROC FREQ data = mylib.mechanics;
TABLES Gender;
run;

/* Part 2a (1): For Gender, there are 4 possible values listed */

PROC FREQ data = mylib.mechanics;
TABLES JobCode;
run;

/* Part 2a (2): For JobCode, there is one missing value */


* Part 2b;
PROC FREQ data = mylib.mechanics;
TABLES Gender * JobCode;
run;

/* From the output: Assuming 'B' and 'G' are the invalid values of Gender, then the corresponding
JobCode that matches is 'MECH02' and 'MECH03', respectively */

* ------- ;

* Part 3a;
PROC MEANS data= mylib.sanfran;
VAR CargoRev TotPassCap;
TITLE;
RUN;


* Part 3b;
PROC MEANS data= mylib.sanfran n mean median mode stddev MAXDEC=2;
VAR CargoRev TotPassCap;
CLASS Destination;
TITLE;
RUN;


* Part 4;
PROC REPORT data= mylib.employees;
TITLE1 "Employee Salary Data";
COLUMN Division City Salary;
DEFINE Division /  'Division Name' ORDER WIDTH=10;
DEFINE Salary / FORMAT=dollar10. WIDTH=10;
DEFINE City / 'City Based' ORDER;
run;


* Part 5;
PROC REPORT data= mylib.employees;
COLUMN Division City Salary;
DEFINE Salary / FORMAT=dollar10. WIDTH=10;
DEFINE Division / 'Division Name' GROUP;
DEFINE City / GROUP;
TITLE1 'Employee Salary Data by Division / City';
RBREAK AFTER / SUMMARIZE OL DUL;
run;

* Part 6;
PROC TABULATE data = mylib.employees;
VAR Division;
TABLE Division * n;
TITLE1 'Homework #4 Part 6';
run;

* Part 7;
PROC TABULATE data = mylib.employees;
WHERE Division contains "Operations";
VAR Division;
Table City ALL, Division ALL *n;
TITLE1 'Homework #4 Part 7';
run;

* Part 8;
PROC TABULATE data = mylib.employees format=dollar10.;
WHERE Division contains "Operations";
VAR Division;
TABLE City, Salary ALL *mean;
TITLE1 'Homework #4 Part 8';
run;


