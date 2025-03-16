create database UniversityDB;

use UniversityDB;

create schema academic;

create schema administration;

create table academic.Students (
	ID int primary key identity(1,1) not null,
	name varchar(50) not null,
	email varchar(30) unique,
	dob date check (dob < getdate()),
	gender char(1) check(gender in ('M', 'F')),
	phone varchar(20),
	address varchar(100),
	enrollment_date date default getdate()
);

create table academic.Courses (
	ID int primary key identity (1,1) not null,
	course_name varchar(20) unique not null,
	credits int check (credits between 1 and 5),
	department varchar(20),
	course_description varchar(200)
)

create table administration.Faculty (
	ID int primary key identity (1,1) not null,
	name varchar(50) not null,
	email varchar(30) unique,
	phone varchar(20),
	hire_date date default getdate(),
	department varchar(20)
);

create table academic.Enrollments (
	studentID int not null,
	courseID int not null,
	enrollmentDate date default getdate(),
	primary key (studentID, courseID),
	foreign key (studentID) references academic.students (ID) on delete cascade,
	foreign key (courseID) references academic.courses (ID) on delete cascade,
);

select * from academic.Enrollments;

select * from academic.Students;

insert into academic.Students (name,email,dob,gender,phone,address) 
values
	('Ali', 'alikhan@gmail.com', '1992-5-14', 'M', '0312-3456789', 'Karachi'),
	('Khan', 'khan@gmail.com', '1993-8-23', 'M', '0312-2346421', 'Karachi'),
	('Jalal', 'jalalkhan@gmail.com', '2000-5-10', 'M', '0314-6536789', 'Mardan'),
	('Junaid', 'junaidkhan@gmail.com', '2006-9-27', 'M', '0316-3126989', 'Mardan');


