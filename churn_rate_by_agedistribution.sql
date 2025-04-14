WITH age_groups AS (SELECT customerid, CASE
            WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
            WHEN age BETWEEN 36 AND 45 THEN 'Adults'
            WHEN age BETWEEN 46 AND 55 THEN 'Middle Aged'
            WHEN age BETWEEN 56 AND 65 THEN 'Elderly'
        END AS "age distribution"
FROM customer_churn)

SELECT "age distribution", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
JOIN age_groups
ON customer_churn.customerid = age_groups.customerid
GROUP BY "age distribution"