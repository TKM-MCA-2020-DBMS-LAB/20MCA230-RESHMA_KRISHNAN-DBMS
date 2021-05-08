CREATE DATABASE Organization;
USE Organization;
CREATE TABLE Department(Dept_no INT PRIMARY KEY,Dept_name VARCHAR(20),Location VARCHAR(30));
CREATE TABLE Employee(Emp_no INT PRIMARY KEY,Emp_name VARCHAR(20) NOT NULL,DOB DATE NOT NULL,Address VARCHAR(30),Date_of_Join DATE,Mobile_no NUMERIC,Dept_no INT,Salary FLOAT,FOREIGN KEY(Dept_no) REFERENCES Department(Dept_no));
SHOW TABLES;
DESCRIBE Employee;
INSERT INTO Department VALUES(1,"PRODUCTION","Block-1");
INSERT INTO Department VALUES(2,"MARKETING","Block-2");
INSERT INTO Department VALUES(3,"fINANCE","Block-3");
INSERT INTO Department VALUES(4,"HR","Block-4");
SELECT * FROM Department;

INSERT INTO Employee VALUES(1,"Maneesh",'1994-08-12',"Kollam",'2020-05-06',9633019940,3,35000);
INSERT INTO Employee VALUES(2,"Arya",'1999-11-12',"Thiruvanthapuram",'2021-01-08',9895673412,2,8500);
INSERT INTO Employee VALUES(3,"Vishnu",'1994-10-15',"Kollam",'2018-11-15',9746568910,4,40000);
INSERT INTO Employee VALUES(4,"Vivek",'1992-10-19',"Kollam",'2018-11-20',9746563456,1,40000);
SELECT * FROM Employee;
ALTER TABLE Employee  ADD Designation VARCHAR(100);
DESCRIBE Employee;
ALTER TABLE Department  DROP COLUMN Location;
DESCRIBE Department;

DROP TABLE Employee;
DROP TABLE Department;
DROP DATABASE Organization;