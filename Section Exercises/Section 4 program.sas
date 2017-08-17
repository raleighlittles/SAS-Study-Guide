/* question 1 */
DATA data1;
INPUT state$ num;
datalines;
California	 36.9
Texas	 24.8
New York	 19.5
Florida 	18.5
Illinois	 12.9
;
run;

proc print data=data1;
run;

/* Q2 */
DATA data2;
INPUT @1 state 12
DATALINES;
California 36,961,664
Texas 24,782,302
New York 19,541,453
Florida 18,537,969
Illinois 12,910,409;

/* TA Answers */
/* Q1 */
DATA data1;
input State $ 1-10 Pop 13-17 Date $ 18-22;
datalines;
California	 36.9
Texas	 24.8
New York	 19.5
Florida 	18.5
Illinois	 12.9
;
run;
proc print data=data1;
run;


/* question 2 */
DATA data2;
INPUT State $ 10. Pop Comma12.;
datalines;
California	36,961,664
Texas 		24,782,302
New York 	19,541,453
Florida 	18,537,969
Illinois 	12,910,409
;
run;
proc print data=data2;
format Pop Comma10.;
run;

DATA data2_2;
/* Question 2 part 2? */
INPUT State $ Pop $ Comma10.;
datalines;
California 36,961,664
Texas 24,782,302
New York 19,541,453
Florida 18,537,969
Illinois 12,910,409
run;
proc print data=data2_2;
format Pop Comma10.;
run;

/* Using pointer column controls? */
DATA data3;
input State $ 10. @13 Pop Comma10.;
datalines;
California 	36,961,664
Texas 		24,782,302
New York 	19,541,453
Florida 	18,537,969
Illinois 	12,910,409
;

run;
proc print data=data2;
format Pop Comma10.;
run;

/* Student Ans */
/* Question 3, part 1 */
libname mylib "C:\Users\SSMS1303-22\Documents";
DATA diabetes2;
set mylib.diabetes (DROP = Sex Height Weight);
run;

/* Question 3, part 2 */

DATA work.diabetes;
set diabetes2;
Difference = PostGluc - FastGluc;
LABEL Difference = "Difference Between";
run;

proc print data=work.diabetes;
run;

/* TA Answers for Q3 */
libname mylib 'C:\Users\SSMS1303-22\Documents\';
data work.diabetes;
set mylib.diabetes(drop = Sex Height Weight);
run;

data work.diabetes;
set work.diabetes;
Difference = PostGluc - FastGluc;
label Difference "Difference Beteween PostGluc and FastGluc";
run;

proc contents data=work.diabetes;
run;









