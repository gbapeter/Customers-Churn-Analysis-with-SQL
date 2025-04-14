WITH usage_groups AS (SELECT customerid, CASE
            WHEN "Usage Frequency" BETWEEN 1 AND 10 THEN 'Less Frequent'
            WHEN "Usage Frequency" BETWEEN 11 AND 20 THEN 'Frequent'
            WHEN "Usage Frequency" BETWEEN 21 AND 30 THEN 'Very Frequent'
        END AS  "frequency distribution"
FROM customer_churn)

SELECT  "frequency distribution", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
JOIN usage_groups
ON customer_churn.customerid = usage_groups.customerid
GROUP BY "frequency distribution"