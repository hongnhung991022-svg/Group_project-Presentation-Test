/*5.Find the job with the highest average income.*/

SELECT JOB_TITLE, AVG(MONTHLY_INCOME) AS AvgIncome
FROM CLIENT_STATUS
GROUP BY JOB_TITLE
ORDER BY AvgIncome DESC
LIMIT 1;