create database companydb;

use companydb;

create schema HR;

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
	foreign key (managerID)
		references hr.employees (employeeID)
		on delete cascade on update cascade
)

create table hr.projects (
	projectID int primary key identity(1,1) not null,
	projectname varchar(50) not null,
	startdate date not null,
	enddate date,
	budget int check(budget > 10000)
)

create table employeesprojects (
	employeeID int,
	projectID int,
	assigneddate date not null,
	foreign key (employeeID)
		references hr.employees (employeeID)
		on delete cascade on update cascade
	foreign key (projectID)
		references hr.projects (projectID)
		on delete cascade on update cascade
)