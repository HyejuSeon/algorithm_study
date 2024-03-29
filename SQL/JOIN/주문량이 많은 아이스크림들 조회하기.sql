################# SOL1 ###################
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

################# SOL2 ###################
SELECT A.FLAVOR
FROM FIRST_HALF A
JOIN (
    SELECT FLAVOR, SUM(TOTAL_ORDER) TOTAL
    FROM JULY
    GROUP BY FLAVOR
) B
ON A.FLAVOR = B.FLAVOR
ORDER BY (A.TOTAL_ORDER + B.TOTAL) DESC
LIMIT 3;
