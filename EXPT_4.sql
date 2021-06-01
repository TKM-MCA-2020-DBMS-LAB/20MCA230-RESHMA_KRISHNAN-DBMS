
 MySQL SQL > use company;
Default schema set to `company`.
Fetching table and column names from `company` for auto-completion... Press ^C to stop.
 MySQL company  SQL > show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| department        |
| employee          |
| manager           |
+-------------------+
3 rows in set (0.0018 sec)
 MySQL  company  SQL > select * from department;
+------+-------------+
| D_No | D_Name      |
+------+-------------+
|    1 | Payroll     |
|    2 | TechSupport |
|    3 | Research    |
+------+-------------+
3 rows in set (0.0272 sec)
 MySQL company  SQL > select * from employee;
+----+------+----------+--------+------------+------+
| ID | NAME | SUPER_ID | SALARY | DOB        | D_No |
+----+------+----------+--------+------------+------+
|  1 | John |        3 | 100000 | 1960-01-01 |    1 |
|  2 | Mary |        3 |  50000 | 1964-12-01 |    3 |
|  3 | Bob  |     NULL |  80000 | 1974-02-07 |    3 |
|  4 | Tom  |        1 |  50000 | 1978-01-17 |    2 |
|  5 | Roy  |     NULL |   NULL | 1985-01-20 |    1 |
+----+------+----------+--------+------------+------+
5 rows in set (0.0491 sec)

// VIEW


 MySQL  company  SQL > create view Details as select name,salary,dob,d_name from employee, department where employee.d_no = department.d_no;
Query OK, 0 rows affected (0.3847 sec)
 MySQL  company  SQL > select * from Details;
+------+--------+------------+-------------+
| name | salary | dob        | d_name      |
+------+--------+------------+-------------+
| John | 100000 | 1960-01-01 | Payroll     |
| Mary |  50000 | 1964-12-01 | Research    |
| Bob  |  80000 | 1974-02-07 | Research    |
| Tom  |  50000 | 1978-01-17 | TechSupport |
| Roy  |   NULL | 1985-01-20 | Payroll     |
+------+--------+------------+-------------+
5 rows in set (0.0018 sec)

 MySQL  company  SQL > select * from Details where salary>50000;
+------+--------+------------+----------+
| name | salary | dob        | d_name   |
+------+--------+------------+----------+
| John | 100000 | 1960-01-01 | Payroll  |
| Bob  |  80000 | 1974-02-07 | Research |
+------+--------+------------+----------+
2 rows in set (0.0267 sec)

//PROCEDURE

 MySQL  SQL > create table deptsal as select D_No, 0 as Total_Salary from department;
Query OK, 3 rows affected (1.3359 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  SQL > select * from deptsal;
+------+--------------+
| D_No | Total_Salary |
+------+--------------+
|    1 |            0 |
|    2 |            0 |
|    3 |            0 |
+------+--------------+
3 rows in set (0.0009 sec)
 MySQL  SQL > delimiter //
 MySQL  SQL > create procedure updateSal (IN param1 int)
                                          -> begin
                                          -> update deptsal
                                          -> set Total_Salary = (select sum(salary) from employee where D_No=param1) where D_No = param1;
                                          -> end;
                                          -> //
Query OK, 0 rows affected (0.2810 sec)
 MySQL  company  SQL > delimiter ;
 MySQL  SQL > call updateSal(1);
Query OK, 1 row affected (0.1843 sec)
 MySQL SQL > call updateSal(2);
Query OK, 1 row affected (0.2329 sec)
 MySQL  SQL > call updateSal(3);
Query OK, 1 row affected (0.2594 sec)
 MySQL company  SQL > select * from deptsal;
+------+--------------+
| D_No | Total_Salary |
+------+--------------+
|    1 |       100000 |
|    2 |        50000 |
|    3 |       130000 |
+------+--------------+
3 rows in set (0.0007 sec)
 MySQLcompany  SQL >
