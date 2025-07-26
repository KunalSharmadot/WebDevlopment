-- Create a new table
create database mydatabase;
create database if not exists mydatabase;

-- Select database 
USE mydatabase;

-- Delete created database
DROP DATABASE mydatabase;

-- Create new table 
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Delete a table
DROP TABLE users;

-- show all columns from table(user)
select * from users;

-- Rename the table
RENAME TABLE users to programmers;
select * from programmers;
-- ADD more column to table
ALTER TABLE users ADD city VARCHAR(100), ADD state VARCHAR(100);
ALTER TABLE users DROP COLUMN state;
-- Add new column at last of column in table 
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
-- Delete selected column
ALTER TABLE users DROP COLUMN is_active;  

-- Modify selectred column of Datatype in table
ALTER TABLE users MODIFY COLUMN name VARCHAR(150);
-- Modify : locate the email column after the id
ALTER TABLE users MODIFY COLUMN email VARCHAR(100) AFTER id;
-- Modify : locate the date_of_birth in first position in column
ALTER TABLE users MODIFY COLUMN date_of_birth DATE FIRST;

-- CRUD (Create, Read, Update, Delete)
-- Insert the data (Format must be follow)
INSERT INTO users VALUES('2016-07-13', 1, 'limeCode@gmail.com', 'Alice', 'Male', DEFAULT);
-- Insert the data according to itself by changing the format
INSERT INTO users (name, email, gender, date_of_birth) VALUES ('Knal', 'kunalshrma@gmail.com', 'Male', NULL);
-- Insert Multiple data at a single command
INSERT INTO users (name, email, gender, date_of_birth) VALUES 
('Kaushal', 'kaushalrathore@gmail.com', 'Male', '2001-08-26'),
('Mahi', 'golumaheshrawat676@gmail.com', 'Female', '2003-10-02');

-- show all selected columns from table (users)
SELECT id, name, email FROM users;
-- more filter you can do on table
SELECT * FROM users WHERE gender="Female";
-- gender is not equal to female
SELECT * FROM users WHERE gender!="Female";
SELECT * FROM users WHERE gender<>"Female";
SELECT * FROM users WHERE gender IN ('Male', 'Female');
SELECT * FROM users WHERE name LIKE 'A%';  -- Starts with A
SELECT * FROM users WHERE name LIKE '%a';  -- Ends with a
SELECT * FROM users WHERE name LIKE '_a%';  -- Second letter is 'a'
SELECT * FROM users WHERE name LIKE '_a_h%';  -- Second letter is '_a_h%'
SELECT * FROM users WHERE name LIKE '%li%'; -- Contains 'li'
SELECT * FROM users WHERE date_of_birth<"2020-10-20";
SELECT * FROM users WHERE date_of_birth IS NULL;
SELECT * FROM users WHERE date_of_birth BETWEEN '1990-09-09' AND '2005-08-06';
-- SELECT * FROM users WHERE gender='Female' OR date_of_birth<"2020-10-20";
SELECT * FROM users WHERE gender='Female' AND date_of_birth<"2020-10-20" ORDER BY id DESC;
-- SELECT * FROM users ORDER BY id ASC;
SELECT * FROM users LIMIT 10 OFFSET 5;	-- after left first 5th rows give us 6th to 15th record
SELECT * FROM users LIMIT 6, 10;	-- first value is offset then limit
SELECT * FROM users;

-- Update in tables
UPDATE users SET salary = 45000 WHERE id = 1;	-- update salary of id 1
UPDATE users SET salary = 45000, email = 'knalsharma@gmail.com' WHERE id = 1;	-- update salary and email of id 1
USE mydatabase;
SELECT * FROM users;

-- delete in tables : All logics /Syntax Followed by updates query
DELETE FROM users WHERE salary<65000;

-- MySQL Constraints: Constraints in MySQL are rules applied to table columns to ensure the accuracy, validity,  and initegrity of the data.

-- UNIQUE Constraint: Ensure that all values in a column  are different.
CREATE TABLE users (
    email VARCHAR(100) UNIQUE
);
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);	-- email have a uique for everyone
ALTER TABLE users MODIFY COLUMN name VARCHAR(100) NOT NULL;		-- name column will not be empty/null
ALTER TABLE users MODIFY COLUMN name VARCHAR(100) NULL;		-- name column will be empty/null
ALTER TABLE users DROP INDEX email;	-- Drop a unique constraint

-- CHECK constraint : Ensure that values in a column satisfy a specific condition
ALTER TABLE users ADD CONSTRAINT chk_dob CHECK (date_of_birth > '1920-01-01');
ALTER TABLE users ALTER COLUMN is_active SET DEFAULT TRUE;	-- add default using ALTER TABLE

-- AUTO_INCREMENT Constraint : Automatically genereates unique numbers
-- PRIMARY KEY Constraint : Uniquely identifies each row. Must be Not Null and Unique
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE users DROP PRIMARY KEY;		-- This may fails if the primary key is being used elsewhere (like in a foreign key or auto_increment)
ALTER TABLE users AUTO_INCREMENT = 1000;	-- Auto increment start with 1000

