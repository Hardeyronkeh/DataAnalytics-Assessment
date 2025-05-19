WITH user_savings AS(
SELECT 
	u.id, 
    first_name, 
    last_name, 
	ROUND(SUM(confirmed_amount),2) AS total_deposit
FROM adashi_staging.users_customuser AS u
JOIN adashi_staging.savings_savingsaccount As s
ON u.id = s.owner_id
GROUP BY 
	u.id, first_name, last_name
)
SELECT 
	us.id, 
    CONCAT(first_name, " ", last_name) AS name,
    SUM(is_regular_savings) AS savings_count,
	SUM(is_a_fund)  AS investment_count,
    total_deposit
FROM user_savings us
JOIN adashi_staging.plans_plan As p
ON us.id = p.owner_id
GROUP BY 
	us.id, first_name, last_name
HAVING savings_count AND investment_count >= 1
ORDER BY total_deposit DESC;