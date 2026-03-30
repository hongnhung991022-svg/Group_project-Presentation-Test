/*7.List the customers whose files contain the word "loan".*/

SELECT F.TITLE, F.CONTENT, C.NAME AS ClientName
FROM FILES F
JOIN CLIENTS C ON F.ID_EMPLOYEE = C.ID_C
WHERE F.CONTENT LIKE '%loan%';