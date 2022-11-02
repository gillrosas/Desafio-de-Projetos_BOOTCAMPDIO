use company;
show tables;

-- Dnumber: department
desc department; 
desc dept_locations;

select * from department;
select * from dept_locations;

-- retirar a ambiguidade por meio do alias ou AS STATMEN 
-- select Dname, l.location as Department_name
-- from department as d, dept_locations as l
-- where d.Dnumber =l.Dnumber;

-- concatenar 
select concat(Fname, " ", Lname) from employee;