WITH support_groups AS (SELECT customerid, CASE
            WHEN "Support Calls" BETWEEN 0 AND 3 THEN 'Few'
            WHEN "Support Calls" BETWEEN 4 AND 6 THEN 'Moderate'
            WHEN "Support Calls" BETWEEN 7 AND 10 THEN 'Many'
        END AS  "calls distribution"
FROM customer_churn)

SELECT  "calls distribution", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
JOIN support_groups
ON customer_churn.customerid = support_groups.customerid
GROUP BY "calls distribution"