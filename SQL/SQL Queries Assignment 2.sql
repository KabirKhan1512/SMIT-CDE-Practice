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



select left(zip_code,3) as zip_start
from sales.customers;

-- Assignemnt 11
select * from sales.customers;
select replace(street, 'St.', 'Street')
from sales.customers;

-- Assignment 12
select *
from sales.orders
order by order_date;


select *
from sales.orders
join
sales.customers
on sales.orders.customer_id = sales.customers.customer_id
order by order_id;

select * 
from sales.customers c
right join
sales.orders o
on c.customer_id = o.customer_id;

CREATE SCHEMA hr;
GO
CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);


INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

select *
from production.products p
inner join
production.categories c
on p.category_id = c.category_id;




 select *
from production.products p
inner join 
production.categories c
ON c.category_id = p.category_id
inner join  production.brands b 
ON p.brand_id = b.brand_id;

select * from production.products;
select * from sales.order_items;

select *
from sales.order_items o
left join
production.products p
on o.product_id = p.product_id;


select *
from production.products p
left join 
sales.order_items o
on p.product_id = o.product_id
left join
sales.orders s
on o.order_id = s.order_id;

select p.product_id, p.product_name,p.brand_id, p.list_price, o.discount
from production.products p
right join
sales.order_items o
on p.product_id = o.product_id;


-- all possible order and customers
select *
from sales.orders
cross join 
sales.customers;
