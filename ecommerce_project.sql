-- customer table 

create table customer(
CustomerID varchar(15) primary key,
FullName varchar(50) not null,
Email varchar(100),
SignUpDate date,
City varchar(50),
Country varchar(30)
);

select * from customer;

--import CSV file from Excel

copy 
customer (CustomerID,	FullName,	Email,	SignUpDate,	City,	Country) 
from 'D:\e-commerce_anylitics\PNRao_E-commerce_Customers.csv'
DELIMITER ','
Header CSV ;

-- order table 

create table orders(
OrderID varchar(15) primary key,
CustomerID varchar(20),
OrderDate date,
OrderStatus varchar(15),
TotalAmount numeric(10,2),
foreign key (CustomerID) references customer(CustomerID)
);

select * from orders;

-- import orders csv file from excel 

copy 
orders (OrderID,	CustomerID,	OrderDate,	OrderStatus,	TotalAmount)
from 'D:\e-commerce_anylitics\PNRao_E-commerce_Orders.csv'
DELIMITER ','
CSV HEADER;

--product table

create table products(
ProductID varchar(15) primary key,
ProductName	varchar(50) not null,
Category varchar(50),
Brand varchar(50),
UnitPrice numeric(10, 2)
);

select * from products;

--Import products csv file from Excel 

copy 
products(ProductID,	ProductName,	Category,	Brand,	UnitPrice)
from 'D:\e-commerce_anylitics\PNRao_E-commerce_Products.csv'
DELIMITER ','
CSV HEADER ;

--ORDER ITEMS TABLE

drop table orderitem;
create table orderitem(
OrderItemID varchar(20) primary key,
OrderID varchar(20),
ProductID varchar(20),
Quantity int,
PricePerUnit numeric(10, 2),
foreign key (OrderID) References orders(OrderID),
foreign key (ProductID) References products(ProductID)
);

select * from orderitem;

--Import order items CSV file from excel
copy 
orderitem(OrderItemID,	OrderID,	ProductID,	Quantity,	PricePerUnit)
from 'D:\e-commerce_anylitics\PNRao_E-commerce_Order_Items.csv'
DELIMITER ','
CSV HEADER;


-- 1) Count the total number of customers.
-- 2) List all unique cities where customers are located.
-- 3) Find the total number of orders.
-- 4) Count how many orders have the status 'Delivered'.
-- 5) Show the latest 5 orders with OrderID and OrderDate.
-- 6) Find the top 10 customers with the highest number of orders.
-- 7) Calculate the total revenue (SUM of TotalAmount).
-- 8) List all customers who signed up in 2023.
-- 9) Count the number of unique product categories.
-- 10) List all products with price_per_unit greater than 9000.
