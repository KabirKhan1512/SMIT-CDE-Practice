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
