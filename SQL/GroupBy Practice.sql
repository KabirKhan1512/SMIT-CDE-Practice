use BikeStores;

-- Assignmet 1
select s.first_name, s.last_name, o.staff_id, count(customer_id) as no_of_sales
from sales.orders o
join sales.staffs s
on o.staff_id = s.staff_id
group by s.first_name, s.last_name, o.staff_id;

-- Assignment 2
select store_id, product_name, count(distinct product_name) 
from production.products p
join production.stocks s
on p.product_id = s.product_id

group by store_id, product_name;

-- Assignment 3
select s.store_name, sum(list_price * (1 - i.discount)) as total_sale
from sales.order_items i
join sales.orders o
on i.order_id = o.order_id
join sales.stores s
on o.store_id = s.store_id
group by s.store_name
order by total_sale desc;

-- Assignment 4
select s.store_name, avg(list_price) as avg_sale
from sales.order_items i
join sales.orders o
on i.order_id = o.order_id
join sales.stores s
on o.store_id = s.store_id
group by s.store_name
order by avg_sale desc;

-- Assignment 5
select p.product_name,  i.product_id, count(p.product_id) as max_sales
from sales.order_items i
join sales.orders o
on i.order_id = o.order_id
join production.products p
on i.product_id = p.product_id
group by p.product_name, i.product_id
order by max_sales desc;



-- Assignment 6
select c.category_name, count(c.category_id) as cat_sales,  avg(o.list_price) as avg_price, sum(o.list_price) as total_sales
from sales.order_items o
join production.products p
on o.product_id = p.product_id
join production.categories c
on c.category_id = p.category_id
group by c.category_name
order by cat_sales desc;

-- Assignment 7
select month(order_Date), year(order_date), count(order_id)
from sales.orders
group by year(order_date), month(order_date)
order by YEAR(order_date);

select first_name, last_name
from sales.staffs

union

select first_name, last_name
from sales.customers;

SELECT s.first_name, s.last_name
FROM sales.staffs s
INNER JOIN sales.customers c
ON s.first_name = c.first_name
AND s.last_name = c.last_name;


select * from sales.order_items;
select * from sales.orders;
select * from sales.stores;
select * from production.products;
select * from production.categories;
select * from sales.staffs;
select * from sales.customers;
