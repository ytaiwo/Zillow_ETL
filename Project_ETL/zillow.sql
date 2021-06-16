select * from zindicator as i
inner join category as c
on c. category_id = i.category_id


drop table category,region,regtype,stg_zillow_data,stg_zillow_ind,stg_zillow_region,zdata,zindicator cascade


/* Query:
Home value forecasts for state */

select d.region_id, from region as r
inner join zdata as d
on d.zind_id = r.region_num
where trim(state) = 'UT'

/* Query 1: 
Display all the avalibale renetals with their prices: */

select zindicator.indicator_name, 
	zdata.zdate, zdata.value, 
	category.category_name,
	reg.state
from zindicator
left join zdata 
on zindicator.zind_id = zdata.zind_id
left join category 
on category.category_id = zindicator.category_id
left join region reg
ON reg.region_num=zdata.region_id
where indicator_name = 'RSNA' 
and trim(state) = 'IN'

/* Query :
Display all the indicators for category */
select c.category_id,c.category_name, i.zind_id, i.indicator_name, i.indicator from category as c 
inner join zindicator as i
on c.category_id=i.category_id
where category_name='Inventory and sales'

select i.zind_id,i.indicator_name,c.category_name from zindicator as i
inner join category as c
on c.category_id=i.category_id
where indicator_name ='CRAM'