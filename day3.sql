create database retail;

#DDL - Data Definitions Language - CREATE,ALTER,DROP,RENAME
#DML - Data Manupluation Language -SELECT,INSERT,UPDATE,DELETE,
#TCL - Transaction control language - commit, rollback, savepoint
#DCL -> Data Control Language - GRANT, REVOKE
USE retail;
CREATE TABLE order_tbl (
order_id INT primary key,
cust_name VARCHAR(200) NOT NULL,
product_name VARCHAR(100) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
trans_date DATE);


INSERT INTO order_tbl 
VALUES(100,'rohit','laptop',66000,'2022-04-05'),
(101,'ramu','tv',75000,current_date()),
(102,'durga','mobile',125000,'2022-04-05');

SELECT * FROM order_tbl;

START transaction;
SET SQL_SAFE_UPDATES=0;

DELETE FROM order_tbl WHERE product_name='tv';

SELECT * FROM order_tbl;

ROLLBACK;

COMMIT;


START TRANSACTION;

INSERT INTO order_tbl 
VALUES(101,'ramu','tv',75000,current_date());
SELECT * FROM order_tbl;

SAVEPOINT sp1;
INSERT INTO order_tbl 
VALUES(103,'ramu','chair',5000,current_date());
SELECT * FROM order_tbl;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;


START transaction;
SAVEPOINT stage1;
UPDATE order_tbl SET amount=132000 WHERE product_name='laptop';
SAVEPOINT stage2;
UPDATE order_tbl SET amount=100000 WHERE product_name='tv';
SAVEPOINT stage3;
UPDATE order_tbl SET amount=100 WHERE product_name='chair';

rollback to savepoint stage2;
commit;

-- # DCL (GRANT and REVOKE)
-- #PERMISSION:
-- #SELECT,
-- #INSERT,
-- #DELETE,
-- #UPDATE,
-- #CREATE ,
-- #ALTER,
-- #DROP,
-- #ALL

-- GRANT SELECT ON order_tbl to 'Rohit'@localhost;
-- GRANT SELECT,UPDATE,INSERT ON order_tbl to 'Rohit'@localhost;
-- GRANT ALL ON order_tbl to 'Rohit'@localhost;

-- REVOKE UPDATE,INSERT ON  order_tbl to 'Rohit'@localhost;
-- REVOKE ALL ON order_tbl to 'Rohit'@localhost;
-- SHOW GRANTS FOR 'Rohit'@localhost;


-- DESC order_table;
-- ALTER TABLE order_tbl
-- RENAME COLUMN product_name TO prod_name;

-- RENAME TABLE order_tbl TO order_table;


-- JOINS
-- TYPES OF JOINS
--  INNER JOIN
-- OUTER JOIN



CREATE TABLE CUSTOMER (
cust_id INT,
fname Varchar(100),
lname varchar(100),
age INT,
city varchar(100) 
);

INSERT INTO CUSTOMER
VALUES(1000,'Rohit','R',36,'Chennai'),(1001,'Malini','Sekar',31,'Bangalore'),
(1002,'Rajini','Ramesh',36,'Hyderabad');

CREATE TABLE TRANSACTION
(trans_id INT,
cust_id INT,
prod_name VARCHAR(100),
amount INT,
trans_date date);

INSERT INTO TRANSACTION
VALUES(1,1000,'Juice',35,current_date()),(2,1001,'Biscuits',50,current_date()),(3,1000,'Chocalate',50,current_date()),
(4,1000,'Chips',30,current_date()),(5,1001,'ice cream',35,current_date()),(6,1003,'Water',20,current_date());

SELECT * FROM customer;
SELECT * FROM TRANSACTION;
-- INNER JOIN
SELECT t.cust_id,trans_id,fname,lname,city,prod_name,amount FROM TRANSACTION t 
INNER JOIN CUSTOMER c
ON t.cust_id=c.cust_id;

-- LEFT JOIN
SELECT t.cust_id,trans_id,fname,lname,city,prod_name,amount  FROM TRANSACTION t LEFT OUTER JOIN CUSTOMER c
ON t.cust_id=c.cust_id;

-- RIGHT JOIN
SELECT CUSTOMER.cust_id,trans_id,fname,lname,city,prod_name,amount  FROM TRANSACTION  RIGHT OUTER JOIN CUSTOMER  
ON TRANSACTION.cust_id=CUSTOMER.cust_id;

-- CROSS JOIN

SELECT * FROM TRANSACTION t CROSS JOIN CUSTOMER c;

SELECT fname , lname       
FROM CUSTOMER
WHERE cust_id NOT IN ( SELECT DISTINCT cust_id
					FROM TRANSACTION);

SELECT fname , lname  FROM CUSTOMER WHERE cust_id  IN (1000,1001,1003);   -- 1000,1001, 1002

SELECT DISTINCT cust_id FROM TRANSACTION;
SELECT DISTINCT cust_id FROM CUSTOMER;

-- co-related sub query

alter table customer
add column balance int;

SELECT  * FROM customer;
INSERT INTO customer VALUES(1004,'Durga','Devi',35,'Chennai',100),(1005,'Satya','K',36,'Chennai',70),(1005,'Saraswathi','R',37,'Bangalore',100);
SELECT  * FROM transaction;

update customer set balance=40;

SELECT fname, lname
FROM customer c
WHERE balance > ( SELECT avg(amount)   -- 38.33
					FROM transaction 
					WHERE c.cust_id=cust_id);

-- SELF JOIN

SELECT c1.fname as name1 , c2.fname as name2  FROM customer c1, customer c2
WHERE c1.cust_id <> c2.cust_id AND c1.city=c2.city
order by c2.fname;

-- UNION and UNION ALL

SELECT * FROM CUSTOMER;  -- 1000,1001,1002,1004,1005
SELECT * FROM TRANSACTION;  -- 1000,1001,1003

SELECT cust_id FROM CUSTOMER
UNION 
SELECT cust_id FROM TRANSACTION;

DELETE FROM customer WHERE fname='Satya';