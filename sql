-- Create the SUPPLIERS table  
CREATE TABLE SUPPLIERS (  
    SupplierID NUMBER(10) PRIMARY KEY,  
    SupplierName VARCHAR2(255) NOT NULL,  
    ContactName VARCHAR2(255),  
    City VARCHAR2(100),  
    Country VARCHAR2(100)  
);  

-- Create the PRODUCT table  
CREATE TABLE PRODUCT (  
    ProductID NUMBER(10) PRIMARY KEY,  
    ProductName VARCHAR2(255) NOT NULL,  
    SupplierID NUMBER(10),  
    Price NUMBER(10, 2) NOT NULL,  
    Stock NUMBER(10) NOT NULL,  
    FOREIGN KEY (SupplierID) REFERENCES SUPPLIERS(SupplierID)  
);  

-- Create the CUSTOMERS table  
CREATE TABLE CUSTOMERS (  
    CustomerID NUMBER(10) PRIMARY KEY,  
    CustomerName VARCHAR2(255) NOT NULL,  
    ContactName VARCHAR2(255),  
    City VARCHAR2(100),  
    Country VARCHAR2(100)  
);  

-- Create the ORDERS table  
CREATE TABLE ORDERS (  
    OrderID NUMBER(10) PRIMARY KEY,  
    CustomerID NUMBER(10),  
    OrderDate DATE NOT NULL,  
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)  
);  

-- Create the ORDER_DETAILS table  
CREATE TABLE ORDER_DETAILS (  
    OrderDetailID NUMBER(10) PRIMARY KEY,  
    OrderID NUMBER(10),  
    ProductID NUMBER(10),  
    Quantity NUMBER(10) NOT NULL,  
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),  
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)  
);



-- Add Category column to the PRODUCT table  
ALTER TABLE PRODUCT  
ADD Category VARCHAR2(20);  

-- Add OrderDate column to the ORDERS table with SYSDATE as the default value  
ALTER TABLE ORDERS  
ADD OrderDate DATE DEFAULT SYSDATE;