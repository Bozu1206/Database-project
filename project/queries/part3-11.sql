SELECT S.TITLE, COUNT(R.ORIGIN_ID)
FROM GCD_STORY_REPRINT R, GCD_STORY S
WHERE R.ORIGIN_ID = S.ID
GROUP BY R.ORIGIN_ID, S.TITLE
HAVING COUNT(R.ORIGIN_ID) >= 30
ORDER BY COUNT(R.ORIGIN_ID) DESC;