use student;
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


SELECT order_id,cust_id,product_name,amount,CASE
WHEN amount < 10000 THEN 'SMALL ORDER'
WHEN amount BETWEEN 10000 AND 50000 THEN 'MEDIUM ORDER'
ELSE 'BIG ORDER'
END AS order_category
FROM order_tbl;