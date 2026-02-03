-- CREATING Books TABLES

CREATE TABLE Books(
Book_ID	INT	Primary KEY,
Title	varchar(100) NOT NULL,
Author	varchar(100) NOT NULL,
Genre	varchar(100) NOT NULL,
Published_Year	INT NOT NULL,
Price	NUMERIC(10,2) NOT NULL,
Stock	INT	NOT NULL
);

-- Creating Customers Table

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers(
Customer_ID	SERIAL	Primary KEY,
Name VARCHAR(50),	
Email VARCHAR(50),	
Phone INT,	
City VARCHAR(100),	
Country	VARCHAR(50)	
);


-- CREATING Orders Table


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
Order_ID	INT PRIMARY KEY,	
Customer_ID	INT REFERENCES Customers(Customer_ID),
Book_ID	INT REFERENCES Books(Book_ID),
Order_Date DATE,		
Quantity INT,		
Total_Amount NUMERIC(10,2)		
);

-- Import Data into Books Table

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM '‪Books.CSV'
CSV HEADER;

-- Import Data into Customers Table

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'Customers.CSV'
CSV HEADER;

-- Used This Quary to So
ALTER TABLE Customers
ALTER COLUMN Country TYPE VARCHAR(50) USING Country::VARCHAR(100);

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'Orders.CSV' 
CSV HEADER;

