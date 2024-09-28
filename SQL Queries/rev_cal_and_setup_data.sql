--Calculate real revenue anb setup data for visualizations
select
	store_id,
	date,
	extract (year from rev.date) as sales_year,
	case 
		when extract(month from rev.date) = 1 then  'January'
		when extract(month from rev.date) = 2 then 'February'
		when extract(month from rev.date) = 3 then  'March'
		when extract(month from rev.date) = 4 then 'April'
		when extract(month from rev.date) = 5 then 'May'
		when extract(month from rev.date) = 6 then 'June'
		when extract(month from rev.date) = 7 then 'July'
		when extract(month from rev.date) = 8 then 'August'
		when extract(month from rev.date) = 9 then 'September'
		when extract(month from rev.date) = 10 then 'October'
		when extract(month from rev.date) = 11 then 'November'
		when extract(month from rev.date) = 12 then 'December'
	end as sales_month,		
	product_id,
	item,
	units_sold,
	price_per_unit,
	rev.revenue,
	round(rev.revenue * (1-discount_percentage/100.0)) as pure_revenue,
	product_category,
	discount_percentage,
	m.marketing_cost_per_item,
	store_location,
	rev.category_id,
	day_of_the_week,
	holiday_effect
from (select
	r.store_id,
	r.date,
	r.product_id,
	c.item,
	r.units_sold,
	c.price_per_unit,
	r.units_sold * c.price_per_unit as revenue,
	c.product_category,
	r.discount_percentage,
	r.store_location,
	r.category_id,
	r.day_of_the_week,
	r.holiday_effect
from retail_sales r
join categories c
	on c.product_id = r.product_id) as rev
join marketing_cost m
	on m.category_id = rev.category_id