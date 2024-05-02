--CREATING CUSTOMERS TABLE--
CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT PRIMARY KEY, 
FIRST_NAME VARCHAR(20) NOT NULL ,LAST_NAME VARCHAR(20),
EMAIL VARCHAR(30) NOT NULL,
PHONE_NUMBER varchar(20) NOT NULL,
ADDRESS VARCHAR(20) NOT NULL);

--CREATING PRODUCTS TABLE--
CREATE TABLE PRODUCTS(
PRODUCT_ID INT PRIMARY KEY NOT NULL,
PRODUCT_NAME VARCHAR(30) NOT NULL,
DESCRIPTION VARCHAR(200),
PRICE INT);


--CREATING ORDERS TABLE--
CREATE TABLE ORDERS(
ORDER_ID INT NOT NULL PRIMARY KEY,
CUSTOMER_ID INT NOT NULL, 
ORDER_DATE DATETIME NOT NULL,
TOTAL_AMOUNT INT NOT NULL,
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE);


--CREATING ORDER DETAILS TABLE--
CREATE TABLE ORDER_DETAILS(
ORDER_DETAIL_ID INT NOT NULL PRIMARY KEY,
ORDER_ID INT,
PRODUCT_ID INT,
QUANTITY INT NOT NULL,
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID) ON DELETE CASCADE);

--CREATING INVENTORY TABLE--
DROP TABLE inventory;

CREATE TABLE INVENTORY(
INVENTORY_ID INT NOT NULL PRIMARY KEY,
PRODUCT_ID INT NOT NULL ,
QUANTITY_IN_STOCK int,
LAST_STOCK_UPDATE DATE,
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID));


--5. Insert at least 10 sample records into each of the following tables.
--a. Customers
--b. Products
--c. Orders
--d. OrderDetails 
--e. Inventor
--INSERTING RECORDS INTO CUSTOMERS TABLE--
INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS)
VALUES
(1, 'Sasikala', 'Pulluru', 'sasikala@gmail.com', '9876543210', '123 Street, City'),
(2, 'Likhitha', 'Namburi', 'likhitha456@gmail.com', '8765432109', '456 Avenue, Town'),
(3, 'Lohitha', 'Dayakar', 'lohitha789@gmail.com', '7654321098', '789 Road, Village'),
(4, 'Tejaswi', 'Pasupuleti', 'teju101@gmail.com', '6543210987', '101 Colony, City'),
(5, 'Rukhaiah', 'Syed', 'Rukku0910@gmail.com', '5432109876', '222 Lane, Town'),
(6, 'Sreya', 'Krishnamurthy', 'Sreyamk@gmail.com', '4321098765', '333 Street, Village'),
(7, 'Rohit', 'Mishra', 'rohitm@gmail.com', '3210987654', '444 Road, City'),
(8, 'Divya', 'Jain', 'jaindivya@gmail.com', '2109876543', '555 Avenue, Town'),
(9, 'Suresh', 'Kumar', 'skumar@gmail.com', '1098765432', '666 Colony, Village'),
(10, 'Pooja', 'Verma', 'pverma@gmail.com', '0987654321', '777 Lane, City');


--INSERTING RECORDS INTO PRODUCTS TABLE--
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, PRICE)
VALUES
(1, 'Laptop', '15-inch, 16GB RAM, 512GB SSD', 1200),
(2, 'Smartphone', '6.5-inch, 128GB storage, 5G', 800),
(3, 'Headphones', 'Wireless noise-canceling headphones', 150),
(4, 'Tablet', '10-inch, 64GB storage, Wi-Fi', 400),
(5, 'Smartwatch', 'Fitness tracker with heart rate monitor', 250),
(6, 'Speaker', 'Bluetooth speaker with 20W output', 100),
(7, 'Camera', 'Mirrorless camera with 24MP sensor', 900),
(8, 'Printer', 'Wireless all-in-one printer', 200),
(9, 'Gaming Console', 'Next-gen gaming console', 500),
(10, 'Drone', '4K camera drone with GPS', 700),
(12, 'Gadget Organiser Bag', 'Non Electronic', 200),
(13, 'Mechanical Keyboards', 'Non Electronic', 1800),
(14, 'Analog Watches', 'Non Electronic', 900);

Select * from products;


