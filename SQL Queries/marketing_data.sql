--Marketing Data
select
	rev.date,
	rev.product_id,
	rev.item,
	rev.product_category,
	rev.units_sold,
	rev.price_per_unit,
	rev.units_sold * m.marketing_cost_per_item as marketing_cost,
	rev.revenue	
from (select
	r.date,
	r.product_id,
	c.item,
	c.product_category,
	r.units_sold,
	r.category_id,
	c.price_per_unit,
	round( r.units_sold * c.price_per_unit) as revenue
from retail_sales r
join categories c
	on c.category_id = r.category_id) as rev
join marketing_cost m
	on m.category_id = rev.category_id