use BikeStores;

-- 1. Write a query to display all columns for all records from the Employees table.
select *
from hr.employees;

-- 2. Write a query to retrieve the first and last names of employees whose salary exceeds 50,000.
select first_name, last_name
from sales.staffs
where store_id > 1;

-- 3. Write a query to select all customers from the Customers table ordered alphabetically by CustomerName.
select *
from sales.customers
order by first_name asc;

-- 4. Write a query to display the total number of orders from the Orders table.
select count(order_id) as total_orders 
from sales.orders;

-- 5. Write a query to display the number of employees in each department.
select store_id, count(staff_id) as no_of_emp
from sales.staffs
group by store_id;

-- 6. Write a query that selects EmployeeID and concatenates FirstName and LastName as FullName.
select staff_id, first_name + ' ' + last_name as FullName
from sales.staffs;

-- 7. Write a query to join the Employees and Departments tables to show each employee’s name and their department name.
select s.staff_id , s.first_name + ' ' + s.last_name, s.store_id, r.store_name 
from sales.staffs s
join sales.stores r
on s.store_id = r.store_id; 

-- 8. Write a query to calculate and display each product’s price with a 10% discount.
select *, list_price * .1 as discount, list_price - (list_price * .1) as discounted_price
from production.products;

-- 9. Write a query to select all orders where the CustomerID is 'ALFKI', 'ANATR', or 'FRANK'.
select *
from sales.customers
where first_name like 'F%';

-- 10. Write a query to retrieve orders placed after January 1, 2023.
select *
from sales.orders
where order_Date > '2016-03-01';

-- Intermediate (20 Questions)
-- 1. Write a query to list the EmployeeID, FirstName, and DepartmentName for all employees.
select staff_id, first_name, last_name, r.store_name 
from sales.staffs s
join sales.stores r
on s.store_id = r.store_id;


-- 2. Write a query to show all customers and any matching orders.
select c.first_name + ' ' + c.last_name as full_name, c.city, count(o.order_date) as total_orders
from sales.customers c
left join sales.orders o
on c.customer_id = o.customer_id
group by c.first_name + ' ' + c.last_name, c.city;


-- 3. Write a query to display each department having more than 2 employees.
select * 
from
(select s.store_id, r.store_name, count(staff_id) as no_of_emp
from sales.staffs s
join sales.stores r
on s.store_id = r.store_id
group by s.store_id, store_name) as staff
where no_of_emp > 2;


-- 4. Write a query to select employees whose salary is above the average salary.
select product_name, list_price, (select avg(list_price) from production.products) as avg_price
from production.products
where list_price > (select avg(list_price) from production.products)
;

-- 5. Write a query to display each store’s name and its total sales.
select i.order_id, o.store_id, i.list_price, i.discount, s.store_name, list_price - (list_price*discount) as total_price
from sales.order_items i
left join sales.orders o
on i.order_id = o.order_id
left join sales.stores s
on o.store_id = s.store_id
;
select s.store_name, sum((list_price - (list_price*discount)) * quantity) as total_price
from sales.order_items i
left join sales.orders o
on i.order_id = o.order_id
left join sales.stores s
on o.store_id = s.store_id
group by s.store_name
order by total_price desc
;
-- 6. Write a query to list distinct cities from the Customers table.
select distinct city
from sales.customers;

-- 7. Write a query to find orders with a TotalAmount between 500 and 2000.
select order_id, sum((list_price - (list_price*discount)) * quantity) as total_price
from sales.order_items
group by order_id
having sum((list_price - (list_price*discount)) * quantity) between 500 and 2000;

-- 8. Write a query using ROW_NUMBER() to number orders by OrderDate within each CustomerID.
select *,
	ROW_NUMBER() over (
	partition by customer_id
	order by order_date
	) as row_num
from sales.orders;

-- 9. Write a query that selects OrderID and a column OrderStatus that shows 'High' if TotalAmount is above 1000, otherwise 'Low'.
with cte as
(select order_id, sum((list_price - (list_price*discount)) * quantity) as total_price
from sales.order_items
group by order_id)

select order_id, total_price,
case
	when total_price >= 5000 Then 'High'
	Else 'Low'
	End as order_status
from cte;


