use BikeStores

-- Q1: Create a view that returns each product’s total sold quantity and average discount received.
create view production.product_quantity_solds
as
	select p.product_name, sum(o.quantity) as total_quantity_sold, avg(o.discount) as avg_discount 
	from production.products p
	left join sales.order_items o
	on p.product_id = o.product_id
	group by p.product_name;

select * from production.product_quantity_solds
order by total_quantity_sold;

-- Q2: List customers who have placed more orders than the average number of orders per customer.
select * from sales.customer_orders
where total_price > (select avg(total_price) from sales.customer_orders)
order by total_price desc;

-- Q3: Build an IF…ELSE block that accepts @BrandID and prints the number of products under that brand, or “Brand not found” if none exist.
create procedure production.brand_check @brandID int
as
begin
if exists (select 1 from production.brands where brand_id = @brandID)
begin
		select b.brand_name, COUNT(p.product_id)
		from production.products p
		join production.brands b
		on p.brand_id = b.brand_id
		where b.brand_id = @brandID
		group by b.brand_name
End
else
begin
	print 'Brand ID not found.'
end
end;

exec production.brand_check @brandID = 112;


select * from production.brands;
select * from production.products;

-- Q4: Find all pairs of products that share the same brand but belong to different categories; show both product names, their categories, and the brand name.

-- Q5: Write a scalar UDF ufn_CalcOrderTotal(@OrderID) returning the total amount (after discount) for that order.

-- Q6: For each order, calculate its total amount and then categorize it as ‘Low’, ‘Medium’ or ‘High’ value using thresholds of your choice.

-- Q7: Identify a query that filters orders by order date and customer city. Then describe what non-clustered index you’d create to optimize it.

-- Q8: Retrieve all products whose list price exceeds the average list price of their category.

-- Q9: Write a T-SQL script that takes a @StoreID parameter: if that store has processed zero orders in the last 30 days, print “No recent sales”; otherwise print “Active store”.

-- Q10: Produce a single list of all distinct “locations” where the business operates, combining store cities and customer cities, with a column labeling each row as ‘Store’ or ‘Customer’.

-- Q11: List every order, showing its ID, date, customer name, store city and country, plus for each order line the product name and quantity—include orders even if they have no items yet.

-- Q12: Write a trigger on stocks that prevents any update setting quantity to a negative number—if attempted, roll back the operation.

-- Q13: Design a stored procedure usp_GetCustomerOrders that takes @CustomerID and returns all their orders with totals and status.

-- Q14: Create an AFTER INSERT trigger on order_items that updates a running total in a separate product_sales_summary table.

-- Q15: Create a table-valued UDF ufn_ProductsByCategory(@CategoryID) listing all products in a category along with their current total stock across all stores.

-- Q16: Propose an index strategy to speed up retrieving the top-selling products in a given month.

-- Q17: Build a proc usp_AdjustStock that accepts @StoreID, @ProductID, and @AdjustmentQty; it should apply the change and log it into an inventory_log table.

-- Q18: For each store, show its name and the number of orders it processed that exceeded that store’s own average order total.

-- Q19: List every product and assign a stock-status label—‘Out of Stock’, ‘Low Stock’ (<10 units), or ‘In Stock’—based on its total quantity across all stores.

-- Q20: Create a view showing each customer’s total lifetime spend and most recent order date.
