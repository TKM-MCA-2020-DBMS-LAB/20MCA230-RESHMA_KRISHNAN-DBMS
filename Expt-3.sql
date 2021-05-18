CREATE DATABASE Orgn;
USE Orgn;
CREATE TABLE Department(Dept_no INT,Dept_name VARCHAR(20) PRIMARY KEY,Location VARCHAR(30));
CREATE TABLE Employee(Emp_no INT PRIMARY KEY,Emp_name VARCHAR(20) NOT NULL,DOB DATE NOT NULL,Address VARCHAR(30),Date_of_Join DATE,Mobile_no NUMERIC,Dept_no INT,Dept_name VARCHAR(20), Designation VARCHAR(30),Salary FLOAT,FOREIGN KEY(Dept_name) REFERENCES Department(Dept_name));
DESCRIBE Employee;
INSERT INTO Department VALUES(1,"PRODUCTION","Block-1");
INSERT INTO Department VALUES(2,"MARKETING","Block-2");
INSERT INTO Department VALUES(3,"FINANCE","Block-3");
INSERT INTO Department VALUES(4,"HR","Block-4");
SELECT * FROM Department;
INSERT INTO Employee VALUES(1,"Maneesh",'1994-08-12',"Kollam",'2020-05-06',9633019940,2,"MARKETING","Admin. Assistant",35000);
INSERT INTO Employee VALUES(2,"Arya",'1999-11-12',"Thiruvanthapuram",'2021-01-08',9895673412,4,"MARKETING","Admin. Cordinator",8500);
INSERT INTO Employee VALUES(3,"Vishnu",'1994-10-15',"Kollam",'2018-11-15',9746568910,1,"HR","Business Analyst",40000);
INSERT INTO Employee VALUES(4,"Vivek",'1992-10-19',"Kollam",'2018-11-20',9746563456,2,"MARKETING","Programme Coordinator",40000);
SELECT * FROM Employee;
-- (i) Add 5 rows in the employee and dept tables
INSERT INTO Department VALUES(5,"PURCHASING","Block-4");
INSERT INTO Department VALUES(6,"SALES","Block-5");
INSERT INTO Department VALUES(7,"ACCOUNTING","Block-6");
INSERT INTO Department VALUES(8,"PUBLIC RELATIONS","Block-1");
INSERT INTO Department VALUES(9,"LEGAL/MEDIA","Block-1");

INSERT INTO Employee VALUES(5,"John",'1970-08-12',"Venjarummood",'2021-02-14',9633789600,5,"LEGAL/MEDIA","Support Assistant",10000);
INSERT INTO Employee VALUES(6,"Firoz",'1971-11-12',"Thiruvanthapuram",'2021-02-14',9895677812,9,"PRODUCTION","Client Relations Manager",8500);
INSERT INTO Employee VALUES(7,"Soorya",'1984-10-15',"Kasaragod",'2021-02-15',9756768910,9,"LEGAL/MEDIA","Typist",8500);
INSERT INTO Employee VALUES(9,"Adonney",'1989-10-19',"Mundakkayam",'2021-02-14',9746989456,1,"PUBLIC RELATIONS","Sr. Clerk",4500);
INSERT INTO Employee VALUES(8,"Ramzan",'2000-10-19',"Calicut",'2021-02-14',9746589456,"SALES",3,"Jr. Clerk",2500);

-- (ii)Display all the records from the above tables
SELECT * FROM Department;
SELECT * FROM Employee;

-- (iii) Display the empno and name of all the employees from department no2
SELECT Emp_name , Emp_no FROM Employee 
WHERE Dept_no = 2;

-- (iv) Display empno,name,designation,dept no and salary in the descending order of salary
SELECT Emp_no,Emp_name,Designation,Dept_no,Salary FROM Employee 
ORDER BY Salary DESC;

-- (v) Display the empno and name of all employees whose salary is between 2000 and 5000
SELECT Emp_no, Emp_name, Salary FROM Employee 
WHERE Salary BETWEEN 2000 and 5000;

-- (vi) Display all designations without duplicate values.
SELECT DISTINCT Designation FROM Employee;

-- (vii) Display the total salary of employees of each department.
SELECT Dept_name,SUM(Salary)
FROM Employee
GROUP BY Dept_name

-- (viii) Change the salary of employees to 25000 whose designation is ‘Typist’
UPDATE Employee 
SET Salary= 25000 
WHERE Designation="Typist";
SELECT * FROM Employee

-- (ix)	Change the mobile no of employee named ‘John’
UPDATE Employee
SET Mobile_no="7856193670" WHERE Emp_name ="John";

-- (x)	Delete all employees whose salaries are equal to Rs.4500
DELETE FROM Employee WHERE salary="4500";
 
 -- (xi) Select the department that has total salary paid for its employees more than 25000
SELECT Dept_name, SUM(Salary) FROM Employee
GROUP BY(Dept_name) HAVING SUM(Salary)>25000;

DROP TABLE Employee;
DROP TABLE Department;
DROP DATABASE Orgn;