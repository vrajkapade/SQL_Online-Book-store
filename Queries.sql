SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books
WHERE genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM Books
WHERE published_year > 1950;

-- 3) List all customers from the Canada:

SELECT * FROM Customers
WHERE Country ='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders
WHERE Order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM(Stock) AS TOTAL_Stock
FROM Books;

-- 6) Find the details of the most expensive book:

SELECT * FROM books ORDER BY Price DESC LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT c.Name, c.customer_id, o.Quantity
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity > 1;


-- 8) Retrieve all orders where the total amount exceeds $200:

SELECT * FROM Orders
WHERE Total_amount > 200;

-- 9) List all genres available in the Books table:

SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:

SELECT * FROM Books ORDER BY Stock LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) FROM Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT b.Genre,SUM(o.Quantity) AS total_Sold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(price),genre AS AVERAGE_PRICE
FROM Books
WHERE Genre = 'Fantasy'
GROUP BY Genre;


-- 3) List customers who have placed at least 10 orders:

SELECT c.name,o.Quantity
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE Quantity >= 10;

-- 4) Find the most frequently ordered book:

SELECT Book_ID,COUNT(Order_ID) AS ORDER_COUNT
From Orders
GROUP BY Book_ID
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY PRICE DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.Author, SUM(o.Quantity) AS TOTAL_BOOKS
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Author;

-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.city,o.Total_amount AS VALUABLE_CITY
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE Total_amount > 30;

-- 8) Find the customer who spent the most on orders:

SELECT c.name,SUM(o.Total_Amount) AS Total_Order
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY C.name
ORDER BY Total_Order DESC;

--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.Book_ID, b.title,b.Stock, COALESCE(SUM(o.Quantity),0) AS Stock,
b.Stock - COALESCE(SUM(o.Quantity),0) AS Remaining_stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;


