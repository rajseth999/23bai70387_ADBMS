--MEDIUM LEVEL PROBLEM
USE DB_DEMO 
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(100),
    ManagerID INT -- References EmployeeID of another employee
);

INSERT INTO Employee (EmployeeID, EmployeeName, Department, ManagerID) VALUES
(1, 'Alice', 'HR', NULL),
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT 
    E.EmployeeName,
    E.Department AS EmployeeDept,
    M.EmployeeName AS ManagerName,
    M.Department AS ManagerDept
FROM 
    Employee E
LEFT JOIN 
    Employee M ON E.ManagerID = M.EmployeeID;

--HARD LEVEL PROBLEM

CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);
CREATE TABLE Queries_tbl (
    ID INT,
    YEAR INT
);
INSERT INTO Year_tbl (ID, YEAR, NPV) VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);
INSERT INTO Queries_tbl (ID, YEAR) VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);
SELECT * FROM Year_tbl
SELECT * FROM Queries_tbl
SELECT 
    Q.ID,
    Q.YEAR,
    COALESCE(Y.NPV, 0) AS NPV
FROM 
    Queries_tbl Q
LEFT JOIN 
    Year_tbl Y 
ON 
    Q.ID = Y.ID AND Q.YEAR = Y.YEAR
ORDER BY 
    Q.ID, Q.YEAR;