UPDATE PRODUCTS
SET DESCRIPTION = 'Electronic'
WHERE PRODUCT_ID IN (1,2,3,4,5,6,7,8,9,10);



--INSERTING RECORDS INTO ORDERS TABLE--
INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT)
VALUES
(001, 1, '2024-04-25 10:00:00', 15000),
(002, 2, '2024-04-25 11:00:00', 25000),
(003, 3, '2024-04-25 12:00:00', 10000),
(004, 4, '2024-04-25 13:00:00', 20000),
(005, 5, '2024-04-25 14:00:00', 30000),
(006, 6, '2024-04-25 15:00:00', 35000),
(007, 7, '2024-04-25 16:00:00', 12000),
(008, 8, '2024-04-25 17:00:00', 18000),
(009, 9, '2024-04-25 18:00:00', 22000),
(010, 10, '2024-04-25 19:00:00', 28000);

select * from orders;
UPDATE ORDERS SET TOTAL_AMOUNT='10000' WHERE ORDER_ID ='1';
UPDATE ORDERS SET TOTAL_AMOUNT='15000' WHERE ORDER_ID ='2';
UPDATE ORDERS SET TOTAL_AMOUNT='20000' WHERE ORDER_ID ='3';
UPDATE ORDERS SET TOTAL_AMOUNT='25000' WHERE ORDER_ID ='4';
UPDATE ORDERS SET TOTAL_AMOUNT='30000' WHERE ORDER_ID ='5';
UPDATE ORDERS SET TOTAL_AMOUNT='35000' WHERE ORDER_ID ='6';
UPDATE ORDERS SET TOTAL_AMOUNT='40000' WHERE ORDER_ID ='9';
UPDATE ORDERS SET TOTAL_AMOUNT='45000' WHERE ORDER_ID ='11';
UPDATE ORDERS SET TOTAL_AMOUNT='50000' WHERE ORDER_ID ='10';
UPDATE ORDERS SET TOTAL_AMOUNT='55000' WHERE ORDER_ID ='7';
UPDATE ORDERS SET TOTAL_AMOUNT='60000' WHERE ORDER_ID ='8';




SELECT * FROM ORDERS


--INSERTING RECORDS INTO ORDERS_DETAILS TABLE--
INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY)
VALUES
(1, 001, 1, 2),
(2, 001, 3, 1),
(3, 002, 2, 1),
(4, 003, 4, 3),
(5, 003, 5, 2),
(6, 004, 6, 1),
(7, 005, 7, 2),
(8, 006, 8, 1),
(9, 007, 9, 3),
(10, 008, 10, 2);


--INSERTING RECORDS INTO INVENTORY TABLE--
INSERT INTO INVENTORY (INVENTORY_ID, PRODUCT_ID, QUANTITY_IN_STOCK, LAST_STOCK_UPDATE)
VALUES
(1, 1, 20,'2024-04-25'),
(2, 2, 30, '2024-03-27'),
(3, 3, 50, '2024-03-30'),
(4, 4, 25, '2024-02-25'),
(5, 5, 70, '2024-01-15'),
(6, 6, 40, '2024-01-11'),
(7, 7, 10, '2024-02-28'),
(8, 8, 20, '2024-04-27'),
(9, 9, 5, '2024-04-23'),
(10, 10, 8 ,'2024-03-20'),
(11,11, 0,'2023-10-19'),
(12,12, 0,'2023-12-25');

select * from inventory;

--Tasks 2: Select, Where, Between, AND, LIKE:--
--1. Write an SQL query to retrieve the names and emails of all customers. --
SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM CUSTOMERS;

--2.Write an SQL query to list all orders with their order dates and corresponding customer names--

SELECT O.ORDER_ID, O.ORDER_DATE, CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME) AS CUSTOMER_NAME
FROM ORDERS O, CUSTOMERS C
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID;


--3. Write an SQL query to insert a new customer record into the "Customers" table. 
--Include customer information such as name, email, and address--

INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS)
VALUES (11,'Mahaansh', 'Akula', 'mahaanshak@gmail.com', '1234567890', 'Hope St, Tirupati');

--4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10% --
UPDATE PRODUCTS
SET PRICE = PRICE * 1.1
WHERE DESCRIPTION = 'Electronic';


SELECT * FROM PRODUCTS;


--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and 
--"OrderDetails" tables. Allow users to input the order ID as a parameter.--