select order_id, sum((list_price - (list_price*discount)) * quantity) as total_price, case
	when sum((list_price - (list_price*discount)) * quantity) >= 5000 Then 'High'
	Else 'Low'
	End as total_price
from sales.order_items
group by order_id;

-- 10. Write a query to select products where sales is between 4000 and 8000.
with cte as (select p.product_name, SUM(quantity * (o.list_price - (o.list_price * o.discount))) as total_sales
from production.products p
join sales.order_items o
on p.product_id = o.product_id
group by p.product_name)

select product_name, total_sales
from cte
where total_sales between 4000 and 8000
order by total_sales desc;

-- 12. Write a query to assign a rank to employees based on their salary.
select product_name, list_price,
	DENSE_RANK() over(
	order by list_price
	) as price_rank,
	rank() over (
	order by list_price
	) as price_ranks
from production.products;

-- 14. Write a query to display each order’s OrderDate along with the next order’s OrderDate.
select order_id, order_date,
	Lead(order_date,1) over(
	order by order_date) as next_order
from sales.orders;


-- 15. Write a query to display each order’s OrderDate along with the previous order’s OrderDate.
select order_id, order_date,
	Lag(order_date,1) over(
	order by order_date) as previous_order
from sales.orders;

-- 16. Write a query to display customers who placed orders with a TotalAmount greater than the average order amount.
with cte as (select c.first_name, c.last_name, sum(s.list_price - (s.list_price*s.discount)) as total_purchase
from sales.customers c
left join sales.orders o
on c.customer_id = o.customer_id
join sales.order_items s
on o.order_id = s.order_id
group by c.first_name, c.last_name)

select first_name, last_name, total_purchase
from cte
where total_purchase > (select avg(total_purchase) from cte)
order by total_purchase desc;


-- 17. Write a query to select OrderID, TotalAmount, and the discount using dbo.CalculateDiscount(@TotalAmount).


-- 18. Describe how to call the stored procedure usp_GetEmployeeDetails with EmployeeID as a parameter.
Create procedure GetEmployeeDetails
	@emp_id int
as
begin
	select *
	from sales.staffs
	where staff_id = @emp_id
end;

exec GetEmployeeDetails @emp_id = 10;

-- 19. Explain how an index on OrderDate in the Orders table can improve performance.
select * from sales.orders where order_date = '2016-01-06';
create nonclustered index orders_date_index
on sales.orders(order_date);

-- 20. Write a query that shows each order with the customer's name, order date, and employee who handled it.
select c.first_name + ' ' + c.last_name as customer, o.order_date, s.first_name + ' ' + s.last_name as employee
from sales.orders o
left join sales.customers c
on o.customer_id = c.customer_id
join sales.staffs s
on o.staff_id = s.staff_id;



-- Hard (20 Questions)
-- 1. Write a query to rank employees within each department by salary.
Select product_name, list_price,
rank() over(order by list_price) as price_rank,
dense_rank() over(order by list_price) as price_ranks
from production.products;

-- 2. Write a query to calculate a running total of TotalAmount for each customer’s orders.
WITH order_totals AS (
    SELECT 
        o.customer_id,
        o.order_id,
        SUM(i.quantity * (i.list_price - (i.list_price * i.discount))) AS total_amount
    FROM sales.orders o
    JOIN sales.order_items i ON o.order_id = i.order_id
    GROUP BY o.customer_id, o.order_id
)
SELECT 
    customer_id,
    order_id,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_id) AS running_total
FROM order_totals;

-- 3. Write a query that selects customers from vw_OrderSummary whose order total is above the average and filters using the Customers table.
create view sales.customer_orders
as
select c.customer_id, c.first_name + ' ' + c.last_name as customer_name, sum(i.list_price-(i.list_price*i.discount) * i.quantity) as total_price
from sales.customers c
left join sales.orders o
on c.customer_id = o.customer_id
join sales.order_items i
on o.order_id = i.order_id
group by c.customer_id, c.first_name + ' ' + c.last_name;

select *
from sales.customer_orders
where total_price > (select avg(total_price) from sales.customer_orders);
-- 4. Explain how to design a stored procedure that returns the top 5 bestselling products.
create procedure bestselling
as
begin
	select top 5 p.product_id, p.product_name, sum(o.list_price - (o.list_price*o.discount)) as total_sales 
	from production.products p
	left join sales.order_items o
	on p.product_id = o.product_id
	group by p.product_id, p.product_name
	order by total_sales desc
