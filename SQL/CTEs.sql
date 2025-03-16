use BikeStores;

with profitmargin as (
	select product_name, (revenue - cost) as total_revenue 
	from sales.data
)

select * from profitmargin where total_revenue > 50;

with productcount as (
	select product_name, sum(quantity) as sale
	from sales.data
	group by product_name
) select product_name, sale from productcount where sale > 5;

select * from sales.data;

with totalcost as (
	select product_name, customer_id, (cost-discount)*quantity as t_cost
	from sales.data
)
select product_name, customer_id, t_cost
from totalcost
where t_cost > 500;

with profitmargin as (
	select product_name, revenue - cost / nullif(revenue,0) as profit_margin
	from sales.data
)
select product_name, profit_margin
from profitmargin
where profit_margin > 20;


