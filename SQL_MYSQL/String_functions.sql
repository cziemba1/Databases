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

-- SELECT title FROM books WHERE released_year != 2003;
-- SELECT title FROM books WHERE title LIKE "%er";
-- SELECT title FROM books WHERE title NOT LIKE "%er";
-- SELECT title, released_year FROM books WHERE released_year NOT LIKE "20%";
-- SELECT title, released_year FROM books WHERE released_year LIKE "20%";
-- SELECT title, stock_quantity FROM books WHERE stock_quantity > 20;
-- SELECT title, stock_quantity FROM books WHERE stock_quantity <= 30;

-- SELECT title, released_year FROM books
-- WHERE released_year BETWEEN 1999 and 2010;

-- SELECT title, released_year FROM books
-- WHERE released_year IN (2002, 2000, 1999, 1998);

-- SELECT title, released_year
-- FROM books
-- WHERE released_year NOT IN (2002, 1998);

-- SELECT * FROM books
-- WHERE released_year < 1980;


-- SELECT *
-- FROM books
-- WHERE author_lname = "Eggers" OR author_lname = "Chabon";

-- SELECT * 
-- FROM books
-- WHERE author_lname = "Lahiri" AND released_year > 2000;

-- SELECT * 
-- FROM books
-- WHERE pages BETWEEN 100 AND 200;

-- SELECT *
-- FROM books
-- WHERE author_lname LIKE "C%" OR author_lname LIKE "S%";

-- SELECT title, author_lname, 
-- CASE 
--     WHEN title LIKE "%stories%" THEN "Short Stories"
--     WHEN title = "Just Kids" OR title = "A Heartbreaking Work" THEN "Memoir"
--     ELSE "Novel"
--     END AS "Type"
-- FROM books;

CREATE TABLE STUDENTS(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR
(20)
);

CREATE TABLE PAPERS
(
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES STUDENTS(id)
);

INSERT INTO students
    (first_name)
VALUES
    ('Caleb'),
    ('Samantha'),
    ('Raj'),
    ('Carlos'),
    ('Lisa');

INSERT INTO papers
    (student_id, title, grade )
VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade
FROM STUDENTS
    INNER JOIN PAPERS
    ON STUDENTS.id = papers.student_id
ORDER BY first_name, grade DESC;

SELECT first_name, title, grade
FROM STUDENTS
    LEFT JOIN PAPERS
    ON STUDENTS.id = PAPERS.student_id;

SELECT first_name, IFNULL(title,"MISSING"), IFNULL(grade,0)
FROM STUDENTS
    LEFT JOIN PAPERS
    ON STUDENTS.id = PAPERS.student_id;

SELECT first_name, IFNULL(AVG(grade), 0) as average
FROM STUDENTS
    LEFT JOIN PAPERS
    ON STUDENTS.id = PAPERS.student_id
GROUP BY first_name;

SELECT first_name, IFNULL(AVG(grade), 0) as average,
    CASE
        WHEN AVG(grade) > 70 THEN "PASSING"
        ELSE "FAILING"
        END AS "passing_status"
FROM STUDENTS
    LEFT JOIN PAPERS
    ON STUDENTS.id = PAPERS.student_id
GROUP BY first_name;