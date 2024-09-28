--Best Selling Category

select
	product_category
from(select  
	c.product_category,
    sum (r.Sales_Revenue * (1 - r.discount_percentage / 100.0)) as total_sales_revenue
from retail_sales r
join categories c
	on c.category_id = r.category_id
group by c.product_category
order by total_sales_revenue desc
limit 1) as a ;





