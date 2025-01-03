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

-- Assignment 14
SET IDENTITY_INSERT sales.customers ON;

INSERT INTO sales.customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
VALUES (1446, 'Kabir', 'khan', '03129421202', 'abc@gmail.com', 'maymar', 'karachi', 'SD', '23200');

SET IDENTITY_INSERT sales.customers OFF;

select *
from sales.customers;

select *
from production.products;

update production.products
set list_price = list_price * 1.10;

select *
from production.stocks;

delete from production.stocks
where quantity = 0;

-- Assignment 15
select * from production.products;

select *
from production.products
order by list_price desc
offset 5 rows
fetch next 5 rows only;

-- Assignment 17
select *
from production.products
where list_price > (select avg(list_price) from production.products);

select * from production.products;
select * from production.stocks;

-- Assignment 18
select
	product_name,
	list_price,
	quantity
from
	production.products
left join
	production.stocks
on 
	production.products.product_id = production.stocks.product_id
where
	quantity < 5;

-- Assignment 19
select 
first_name, last_name, state, order_id, order_status, required_date

from
sales.customers
join
sales.orders
on
sales.customers.customer_id = sales.orders.customer_id;


select * from sales.orders;
-- Assignment 20
select customer_id, order_status
from sales.orders
order by order_status desc;

select customer_id, count(customer_id) as orders
from sales.orders
group by customer_id
order by orders desc;

-- Assignment 21
