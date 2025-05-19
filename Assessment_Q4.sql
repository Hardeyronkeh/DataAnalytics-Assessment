WITH clv_value AS(
SELECT
	u.id,
	first_name,
    last_name,
    date_joined,
    confirmed_amount,
    DATEDIFF(CURRENT_DATE(), date_joined) / 30 AS "tenure_months",
    confirmed_amount * 0.001 AS "profit_per_transaction" 
FROM adashi_staging.users_customuser AS u
JOIN adashi_staging.savings_savingsaccount As s
	ON u.id = s.owner_id
)
SELECT
	id AS "customer_id",
	CONCAT(first_name, " ", last_name) AS name,
    tenure_months ,
    COUNT(confirmed_amount) AS "total_transactions", -- I used this so we can use successful transaction
    ROUND((COUNT(confirmed_amount)/ tenure_months )* 12 * AVG(profit_per_transaction), 2) AS "estimated_clv" 
FROM clv_value	
GROUP BY id, first_name, last_name
ORDER BY estimated_clv DESC;