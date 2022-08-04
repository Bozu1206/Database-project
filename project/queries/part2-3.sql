SELECT DISTINCT S.NAME
FROM   GCD_SERIES S
WHERE  S.PUBLICATION_TYPE_ID =  
                (SELECT P.ID 
                 FROM   GCD_SERIES_PUBLICATION_TYPE P 
                 WHERE  P.NAME = 'book')
       AND
       S.COUNTRY_ID = (SELECT C.ID 
                       FROM   STDDATA_COUNTRY C 
                       WHERE  C.NAME = 'Switzerland')
ORDER BY S.NAME;
