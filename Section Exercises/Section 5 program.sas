/* Q1 */
* read SAS dataset from your own storage;
libname mylib 'C:\Users\SSMS1303-01\Desktop';
data work.admit;
set mylib.admit;
BMI = Weight / Height ** 2 * 703; * Exponent is first priority;
Name = upcase(Name);
ActLevel = lowcase(ActLevel);
run;

proc print work.admit;
run;

/* Question 2 */
data date1;
input Name $ @8 DOB DATE9. @18 Gender $; * Note that the column pointer goes BEFORE the variable name;
DATALINES;
Amy   12FEB1996 F
Bella 23DEC1995 F
;
run;
proc print data=date1;
format DOB MMDDYY8.;
run;

data temp;
date_time = "19DEC2010:20:10:10"dt;
date_part = datepart(date_time);
time_part = timepart(date_time);
days=mdy(12,19,2010);
year=year(days);
weekday=weekday(days);
run;
proc print data=temp;
format date_part date9. date_time datetime25.6 time_part time.;
run;

/* Question 3 */
data work.admit2;
set work.admit;
if Age > 30 THEN AgeStatus = 'Middle';
ELSE AgeStatus='Young';
if ActLevel='high' then do;
Name = upcase(Name);
LevelNew=1
end;
else do;
AgeStatus=upcase(AgeStatus);
LevelNew=2;
end;
run;
proc print;
run;