DECLARE @OrderIdToDelete INT
SET @OrderIdToDelete=003

DELETE FROM ORDER_DETAILS 
WHERE ORDER_ID=@OrderIdToDelete;

SELECT * FROM ORDERS;

--6. Write an SQL query to insert a new order into the "Orders" table. 
--Include the customer ID, order date, and any other necessary information--

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT)
VALUES (011, 11, '2024-04-26 17:33:00',37000 );

SELECT * FROM ORDERS;

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact information--

DECLARE @CustomerIdToUpdate INT
SET @CustomerIdToUpdate = 9; 
DECLARE @NewEmail VARCHAR(30)
SET @NewEmail = 'sk2345@gmail.com';
DECLARE @NewAddress VARCHAR(50)
SET @NewAddress = 'Nehru street';


UPDATE CUSTOMERS
SET EMAIL = @NewEmail,
ADDRESS = @NewAddress
WHERE CUSTOMER_ID = @CustomerIdToUpdate;



SELECT *from CUSTOMERS ;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--table based on the prices and quantities in the "OrderDetails" table.
UPDATE ORDERS
SET TOTAL_AMOUNT = (
    SELECT SUM(P.PRICE * OD.QUANTITY)
    FROM PRODUCTS P, ORDER_DETAILS OD
    WHERE P.PRODUCT_ID = OD.PRODUCT_ID
    AND OD.ORDER_ID = ORDERS.ORDER_ID
)
WHERE ORDER_ID IN (
    SELECT ORDER_ID
    FROM ORDER_DETAILS
);


select * from ORDERS;

--9.Write an SQL query to delete all orders and their associated order details for a specific customer
--from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

DECLARE @CustomerIDToDelete INT
SET @CustomerIDToDelete = 9; 

-- Delete order details for the specified customer
DELETE FROM ORDER_DETAILS
WHERE ORDER_ID IN (
    SELECT ORDER_ID FROM ORDERS
    WHERE CUSTOMER_ID = @CustomerIDToDelete
);

-- Delete orders for the specified customer
DELETE FROM ORDERS
WHERE CUSTOMER_ID = @CustomerIDToDelete;



select * from orders

select * from order_details



--10.. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, PRICE)
VALUES
(11, 'Ipad', 'Electronic', 35000);

select * from products;


select * from ORDERS;

--11.Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

--ADDING A COLUMN ORDER_STATUS
Alter TABLE ORDERS ADD ORDER_STATUS VARCHAR(50);

UPDATE ORDERS SET ORDER_STATUS = 'PENDING' WHERE CUSTOMER_ID =1;
UPDATE ORDERS SET ORDER_STATUS = 'SHIPPED' WHERE CUSTOMER_ID = 2;
UPDATE ORDERS SET ORDER_STATUS = 'SHIPPED' WHERE CUSTOMER_ID = 4;
UPDATE ORDERS SET ORDER_STATUS = 'SHIPPED' WHERE CUSTOMER_ID = 5;
UPDATE ORDERS SET ORDER_STATUS = 'DELIVERED' WHERE CUSTOMER_ID = 6;
UPDATE ORDERS SET ORDER_STATUS = 'PENDING' WHERE CUSTOMER_ID =7;
UPDATE ORDERS SET ORDER_STATUS = 'PENDING' WHERE CUSTOMER_ID = 8;
UPDATE ORDERS SET ORDER_STATUS = 'DELIVERED' WHERE CUSTOMER_ID = 9;
UPDATE ORDERS SET ORDER_STATUS = 'CANCELLED' WHERE CUSTOMER_ID = 10;
UPDATE ORDERS SET ORDER_STATUS = 'PENDING' WHERE CUSTOMER_ID =11;


DECLARE @OrderID INT
SET @OrderID = 7; 
DECLARE @NewStatus VARCHAR(50)
SET @NewStatus = 'SHIPPED'; 

UPDATE ORDERS
SET ORDER_STATUS = @NewStatus
WHERE ORDER_ID = @OrderID;

select * from ORDERS;

ALTER TABLE ORDERS ADD NUM_OF_ORDERS INT;
--12. Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table.

SELECT  O.CUSTOMER_ID, COUNT(*) 
FROM ORDERS O
GROUP BY O.CUSTOMER_ID;







--TASK 3: Aggregate functions, Having, Order By, GroupBy and Joins--
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.

