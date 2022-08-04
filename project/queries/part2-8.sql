SELECT DISTINCT P.NAME
FROM    GCD_PUBLISHER P, GCD_SERIES s
WHERE    P.ID = S.PUBLISHER_ID  
AND      P.COUNTRY_ID != S.COUNTRY_ID
ORDER BY P.NAME;