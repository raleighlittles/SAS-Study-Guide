/*check variables in HEART dataset*/
PROC CONTENTS DATA=SASHELP.HEART;
RUN;
PROC PRINT DATA=SASHELP.HEART(OBS=5); 
RUN;
/*Q1_A*/
ods html file='C:\Users\SSMS1303-01\Desktop\output\output1.html';
goptions device=activex;
title1 "Deathcause number";
axis1=' ';
PROC GCHART DATA=SASHELP.HEART;
VBAR DEATHCAUSE/maxis=axis1;
WHERE STATUS='Dead' and Sex='Male';
RUN;
ods html close;
quit;
/*Q1_B*/
title1;
DATA HEARTBMI;
SET SASHELP.HEART;
BMI = round((weight*703) / height**2);
RUN;
ods html file='C:\Users\SSMS1303-01\Desktop\output\output2.html' style=analysis;
goptions device=activex;
PROC GCHART DATA=HEARTBMI;
PIE DEATHCAUSE/SUMVAR=BMI TYPE=MEAN EXPLODE='Cancer';
WHERE STATUS='Dead' and Sex='Male';
RUN;
ods html close;
quit;

/*Q2*/
ods pdf file='C:\Users\SSMS1303-01\Desktop\output\output3.pdf' style=journal;
goptions device=actximg;
proc gplot data=HEARTBMI;
title 'Correlation between Weight and BMI' color=blue;
plot BMI*WEIGHT /vaxis=10 to 60 by 10;
where DEATHCAUSE='Cancer' and Sex='Female';
symbol value=star color=blue i=rl; 
run;
ods pdf close;
quit;

example for output statement
/*https://onlinecourses.science.psu.edu/stat481/node/34*/
/*https://onlinecourses.science.psu.edu/stat481/node/35*/
example for sum statement
/*https://onlinecourses.science.psu.edu/stat481/node/10*/
Search your examples by key word
https://onlinecourses.science.psu.edu/stat481/search
