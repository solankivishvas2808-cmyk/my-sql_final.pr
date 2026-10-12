CREATE DATABASE CollegeManagement;
USE CollegeManagement;
===================================
CREATE TABLE Students (
 StudentID INT PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Email VARCHAR(100),
 BirthDate DATE,
 EnrollmentDate DATE
 );
Query OK, 0 rows affected (0.017 sec)
==========================================
INSERT INTO Students
      VALUES
 (101, 'Rahul', 'Patel', 'rahul.patel@gmail.com', '2002-04-12', '2023-06-15'),
 (102, 'Priya', 'Shah', 'priya.shah@gmail.com', '2003-09-25', '2024-07-10'),
 (103, 'Amit', 'Desai', 'amit.desai@gmail.com', '2001-11-08', '2022-08-20'),
 (104, 'Neha', 'Joshi', 'neha.joshi@gmail.com', '2002-02-18', '2023-07-05'),
 (105, 'Karan', 'Mehta', 'karan.mehta@gmail.com', '2004-01-30', '2025-06-12');
Query OK, 5 rows affected (0.007 sec)
Records: 5  Duplicates: 0  Warnings: 0

SELECT * FROM students;
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|       101 | Rahul     | Patel    | rahul.patel@gmail.com | 2002-04-12 | 2023-06-15     |
|       102 | Priya     | Shah     | priya.shah@gmail.com  | 2003-09-25 | 2024-07-10     |
|       103 | Amit      | Desai    | amit.desai@gmail.com  | 2001-11-08 | 2022-08-20     |
|       104 | Neha      | Joshi    | neha.joshi@gmail.com  | 2002-02-18 | 2023-07-05     |
|       105 | Karan     | Mehta    | karan.mehta@gmail.com | 2004-01-30 | 2025-06-12     |
+-----------+-----------+----------+-----------------------+------------+----------------+
5 rows in set (0.001 sec)
===============================================================================================

CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100)
 );

 INSERT INTO Departments
 VALUES
 (11, 'Information Technology'),
 (12, 'Business Administration'),
 (13, 'Mechanical Engineering');
Query OK, 3 rows affected (0.002 sec)
Records: 3  Duplicates: 0  Warnings: 0

select * from Departments
+--------------+-------------------------+
| DepartmentID | DepartmentName          |
+--------------+-------------------------+
|           11 | Information Technology  |
|           12 | Business Administration |
|           13 | Mechanical Engineering  |
+--------------+-------------------------+

=================================================================================================
CREATE TABLE Courses (
 CourseID INT PRIMARY KEY,
 CourseName VARCHAR(100),
 DepartmentID INT,
 Credits INT,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
 );
Query OK, 0 rows affected (0.010 sec)

INSERT INTO Courses
 VALUES
 (201, 'Database Management', 11, 4),
 (202, 'Web Development', 11, 3),
 (203, 'Business Mathematics', 12, 4),
 (204, 'Machine Design', 13, 3);
Query OK, 4 rows affected (0.002 sec)
Records: 4  Duplicates: 0  Warnings: 0

select * from courses;
+----------+----------------------+--------------+---------+
| CourseID | CourseName           | DepartmentID | Credits |
+----------+----------------------+--------------+---------+
|      201 | Database Management  |           11 |       4 |
|      202 | Web Development      |           11 |       3 |
|      203 | Business Mathematics |           12 |       4 |
|      204 | Machine Design       |           13 |       3 |
+----------+----------------------+--------------+---------+
4 rows in set (0.000 sec)
=========================================================================================

CREATE TABLE Instructors (
 InstructorID INT PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Email VARCHAR(100),
 DepartmentID INT,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
 );
Query OK, 0 rows affected (0.009 sec)

INSERT INTO Instructors
 VALUES
 (301, 'Harsh', 'Trivedi', 'harsh.trivedi@college.com', 11),
 (302, 'Pooja', 'Raval', 'pooja.raval@college.com', 12),
 (303, 'Nilesh', 'Parmar', 'nilesh.parmar@college.com', 13);
Query OK, 3 rows affected (0.002 sec)
Records: 3  Duplicates: 0  Warnings: 0

select * from instructors;
+--------------+-----------+----------+---------------------------+--------------+
| InstructorID | FirstName | LastName | Email                     | DepartmentID |
+--------------+-----------+----------+---------------------------+--------------+
|          301 | Harsh     | Trivedi  | harsh.trivedi@college.com |           11 |
|          302 | Pooja     | Raval    | pooja.raval@college.com   |           12 |
|          303 | Nilesh    | Parmar   | nilesh.parmar@college.com |           13 |
+--------------+-----------+----------+---------------------------+--------------+
3 rows in set (0.000 sec)
==============================================================================================

CREATE TABLE Enrollments (
    ->     EnrollmentID INT PRIMARY KEY,
    ->     StudentID INT,
    ->     CourseID INT,
    ->     EnrollmentDate DATE,
    ->     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    ->     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
    -> );
