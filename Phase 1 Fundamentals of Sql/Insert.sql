-- ==========================================
-- 📚 BOOKSTORE DATASET (Phase 1 Practice)
-- ==========================================

-- 1. Create the 'Books' table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    PublishedYear INT,
    StockQuantity INT
);

-- 2. Create the 'Customers' table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Country VARCHAR(50)
);

-- ==========================================
-- 📥 POPULATE DATA
-- ==========================================

-- Inserting data into Books
-- Note: We include some same authors and genres to practice DISTINCT
INSERT INTO Books (BookID, Title, Author, Genre, Price, PublishedYear, StockQuantity) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 10.99, 1925, 100),
(2, '1984', 'George Orwell', 'Dystopian', 8.99, 1949, 50),
(3, 'Animal Farm', 'George Orwell', 'Satire', 7.50, 1945, 75),
(4, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 15.00, 1937, 20),
(5, 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Fantasy', 20.00, 1997, 120),
(6, 'The Da Vinci Code', 'Dan Brown', 'Thriller', 12.50, 2003, 0),
(7, 'Angels & Demons', 'Dan Brown', 'Thriller', 11.00, 2000, 15),
(8, 'Pride and Prejudice', 'Jane Austen', 'Romance', 9.99, 1813, 40),
(9, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 14.50, 1960, 85),
(10, 'The Catcher in the Rye', 'J.D. Salinger', 'Classic', 10.00, 1951, 10);

-- Inserting data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Canada'),
(3, 'Alice', 'Johnson', 'alice.j@example.com', 'UK'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 'USA'),
(5, 'Charlie', 'Davis', 'charlie.d@example.com', 'Australia'),
(6, 'Emma', 'Wilson', 'emma.w@example.com', 'UK'),
(7, 'Liam', 'Miller', 'liam.m@example.com', 'Canada');

-- ==========================================
-- 🎯 PRACTICE EXAMPLES (Phase 1)
-- ==========================================

/*
  1. SELECT & FROM
  Task: Get all book titles and their prices.
*/
-- SELECT Title, Price FROM Books;


/*
  2. DISTINCT
  Task: List all unique genres available in the store.
*/
-- SELECT DISTINCT Genre FROM Books;


/*
  3. LIMIT / TOP
  Task: Get the first 5 customers.
  (Note: 'LIMIT' is used in MySQL/PostgreSQL. Use 'TOP 5' for SQL Server)
*/
-- SELECT * FROM Customers LIMIT 5;


/*
  4. ALIASING (AS)
  Task: Select title and author, but rename columns to 'Book Name' and 'Writer'.
*/
-- SELECT Title AS "Book Name", Author AS "Writer" FROM Books;