end;
	exec bestselling;

-- Create a scalar UDF that takes a product's price and tax rate and returns the final price after adding tax.
create function sales.price_calculator 
	(	@price decimal(15,2),
		@discount decimal (15,2)
	)
		returns decimal(15,2)
as
begin
	declare @final_price decimal(15,2)
	set @final_price = @price - (@price * @discount)
	return @final_price
End;
go

select sales.price_calculator(499,0.2);

DROP FUNCTION IF EXISTS sales.price_calculator;
GO

-- Write a UDF that returns the full name of a customer by combining their first and last names.
create function sales.full_name(
	@first_name varchar(25),
	@last_name varchar(25)
	) returns varchar(55)
as
begin
	declare @full_name varchar(55);
	set @full_name = @first_name + ' ' + @last_name
	return @full_name
End;

select sales.full_name('Ali', 'Khan') as full_name;

-- Create a UDF to calculate the discount amount based on a fixed discount percentage.
create function sales.discount_finder (
	@price decimal(15,2),
	@discount_rate decimal(3,2)
) returns decimal(15,2)
as
begin
	declare @discount_amount decimal(15,2);
	set @discount_amount = @price * @discount_rate
	return @discount_amount
end;

select sales.discount_finder(599,1) as discount_amount;

-- Write a UDF to check if a product's stock level is below a given threshold.
create function production.stock_check (
	@product_id int
) returns varchar(10)
as
begin
	declare @quantity varchar(10)
	if (select sum(quantity) from production.stocks where product_id = @product_id) < 10 set @quantity = 'Low';
	else set @quantity = 'Not Low';
	return @quantity
end;

select production.stock_check(289) as status;

-- 8. Write a query to compute the rank of each product by total sales using Products, OrderDetails, and Orders.
select p.product_name, sum(o.quantity * (o.list_price - (o.list_price*o.discount))) as total_sales, DENSE_RANK() over(order by sum(o.quantity * (o.list_price - (o.list_price*o.discount))) desc) as ranking
from production.products p
left join sales.order_items o
on p.product_id = o.product_id
group by p.product_name
having sum(o.quantity * (o.list_price - (o.list_price*o.discount))) is not null;


-- 9. Describe a scenario where an AFTER INSERT trigger updates a sales summary table.
CREATE TABLE sales.test_order (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE()
);

create table sales.trigger_order (
	order_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
	audit_action varchar(100),
	audit_time datetime
);

create trigger sales_order_trigger
on sales.test_order
for insert
as
begin
	insert into sales.trigger_order (order_id, product_id, quantity, audit_action, audit_time)
	select
		i.order_id,
		i.product_id,
		i.quantity,
		'Order details inserted',
		GETDATE()
	from inserted i
	print 'Trigger executed after insert'
End;

INSERT INTO sales.test_order (product_id, quantity, order_date)
VALUES 
(34, 150, GETDATE()),
(76, 315, GETDATE());

-- 14. Write a query that uses a nested subquery to calculate average sales per month and ranks months by sales.
select month(r.order_date) as months, year(r.order_date) as years, avg(o.quantity*(o.list_price-(o.list_price*o.discount))) as avg_sales,
DENSE_RANK() over(order by avg(o.quantity*(o.list_price-(o.list_price*o.discount))) desc) as ranks
from production.products p
left join sales.order_items o
on p.product_id = o.product_id
join sales.orders r
on o.order_id = r.order_id
group by MONTH(order_date), year(r.order_date)
order by years;


-- 15. Write a query to create a customer leaderboard using rank and total purchases.
select *, 
DENSE_RANK() over(order by total_price desc) as customers_ranking
from sales.customer_orders;


-- 16. Write a query to calculate year-over-year growth in sales per customer.
with cte as (select c.customer_id, c.first_name + ' ' + c.last_name as customer_name, year(o.order_date) as years, sum(i.list_price-(i.list_price*i.discount) * i.quantity) as total_purchase
from sales.customers c
left join sales.orders o
on c.customer_id = o.customer_id
join sales.order_items i
on i.order_id = o.order_id
group by c.customer_id, c.first_name + ' ' + c.last_name, year(o.order_date))


select *, LAG(total_purchase,1) over(order by years partition by customer_name) 
from cte
;