Query OK, 0 rows affected (0.011 sec)

INSERT INTO Enrollments
    -> VALUES
    -> (401, 101, 201, '2023-07-01'),
    -> (402, 101, 202, '2023-07-02'),
    -> (403, 102, 201, '2024-07-12'),
    -> (404, 102, 203, '2024-07-15'),
    -> (405, 103, 202, '2022-08-25'),
    -> (406, 104, 201, '2023-07-10'),
    -> (407, 104, 203, '2023-07-12'),
    -> (408, 105, 204, '2025-06-20');
Query OK, 8 rows affected (0.003 sec)
Records: 8  Duplicates: 0  Warnings: 0

SELECT * FROM Enrollments;
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|          401 |       101 |      201 | 2023-07-01     |
|          402 |       101 |      202 | 2023-07-02     |
|          403 |       102 |      201 | 2024-07-12     |
|          404 |       102 |      203 | 2024-07-15     |
|          405 |       103 |      202 | 2022-08-25     |
|          406 |       104 |      201 | 2023-07-10     |
|          407 |       104 |      203 | 2023-07-12     |
|          408 |       105 |      204 | 2025-06-20     |
+--------------+-----------+----------+----------------+
8 rows in set (0.000 sec)

========================================================================

INSERT INTO Students
VALUES
(106, 'Dhruv', 'Patel', 'dhruv.patel@gmail.com', '2003-05-14', '2025-07-01');

SELECT * FROM Students;
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|       101 | Rahul     | Patel    | rahul.patel@gmail.com | 2002-04-12 | 2023-06-15     |
|       102 | Priya     | Shah     | priya.shah@gmail.com  | 2003-09-25 | 2024-07-10     |
|       103 | Amit      | Desai    | amit.desai@gmail.com  | 2001-11-08 | 2022-08-20     |
|       104 | Neha      | Joshi    | neha.joshi@gmail.com  | 2002-02-18 | 2023-07-05     |
|       105 | Karan     | Mehta    | karan.mehta@gmail.com | 2004-01-30 | 2025-06-12     |
|       106 | Dhruv     | Patel    | dhruv.patel@gmail.com | 2003-05-14 | 2025-07-01     |
+-----------+-----------+----------+-----------------------+------------+----------------+
6 rows in set (0.000 sec)

=================================================================================================

UPDATE Students
SET FirstName = 'Dhruvraj'
WHERE StudentID = 106;

DELETE FROM Students
WHERE StudentID = 106;

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';
+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|       101 | Rahul     | Patel    | rahul.patel@gmail.com | 2002-04-12 | 2023-06-15     |
|       102 | Priya     | Shah     | priya.shah@gmail.com  | 2003-09-25 | 2024-07-10     |
|       104 | Neha      | Joshi    | neha.joshi@gmail.com  | 2002-02-18 | 2023-07-05     |
|       105 | Karan     | Mehta    | karan.mehta@gmail.com | 2004-01-30 | 2025-06-12     |
+-----------+-----------+----------+-----------------------+------------+----------------+
4 rows in set (0.003 sec)
=====================================================================================================

SELECT c.*
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Business Administration'
LIMIT 5;
+----------+----------------------+--------------+---------+
| CourseID | CourseName           | DepartmentID | Credits |
+----------+----------------------+--------------+---------+
|      203 | Business Mathematics |           12 |       4 |
+----------+----------------------+--------------+---------+
1 row in set (0.002 sec)
=====================================================================================================

SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 1;
+----------+----------------------+--------------+
| CourseID | CourseName           | StudentCount |
+----------+----------------------+--------------+
|      201 | Database Management  |            3 |
|      202 | Web Development      |            2 |
|      203 | Business Mathematics |            2 |
+----------+----------------------+--------------+
3 rows in set (0.005 sec)
=========================================================

SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Database Management', 'Web Development')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|       101 | Rahul     | Patel    |
+-----------+-----------+----------+
1 row in set (0.005 sec)
=====================================================================

SELECT DISTINCT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Database Management', 'Web Development');
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|       101 | Rahul     | Patel    |
|       102 | Priya     | Shah     |
|       104 | Neha      | Joshi    |
|       103 | Amit      | Desai    |
+-----------+-----------+----------+
4 rows in set (0.003 sec)
======================================================================

SELECT AVG(Credits) AS AverageCredits
FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.002 sec)
=======================================================================

UPDATE Instructors
SET Salary = 50000
WHERE InstructorID = 301;

UPDATE Instructors
SET Salary = 60000
WHERE InstructorID = 302;

UPDATE Instructors
SET Salary = 55000
WHERE InstructorID = 303;

SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Information Technology';

+---------------+
| MaximumSalary |
+---------------+
|      50000.00 |
+---------------+
1 row in set (0.000 sec)
===========================================================================

SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses c
ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

