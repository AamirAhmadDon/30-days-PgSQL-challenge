select gender, count(*) ,avg(height_inches),min(height_inches),max(height_inches),
stddev_samp(height_inches), stddev_pop(height_inches), var_samp(height_inches), var_pop(height_inches)
from public.people_heights
group by gender

--ROLL UP function
select gender, count(*),
max(height_inches) as "max height",
min(height_inches) as "min height",
avg(height_inches) as "average height"
from public.people_heights
group by rollup(gender)

--but what if we changed rollup with cube instead?
select gender, count(*),
max(height_inches) as "max height",
min(height_inches) as "min height",
avg(height_inches) as "average height"
from public.people_heights
group by cube(gender)

SELECT
    gender,
    COUNT(*) AS people,
    MAX(height_inches) AS "max height",
    MIN(height_inches) AS "min height",
    AVG(height_inches) AS "average height",
    STDDEV_POP(height_inches) AS "stddev population",
    STDDEV_SAMP(height_inches) AS "stddev sample",
    VAR_POP(height_inches) AS "variance population",
    VAR_SAMP(height_inches) AS "variance sample"
FROM public.people_heights
GROUP BY CUBE(gender);