SELECT C.CUSTOMER_ID, C.FIRST_NAME,C.LAST_NAME,O.ORDER_ID,O.ORDER_STATUS,O.TOTAL_AMOUNT 
FROM CUSTOMERS C 
JOIN ORDERS O 
ON C.CUSTOMER_ID=O.ORDER_ID;

--2.Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.


SELECT P.PRODUCT_NAME,
       SUM(OD.QUANTITY * P.PRICE) AS TOTAL_REVENUE
FROM PRODUCTS P
JOIN ORDER_DETAILS OD ON P.PRODUCT_ID = OD.PRODUCT_ID
JOIN ORDERS O ON OD.ORDER_ID = O.ORDER_ID
WHERE P.DESCRIPTION LIKE 'Electronic'
GROUP BY P.PRODUCT_NAME;


--3. Write an SQL query to list all customers who have made at least one purchase. Include their
--names and contact information.

SELECT 
    C.FIRST_NAME, C.LAST_NAME,C.EMAIL,C.PHONE_NUMBER,C.ADDRESS,C.CUSTOMER_ID
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY 
    C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, C.EMAIL, C.PHONE_NUMBER, C.ADDRESS;


	SELECT* FROM ORDERS

--4.Write an SQL query to find the most popular electronic gadget, 
--which is the one with the highest total quantity ordered. 
--Include the product name and the total quantity ordered.

SELECT TOP 1 P.PRODUCT_NAME, SUM(OD.QUANTITY) AS TOTAL_QUANTITY_ORDERED
FROM PRODUCTS P, ORDER_DETAILS OD
WHERE P.PRODUCT_ID = OD.PRODUCT_ID
AND P.DESCRIPTION = 'Electronic'
GROUP BY P.PRODUCT_NAME
ORDER BY TOTAL_QUANTITY_ORDERED DESC;


--5.Write an SQL query to retrieve a list of electronic gadgets
--along with their corresponding categories.

--Adding category to products
ALTER TABLE PRODUCTS ADD CATEGORY VARCHAR(50);

UPDATE PRODUCTS SET CATEGORY ='Computers & Laptops' WHERE PRODUCT_NAME ='Laptop';
UPDATE PRODUCTS SET CATEGORY ='Mobile Phones & Tablets' WHERE PRODUCT_NAME ='Smartphone';
UPDATE PRODUCTS SET CATEGORY ='Mobile Phones & Tablets' WHERE PRODUCT_NAME ='Tablet';
UPDATE PRODUCTS SET CATEGORY ='Audio & Headphones' WHERE PRODUCT_NAME ='Headphones';
UPDATE PRODUCTS SET CATEGORY ='Audio & Headphones' WHERE PRODUCT_NAME ='Speaker';
UPDATE PRODUCTS SET CATEGORY ='Cameras & Photography' WHERE PRODUCT_NAME ='Camera';
UPDATE PRODUCTS SET CATEGORY ='Cameras & Photography' WHERE PRODUCT_NAME ='Drone';
UPDATE PRODUCTS SET CATEGORY ='Printers & Scanners' WHERE PRODUCT_NAME ='Printer';
UPDATE PRODUCTS SET CATEGORY ='Gaming' WHERE PRODUCT_NAME ='Gaming Console';
UPDATE PRODUCTS SET CATEGORY ='Accessories' WHERE PRODUCT_NAME ='Smartwatch';
UPDATE PRODUCTS SET CATEGORY ='Mobile Phones & Tablets' WHERE PRODUCT_NAME ='Ipad';
UPDATE PRODUCTS SET CATEGORY ='Bags' WHERE PRODUCT_NAME ='Gadget Organiser Bag';
UPDATE PRODUCTS SET CATEGORY ='Keyboards and Mouses' WHERE PRODUCT_NAME ='Mechanical Keyboards';
UPDATE PRODUCTS SET CATEGORY ='Accessories' WHERE PRODUCT_NAME ='Analog Watches';

SELECT * FROM PRODUCTS;
-- 5th query
SELECT PRODUCT_NAME, CATEGORY
FROM PRODUCTS
WHERE DESCRIPTION = 'Electronic';


--6.Write an SQL query to calculate the average order value for each customer.
--Include the customer's name and their average order value.

SELECT C.FIRST_NAME, C.LAST_NAME, AVG(O.TOTAL_AMOUNT) AS AVERAGE_ORDER_VALUE
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME;



