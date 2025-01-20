-- Assignment 1
select c.first_name, c.last_name, c.city
from sales.orders o
inner join sales.customers c
on
o.customer_id = c.customer_id
order by c.customer_id;

-- Assignment 2
select p.product_name, c.category_name
from production.products p
inner join production.categories c
on p.category_id = c.category_id;

-- Assignment 3
select first_name, last_name, count(s.staff_id)
from sales.staffs s
inner join sales.orders o
on s.staff_id = o.staff_id
group by first_name, last_name;



select * from sales.stores;

-- Assignment 4
select store_name, sum(s.quantity) total_quantity
from production.stocks s
inner join sales.stores t
on s.store_id=t.store_id
group by store_name;




-- Assignment 5
select c.first_name, c.last_name, sum(r.list_price * (1 - r.discount)) as total_purchase
from sales.customers c
inner join sales.orders o
on c.customer_id = o.customer_id
inner join sales.order_items r
on o.order_id = r.order_id
group by c.first_name, c.last_name;



-- Assignment 6
select * 
from production.products
where list_price > (select avg(list_price) from production.products);

-- Assignment 7
select product_name, o.order_id, o.list_price, o.discount, (o.list_price * (1-o.discount)) as final_price
from sales.order_items o
inner join production.products p
on o.product_id = p.product_id;




select * from sales.orders;
select * from sales.customers;
select * from sales.order_items;
select * from production.products;


-- Assignment 8
select c.category_name, count(p.category_id) as product_count
from production.categories c
inner join production.products p
on c.category_id = p.category_id
group by c.category_name;




