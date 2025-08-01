--EASY LEVEL PROBLEM
USE DB_DEMO 
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Book (
BookID INT PRIMARY KEY,
Title VARCHAR(100),
AuthorID INT,
FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

INSERT INTO Author (AuthorID, AuthorName, Country) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George R.R. Martin', 'United States'),
(3, 'Haruki Murakami', 'Japan');

INSERT INTO Book (BookID, Title, AuthorID) VALUES
(101, 'Harry Potter and the Sorcerer''s Stone', 1),
(102, 'A Game of Thrones', 2),
(103, 'Norwegian Wood', 3);

SELECT
Book.Title AS BookTitle,
Author.AuthorName,
Author.Country
FROM
Book
INNER JOIN
Author ON Book.AuthorID = Author.AuthorID;

--MEDIUM LEVEL PROBELM

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mathematics'),
(5, 'Civil Engineering');

INSERT INTO Course (CourseID, CourseName, DepartmentID) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'DBMS', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
(106, 'Circuit Theory', 3),
(107, 'Digital Electronics', 3),
(108, 'Linear Algebra', 4),
(109, 'Calculus', 4),
(110, 'Structural Analysis', 5);
SELECT 
    DepartmentName,
    (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DepartmentID = Department.DepartmentID) AS CourseCount
FROM Department;
SELECT 
    DepartmentName
FROM 
    Department
WHERE 
    (SELECT COUNT(*) 
     FROM Course 
     WHERE Course.DepartmentID = Department.DepartmentID) > 2;

GRANT SELECT ON Course TO RAJ;


