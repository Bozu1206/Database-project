SELECT I.ID AS Issue_ID, S.ID AS Story_ID, COUNT(S.ID) AS Number_of_reprints
FROM   GCD_STORY S, GCD_ISSUE I, GCD_STORY_REPRINT R
WHERE  R.ORIGIN_ID = S.ID AND S.ISSUE_ID = I.ID
GROUP BY I.ID, S.ID
ORDER BY COUNT(S.ID) DESC
FETCH FIRST 5 ROWS ONLY;
