/*******************************************************************/
/* Example SAS code to determine the effects tutoring has on test 
/* scores.
/*  
/* Repeated measures (inputs) being studied:
/*   Group 1 variable TScore_before
/*   Group 2 variable TScore_after
/*
/* Method used to compare means:
/*   - Paired T-Test (PROC TTEST with the PAIRED directive).
/* 	
/*******************************************************************/
/* 
   Create a new data set called TestScores and define two variables
   that will store before and after test scores. 
*/
data TestScores;
input TScore_before TScore_after @@;
datalines;
123 133 135 136 129 135 117 137
120 142 138 135 140 121 145 147
136 168 140 152 146 129 137 145
;
run;
/* Print the two-column data set */
proc print data=TestScores;
run;
/* Enable the output delivery system graphics */
ods graphics on;
/* 
   Invoke the TTEST procedure to produce:
      - Results of the paired sample t-Test. 
      - Summary plots showing the distribution of the mean difference
        between the paired observations.
      - Agreement plot for the input data set.
      - Q-Q Plot showing the difference between the inputs.
*/
proc ttest;
paired TScore_before*TScore_after;
run;
ods graphics off;
