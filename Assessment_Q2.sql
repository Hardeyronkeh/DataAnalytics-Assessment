WITH frequency_analysis AS(
SELECT 
	u.id,
    DATE_FORMAT(transaction_date, "%Y-%m") AS "yearmonth",
    COUNT(confirmed_amount) AS "transaction_count"
FROM adashi_staging.users_customuser AS u
JOIN adashi_staging.savings_savingsaccount As s
	ON u.id = s.owner_id
GROUP BY u.id, yearmonth
),
average_transaction AS (
SELECT 
	id,
    AVG(transaction_count) AS "average_transaction_count"
FROM frequency_analysis
GROUP BY id, yearmonth
)
SELECT
	CASE
		WHEN average_transaction_count >=10 THEN "High Frequency"
        WHEN average_transaction_count BETWEEN 3 AND 9 THEN "Medium Frequency"
        ELSE "Low Frequency"
	END AS "frequency_category",
	COUNT(id) AS "customer_count",
    AVG(average_transaction_count) AS "average_transaction_count"
FROM average_transaction
GROUP BY frequency_category;