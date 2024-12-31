-- Assignment 1
select *
from sales.customers;


select *
from sales.customers
where
city = 'Buffalo';

-- Assignment 2
select top (5) *
from production.products
order by
list_price desc;

select top (5) percent *
from production.products
order by
list_price desc;

-- Assignment 3
select distinct category_name as category_type
from production.categories

-- Assignment 4
select *
from sales.customers
where city in ('Campbell','Monroe');

select *
from sales.customers
where city = 'New York'
and 
zip_code > 1000
;

select *
from sales.customers
where city = 'New York'
and 
zip_code > 1000
;

-- Assignment 5
select *
from sales.customers
where phone is not null;

-- Assignment 6
select *
from sales.customers
where first_name like ('A%')
or
last_name like ('%s');

select *
from sales.customers
where first_name like ('A%')
and
last_name like ('%s')
and
phone is not null;

-- Assignment 7
select sum(list_price) as total_order_price
from sales.order_items;

select avg(list_price)
from production.products;

select max(list_price)
from production.products;

select category_id, avg(list_price)
from production.products
group by
category_id;

select category_id, avg(list_price)
from production.products
group by
category_id;

-- Assignment 8
select left(product_name,3) as '3 char'
from production.products;

select CHARINDEX('Townie',product_name) as 'char'
from production.products;

select product_name
from production.products;

-- Assignment 9
select RIGHT(phone,4)
from sales.customers
where phone is not null;

select REPLACE(product_name,'Townie','Town') as replaced
from production.products;

-- Assignment 10
select *
from sales.orders
where order_date between '2017-01-01' and '2017-12-31';

select *
from sales.customers
where state not in ('NY', 'TX');

--Assignment 11
select first_name, last_name, order_status, store_id
from sales.customers
inner join sales.orders
on sales.customers.customer_id = sales.orders.customer_id;

--Assignment 12
select * from production.products;
select * from production.categories;

select product_name, model_year, category_name
from production.products
left join production.categories
on production.products.category_id = production.categories.category_id;


select product_name, avg(list_price) as average
from production.products
group by product_name
having avg(list_price) <= 200;

select customer_id, count(customer_id)
from sales.orders
group by customer_id
having COUNT(customer_id) > 2;

-- Assignment 13
select *
from production.products
order by
len(product_name);




