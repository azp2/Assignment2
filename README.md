# SQL Assignment - Training Center Database

## Trainee Information
* **Student Name:** Abdulaziz Alamri
* **Assignment:** SQL Assignment

## Database Tool Used
* **DBMS:** MySQL
* **GUI/Tool:** MySQL Workbench 

## Project Description
This project is a complete SQL script that creates and manages a relational database for a training center. It covers the following tasks:
1. **Database & Tables Creation:** Creating `training_center_db` with `instructors`, `students`, `courses`, and `enrollments` tables using appropriate constraints (Primary/Foreign Keys, CHECK, DEFAULT, UNIQUE).
2. **Sample Data Insertion:** Populating the database with realistic data to establish logical many-to-many and one-to-many relationships.
3. **CRUD Operations:** Selecting, updating, and deleting records safely.
4. **String Functions:** Using functions like CONCAT, LOWER, SUBSTRING, REPLACE, and CHAR_LENGTH.
5. **Refining Selections:** Filtering data using DISTINCT, ORDER BY, LIMIT, and LIKE with escape characters.
6. **Aggregate Functions:** Utilizing COUNT, AVG, MIN, MAX, GROUP BY, and HAVING.
7. **Operators, Dates, and CASE:** Implementing BETWEEN, IN, AND/OR, IS NULL, and CASE statements.
8. **ALTER TABLE & Constraints:** Modifying table structures and adding named constraints.
9. **Relationships & Joins:** Executing INNER, LEFT, RIGHT, and multi-table JOIN queries.
10. **Views:** Creating, querying, and replacing views, including the use of WITH ROLLUP.
11. **Window Functions (Bonus):** Applying ROW_NUMBER, DENSE_RANK, PARTITION BY, and LAG.

## Steps to Run the Script
1. Open **MySQL Workbench** (or your preferred MySQL GUI).
2. Open the provided SQL script file.
3. Select all the code in the script (`Ctrl + A` on Windows).
4. Click the **Execute** button (the lightning bolt icon) to run the script from top to bottom.
5. Check the Output panel to ensure all queries executed successfully.

## Notes & Considerations
* **Safe Updates:** In Task 3, `SQL_SAFE_UPDATES` is temporarily disabled (`SET sql_safe_updates=0;`) to allow specific `UPDATE` and `DELETE` operations, and then immediately re-enabled.
* **Self-Contained Script:** The script includes `CREATE DATABASE IF NOT EXISTS` and `USE training_center_db;`, so manual database creation is not required before running the file.
