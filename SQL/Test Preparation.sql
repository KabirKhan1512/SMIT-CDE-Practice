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
select * from sales.order_items;
select * from sales.orders;
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

-- 10. Write a query to select employees where DepartmentID is 3 and the Salary is between 40,000 and 80,000.


-- 11. Write a query to select employee names and salaries, ordered by Salary descending then LastName ascending.


-- 12. Write a query to assign a rank to employees based on their salary.


-- 13. Write a query to assign a dense rank to employees within each department based on salary.


-- 14. Write a query to display each order’s OrderDate along with the next order’s OrderDate.


-- 15. Write a query to display each order’s OrderDate along with the previous order’s OrderDate.


-- 16. Write a query to display customers who placed orders with a TotalAmount greater than the average order amount.


-- 17. Write a query to select OrderID, TotalAmount, and the discount using dbo.CalculateDiscount(@TotalAmount).


-- 18. Describe how to call the stored procedure usp_GetEmployeeDetails with EmployeeID as a parameter.


-- 19. Explain how an index on OrderDate in the Orders table can improve performance.


-- 20. Write a query that shows each order with the customer's name, order date, and employee who handled it.





-- Hard (20 Questions)


-- 1. Write a query to rank employees within each department by salary.


-- 2. Write a query to calculate a running total of TotalAmount for each customer’s orders.


-- 3. Write a query that selects customers from vw_OrderSummary whose order total is above the average and filters using the Customers table.


-- 4. Explain how to design a stored procedure that returns the top 5 bestselling products.


-- 5. Write a query to list every order with its computed discount using dbo.ComputeCustomDiscount(@OrderID), and filter out discounts below a threshold.


-- 6. Write a query to calculate the median salary for each department.


-- 7. Explain how indexes work and how indexing CustomerID improves join performance.


-- 8. Write a query to compute the rank of each product by total sales using Products, OrderDetails, and Orders.


-- 9. Describe a scenario where an AFTER INSERT trigger updates a sales summary table.


-- 10. Write a query using LAG() to show salary differences and rank employees with the largest jumps.



-- 11. Design a view showing each department with total employees and salary payout. Join it with Departments and filter by payout-to-employee ratio.


-- 12. Write a query using LEAD() and LAG() to compare consecutive TotalAmount values and filter based on dbo.GetThreshold().


-- 13. Explain how a stored procedure can be used within a trigger to update loyalty points.


-- 14. Write a query that uses a nested subquery to calculate average sales per month and ranks months by sales.


-- 15. Write a query to create a customer leaderboard using rank and total purchases.



-- 16. Write a query to calculate year-over-year growth in sales per customer.


-- 17. Write a query that joins Employees with vw_DepartmentPerformance and ranks departments.


-- 18. Describe a trigger that prevents updates when order status is 'Shipped'.


-- 19. Write a query using both RANK() and DENSE_RANK() to compare handling of tied values.


-- 20. Design a solution integrating:

--    o A view for sales summary

--    o A stored procedure to get top-performing regions

--    o A UDF for custom commission

--    o Indexes for performance

--    o A trigger to log orders

--    o Window functions for ranking

--    Explain each component’s role, interaction, benefits, and challenges.
