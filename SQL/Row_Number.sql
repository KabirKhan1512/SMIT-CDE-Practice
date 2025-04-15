CREATE TABLE t1 (
    id INT IDENTITY(1, 1), 
    a  INT, 
    b  INT, 
    PRIMARY KEY(id)
);


INSERT INTO
    t1(a,b)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (1,2),
    (1,3),
    (2,1),
    (2,2);

select * from t1;


with cte as(
	select *,
	ROW_NUMBER() over (partition by a,b order by a,b) as row_number
	from t1)
delete from t1
where id in (select id from cte where row_number>1);



