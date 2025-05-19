# Data Analytics SQL Assessment 

This repository contains SQL assessment files:

- `Assessment_Q1.sql`: a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
- `aAssessment_Q2.sql`: a query to calculate the average number of transactions per customer per month and categorize them.
- `aAssessment_Q4.sql`: a query to find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).
- `Assessment_Q4.sql`: a query to estimte customer lifetime value (CLV) .

`Assessment_Q1.sql` I made use of CTE, I joined the first 2 tables needed for the query first in the CTE and then join the third table from my output query. I had to use group by as well as the query require I group per customers, and finally I filtered my aggregated data so as to get what I needed to.

`Assessment_Q2.sql` I also made use of CTE here, I first selected the data I needed, and extracted the transaction date into month/year, after that I created another CTE so I can average the total transaction, by customer and month, then I use control flow (CASE) to categorize my data to get the desired output.

`Assessment_Q3.sql` I made use of inner join to join the 2 tables needed for this query, I then selected the needed columns, I made use of Control flow too (CASE) because my "is_regular_saings" colun and the investment column oo has 0 or 1, so i use that to put either investment or savings if it is a 1 in both columns, before doing that, I made sure I check that a row does not have a 1 in both column (so as to avoid a clash, and to ensure accuracy), I then made use of DATE_SUB to bact track my date by a year, so as to get the query needed.

`Assessment_Q4.sql` I made use of CTE here too, and use join in the CTE to join the 2 tables needed in my query, I then selected some columns that will be useful in mu final output, I calculated the column for profit_per_transaction in the CTE, I then went further and selected the needed columns to get the desired output, I calculated the customer_lifetime value using the provided formular

# Challenges faced

when i started the assessment, after running the query provided for the adashi_staging database and the 4 tables, I then wrote the query for the first assessment, and then I keep getting a "you've lost connection to your server", I tried it multiple times after getting to above 30.000 secs I got same feedback, I was confused and then decided to change my approach, I first checked if my tables were indexed, which they were, I then try to join the tables in two's (i used user and plan first), then (user and saving), it ran perfectly, I then try to join the 3 together again, it was same issue, and then i try to optimize my query (discovering it is taking too much minutes perhaps because 1 of the datasets is huge), which was the reason I used CTE as explain earlier in assessment 1, I used the cte to join the first 2 tables (as it ran perfectly when i was trying to figure out the problem earlier), an then select the needed data from the CTE, joining the 3 table, which ran in less than 5 secs, and then I got the desired results the first 3 joins I was trying to use earlier was supposed to achieve.
