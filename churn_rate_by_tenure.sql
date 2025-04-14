WITH tenure_groups AS (SELECT customerid, CASE
            WHEN tenure BETWEEN 1 AND 15 THEN 'Newcomers'
            WHEN tenure BETWEEN 16 AND 30 THEN 'Regulars'
            WHEN tenure BETWEEN 31 AND 45 THEN 'Veterans'
            WHEN tenure BETWEEN 46 AND 60 THEN 'Loyalists'
        END AS "tenure distribution"
FROM customer_churn)

SELECT "tenure distribution", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
JOIN tenure_groups
ON customer_churn.customerid = tenure_groups.customerid
GROUP BY "tenure distribution"


