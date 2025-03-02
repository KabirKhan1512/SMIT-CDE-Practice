

create table hr.employees (
	employeeID int primary key identity(1,1) not null,
	first_name varchar(20) not null,
	second_name varchar(20) not null,
	email varchar(50) unique not null,
	phone varchar(20),
	hiredate date not null,
	jobtitle varchar(20) not null,
	salary decimal(10,2) check(salary > 0),
	departmentID int,
	foreign key (departmentID)
		references hr.departments (departmentID)
		on delete cascade on update cascade
)

create table hr.departments (
	departmentID int primary key identity(1,1) not null,
	departmentname varchar(20) unique not null,
	managerID int,
)

create table hr.projects (
	projectID int primary key identity(1,1) not null,
	projectname varchar(50) not null,
	startdate date not null,
	enddate date,
	budget int check(budget > 10000)
)

create table hr.employeesprojects (
	employeeID int,
	projectID int,
	assigneddate date not null,
	foreign key (employeeID)
		references hr.employees (employeeID)
		on delete cascade on update cascade,
	foreign key (projectID)
		references hr.projects (projectID)
		on delete cascade on update cascade
)



ALTER TABLE hr.departments 
ADD CONSTRAINT fk_manager 
FOREIGN KEY (managerID)
REFERENCES hr.employees (employeeID);


select * from hr.departments;

insert into hr.departments (departmentname, managerID)
values ('IT', null),
		('Ac', null),
		('Fin', null),
		('Mark', null);



insert into hr.employees (first_name,second_name,email,phone,hiredate,jobtitle,salary,departmentID) 
	values ('kabir', 'khan', 'abc', '0312', GETDATE(), 'accountant', 30000, 2);

insert into hr.employees (first_name,second_name,email,phone,hiredate,jobtitle,salary,departmentID) 
	values ('ali', 'khan', 'asdc', '0334', GETDATE(), 'Financer', 60000, 3);



select * from hr.employeesprojects;
select * from hr.employees;
select * from hr.projects;

insert into hr.projects (projectname, startdate,enddate,budget)
values 
 ('masjid', getdate(),DATEADD(MONTH, 9, GETDATE()), 600000)
;

s




