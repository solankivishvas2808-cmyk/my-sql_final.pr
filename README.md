# College Management System — MySQL Database Project

**Developed by:** Vishwas Solanki  
**Project Type:** Relational Database Management System (RDBMS)  
**Database:** MySQL  
**Primary Focus:** Database design, SQL queries, relationships, joins, aggregation, and data analysis

---

## 1. Project Overview

The **College Management System** is a MySQL database project designed to organize and query common college information. It models students, academic departments, courses, instructors, and student course enrollments in a relational structure.

The project demonstrates practical SQL skills, including creating databases and tables, inserting and modifying records, defining primary and foreign keys, joining related tables, filtering results, grouping data, using aggregate functions, and applying date and string functions.

## 2. Objectives

- Build a structured relational database for college-related data.
- Store student, department, course, instructor, and enrollment records.
- Establish relationships between tables using primary and foreign keys.
- Retrieve meaningful information through SQL queries.
- Practice data manipulation and analysis using MySQL.

## 3. Database Schema

The database is named `CollegeManagement` and contains the following tables:

| Table | Purpose | Key relationships |
|---|---|---|
| `Students` | Stores student identity, contact, birth, and enrollment information. | `StudentID` is the primary key. |
| `Departments` | Stores department identifiers and names. | `DepartmentID` is the primary key. |
| `Courses` | Stores course names, department assignments, and credit values. | `DepartmentID` references `Departments`. |
| `Instructors` | Stores instructor identity, contact, and department information. | `DepartmentID` references `Departments`. |
| `Enrollments` | Connects students to the courses they take and records enrollment dates. | `StudentID` references `Students`; `CourseID` references `Courses`. |

### Relationship summary

- One department can be associated with multiple courses.
- One department can be associated with multiple instructors.
- A student can enroll in multiple courses.
- A course can have multiple students.
- `Enrollments` links students and courses, implementing the many-to-many relationship.

## 4. Technologies Used

- **MySQL** — relational database and SQL query execution
- **SQL** — schema definition, data manipulation, and data retrieval

## 5. SQL Concepts Demonstrated

The supplied SQL project demonstrates:

- **Database and table creation:** `CREATE DATABASE`, `USE`, `CREATE TABLE`
- **Data manipulation:** `INSERT`, `UPDATE`, `DELETE`
- **Data retrieval and filtering:** `SELECT`, `WHERE`, `IN`, `LIMIT`
- **Relationships:** primary keys and foreign keys
- **Joins:** `INNER JOIN` and `LEFT JOIN`
- **Aggregate functions:** `COUNT()`, `AVG()`, `MAX()`, `SUM()`
- **Grouping and group filtering:** `GROUP BY`, `HAVING`
- **Subqueries:** nested queries to find students linked to highly enrolled courses
- **Date functions:** `YEAR()`, `CURDATE()`, `DATE_SUB()`
- **String functions:** `CONCAT()`
- **Conditional logic:** `CASE`
- **Window functions:** `SUM() OVER (...)` for a running enrollment total
- **Distinct results:** `DISTINCT` and `COUNT(DISTINCT ...)`

## 6. Example Questions Answered by the Project

The queries are used to answer questions such as:

- Which students enrolled after a specified date?
- Which courses belong to a particular department?
- How many students are enrolled in each course?
- Which students are enrolled in both Database Management and Web Development?
- What is the average number of credits across courses?
- What is the maximum instructor salary in the Information Technology department?
- How many distinct students are enrolled in courses offered by each department?
- Which students are associated with courses having more than two enrollments?
- What is the running total of enrollments by date?
- How can students be classified as `Senior` or `Junior` based on an enrollment-date rule?

## 7. Setup and Usage

### Requirements

- MySQL Server installed and running
- A MySQL client, such as MySQL Workbench or the MySQL command-line client

### Steps

1. Open your MySQL client and connect to your MySQL server.
2. Review the SQL file before executing it.
3. Run the database setup statements first:

   ```sql
   CREATE DATABASE CollegeManagement;
   USE CollegeManagement;
   ```

4. Execute the table-creation statements in dependency order: `Students`, `Departments`, `Courses`, `Instructors`, and `Enrollments`.
5. Insert the sample records.
6. Run the `SELECT` queries individually to review the results.

> **Important:** The supplied `.sql` file includes MySQL terminal output and prompt fragments alongside SQL statements. These are useful as a record of the work, but they are not valid SQL statements. Before running the entire file as a script, remove lines such as `Query OK`, result-table borders, and command-prompt markers (for example, `->`).

### Salary-query prerequisite

The file updates and queries an `Instructors.Salary` column, but the shown `CREATE TABLE Instructors` statement does not define that column. Before running the salary updates and salary query on a freshly created database, add it:

```sql
ALTER TABLE Instructors
ADD Salary DECIMAL(10,2);
```

Then run the salary updates before executing the maximum-salary query.

## 8. Sample Data Included

The script includes sample records for:

- 5 students in the initial student dataset
- 3 departments
- 4 courses
- 3 instructors
- 8 enrollments

It also demonstrates an additional student insert, an update, and a delete operation. The final student table contains the original five students after the additional demonstration record is deleted.

## 9. Learning Outcomes

Through this project, the developer practices how to:

- Design a relational schema with linked tables.
- Maintain referential integrity with foreign keys.
- Write queries across multiple related tables.
- Summarize and compare data with aggregate functions.
- Filter grouped results using `HAVING`.
- Use subqueries, conditional expressions, date/string functions, and window functions.
- Interpret query output to answer practical database questions.

## 10. Future Enhancements

Possible improvements for a future version include:

- Add marks, attendance, semesters, and academic-year records.
- Add constraints such as `NOT NULL`, `UNIQUE`, and appropriate checks.
- Add indexes for frequently searched columns.
- Create views for common reports.
- Add stored procedures and triggers where appropriate.
- Build a front-end application for authorized college staff.

## 11. Author

**Vishwas Solanki**  
*MySQL Database Project — College Management System*

---

*This project is intended for learning and demonstration purposes and uses sample data.*
