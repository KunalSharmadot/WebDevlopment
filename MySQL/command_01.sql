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