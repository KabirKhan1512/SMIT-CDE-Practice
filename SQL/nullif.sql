use BikeStores;

create table sales.data (
	sale_id int identity primary key,
	customer_id int,
	product_name varchar(50) not null,
	quantity int not null,
	revenue decimal not null,
	cost decimal not null,
	discount decimal,
	sales_target decimal,
	actual_sales decimal,
	constraint fk_customer foreign key (customer_id) references sales.customers(customer_id)
)


insert into sales.data (customer_id, product_name,quantity,revenue,cost,discount,sales_target,actual_sales)
values (340, 'Bicycle',50, 10000, 7600, 0.2, 11000, 23000);

INSERT INTO sales.data (customer_id, product_name, quantity, revenue, cost, discount, sales_target, actual_sales)  
VALUES  
(1, 'Mountain Bike', 2, 1200, 800, 100, 5000, 1200),  
(2, 'Road Bike', 1, 1500, 1100, 200, 6000, 1500),  
(3, 'Helmet', 5, 250, 150, 50, 1000, 250),  
(4, 'Gloves', 3, 90, 45, 10, 500, 90),  
(5, 'Cycling Jersey', 2, 160, 80, 20, 700, 160),  
(6, 'Mountain Bike', 0, 0, 0, 0, 3000, 0),  
(7, 'Water Bottle', 10, 100, 60, 10, 500, 100),  
(8, 'Bike Pump', 2, 70, 40, 5, 300, 70),  
(9, 'Chain Lubricant', 4, 60, 30, 5, 250, 60),  
(10, 'Road Bike', 1, 1550, 1200, 200, 6000, 1550),  
(11, 'Mountain Bike', 3, 1800, 1350, 150, 5000, 1800),  
(12, 'Helmet', 2, 100, 70, 10, 1000, 100),  
(13, 'Gloves', 1, 30, 15, 5, 500, 30),  
(14, 'Cycling Shorts', 2, 200, 120, 30, 800, 200),  
(15, 'Bike Lock', 3, 180, 120, 20, 700, 180),  
(16, 'Bike Stand', 1, 75, 50, 10, 400, 75),  
(17, 'Bike Bell', 5, 50, 30, 5, 250, 50),  
(18, 'Chain Lubricant', 0, 0, 0, 0, 250, 0),  
(19, 'Mountain Bike', 2, 1200, 800, 100, 5000, 1200),  
(20, 'Helmet', 0, 0, 0, 0, 1000, 0);  


select product_name, revenue, (revenue-cost)/nullif(revenue,0) as result
from sales.data;

select product_name, discount/nullif(revenue,0) as result
from sales.data;

select product_name, actual_sales/nullif(sales_target,0) as results
from sales.data;

select product_name, cost/nullif(quantity,0) as result
from sales.data;

select product_name, revenue/nullif(quantity,0) as result
from sales.data;