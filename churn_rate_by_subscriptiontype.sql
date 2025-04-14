SELECT "Subscription Type", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
GROUP BY "Subscription Type"