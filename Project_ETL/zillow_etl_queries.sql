--Zillow_ETL Queries

/* Query 1 */
select * from zindicator as i
inner join category as c
on c. category_id = i.category_id

/* Query 2:
Home value forecasts for state */

select d.zregion_id from region as r
inner join zdata as d
on d.zind_id = r.region_num
where trim(state) = 'UT'

/* Query 3:
Display all the avalibale renetals with their prices: */

select zindicator.indicator_name,
zdata.zdate, zdata.zvalue,
category.category_name,
reg.state
from zindicator
left join zdata
on zindicator.zind_id = zdata.zind_id
left join category
on category.category_id = zindicator.category_id
left join region reg
ON reg.region_num = zdata.zregion_id
where indicator_name = 'RSNA'
and trim(state) = 'IN'


/* Query 4:
Display all the indicators for category */
select c.category_id,c.category_name, i.zind_id, i.indicator_name, i.indicator from category as c
inner join zindicator as i
on c.category_id=i.category_id
where category_name='Inventory and sales'

/* Query 5:
Average home values by state */
SELECT category_name, AVG(zvalue)
FROM category
JOIN zindicator
ON category.category_id = zindicator.category_id
JOIN zdata
ON zindicator.zind_id = zdata.zind_id
JOIN region
ON zdata.zregion_id = region.region_id
WHERE category_name = 'Home values'
GROUP BY state

