create view MARVEL as
select distinct LOWER(S.FEATURE) as FEATURE
from GCD_STORY S, GCD_ISSUE I, GCD_INDICIA_PUBLISHER P
where S.ISSUE_ID = I.ID
and I.INDICIA_PUBLISHER_ID = P.ID
and LOWER(P.NAME) like '%marvel%'
and LOWER(P.NAME) not like '%dc%'
and LOWER(S.FEATURE) is not null;

create view CROSSOVER as
select distinct LOWER(S.FEATURE) as FEATURE
from GCD_STORY S, GCD_ISSUE I, GCD_INDICIA_PUBLISHER P
where S.ISSUE_ID = I.ID
and I.INDICIA_PUBLISHER_ID = P.ID
and LOWER(P.NAME) like '%marvel%'
and LOWER(P.NAME) like '%dc%';

select distinct MARVEL.FEATURE
from MARVEL, CROSSOVER
where CROSSOVER.FEATURE like concat(concat('%', MARVEL.FEATURE), '%');
