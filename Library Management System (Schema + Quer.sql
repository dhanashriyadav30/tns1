Library Management System (Schema + Queries)

-- Create tables
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    join_date DATE
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Issues (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Sample insertions
INSERT INTO Members VALUES (1, 'Alice', '2023-05-10');
INSERT INTO Books VALUES (101, 'Clean Code', 'Robert C. Martin', TRUE);

-- Issue a book
INSERT INTO Issues VALUES (1, 1, 101, '2023-06-01', NULL);
UPDATE Books SET available = FALSE WHERE book_id = 101;

-- Query: List all issued books
SELECT M.name, B.title, I.issue_date
FROM Issues I
JOIN Members M ON I.member_id = M.member_id
JOIN Books B ON I.book_id = B.book_id
WHERE I.return_date IS NULL;