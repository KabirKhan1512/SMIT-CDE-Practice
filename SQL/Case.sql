use BikeStores;

-- Create a CASE statement to classify quantity as "Bulk Order" (≥10), "Medium Order" (5-9), or "Small Order" (<5)
select product_name, quantity, 
	case 
		when quantity >= 10 then 'Bulk Order'
		when quantity >= 5 and quantity <= 9 then 'Medium Order'
		Else 'Small Order'
	End as 'Status'
from sales.data;

-- Use CASE to mark products as "Profitable" if (revenue - cost) > 500, otherwise mark them as "Not Profitable".
select product_name, revenue, 
	case
		when (revenue - cost) > 500 then 'Profitable'
		else 'Not Profitable'
	End as 'status`'

from sales.data;

-- Create a column Sales_Performance where:
-- "Above Target" if actual_sales > sales_target
-- "On Target" if actual_sales = sales_target
-- "Below Target" if actual_sales < sales_target

select product_name,
	case 
		when actual_sales > sales_target then 'Above Target'
		when actual_sales = sales_target then 'On Target'
		Else 'Below Target'
	End as 'sales_performance'
from sales.data;


--Categorize products based on discount: "High Discount" (>15%), "Medium Discount" (5-15%), or "Low Discount" (<5%).
select product_name,
	case 
		when discount > 0.15 then 'High Discount'
		when discount > 0.05 and discount < 0.15 then 'Normal Discount'
		Else 'Small Discount'
	End as 'discount_status'
from sales.data;






