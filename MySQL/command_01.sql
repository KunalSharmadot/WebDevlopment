-- Create a new table
create database mydatabase;

-- Select database 
USE mydatabase;

-- Delete created database
DROP DATABASE mydatabase;

-- Create new table 
CREATE TABLE users (
	-- using datatype and constraint
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	gender ENUM('Male', 'Female', 'Other'),
	date_of_birth DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- show all columns from table(user)
select * from users;
-- show all selected columns from table (users)
select id, name, email from users;
-- Rename the table
RENAME TABLE users to programmers;
select * from programmers;
-- Add new column at last of column in table 
ALTER TABLE programmers ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE programmers DROP COLUMN is_active;  
ALTER TABLE programmers MODIFY COLUMN name VARCHAR(150);
ALTER TABLE programmers MODIFY COLUMN email VARCHAR(100) AFTER id;
ALTER TABLE programmers MODIFY COLUMN date_of_birth DATE FIRST;