--7.Write an SQL query to find the order with the highest total revenue. 
--Include the order ID, customer information, and the total revenue.

SELECT TOP 1 O.ORDER_ID, C.FIRST_NAME, C.LAST_NAME, O.TOTAL_AMOUNT AS TOTAL_REVENUE
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
ORDER BY TOTAL_REVENUE DESC;


--8.Write an SQL query to list electronic gadgets and the number of times
--each product has been ordered.

SELECT P.PRODUCT_NAME, COUNT(OD.ORDER_ID) AS ORDER_COUNT
FROM PRODUCTS P
JOIN ORDER_DETAILS OD ON P.PRODUCT_ID = OD.PRODUCT_ID
WHERE P.DESCRIPTION = 'Electronic'
GROUP BY P.PRODUCT_NAME;



--9.Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(30);
SET @ProductName = 'Smartphone ';

SELECT C.*
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
WHERE P.DESCRIPTION = 'Electronic' AND P.PRODUCT_NAME = @ProductName;


--10.Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period.
--Allow users to input the start and end dates as parameters.

SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM ORDERS
WHERE ORDER_DATE BETWEEN '2024-04-25' AND '2024-04-26'; 


--task 4 : Subquery and its type --

--1. Write an SQL query to find out which customers have not placed any orders--

SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_ID IS NULL;


--2.Write an SQL query to find the total number of products available for sale.

SELECT COUNT(*) AS NUM_OF_PRODS_AVAIL_FOR_SALE
FROM INVENTORY
WHERE QUANTITY_IN_STOCK > '0';


--3. Write an SQL query to calculate the total revenue generated by TechShop--

SELECT SUM(TOTAL_AMOUNT) AS total_revenue
FROM ORDERS;

--4. To calculate the average quantity ordered for products in a specific category 
--(parameterized by category name):

SELECT AVG(OD.QUANTITY) AS average_quantity_ordered
FROM ORDER_DETAILS OD
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
WHERE P.CATEGORY = 'Mobile Phones & Tablets'; 


--5. To calculate the total revenue generated by a specific customer 
--(parameterized by customer ID):

SELECT SUM(TOTAL_AMOUNT) AS total_revenue
FROM ORDERS
WHERE CUSTOMER_ID = 7; 


--6. Write an SQL query to find the customers who have placed the most orders, listing their names and
--the number of orders they've placed:
INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT,ORDER_STATUS)
VALUES
(012, 1, '2024-04-30 09:00:00', 90000,'PENDING'),
(013, 9, '2024-04-30 09:00:00', 30000,'PENDING'),
(014, 7, '2024-04-30 09:00:00', 70000,'PENDING');

SELECT C.FIRST_NAME, C.LAST_NAME, COUNT(O.ORDER_ID) AS Number_of_Orders
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME, C.LAST_NAME
ORDER BY COUNT(O.ORDER_ID) DESC;


--7.Write an SQL query to find the most popular product category, 
--which is the one with the highest total quantity ordered across all orders:

SELECT TOP 1 CATEGORY, SUM(OD.QUANTITY) AS Total_Quantity_Ordered
FROM PRODUCTS P
JOIN ORDER_DETAILS OD ON P.PRODUCT_ID = OD.PRODUCT_ID
GROUP BY CATEGORY
ORDER BY Total_Quantity_Ordered DESC;


--8.Write an SQL query to find the customer who has spent the most money
--(highest total revenue) on electronic gadgets:

SELECT TOP 1 C.FIRST_NAME, C.LAST_NAME, SUM(P.PRICE * OD.QUANTITY) AS Total_Spending
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
WHERE P.DESCRIPTION = 'Electronic'
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME
ORDER BY Total_Spending DESC;


--9.Write an SQL query to calculate the average order value 
--(total revenue divided by the number of orders) for all customers:

SELECT C.CUSTOMER_ID,C.FIRST_NAME,C.LAST_NAME, AVG(O.TOTAL_AMOUNT) AS Average_Order_Value
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME;

--10.Write an SQL query to find the total number of orders placed by each customer 
--and list their names along with the order count:

SELECT C.FIRST_NAME, C.LAST_NAME , COUNT(O.ORDER_ID) AS Order_Count
FROM  CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME, C.LAST_NAME;




