WITH payment_delay_groups AS (SELECT customerid, CASE
            WHEN "Payment Delay" BETWEEN 0 AND 10 THEN 'Late'
            WHEN "Payment Delay" BETWEEN 11 AND 20 THEN 'Moderately Late'
            WHEN "Payment Delay" BETWEEN 21 AND 30 THEN 'Very Late'
        END AS  "payment delay distribution"
FROM customer_churn)

SELECT  "payment delay distribution", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
JOIN payment_delay_groups
ON customer_churn.customerid = payment_delay_groups.customerid
GROUP BY "payment delay distribution"