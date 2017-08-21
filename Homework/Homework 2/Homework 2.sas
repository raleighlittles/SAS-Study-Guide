/* Homework #2 Programming Assignment */
/* PSTAT 130, Raleigh Littles */


/* Part 1a */
libname mylib "/folders/myshortcuts/SAS_VirtualBox/";

PROC sort data=mylib.talent out=Sorted_talent;
* Sort Address2 Variable in alphabetical order which means descending ;
by Address2 DESCENDING Rate; 
run;

PROC print data=Sorted_talent;
* Output the sorted dataset;
run;


/* Part 1b */
PROC print data=mylib.talent;
BY Address2;
title "HW 2 Part 1B";
OPTIONS NODATE LS=100;
* Use the VAR statement to specify which variables you want to print ;
VAR FirstName Rate Comment;
PAGEBY Address2;
ID LastName;
* There are 4 columns: LastName, FirstName, Rate, Comment ;
run;


/* Part 2a */

* Read the sfosch.dat file in ;
FILENAME sfo "/folders/myshortcuts/SAS_VirtualBox/sfosch.dat";
DATA work.sanfran;
infile sfo;
* Read in the variables you need based on the column input info given in the HW assignment;
input FlightID $1-7 RouteID $8-14 Destination $18-20 Model $21-40 Depart $41-49 DepartDay 51 TotPassCap 65-67;
run;

* Note that no print statement is needed, only a DATA step ;

/* Part 2b */

/* According to the LOG window, we see that:
i. 52 records were read from the infile SFO
ii. 52 observations are in the resulting data set
iii. The resulting dataset contains 7 variables
*/ 

/* Part 2c */
PROC CONTENTS;
run;

/* Part 2d */
PROC PRINT data = work.sanfran;
run;

/* Part 3a */
DATA work.passengers;
infile sfo;
input @1 FlightID $7.
@8 RouteID $7.
@18 Destination $3.
@41 Depart Date11.
@53 FClassPass 3.
@57 BClassPass 3.
@61 EClassPass 3.
;

run;


/* Part 3b */

/* According to the LOG window, we see that: 
i. 52 records were read from the infile SFO
ii. 52 observations are in the resulting data set
iii. 7 variables are in the resulting data set
iv. The error messages are copied below:

 NOTE: Invalid data for BClassPass in line 11 57-59.
 RULE:     ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9
 11        IA018020000018   SEAJetCruise SF1000    07DEC2000 5  10 N/A 132 150  8500 10965 79
 FlightID=IA01802 RouteID=0000018 Destination=SEA Depart=14951 FClassPass=10 BClassPass=.
 EClassPass=132 _ERROR_=1 _N_=11
 
 NOTE: Invalid data for BClassPass in line 26 57-59.
 26        IA008010000008   RDUJetCruise MF4000    14DEC2000 5  14 N/A 222 267 30200 38958 79
 FlightID=IA00801 RouteID=0000008 Destination=RDU Depart=14958 FClassPass=14 BClassPass=.
 EClassPass=222 _ERROR_=1 _N_=26
 
*/

/* Part 3c */

PROC print data = work.passengers;
Options NODATE LINESIZE=75 PAGENO=1;
format Depart MMDDYY10.;
run;

/* Part 4 */
/* The modified DATA step is */
DATA work.passengers;
infile sfo;
input @1 FlightID $7.
@8 RouteID $7.
@18 Destination $3.
@41 Depart Date11.
@53 FClassPass 3.
@57 BClassPass 3.
@61 EClassPass 3.
;
label FClassPass = "First Class Passengers"
	  BClassPass = "Business Class Passengers"
	  EClassPass = "Economy Class Passengers"
;
run;

proc contents data= work.passengers;
run;

