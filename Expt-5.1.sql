 MySQL SQL > create database trigger_;
Query OK, 1 row affected (0.2111 sec)
 MySQL SQL > use trigger_;
Default schema set to `trigger_`.
Fetching table and column names from `trigger_` for auto-completion... Press ^C to stop.
 

 MySQL trigger_  SQL > create table employee(
                                           ->   name varchar(45) NOT NULL,
                                           ->   occupation varchar(35) NOT NULL,
                                           ->   working_date date,
                                           ->   working_hours varchar(10)
                                           -> );
Query OK, 0 rows affected (2.3044 sec)
 MySQL trigger_  SQL > insert into employee values
                                           ->   ('Robin', 'Scientist', '2020-10-04', 12),
                                           ->   ('Warner', 'Engineer', '2020-10-04', 10),
                                           ->   ('Peter', 'Actor', '2020-10-04', 13),
                                           ->   ('Marco', 'Doctor', '2020-10-04', 14),
                                           ->   ('Brayden', 'Teacher', '2020-10-04', 12),
                                           ->   ('Antonio', 'Business', '2020-10-04', 11);
Query OK, 6 rows affected (0.4230 sec)

Records: 6  Duplicates: 0  Warnings: 0
 MySQL trigger_  SQL > select * from employee;
+---------+------------+--------------+---------------+
| name    | occupation | working_date | working_hours |
+---------+------------+--------------+---------------+
| Robin   | Scientist  | 2020-10-04   | 12            |
| Warner  | Engineer   | 2020-10-04   | 10            |
| Peter   | Actor      | 2020-10-04   | 13            |
| Marco   | Doctor     | 2020-10-04   | 14            |
| Brayden | Teacher    | 2020-10-04   | 12            |
| Antonio | Business   | 2020-10-04   | 11            |
+---------+------------+--------------+---------------+
6 rows in set (0.0012 sec)

 MySQL trigger_  SQL > delimiter //
 MySQL trigger_  SQL > create trigger Before_insert_emp_working_hrs
                                           -> BEFORE INSERT ON employee FOR EACH ROW
                                           -> BEGIN
                                           -> IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
                                           -> END IF;
                                           -> END; //
Query OK, 0 rows affected (0.4979 sec)
 MySQL  trigger_  SQL > delimiter ;
 MySQL  trigger_  SQL > INSERT INTO employee VALUES('Markus', 'Former', '2020-10-08', 14);
Query OK, 1 row affected (0.2793 sec)
 MySQL  trigger_  SQL > INSERT INTO employee VALUES  ('Alexander', 'Actor', '2020-10-012', -13);
Query OK, 1 row affected (0.2246 sec)
 MySQL  trigger_  SQL > select * from employee;
+-----------+------------+--------------+---------------+
| name      | occupation | working_date | working_hours |
+-----------+------------+--------------+---------------+
| Robin     | Scientist  | 2020-10-04   | 12            |
| Warner    | Engineer   | 2020-10-04   | 10            |
| Peter     | Actor      | 2020-10-04   | 13            |
| Marco     | Doctor     | 2020-10-04   | 14            |
| Brayden   | Teacher    | 2020-10-04   | 12            |
| Antonio   | Business   | 2020-10-04   | 11            |
| Markus    | Former     | 2020-10-08   | 14            |
| Alexander | Actor      | 2020-10-12   | 0             |
+-----------+------------+--------------+---------------+
8 rows in set (0.0309 sec)

 MySQL  trigger_  SQL >  SHOW TRIGGERS;
+-------------------------------+--------+----------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                       | Event  | Table    | Statement                                                                  | Timing | Created                | sql_mode                                   | Definer        | character_set_client | collation_connection | Database Collation |
+-------------------------------+--------+----------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Before_insert_emp_working_hrs | INSERT | employee | BEGIN
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF;
END | BEFORE | 2021-06-10 12:05:03.42 | NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES | root@localhost | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+-------------------------------+--------+----------+----------------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
1 row in set (0.6164 sec)

 
