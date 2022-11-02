-- inserção de dados no db company; 


use company; 
show tables; 
select * from employee;
insert into employee values("Jhon", "B", "Smith", 123456789, "1965-01-09", "731-Fondren-Houston-TX", "M", 30000, null,5);
insert into employee values("Karen", "H", "Smith",472918254, "1965-01-09", "731-Glendale-HO", "F", 24035, null,5 ),    
						   ("Levi", "T", "Rose", 472891987, "1975-05-05", "731-Glendale-HO", "M", 24565, null,4),
                           ("Dors", "R", "Silva", 237894371, "1985-03-02", "731-Sao Paulo-SP", "F", 12035,null,5);
                           
insert into dependent values(123456789, "Alice","F", "1985-08-03","dAUGHTER");
insert into dependent values(472918254, "Ale","M", "1995-05-13","son"),
							(472891987, "Lia","f", "1995-05-01","Daudhter"),
                            (237894371, "Dora","f", "1995-08-01","Daudhter");
select * from dependent; 
insert into department values("Research", 5, 123456789,"1965-01-09"),
							("Administration",4,  472918254,"1965-01-09"),
                            ("Headquarters",1,237894371,"1985-03-02");
                            
-- recuperando dados
select * from employee;
select Ssn, Fname from employee e, department d where (e.Ssn = d.Mgr_ssn);	


-- recuperando dados de dependent 
select Ssn, Fname, Relationship from employee , dependent  where Essn = Ssn;				

-- recuperando nome de uma tabela
select  Bdate, Adress from employee
			where Fname= "Jhon" and Minit = "B" and Lname = "Smith";
            
-- recuperando dados de departamento 
select * from department where Dname= "Research";

-- recuperando dados de departmento especcifico
select Fname, Lname, Adress from employee, department where Dname= "Research" and Dnumber =Dno; 


-- expressões e alias 
-- recolhendo o valor do INSS
select Fname, Lname, Salary, Salary*0.011 from employee; 
select Fname, Lname, Salary, round(Salary*0.011,2) as INNS from employee;


-- definir aumento de salário para os gerentes 
show tables;
select * from works_on;
desc works_on;

-- like e Between 
select * from employee; 

select concat(Fname, " ", Lname) Complete_name from employee where (Adress like "%Houston%");


select concat(Fname, " ", Lname) Complete_NAME, Salary  from employee where (Salary between 20000 and 40000);

-- Operadores lógicos
select Bdate, Adress from employee where Fname= "Jhon" and Lname= "Smith";

select * from department where Dname = "Research" or "Administration";

select concat(Fname, " ", Lname) as Complete_name from employee, department where Dnumber=Dno;

-- Operadores Matemáticos





