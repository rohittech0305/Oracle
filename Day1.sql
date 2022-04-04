CREATE DATABASE STUDENT;

CREATE DATABASE TRANSACTION;

USE STUDENT;

CREATE TABLE IF NOT EXISTS employee(
emp_id  INT,
ename VARCHAR(100),
location VARCHAR(50),
tech VARCHAR(50),
email VARCHAR(50),
joining_date DATE
);

#DROP TABLE employee1;

INSERT INTO employee
VALUE(1000,'Rohit','Chennai','Python','Rohit@gmail.com',current_date());

SELECT * FROM employee;

INSERT INTO employee
VALUE(1001,'Venkat','Hyderabad','Java','Venkat@yahoo.com','2022-04-01');

SELECT * FROM employee;

INSERT INTO employee
VALUE(1002,'Natarajan','Bangalore','','Natarajan@outlook.com','2005-04-01');

INSERT INTO employee
VALUE(1003,'Ankit','Pune','','Ankit@outlook.com','2005-04-01');

USE STUDENT;
CREATE TABLE IF NOT EXISTS tasks (
task_id INT NOT NULL,
title VARCHAR(100) NOT NULL,
curret_status CHAR(1) NOT NULL,  #C-completed, p -progress, n-not started
start_date DATE,   # YYYY-MM-DD
end_date DATE, #YYYY-MM-DD
amount DECIMAL(6,2) NOT NULL,  # 100000 , 20000.75
created_at DATETIME NOT NULL   #date with time  YYYY-MM-DD hh:mm:ss

);

INSERT INTO tasks VALUES(1,'Report Generation','C','2022-04-01','2022-04-04',1000,'2022-03-31 17:00:00'),
(2,'Development','P','2022-04-04','2022-04-05',500.50,'2022-04-04 10:30:30'),
(3,'Data process','N','2022-04-05','2022-04-06',1000.55,'2022-04-01 10:00:00');

SELECT * FROM tasks;

#DROP TABLE tasks;
#TO VIEW THE TABLE STRUCTURE
DESCRIBE tasks;

SHOW CREATE TABLE tasks;


CREATE TABLE transaction_tbl (
train_id INT NOT NULL,
cust_name VARCHAR(100),
product_name VARCHAR(100),
amount DECIMAL(10,2),
spend_by VARCHAR(50)
);


INSERT INTO transaction_tbl VALUES(1,'Rohit','Ice Cream',200,'cash'),(2,'harsha','chocalate',120.5,'sudexo'); 

SELECT * FROM transaction_tbl;

DESC transaction_tbl;

SHOW CREATE TABLE transaction_tbl;


# CREATE A TABLE : TRANSACTION to store
#tran_id, cust_name, product_name, amount, spend_by 
#spend_by - cash, credit, debit, sudexo


CREATE TABLE mytable_nn (
cust_id INT NOT NULL,
cust_name VARCHAR(100) NOT NULL,
city VARCHAR(100),
contact VARCHAR(100)
);

INSERT INTO mytable_nn VALUES(2,'Surya','bangalore','8769198292');
SELECT * FROM mytable_nn;

CREATE TABLE mytable_unique (
cust_id INT NOT NULL UNIQUE,
cust_name VARCHAR(100) NOT NULL,
city VARCHAR(100) UNIQUE,
contact VARCHAR(100)
);

INSERT INTO mytable_unique VALUES(1,'harsha','trichy','98434799291');
SELECT * FROM mytable_unique;
INSERT INTO mytable_unique VALUES(2,'arun','pune','66634799291');
INSERT INTO mytable_unique VALUES(3,'vicky','cochin','66634799291');
INSERT INTO mytable_unique VALUES(NULL,'Aveek','Madurai','77634799291');


CREATE TABLE mytable_pk (
cust_id INT  PRIMARY KEY,
cust_name VARCHAR(100) NOT NULL,
city VARCHAR(100) UNIQUE,
contact VARCHAR(100)
);

INSERT INTO mytable_pk VALUES(1,'mani','pune','6345645457');
SELECT * FROM mytable_pk;
INSERT INTO mytable_pk VALUES(NULL,'divya','hyderabad','5545645457');


SELECT INDEX_NAME FROM INFORMATION_SCHEMA.STATISTICS;


CREATE TABLE mytable_cpk (
cust_id INT ,
cust_name VARCHAR(100) NOT NULL,
city VARCHAR(100) UNIQUE,
contact VARCHAR(100),
CONSTRAINT pk_cust primary key (cust_name,contact)
);

INSERT INTO mytable_cpk VALUES(1,'rohit','bangalore','9843989899');
INSERT INTO mytable_cpk VALUES(2,'rohit','Chennai','8843989899');
INSERT INTO mytable_cpk VALUES(3,'devi','coimbatore','8843989899');
INSERT INTO mytable_cpk VALUES(4,'devi','kolkatta','8843989890');


SELECT * FROM mytable_cpk;

CREATE TABLE customer (
cust_id INT PRIMARY KEY,
cust_name VARCHAR(100) NOT NULL,
city VARCHAR(100) DEFAULT 'CHENNAI'
);

INSERT INTO customer VALUES(105,'ashwin','chennai'),(106,'rani','Trichy');

SELECT * FROM customer;

CREATE TABLE order_tbl(
order_id INT PRIMARY KEY,
cust_id INT,
product_name VARCHAR(100),
amount DECIMAL(10,2),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

INSERT INTO order_tbl VALUES(1000,101,'mobile',100000);
INSERT INTO order_tbl VALUES(1001,106,'TV',75000);
INSERT INTO order_tbl VALUES(1002,103,'Washing Machine',6000);


SELECT * FROM order_tbl;