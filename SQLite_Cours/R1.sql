/*1.Query customers, display an "At Risk" message if there is bad debt, 
and only select customers with incomes below 3000..*/

SELECT 
    C.CODE_C, 
    C.NAME, 
    S.JOB_TITLE, 
    S.MONTHLY_INCOME,
    CASE 
        WHEN S.HAS_BAD_DEBT = 1 THEN 'At Risk'
        ELSE 'Good Standing'
    END AS Debt_Status
FROM CLIENTS C
JOIN CLIENT_STATUS S ON C.CODE_C = S.CODE_C
WHERE S.MONTHLY_INCOME < 3000
ORDER BY S.MONTHLY_INCOME ASC;