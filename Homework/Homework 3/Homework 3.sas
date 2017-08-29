/* Raleigh Littles
 PSTAT 130 Homework 3
 Programming Assignment */


LIBNAME mylib '/folders/myshortcuts/SAS_VirtualBox/';

* Part 1a;
DATA work.bonus;
SET mylib.fltattnd;
* Part 1b;
BonusAmt = Salary * 0.12;
* Part 1c;
AnnivMo = month(HireDate);
* Part 1d;
KEEP EmpID Salary BonusAmt HireDate AnnivMo;
run;

PROC print data = work.bonus;
* Part 1e;
FORMAT Salary Dollar10.0 BonusAmt Dollar10.0;
run;

* ----- ;
* Begin Part 2;

DATA work.raises;
SET mylib.fltattnd;

* Part 2a ;
IF JobCode='FLTAT1' THEN Increase = 0.15 * Salary;
ELSE IF JobCode='FLTAT2' THEN Increase = 0.10 * Salary;
ELSE IF JobCode='FLTAT3' THEN Increase = 0.05 * Salary;

* Part 2b ;
NewSal = Salary + Increase;

KEEP EmpID Salary Increase NewSal;
run;

PROC PRINT data=work.raises;
* Part 2c;
FORMAT Salary Dollar10.2 Increase Dollar10.2 NewSal Dollar10.2;
run;

* ----- ;
* Begin Part 3;

* Part 3a;
/* The 'aprtarget' dataset contains 120 observations and 7 variables. 
The variables are: Flight Destination Date FClassTar EClassTar FRev ERev. */

/* The 'maytarget' dataset contains 67 observations and 7 variables.
The variables are: FlightID Destination Date FTarget ETarget FRev ERev */

/* The 'junetarget' dataset contains 120 observations and 7 variables. 
The variables are: FlightID Destination Date FTarget ETarget FRev ERev */

* Part 3b;
DATA work.q2vienna;
SET mylib.aprtarget(RENAME=(Flight = FlightID
							FClassTar = FTarget
							EClassTar = ETarget))
	mylib.maytarget mylib.juntarget;
* Part 3e;
TotalTar = FTarget + ETarget;
TotalRev = FRev + ERev;
KEEP FlightID Destination Date TotalTar TotalRev;
run;

* Part 3c;
/* According to the LOG, the new dataset contains 307 observations and 7 variables. */

* Part 3d;
PROC PRINT data= work.q2vienna;
run;

* ------ ;
* Begin Part 4;

* Part 4a;
PROC SORT data=mylib.target121999 out= work.sort_b;
by FlightID;
WHERE Date='15dec1999'd and Origin = 'BHM';
run;

* Part 4b;
PROC SORT data=mylib.sales121999 out=work.sort_s;
by FlightID;
WHERE Date='15dec1999'd and Origin = 'BHM';
run;

* Part 4c;
DATA work.compare;
MERGE work.sort_b work.sort_s;
BY FlightID;
LostCargoRev = CargoTarRev - CargoRev;
run;

* Part 4e;
PROC PRINT data = work.compare;
var CargoTarRev CargoRev LostCargoRev;
FORMAT LostCargoRev Dollar10.2;
run;

