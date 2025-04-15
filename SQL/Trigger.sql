use BikeStores;

create table employee_test (
	emp_id int identity,
	emp_name varchar (100),
	emp_sal Decimal (10,2)
);

create table employee_test_audit (
	emp_id int,
	emp_name varchar(100),
	emp_sal decimal (10,2),
	audit_action varchar(100),
	audit_timestamp datetime	
);

create trigger Backup_emp 
on employee_test
for insert 
as
declare @empid int;
declare @empname varchar (100);
declare @empsal decimal (10,2);
declare @audit varchar (100);

select @empid = i.emp_id from inserted i;
select @empname = i.emp_name from inserted i;
select @empsal = i.emp_sal from inserted i;
select @audit = 'Insert Record - After insert Trigger';

insert into employee_test_audit values (@empid, @empname, @empsal, @audit, getdate());
print 'After insert trigger fired';


insert into employee_test values ('Kabir', 5000);

select * from employee_test_audit;


insert into employee_test values ('Khan', 15000);


create trigger trgAfterUpdate 
on employee_test
for update
as 
	declare @empid int;
	declare @empname varchar (100);
	declare @empsal decimal (10,2);
	declare @audit varchar (100);

	select @empid = i.emp_id from inserted i;
	select @empname = i.emp_name from inserted i;
	select @empsal = i.emp_sal from inserted i;
	select @audit = 'Insert Record - After Update Trigger';

	if update(emp_name)
		set @audit = 'Update Record -- After Update Trigger - Name Update.';
	if update(emp_sal)
		set @audit = 'Update Record -- After Update Trigger - Salary Update.';

insert into employee_test_audit values (@empid, @empname, @empsal, @audit, getdate());

print 'After update trigger fired.'


update employee_test set emp_name= 'Kabir Khan' where emp_id=1;

select * from employee_test;

update employee_test set emp_name= 'KabirKhan', emp_sal = '50000'  where emp_id=1;

select * from employee_test_audit;



create trigger trgAfterDelete 
on employee_test
for delete 
as
declare @empid int;
declare @empname varchar (100);
declare @empsal decimal (10,2);
declare @audit varchar (100);

select @empid = d.emp_id from deleted d;
select @empname = d.emp_name from deleted d;
select @empsal = d.emp_sal from deleted d;
select @audit = 'Insert Record - After delete Trigger';

insert into employee_test_audit values (@empid, @empname, @empsal, @audit, getdate());
print 'After delete trigger fired';

delete from employee_test where emp_id = 3;


select * from employee_test_audit;







