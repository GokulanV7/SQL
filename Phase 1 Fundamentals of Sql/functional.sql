-- ==========================================
-- 🎯 PHASE 1: FILTERING & SORTING PRACTICE
-- ==========================================

/*
  TOPIC 3: THE 'WHERE' CLAUSE
  The WHERE clause limits the rows returned by the query.
*/

-- 1. Comparison Operators (=, <, >, <=, >=, <>)
-- Task: Find all books that cost less than $11.00.
SELECT Title, Price 
FROM Books 
WHERE Price < 11.00;

-- 2. Logical Operators (AND, OR)
-- Task: Find books that are 'Fantasy' genre AND cost more than $10.
SELECT * FROM Books 
WHERE Genre = 'Fantasy' AND Price > 10.00;

-- Task: Find books that are either 'Satire' OR 'Dystopian'.
SELECT * FROM Books 
WHERE Genre = 'Satire' OR Genre = 'Dystopian';

-- 3. The 'IN' Operator (Shorthand for multiple ORs)
-- Task: Find books written by 'Dan Brown' or 'George Orwell'.
SELECT Title, Author 
FROM Books 
WHERE Author IN ('Dan Brown', 'George Orwell');

-- 4. The 'BETWEEN' Operator
-- Task: Find books published between 1940 and 1960.
SELECT Title, PublishedYear 
FROM Books 
WHERE PublishedYear BETWEEN 1940 AND 1960;

-- 5. Pattern Matching (LIKE)
-- % represents zero, one, or multiple characters
-- _ represents exactly one character
-- Task: Find all books starting with the word "The".
SELECT Title 
FROM Books 
WHERE Title LIKE 'The%';

-- Task: Find all customers with an email ending in '.com'.
SELECT FirstName, Email 
FROM Customers 
WHERE Email LIKE '%.com';

-- 6. Handling NULLs
-- Task: Find books where the StockQuantity is NOT zero (In Stock).
SELECT Title, StockQuantity 
FROM Books 
WHERE StockQuantity IS NOT NULL AND StockQuantity > 0;

-- ==========================================
-- 🔽 TOPIC 4: SORTING (ORDER BY)
-- ==========================================

/*
  ORDER BY sorts the result set. 
  ASC = Ascending (default)
  DESC = Descending
*/

-- 7. Basic Sorting
-- Task: List all books sorted by Price (Cheapest to Most Expensive).
SELECT Title, Price 
FROM Books 
ORDER BY Price ASC;

-- 8. Sorting High to Low
-- Task: List books by Published Year, newest first.
SELECT Title, PublishedYear 
FROM Books 
ORDER BY PublishedYear DESC;

-- 9. Multi-Column Sorting
-- Task: Sort by Genre (A-Z), and then by Price (High to Low) within that genre.
SELECT Genre, Title, Price 
FROM Books 
ORDER BY Genre ASC, Price DESC;

-- 10. The "Grand Finale" (Combining everything)
-- Task: Find the top 3 most expensive 'Classic' books.
SELECT Title, Price 
FROM Books 
WHERE Genre = 'Classic' 
ORDER BY Price DESC 
LIMIT 3; 
-- (Note: Use 'TOP 3 *' after SELECT if using SQL Server)