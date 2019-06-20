-- Order
-- Find all subjects sorted by subject
SELECT * FREOM subjects ORDER BY subject ASC;
-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location ASC;

-- Where
-- Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE  '%Python%';
-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';

-- Joins
-- Find all books about Computers and list ONLY the book titles
Select books.title
FROM books INNER JOIN subjects
ON books.subject_id=subjects.id WHERE subjects.id = 4;
-- Find all books and display a result table with ONLY the following columns
    -- Book title
    -- Author's first name
    -- Author's last name
    -- Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject    
FROM books INNER JOIN subjects ON books.subject_id = subjects.id 
INNER JOIN authors ON books.author_id=authors.id;
-- Find all books that are listed in the stock table
    -- Sort them by retail price (most expensive first)
    -- Display ONLY: title and price
SELECT books.title, stock.retail 
FROM books INNER JOIN editions ON books.id=editions.book_id 
INNER JOIN stock ON editions.isbn=stock.isbn 
ORDER BY stock.retail DESC;
-- Find the book "Dune" and display ONLY the following columns
    -- Book title
    -- ISBN number
    -- Publisher name
    -- Retail price
SELECT books.title, editions.isbn, publishers.name AS publisher_name, stock.retail 
from books INNER JOIN editions ON books.id=editions.book_id
INNER JOIN stock ON editions.isbn=stock.isbn 
INNER JOIN publishers ON editions.publisher_id=publishers.id WHERE books.title = 'Dune';
-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
    -- Customer first name
    -- Customer last name
    -- ship date
    -- book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM books INNER JOIN editions ON books.id=editions.book_id
INNER JOIN shipments ON editions.isbn=shipments.isbn
INNER JOIN customers ON shipments.customer_id=customers.id ORDER BY shipments.ship_date ASC;
-- Grouping and Counting
-- Get the COUNT of all books
SELECT count(*) FROM books;
-- Get the COUNT of all Locations
SELECT count(location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT count(location), location FROM subjects GROUP BY location;
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, count(editions.edition) AS editions FROM books INNER JOIN editions ON books.id=editions.book_id GROUP BY books.id;