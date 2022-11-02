create schema if not exists company;
use company; 
create table employee(
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar (15) NOT NULL, 
	Ssn char(9) NOT NULL, 
	Bdate DATE, 
	Adress varchar(30), 
	sex char,
	Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL,
    check (Salary > 2000.0),
	primary key (ssn)
);



use company; 
create table department(
	Dname varchar(15) NOT NULL,
    Dnumber int not null, 
    Mgr_ssn varchar (20), 
    Mgr_start_date date,
    constraint chk_date check(Mgr_ssn < Mgr_start_date),
    primary key (Dnumber),
    unique (Dname), 
    foreign key (Mgr_ssn) references employee (Ssn)
);
-- modificar uma constraint: drop e add
alter table department drop constraint fk_dept; 
alter table department
		add constraint ofk_dept foreign key (Mgr_ssn) references employee(Ssn)
        on update cascade;



create table dept_locations(
	Dnumber int not null, 
    Dlocations varchar(15) not null, 
    primary key(Dnumber, Dlocations),
    foreign key(Dnumber) references department (Dnumber)

);





create table project(
	Pname varchar (15) not null,
	Pnumber int not null, 
	Plocation varchar (15), 
	Dnum int not null, 
	primary key(Pnumber), 
	unique (Pname),
	foreign key(Dnum) references department (Dnumber)
 );
 
 create table works_on(
	Essn char(9) not null,
    Pno int not null, 
    Hours decimal(3,1) not null, 
    primary key (Essn, Pno),
    foreign key (Essn) references employee (Ssn), 
    foreign key (Pno) references project (Pnumber) 
 );

create table dependent (
	Essn char(9) not null, 
    Dependent_name varchar (15) not null, 
    Sex char, -- F OU M
    Bdate date, 
    Relationship varchar (8), 
    primary key(Essn, Dependent_name), 
    foreign key (Essn) references employee(SSn)
);
alter table dependent drop constraint fk_dependent; 
alter table dependent add constraint OFK_dependent foreign key(Essn) references employee(Ssn)
					  on update cascade; 

show tables; 
desc dependent;

select * from information_schema.referential_constraints
	where  constraint_schema =  "company";

