use BikeStores;

select * from production.products;

create view vw_productsPrices as
select * 
from production.products
where list_price > 1500;

select * from vw_productsPrices;

select * 
from production.products
where product_name = 'Trek Boone 5 Disc - 2018';

create nonclustered index category_index3
on production.products (product_name);



select * from sales.order_items
where product_id = 26;

create nonclustered index category_index4
on sales.order_items (product_id);

CREATE TABLE sales.PracticeData (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    CreatedDate DATETIME DEFAULT GETDATE()
);


DECLARE @i INT = 1;
DECLARE @batchSize INT = 100000;

WHILE @i <= 1000000
BEGIN
    INSERT INTO sales.PracticeData (Name, Age)
    SELECT TOP (@batchSize)
        'User_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) + @i - 1 AS NVARCHAR(10)),
        ABS(CHECKSUM(NEWID()) % 60) + 18  -- Random age between 18 and 77
    FROM sys.all_objects a CROSS JOIN sys.all_objects b;

    PRINT CONCAT('Inserted ', @i, ' rows...');

    SET @i = @i + @batchSize;
END


select * from sales.PracticeData
where age = 50;


create nonclustered index category_index4
on sales.PracticeData (age);

CREATE NONCLUSTERED INDEX category_index5
ON sales.PracticeData (age)
INCLUDE (Name, ID, CreatedDate);

select * from sales.customers;

create procedure all_customers
as
	begin
	select * from sales.customers;
	end;

exec all_customers;


create procedure name_city @city varchar(50)
as
	begin
	select * from sales.customers
	where city = @city;
	end;

exec name_city @city = 'Campbell';