+--------------+-------------------------+--------------+
| DepartmentID | DepartmentName          | StudentCount |
+--------------+-------------------------+--------------+
|           11 | Information Technology  |            4 |
|           12 | Business Administration |            2 |
|           13 | Mechanical Engineering  |            1 |
+--------------+-------------------------+--------------+
3 rows in set (0.000 sec)
==============================================================================

SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseID,
       c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

+-----------+-----------+----------+----------+----------------------+
| StudentID | FirstName | LastName | CourseID | CourseName           |
+-----------+-----------+----------+----------+----------------------+
|       101 | Rahul     | Patel    |      201 | Database Management  |
|       102 | Priya     | Shah     |      201 | Database Management  |
|       104 | Neha      | Joshi    |      201 | Database Management  |
|       101 | Rahul     | Patel    |      202 | Web Development      |
|       103 | Amit      | Desai    |      202 | Web Development      |
|       102 | Priya     | Shah     |      203 | Business Mathematics |
|       104 | Neha      | Joshi    |      203 | Business Mathematics |
|       105 | Karan     | Mehta    |      204 | Machine Design       |
+-----------+-----------+----------+----------+----------------------+
8 rows in set (0.000 sec)
=============================================================================
SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseID,
       c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;

+-----------+-----------+----------+----------+----------------------+
| StudentID | FirstName | LastName | CourseID | CourseName           |
+-----------+-----------+----------+----------+----------------------+
|       101 | Rahul     | Patel    |      202 | Web Development      |
|       101 | Rahul     | Patel    |      201 | Database Management  |
|       102 | Priya     | Shah     |      203 | Business Mathematics |
|       102 | Priya     | Shah     |      201 | Database Management  |
|       103 | Amit      | Desai    |      202 | Web Development      |
|       104 | Neha      | Joshi    |      203 | Business Mathematics |
|       104 | Neha      | Joshi    |      201 | Database Management  |
|       105 | Karan     | Mehta    |      204 | Machine Design       |
+-----------+-----------+----------+----------+----------------------+
===============================================================================
SELECT *
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 2
    )
);

+-----------+-----------+----------+-----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                 | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|       101 | Rahul     | Patel    | rahul.patel@gmail.com | 2002-04-12 | 2023-06-15     |
|       102 | Priya     | Shah     | priya.shah@gmail.com  | 2003-09-25 | 2024-07-10     |
|       104 | Neha      | Joshi    | neha.joshi@gmail.com  | 2002-02-18 | 2023-07-05     |
+-----------+-----------+----------+-----------------------+------------+----------------+
3 rows in set (0.007 sec)
================================================================================================
SELECT StudentID,
       FirstName,
       LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

+-----------+-----------+----------+----------------+
| StudentID | FirstName | LastName | EnrollmentYear |
+-----------+-----------+----------+----------------+
|       101 | Rahul     | Patel    |           2023 |
|       102 | Priya     | Shah     |           2024 |
|       103 | Amit      | Desai    |           2022 |
|       104 | Neha      | Joshi    |           2023 |
|       105 | Karan     | Mehta    |           2025 |
+-----------+-----------+----------+----------------+
5 rows in set (0.002 sec)
===================================================================================================
SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;

+----------------+
| InstructorName |
+----------------+
| Harsh Trivedi  |
| Pooja Raval    |
| Nilesh Parmar  |
+----------------+
3 rows in set (0.002 sec)
=================================================================
SELECT EnrollmentDate,
       COUNT(*) AS StudentsEnrolled,
       SUM(COUNT(*)) OVER (
           ORDER BY EnrollmentDate
       ) AS RunningTotal
FROM Enrollments
GROUP BY EnrollmentDate;

+----------------+------------------+--------------+
| EnrollmentDate | StudentsEnrolled | RunningTotal |
+----------------+------------------+--------------+
| 2022-08-25     |                1 |            1 |
| 2023-07-01     |                1 |            2 |
| 2023-07-02     |                1 |            3 |
| 2023-07-10     |                1 |            4 |
| 2023-07-12     |                1 |            5 |
| 2024-07-12     |                1 |            6 |
| 2024-07-15     |                1 |            7 |
| 2025-06-20     |                1 |            8 |
+----------------+------------------+--------------+
8 rows in set (0.003 sec)
======================================================================
SELECT StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
           THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;

+-----------+-----------+----------+----------------+--------------+
| StudentID | FirstName | LastName | EnrollmentDate | StudentLevel |
+-----------+-----------+----------+----------------+--------------+
|       101 | Rahul     | Patel    | 2023-06-15     | Junior       |
|       102 | Priya     | Shah     | 2024-07-10     | Junior       |
|       103 | Amit      | Desai    | 2022-08-20     | Senior       |
|       104 | Neha      | Joshi    | 2023-07-05     | Junior       |
|       105 | Karan     | Mehta    | 2025-06-12     | Junior       |
+-----------+-----------+----------+----------------+--------------+
5 rows in set (0.001 sec)