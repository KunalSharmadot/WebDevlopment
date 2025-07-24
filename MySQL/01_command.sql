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
SELECT * FROM users WHERE name LIKE '%li%'; -- Contains 'li'
SELECT * FROM users WHERE date_of_birth<"2020-10-20";
SELECT * FROM users WHERE date_of_birth IS NULL;
SELECT * FROM users WHERE date_of_birth BETWEEN '1990-09-09' AND '2005-08-06';
-- SELECT * FROM users WHERE gender='Female' OR date_of_birth<"2020-10-20";
SELECT * FROM users WHERE gender='Female' AND date_of_birth<"2020-10-20" ORDER BY id DESC;
-- SELECT * FROM users ORDER BY id ASC;
SELECT * FROM users LIMIT 10 OFFSET 5;
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