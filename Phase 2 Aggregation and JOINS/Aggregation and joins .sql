-- ==========================================
-- 🚀 PHASE 2: AGGREGATION & JOINS
-- ==========================================

/*
  SETUP: ADDING AN 'ORDERS' TABLE
  To practice Joins, we need a table that links Customers and Books.
  Run this block first!
*/

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    OrderDate DATE,
    Quantity INT
);

-- Populating Orders
-- (Note: Customer 7 has no orders, and Book 6 has no sales - helpful for Outer Joins!)
INSERT INTO Orders (OrderID, CustomerID, BookID, OrderDate, Quantity) VALUES
(101, 1, 1, '2023-01-15', 1), -- John bought Great Gatsby
(102, 1, 4, '2023-02-10', 2), -- John bought 2 Hobbts
(103, 2, 1, '2023-03-05', 1), -- Jane bought Great Gatsby
(104, 3, 5, '2023-04-20', 1), -- Alice bought Harry Potter
(105, 4, 2, '2023-05-01', 3), -- Bob bought 1984
(106, 5, 5, '2023-06-15', 1), -- Charlie bought Harry Potter
(107, 1, 5, '2023-07-01', 1); -- John bought Harry Potter

-- ==========================================
-- 📊 TOPIC 1: AGGREGATION FUNCTIONS
-- ==========================================

/*
  Functions that perform a calculation on a set of values 
  and return a single value.
*/

-- 1. COUNT()
-- Task: How many books are in the library?
SELECT COUNT(*) AS TotalBooks FROM Books;

-- 2. SUM()
-- Task: What is the total revenue if we sold all existing stock?
SELECT SUM(Price * StockQuantity) AS PotentialRevenue FROM Books;

-- 3. AVG()
-- Task: What is the average price of a book?
SELECT AVG(Price) AS AveragePrice FROM Books;

-- 4. MIN() / MAX()
-- Task: What are the cheapest and most expensive prices?
SELECT MIN(Price) AS Cheapest, MAX(Price) AS MostExpensive FROM Books;


-- ==========================================
-- 🏘️ TOPIC 2: GROUP BY & HAVING
-- ==========================================

/*
  GROUP BY groups rows that have the same values into summary rows.
  HAVING filters the *groups* (WHERE filters rows).
*/

-- 5. Basic Grouping
-- Task: Count how many books belong to each Genre.
SELECT Genre, COUNT(*) AS BookCount 
FROM Books 
GROUP BY Genre;

-- 6. Grouping with Math
-- Task: Calculate the average price for each Genre.
SELECT Genre, AVG(Price) AS AvgGenrePrice
FROM Books
GROUP BY Genre;

-- 7. HAVING Clause
-- Task: Show Genres that have more than 1 book.
SELECT Genre, COUNT(*) AS BookCount
FROM Books
GROUP BY Genre
HAVING COUNT(*) > 1;


-- ==========================================
-- 🔗 TOPIC 3: JOINS (Combining Tables)
-- ==========================================

/*
  Joins allow you to query data from two or more tables 
  based on a related column between them.
*/

-- 8. INNER JOIN (The most common join)
-- Task: Show Order IDs along with the Customer Name and Book Title.
-- (Only shows records where there is a match in ALL tables)
SELECT 
    Orders.OrderID,
    Customers.FirstName,
    Customers.LastName,
    Books.Title,
    Orders.Quantity
FROM Orders   
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Books ON Orders.BookID = Books.BookID;

-- 9. LEFT JOIN
-- Task: Show ALL Customers, and their orders (if any).
-- (Notice Customer 7 'Liam' appears with NULL order info because he hasn't bought anything)
SELECT 
    Customers.FirstName, 
    Orders.OrderID, 
    Orders.OrderDate 
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 10. Aggregation with Joins (Advanced)  
-- Task: Calculate the total money spent by each customer.
SELECT 
    Customers.FirstName,
    SUM(Books.Price * Orders.Quantity) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Books ON Orders.BookID = Books.BookID
GROUP BY Customers.FirstName;
