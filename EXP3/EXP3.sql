create database exp_3;
use exp_3;

----MEDIUM LEVEL PROBLEM----

CREATE TABLE Department (
    ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

CREATE TABLE Employee (
    ID INT,
    NAME VARCHAR(50),
    SALARY INT,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES Department(ID)
);

INSERT INTO Department (ID, DEPT_NAME) VALUES
(1, 'IT'),
(2, 'SALES');
INSERT INTO Employee (ID, NAME, SALARY, DEPT_ID) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);
SELECT d.DEPT_NAME, e.NAME, e.SALARY
FROM Employee e
JOIN Department d ON e.DEPT_ID = d.ID
WHERE e.SALARY = (
    SELECT MAX(SALARY)
    FROM Employee
    WHERE DEPT_ID = e.DEPT_ID
)
ORDER BY d.DEPT_NAME;

------HARD LEVEL PROBLEM


CREATE TABLE TableA (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
); 
INSERT INTO TableA (EmpID, Ename, Salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);
 
CREATE TABLE TableB (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

INSERT INTO TableB (EmpID, Ename, Salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);
 
SELECT EmpID, Ename, MIN(Salary) AS Salary
FROM (
    SELECT EmpID, Ename, Salary FROM TableA
    UNION ALL
    SELECT EmpID, Ename, Salary FROM TableB
) AS Combined
GROUP BY EmpID, Ename
ORDER BY EmpID;
