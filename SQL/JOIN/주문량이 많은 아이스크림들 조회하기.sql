SELECT FLAVOR
FROM 
(
    SELECT A.FLAVOR FLAVOR, SUM(A.TOTAL_ORDER + B.TOTAL_ORDER) TOTAL
    FROM FIRST_HALF A
    JOIN JULY B
    ON A.FLAVOR = B.FLAVOR
    GROUP BY FLAVOR
    ORDER BY TOTAL DESC
    LIMIT 3
) T;