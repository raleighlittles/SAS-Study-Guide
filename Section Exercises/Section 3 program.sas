
/* Question 1 */

* Create empty dataset;
data state;
* Read in the text file at the specified location;
infile "C:\Users\SSMS1303-27\Documents\state.txt";
* The text file above has 3 columns ;
input state $ rank $ pop;
run;
proc print data=state;
run;

/* Another way for question 1? */
libname mylib 'C:\Users\SSMS1303-27\Documents\';
data mylib.state;
infile "C:C:\Users\SSMS1303-27\Documents\state.txt"

/* Question 2 , part 1 */
libname mylib 'C:\Users\SSMS1303-27\Documents\';
data work.diabetes;
	set mylib.diabetes;
run;
proc print data=diabetes;
run;

/* Question 2, part 2 */
proc print data=diabetes;
where Sex="F" & Age>45; * Filter on age > 45 and sex = female ;
run;

/* Question 2, part 3*/
proc print data=diabetes;
* Use the var statement to select desired variables you want to print;
var ID FastGluc PostGluc; 
sum FastGluc PostGluc; * Specify the columns you want to sum;
run;

/* Question 2, part 4 */
proc sort data=diabetes out=Sorted_FastGluc;
by descending FastGluc; * Sort FastGluc on descending order;
run;
proc print data=Sorted_FastGluc noobs;
run;

/* Question 2, part 5 */
proc sort data=diabetes out=Sorted_Height_Weight;
* Sort by height first and then descending weight;
by Height descending Weight;
run;

proc print data=Sorted_Height_Weight;
var Height Weight;
run;

/* Question 2, Part 6 */
proc sort data=diabetes;
by Sex;
run;

proc print data=diabetes;
by Sex;
pageby Sex;
run;

