################### SOL1 ######################
SELECT CATEGORY, PRICE MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE PRICE IN (
    SELECT MAX(PRICE)
    FROM FOOD_PRODUCT
    GROUP BY CATEGORY
)
AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY PRICE DESC;

################### SOL2 ######################
SELECT F.CATEGORY, F.PRICE MAX_PRICE, F.PRODUCT_NAME
FROM FOOD_PRODUCT F
JOIN (
    SELECT CATEGORY, MAX(PRICE) MAX_PRICE
    FROM FOOD_PRODUCT
    GROUP BY CATEGORY
    HAVING CATEGORY IN ("과자", "국", "김치", "식용유")
) A
ON F.CATEGORY = A.CATEGORY AND F.PRICE = A.MAX_PRICE
ORDER BY MAX_PRICE DESC;