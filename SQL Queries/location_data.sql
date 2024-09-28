--Location Data
select
	product_id,
	date,
	store_location,
	round(revenue * (1 - discount_percentage / 100.0)) as pure_revenue
from (
	select
		r.store_id,
		r.date,
		r.product_id,
		c.item,
		r.units_sold,
		c.price_per_unit,
		r.discount_percentage,
		r.units_sold * c.price_per_unit as revenue,
		case 
    when store_location = 'Mayotte' then 'France'
    when store_location = 'Guam' then 'United States'
    when store_location = 'New Caledonia' then 'France'
    when store_location = 'Martinique' then 'France'
    when store_location = 'Reunion' then 'France'
    when store_location = 'Pitcairn Islands' then 'United Kingdom'
    when store_location = 'Heard Island and McDonald Islands' then 'Australia'
    when store_location = 'Antarctica' then 'Not Applicable'
    when store_location = 'Svalbard & Jan Mayen Islands' then 'Norway'
    when store_location = 'Christmas Island' then 'Australia'
    when store_location = 'Palestinian Territory' then 'Palestine'
    when store_location = 'Hong Kong' then 'China'
    when store_location = 'Bouvet Island' then 'Norway'
    when store_location = 'Netherlands Antilles' then 'Netherlands'
    when store_location = 'British Indian Ocean Territory' then 'United Kingdom'
    when store_location = 'Cocos Islands' then 'Australia'
    when store_location = 'Western Sahara' then 'Morocco'
    when store_location = 'Saint Barthelemy' then 'France'
    when store_location = 'Saint Pierre and Miquelon' then 'France'
    when store_location = 'United States Virgin Islands' then 'United States'
    when store_location = 'Bermuda' then 'United Kingdom'
    when store_location = 'Aruba' then 'Netherlands'
    when store_location = 'Greenland' then 'Denmark'
    when store_location = 'Gibraltar' then 'United Kingdom'
    when store_location = 'Jersey' then 'United Kingdom'
    when store_location = 'Guernsey' then 'United Kingdom'
    else store_location
end as store_location
	from retail_sales r
	join categories c
		on c.product_id = r.product_id
) as rev
order by pure_revenue desc