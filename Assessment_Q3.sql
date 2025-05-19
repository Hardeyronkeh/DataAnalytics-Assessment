SELECT p.id AS plan_id, 
p.owner_id,
CASE
WHEN is_regular_savings = 1 THEN "Savings"
WHEN is_a_fund = 1 THEN "Investments"
END AS type,
MAX(transaction_date) AS "last_transaction_date", 
DATEDIFF(CURRENT_DATE() , MAX(transaction_date)) AS "inactivity_days"
FROM adashi_staging.plans_plan As p
JOIN adashi_staging.savings_savingsaccount As s
	ON p.id = s.plan_id
    AND s.transaction_date <= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
GROUP BY p.owner_id, p.id
HAVING type IN ("Savings" , "Investments");