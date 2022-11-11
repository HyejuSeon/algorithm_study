################### SOL1 ######################
SELECT T.APNT_NO, P.PT_NAME, P.PT_NO, T.MCDP_CD, T.DR_NAME, T.APNT_YMD
FROM PATIENT P
JOIN (
    SELECT A.APNT_NO, A.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
    FROM APPOINTMENT A
    JOIN DOCTOR D
    ON A.MDDR_ID = D.DR_ID
    WHERE A.APNT_YMD LIKE "2022-04-13%" AND A.APNT_CNCL_YN = "N"
) T
ON P.PT_NO = T.PT_NO
ORDER BY APNT_YMD;

################### SOL2 ######################
SELECT A.APNT_NO, P.PT_NAME, P.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM APPOINTMENT A
JOIN PATIENT P
ON A.PT_NO = P.PT_NO
JOIN DOCTOR D
ON A.MDDR_ID = D.DR_ID
WHERE A.APNT_YMD LIKE "2022-04-13%" AND A.APNT_CNCL_YN = "N"
ORDER BY APNT_YMD;
