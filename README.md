# Introduction
 An indepth analysis to uncover patterns of customer disengagement to provide actionable insights and recommendations to enhance customer loyalty, reduce churn and support the long-term growth of the company.
# Tools I Used
For my deep dive into the customer churn dataset, I harnesssed the power of several key tools:
- **SQL:** The backbone of my analysis, allowing me to query the database and uncover key insights.
- **PostgreSQL:** A powerful database management system, suitable for handling the customer churn dataset.
- **Visual Studio Code:** The code editor used for managing the database, writing and executing queries.
- **Git & GitHub:** The platform for showcasing my project.
# Key Insights and Recommendations
## Churn Rate by Gender
Here is the query I used to find the churn rate by gender.
```SQL
SELECT gender, ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
GROUP BY gender
```
A churn rate of 55% was observed among females while a churn rate of  39% was observed among males. This implies that females are more likely to churn than males. Tailored marketing surveys should be conducted to understand the churn rate of female customers and features that resonate with female customers should be launched.
# Churn Rate by Age Distribution
Here is the query I used to find the churn rate by age distribution.
```SQL
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
```
The highest churn rate (53%) was observed in the Elderly (people aged between 56 and 65) followed by the Middle Aged (people aged between 46 and 55) with a churn rate of 49% and a tie of 45% in Adults (people aged between 36 and 45) and Young Adults (people aged between 18 and 35). This shows that the potential of a customer churning increases as he ages. The company can lower churn rate by launching campaigns to target young adults to attract customers with lower tendencies to churn or offering suitable incentives to retain older customers.
## Churn Rate by Tenure
Here is the query I used to find the churn rate by tenure.
```SQL
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
```
New comers (customers who used the service between 1 and 15 months) had the least churn rate (31%), followed by Regulars (customers who used the service between 16 and 30 months) with Veterans (customers who used the service between 31 and 45 months) and Loyalists (customers who used the service between 46 and 60 months) having a tie of 56%. This implies that the possibility of churning increases as the time of usage of the service increases and the company struggles with retaining customers. This could be as a result of customers desiring to try something new or other factors. Long time customers can be retained by offering incentives to them or making regular changes to their services to provide a refreshing experience. Also, long term active customers should be surveyed to know and address their issues.
## Churn Rate by Usage Usage Frequency
Here is the query I used to find the churn rate by usage frequency.
```SQL
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
```
The churn rate was observed to be highest (55%) in less frequent users (usage frequency between 1 and 10) with frequent users (usage frequency between 11 and 20) and very frequent users (usage frequency between 21 and 30) tieing at 43%. This implies that customers are less likely to churn if they use the service frequently. This could be due to established familiarity with frequent use. Encourage less frequent users to engage more through reminders or personalized recommendations.
## Churn Rate by Number of Support Calls
Here is the query I used to find the churn rate by support calls.
```SQL
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
```
The churn rate was observed to be highest (61%) among users with many support calls (support calls between 7 and 10), followed by users with moderate support calls (support calls between 4 and 6) and least in users with few support calls (support calls between 0 and 3). This implies that the possibility of churning increases with an increase in number of support calls. Customers having many support calls indicates dissatisfaction and regular issues with services. Churn can be averted by permanently addressing customer issues in fewer interactions and improving user experience to reduce the need for more customer support calls.
## Churn Rate by Payment Delay
Here is the query I used to find the churn rate by payment delay.
```SQL
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
```
The churn rate was observed to be highest (77%) among users that make very late payments (payment delay between 21 and 30 days), followed by users with moderately late payments (payment delay between 11 and 20 days) and least in users with just late payments (payment delay between 0 and 10 days). This implies that the possibility of churning increases with an increase in delay of making payments. This issue can be addressed by offering flexible subscription options to help users make payments at more convenient times to reduce delay. Also, the subscription fee can be revised if it is perceived to be too high especially compared to competitors.
## Churn Rate by Subscription Type
Here is the query I used to find the churn rate by subscription type.
```SQL
SELECT "Subscription Type", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
GROUP BY "Subscription Type"
```
The churn rate was observed to be highest among Basic subscribers (48%), closely followed by Standard subscribers (47%) and least among Premium subscribers (46%). This implies that subscription type does not have a significant impact on churning.
## Churn Rate by Contract Length
Here is the query I used to find the churn rate by contract length.
```SQL
SELECT "Contract Length", ROUND((SUM(churn)::NUMERIC/COUNT(churn))*100,0) AS "churn rate"
FROM customer_churn
GROUP BY "Contract Length"
```
The churn rate was observed to be highest among customers on a monthly contract (52%), followed by annual subscribers (46%) and least among quarterly subscribers (44%). This can be addressed  by promoting and incentivizing long term contracts over short term ones.
# Conclusion
The project demonstrated and reinforced my SQL skills, and provided valuable insights into customer churn which will be helpful in improving customer retention and contribute to the overall growth of the company.
