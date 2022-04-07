use retail;

SELECT * FROM CUSTOMER;

SHOW CREATE TABLE CUSTOMER;

ALTER TABLE CUSTOMER
MODIFY COLUMN cust_id INT PRIMARY KEY;

CREATE TABLE transaction_table (
trans_id INT primary key,
cust_id INT,
prod_name VARCHAR(100) NOT null,
amount INT NOT NULL,
paid_by VARCHAR(50),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

INSERT INTO transaction_table
VALUES(1,100,'shirt',2000,'credit card'),
(2,105,'table',7000,'credit card'),
(3,102,'fan',2500,'debit card');

INSERT INTO transaction_table(trans_id,prod_name,amount,paid_by) VALUES(4,'mouse',700,'cash');

SELECT * FROM transaction_table;

SELECT t.* FROM CUSTOMER c, TRANSACTION_TABLE t
WHERE c.cust_id=(+)t.cust_id
AND c.cust_id is NULL;

SELECT t.* FROM CUSTOMER c, TRANSACTION_TABLE t
WHERE c.cust_id(+)=t.cust_id
AND c.cust_id is NULL;

-- VIEW, INDEX, 


SELECT * FROM CUSTOMER;
DROP VIEW customer_info;

CREATE VIEW customer_info
AS
SELECT custname, gender,city FROM customer;

SELECT * FROM customer_info;

CREATE VIEW customer_no_trans_list
AS
SELECT c.cust_id,c.custname FROM CUSTOMER c LEFT JOIN TRANSACTION_TABLE t
ON c.cust_id=t.cust_id
WHERE  t.cust_id is NULL;

SELECT * FROM customer_no_trans_list;

CREATE TABLE seq_table (
cust_id INT UNIQUE AUTO_INCREMENT ,
custname VARCHAR(100),
city VARCHAR(100));

INSERT INTO seq_table(custname, city)
VALUES('Rohit','Chennai'),
('Prabha','Bangalore'),
('Parth','Delhi'),
('Poonam','Kolkatta');

SELECT * FROM seq_table;

CREATE SEQUENCE cust_id_incr
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

-- INSERT INTO seq_table VALUES(110,'Durga','Chennai);


CREATE SYNONYM user_data FOR retail.CUSTOMER;

SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES(110,'Raja',55,'M','58786867','Ahmedabad',current_date());
INSERT INTO CUSTOMER VALUES(108,'rajitha',55,'F','58766867','Ahmedabad',current_date());

CREATE INDEX cust_name_index ON Customer(custname,gender);

SELECT *  FROM CUSTOMER WHERE cust_id IN ( 102 , 104);

SHOW INDEX FROM Customer;


-- PLSQL VARIABLES  (IN OUT INOUT)

count int = 0;
salary INT = 300000';


DECLARE
x integer :=10;
y integer :=20;
z integer;
BEGIN
z:=x+y
dbms_output.put_line('Result is :' || z);
END;