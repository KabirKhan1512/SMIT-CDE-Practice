-- Assignment 1
select *
from sales.customers
where city = 'Fairport';

-- Assignment 2
select *
from sales.customers
where city in ('Fairport','Campbell');

-- Assignment 3
select *
from production.products
where list_price between 100 and 500;

-- Assingment 4
select count(*) 
from sales.customers
where email like '%gmail%';

-- Assignment 5
select *
from production.products
where product_name like 'Tre%';

-- Assignment 6
select *
from sales.orders
order by
order_status;

-- Assignment 7
select first_name, COUNT(order_id)
from sales.staffs
left join
sales.orders
on
sales.staffs.staff_id = sales.orders.staff_id
group by
first_name
order by first_name;



select * from production.products;
select * from production.categories;
-- Assignment 9
select p.product_name, p.brand_id, p.model_year, c.category_name, c.category_id
from production.products p 
left join
production.categories c 
on
p.category_id = c.category_id
order by
p.category_id;


select * from sales.customers;
-- Assignment 10
select *
from sales.customers
where street like 'A%';