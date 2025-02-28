-- ALTER Commands:
USE example_db;

DESC employee;

ALTER TABLE employee ADD email VARCHAR(200);

DESC employee;

ALTER TABLE employee DROP email;

DESC employee;

ALTER TABLE employee RENAME TO employees;

SHOW TABLES;
-- Add NOT NULL constraint to email
ALTER TABLE employees DROP email;

ALTER TABLE employees ADD email VARCHAR(200) NOT NULL;

DESC employees;
-- But all the data is deleted.
-- To add NOT NULL constraint without delete data
ALTER TABLE employees MODIFY email VARCHAR(200) NOT NULL UNIQUE;

-- SELECT statement
SELECT * FROM employees;



