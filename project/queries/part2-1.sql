CREATE VIEW US_IP_COUNT_PER_PUBLISHER AS
SELECT  P.ID, COUNT(IP.ID) AS IPS
FROM    GCD_PUBLISHER P, GCD_INDICIA_PUBLISHER IP
WHERE   IP.COUNTRY_ID =
            (SELECT C.ID
             FROM   STDDATA_COUNTRY C
             WHERE  C.NAME = 'United States')
        AND
        P.ID = IP.PUBLISHER_ID
GROUP BY P.ID;

CREATE VIEW MAX_US_IP_PUBLISHER_ID AS
SELECT   USP.ID AS PUBLISHER_ID
FROM     US_IP_COUNT_PER_PUBLISHER USP
WHERE USP.IPS=(SELECT MAX(USP2.IPS) FROM US_IP_COUNT_PER_PUBLISHER USP2);

SELECT DISTINCT BG.NAME
FROM GCD_BRAND_GROUP BG, MAX_US_IP_PUBLISHER_ID MPID
WHERE BG.PUBLISHER_ID = MPID.PUBLISHER_ID;