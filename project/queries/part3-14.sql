create view RANKED_PUBLISHERS as
select P.COUNTRY_ID as COUNTRY_ID,
       P.NAME as NAME,
       ROW_NUMBER() over (partition by P.COUNTRY_ID order by COUNT(S.ID) desc) as ROW_NUMBER
from GCD_PUBLISHER P, GCD_SERIES S
where S.PUBLISHER_ID = P.ID
group by P.COUNTRY_ID, P.NAME;

create view RANKED_COUNTRIES as
select C.ID, C.NAME
from STDDATA_COUNTRY C, GCD_PUBLISHER P
where C.ID = P.COUNTRY_ID
group by C.ID, C.NAME
having count(P.ID) > 200;

select C.NAME, P.NAME
from RANKED_PUBLISHERS P, RANKED_COUNTRIES C
where P.COUNTRY_ID = C.ID
and P.ROW_NUMBER < 3;