-- SQL FUNCTIONS (MySQL) : SQL functions help you analyze, transform, or summarize data in your tables
SELECT COUNT(*) FROM users;		-- Gives total number of columns
SELECT COUNT(*) FROM users WHERE gender = 'Female';	-- count how many female have
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM users;		-- min and max of salary
SELECT SUM(salary) AS total_salary FROM users;		-- sum of salary
SELECT gender, AVG(salary) AS avg_salary FROM users GROUP BY gender;	-- gender wise average salary
SELECT id, gender, LOWER(name) AS lowerWord, UPPER(name) AS UpperWord, LENGTH(name) AS name_length FROM users;	-- it gives lower name and length name
SELECT CONCAT(LOWER(name), "-s") AS concat FROM users;	-- concat lower name and radom String
SELECT name, YEAR(date_of_birth) AS DOB_year, MONTH(date_of_birth) AS DOB_Month, DAY(date_of_birth) AS DOB_day,  NOW() AS time FROM users;	-- time related filters
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS DaysToLived FROM users; 	-- days to lived 

-- Mathmatical Fucntions
-- ROUND(), FLOOR(), CIRL();
SELECT salary,
	ROUND(salary) AS roundOff,	-- roundoff value
    FLOOR(salary) AS Floored,	-- 2.2 => 2.0 less value
    CEIL(salary) AS cieled		-- 2.2 => 3.0 greater value
FROM users;
-- MOD() : Gives remainder
SELECT id, MOD(id, 2) AS remainder FROM users;
-- IF()
SELECT name, gender,
	IF(gender = 'Female', 'Yes', 'No') AS is_female 
FROM users;
SELECT name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM users;	-- calculate age

-- Auto Commit and Transaction
SET autocommit = 0;		-- auto commit off
DELETE FROM users WHERE id=9;	-- accidently delete 9 insted of 5
ROLLBACK;	-- back to the last commit
DELETE FROM users WHERE id=5;	-- delete correct data
COMMIT;	-- Final submission
SELECT * FROM users;  

-- FOREIGN KEYS : Go to foreignKey script file
CREATE TABLE addresses (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    -- connect and pick data from (users) table (id) row and (on delete cascade) when deletion perform on users table than it effect on addresses table
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE	
    -- CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL	-- because of set null the foreign key null	
);
use mydatabase;
DROP TABLE users;
SELECT * FROM addresses;
DROP DATABASE mydatabase;
-- END Foreign Key Work

-- MySQL Join
-- INNER JOIN : Returns only the matching rows from both tables.
SELECT users.name, users.gender, addresses.city, addresses.state, addresses.id AS addressses_id
FROM users 
INNER JOIN addresses ON users.id = addresses.user_id;
-- LEFT JOIN : Returns all rows from the left table (users), and matching rows from the right table (addresses). If no match is found, NULLs are returned.
SELECT * FROM users 
LEFT JOIN addresses ON users.id = addresses.user_id;
-- RIGHT JOIN : Returns all rows from the right table (addresses), and matching rows from the left table (users). If no match is found, NULLs are returned.
SELECT users.name, users.gender, addresses.city, addresses.state, addresses.id AS addressses_id
FROM users 
RIGHT JOIN addresses ON users.id = addresses.user_id;

-- SQL UNION and UNION ALL : 
CREATE TABLE admin_users (
	id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary INT
);
INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

-- UNION : This return single list of unique names from both tables.
SELECT email, name FROM users
UNION
SELECT email, name FROM admin_users;
-- UNION ALL : If you want to keep duplicate names(if any), use UNION ALL
SELECT email, name, 'User' AS role FROM users
UNION ALL
SELECT email, name, 'Admin' AS role FROM admin_users;

-- Rules of UNION
-- The number of columns and their data types must match in all SELECT statements.
-- UNION removes duplicates by default.
-- UNION ALL keeps duplicates.

-- ORDER BY : Arranging according to the column choice
SELECT email, date_of_birth, name, 'User' AS role FROM users
UNION ALL
SELECT email, date_of_birth, name, 'Admin' AS role FROM admin_users
ORDER BY date_of_birth;

-- SELF JOIN in MySQL : A Self JOIN is a regular join, but the table is joined with itself.
-- This is useful when rows in the same table are related to each other. For example, when users refer other users, and we store the ID of the person who referred them in the same users table.
ALTER TABLE users
ADD COLUMN referred_by_id INT;
SELECT * FROM users;
-- Insert Referral Data 
UPDATE users SET referred_by_id = 1 WHERE id IN (2, 3, 8, 10, 12, 15, 19, 20); -- User 1 referred Users 2 and 3
UPDATE users SET referred_by_id = 2 WHERE id = 4;       -- User 2 referred User 4
-- Use a Self JOIN to Get Referrer Names
SELECT 
  a.id,
  a.name AS user_name,
  b.name AS referred_by
