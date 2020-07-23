-- SELECT CONCAT("...", 
--             SUBSTRING(title, 1, 10)) 
--         AS "Short title name" 
--         FROM books;

-- SELECT SUBSTRING("Hello from the other side", 1, 12);

-- SELECT UPPER(REVERSE("Why does my cat look at me with such hatred?"));

-- SELECT REPLACE(title, " ", "->") AS title
-- FROM books;

-- SELECT author_lname AS "forward", REVERSE(author_lname) AS "backwards"
-- FROM books;

-- SELECT UPPER(CONCAT(author_fname, " ", author_lname)) AS "full name in caps"
-- FROM books;

-- SELECT CONCAT(title, " was released in ", released_year) AS "blurb"
-- FROM books;

-- SELECT title AS "title", CHAR_LENGTH(title) AS "character count"
-- FROM books;

-- SELECT CONCAT(SUBSTRING(title, 1, 10), "...") AS "short title",
--     CONCAT(author_lname, ",", author_fname) AS "author",
--     CONCAT(stock_quantity, " in stock") AS "quantity"
-- FROM books;

-- SELECT DISTINCT released_year FROM books;

-- SELECT DISTINCT CONCAT(author_fname, " ", author_lname) FROM books;
-- SELECT DISTINCT author_fname, author_lname FROM books;

-- SELECT title FROM books ORDER BY title;
-- SELECT DISTINCT author_lname, released_year FROM books ORDER BY title;
-- SELECT DISTINCT author_lname FROM books ORDER BY released_year;

-- SELECT UPPER(title), released_year FROM books ORDER BY released_year;
-- SELECT title AS "book title", author_lname AS "author last name",
--     author_fname AS "author name"
-- FROM books
-- ORDER BY 2 DESC; 

-- SELECT title FROM books WHERE author_lname LIKE "%la%";
-- SELECT title, author_lname
-- FROM books
-- WHERE author_lname LIKE "la%" ORDER BY 1;

-- SELECT title FROM books WHERE title LIKE "%stories%";

-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
-- SELECT CONCAT(title, " - ", released_year) AS "summary" FROM books ORDER BY released_year DESC LIMIT 3;
-- SELECT title, author_lname FROM books WHERE author_lname LIKE "% %";
-- SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3; 
-- SELECT title, author_lname FROM books ORDER BY author_lname, title;
-- SELECT DISTINCT CONCAT("MY FAVORITE AUTHOR IS ", UPPER(CONCAT(author_fname, " ", author_lname))) AS "yell" FROM books ORDER BY author_lname;

-- SELECT COUNT(*) FROM books WHERE title LIKE "%a%";
-- SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

-- SELECT CONCAT(author_fname, " ", author_lname) AS "author", COUNT(title) AS "amount of books" FROM books GROUP BY author_fname, author_lname;

-- SELECT CONCAT(author_fname, " ", author_lname) AS "author", released_year AS "Year of first published book"
-- FROM books
-- GROUP BY MIN(released_year);

-- SELECT COUNT(book_id) FROM books;
-- SELECT COUNT(book_id), released_year FROM books GROUP BY released_year;
-- SELECT SUM(stock_quantity) FROM books;

-- SELECT CONCAT(author_fname, " ", author_lname), AVG(released_year)
-- FROM books
-- GROUP BY author_fname, author_lname;

-- SELECT CONCAT(author_fname, " ", author_lname)
-- FROM books
-- WHERE pages = (SELECT MAX(pages) FROM books);

-- SELECT released_year AS "year", COUNT(book_id) AS "# books", AVG(pages) AS "avg pages"
-- FROM books
-- GROUP BY released_year
-- ORDER BY released_year;

