/*Assign a SAS library to a folder on my desktop*/

libname mylib "C:\Users\SSMS1303-27\Desktop";
run;

/* Create a dataset in Work library*/
data dat1;
input Height:1.2;
datalines;
1.61
1.78
1.67
1.88
1.58
1.79
;
run;
proc print data=dat1;
run;

/* Create a dataset in MyLib Library with names/ages */

data mylib.dat2;
input Name:$8. Age:2.; 

/* The dollar sign above tells SAS to use a string for the
variable names, with a maximum length of 8$

datalines;
Amy 22
John 18
Jackson 16
;
run;
proc print data=mylib.dat2;
run;
