CREATE DATABASE Organization;
USE Organization;
CREATE TABLE Department(Dept_no INT PRIMARY KEY,Dept_name VARCHAR(20),Location VARCHAR(30));
CREATE TABLE Employee(Emp_no INT PRIMARY KEY,Emp_name VARCHAR(20) NOT NULL,DOB DATE NOT NULL,Address VARCHAR(30),Date_of_Join DATE,Mobile_no NUMERIC,Dept_no INT,Salary FLOAT,FOREIGN KEY(Dept_no) REFERENCES Department(Dept_no));
SHOW TABLES;
DESCRIBE Employee;
INSERT INTO Department VALUES(1,"PRODUCTION","Block-1");
INSERT INTO Department VALUES(2,"MARKETING","Block-2");
INSERT INTO Department VALUES(3,"FINANCE","Block-3");
INSERT INTO Department VALUES(4,"HR","Block-4");
INSERT INTO Department VALUES(5,"PURCHASING","Block-4");
INSERT INTO Department VALUES(6,"SALES","Block-5");
INSERT INTO Department VALUES(7,"ACCOUNTING","Block-6");
INSERT INTO Department VALUES(8,"PUBLIC RELATIONS","Block-1");
INSERT INTO Department VALUES(9,"MEDIA","Block-1");
SELECT * FROM Department;

INSERT INTO Employee VALUES(1,"Maneesh",'1994-08-12',"Kollam",'2020-05-06',9633019940,3,35000);
INSERT INTO Employee VALUES(2,"Arya",'1999-11-12',"Thiruvanthapuram",'2021-01-08',9895673412,2,8500);
INSERT INTO Employee VALUES(3,"Vishnu",'1994-10-15',"Kollam",'2018-11-15',9746568910,4,40000);
INSERT INTO Employee VALUES(4,"Vivek",'1992-10-19',"Kollam",'2018-11-20',9746563456,1,40000);
INSERT INTO Employee VALUES(5,"Sandra",'1970-08-12',"Venjarummood",'2021-02-14',9633789600,9,10000);
INSERT INTO Employee VALUES(6,"Firoz",'1971-11-12',"Thiruvanthapuram",'2021-02-14',9895677812,2,8500);
INSERT INTO Employee VALUES(7,"Rakhi",'1984-10-15',"Kasaragod",'2021-02-15',9756768910,9,8500);
INSERT INTO Employee VALUES(8,"Anand",'2000-10-19',"Calicut",'2021-02-14',9746589456,2,10000);
INSERT INTO Employee VALUES(9,"Akshay",'1989-10-19',"Mundakkayam",'2021-02-14',9746989456,8,10000);
SELECT * FROM Employee;

DELIMITER //
CREATE FUNCTION Emp_Data(dep_no INT)
RETURNS INTEGER

BEGIN
DECLARE emp_count INT; 
 SELECT COUNT(*) INTO emp_count
FROM Employee
WHERE Employee.Dept_no = dep_no ;
RETURN emp_count;
END
//