FROM users a
INNER JOIN users b ON a.referred_by_id = b.id;		-- you can use  LEFT JOIN OR RIGHT JOIN

-- Views in MySQL
-- A view in MySQL is virtual table based on the result of a SELECT query.IT does not store data itself -- it always reflects the currecnt data in the base tables.
-- View are useful when :
	-- You want to simplify complex queries
	-- You want to reuse logic
	-- You want to hide certain columns from users
	-- You want a "live snapshot" of filtered data
CREATE VIEW rich_users AS 
SELECT * FROM users WHERE salary>70000;
UPDATE users SET salary = 30000 WHERE id = 2;
SELECT * FROM rich_users;
-- Dropping a View
DROP VIEW rich_users;

-- MySQL INDEXES : Indexes in MySQL are used to speed up data retrieval. They work like the index of a book — helping the database engine find rows faster, especially for searches, filters, and joins.
SHOW INDEXES FROM users;
CREATE INDEX idx_gender ON users(gender);	-- Single column indexes
CREATE INDEX idx_gender_salary ON users(gender, salary);	-- Multi Column Index
 -- DROP the Index
 DROP INDEX idx_gender ON users;

-- Subqueries in MySQL : A subquery is a query nested inside another query. Subqueries are useful for breaking down complex problems into smaller parts.
-- They can be used in:
		-- SELECT statements
		-- WHERE clauses
		-- FROM clauses

-- Suppose we want to find all users who earn more than the average salary of all users.
SELECT id, name, salary, (SELECT AVG(salary) FROM users) AS Avg_salary
FROM users
WHERE salary > (
    SELECT AVG(salary) FROM users
    -- This subquery returns a single value — the average salary — and we compare each user's salary against it.
);
-- Nested queries
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id FROM users WHERE salary < (SELECT AVG(salary) FROM users)
);

-- GROUP BY and HAVING in MySQL
SELECT gender, AVG(salary), COUNT(*) AS 'Count' 
FROM users GROUP BY gender WITH ROLLUP		-- rollup gives a weighted average of every column
HAVING AVG(salary) < 61000 OR COUNT(*) < 14;		-- Here you can't use WHERE(It used before GROUP BY Query) So user HAVING
-- Example 2: 
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id;
-- HAVING COUNT(*) > 1;

-- Stored Procedures in MySQL : A stored procedure is a saved SQL block that can be executed later. It's useful when you want to encapsulate logic that can be reused multiple times — like queries, updates, or conditional operations.
DELIMITER $$
-- Why Change the Delimiter?
-- By default, MySQL uses ; to end SQL statements.
-- But when defining stored procedures, we use ; inside the procedure as well. This can confuse MySQL. To avoid this, we temporarily change the delimiter (e.g. to $$ or //) while creating the procedure.
CREATE PROCEDURE select_users()
BEGIN
	SELECT * FROM users;
END $$
-- Some Complex Example
CREATE PROCEDURE addUsers(
	IN p_name VARCHAR(100),
	IN p_email VARCHAR(100),
	IN p_gender ENUM('Male', 'Female', 'Other'),
	IN p_dob DATE,
	IN p_salary INT
)
BEGIN
	INSERT INTO users (name, email, gender, date_of_birth, salary)
    VALUES (p_name, p_email, p_gender, p_dob, p_salary);
    SELECT * FROM users;
END $$
DELIMITER ;
CALL addUsers('Kiran Sharma', 'kiran@example.com', 'Female', '1994-06-15', 72000);
SHOW PROCEDURE STATUS WHERE Db = 'mydatabase';
DROP PROCEDURE IF EXISTS select_users;

-- Trigger in MySQL : A trigger is a special kind of stored program that is automatically executed (triggered) when a specific event occurs in a table — such as INSERT, UPDATE, or DELETE.
-- Triggers are commonly used for:
		-- Logging changes
		-- Enforcing additional business rules
		-- Automatically updating related data
CREATE TABLE user_log (		-- Firtly create new table then work on it
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id, name)
    VALUES(NEW.id, NEW.name);
END $$
DELIMITER ;

INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES 
('Ritika Jain', 'ritika@example.com', 'Female', '1996-03-12', 74000);
SELECT * FROM user_log;
DROP TRIGGER IF EXISTS after_user_insert;


-- More on MySQL

-- DISTINCT Keyword : It is used to return only unique values
SELECT DISTINCT gender FROM users;

-- TRUNCATE Keyword : It removes all rows from a table, but keeps the table structure
select * FROM addresses;
TRUNCATE TABLE addresses; -- Faster than DELETE query, Cannot be rolled back.

-- CHANGE VS MODIFY Column
ALTER TABLE users
CHANGE COLUMN city location VARCHAR(150);	-- THIS rename city to location and change its type
ALTER TABLE users
MODIFY COLUMN salary BIGINT;	-- this change only the datatype of salary





