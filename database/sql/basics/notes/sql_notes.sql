-- Step 1 : Create a Database.

CREATE DATABASE example_db;
USE example_db;
SHOW TABLES;

CREATE TABLE test (
    name VARCHAR(255),
    age INT
);

SHOW TABLES;
DESC test;

ALTER TABLE test ADD department VARCHAR(200);
DESC test;

ALTER TABLE test DROP department;
DESC test;

TRUNCATE TABLE test;
SHOW TABLES;
DESC test;

DROP TABLE test;
SHOW TABLES;

CREATE TABLE student (
    id INT,
    name VARCHAR(60),
    age INT,
    department VARCHAR(200),
    phone BIGINT
);

DESC student;

INSERT INTO student (id, name, age, department, phone) VALUES (1, "ram", 20, "IT", 1234567891);

SELECT * FROM student;





-- Types of create commands:

-- 1. CREATE TABLE <tablename> 
-- 
-- 2. CREATE TABLE IF NOT EXISTS <tablename>

-- Create table with Constraints:

-- 3. CREATE TABLE student (
--     id INT,             PRIMARY KEY
--     name VARCHAR(200)   NOT NULL UNIQUE
-- );
-- 
-- 4. Create Table As Select: (CTAS)

CREATE TABLE table1 AS 
SELECT * FROM student;

-- 5. Temporary Table:

-- Temporary tables exists only for the current session.
CREATE TEMPORARY TABLE table1 (
    id INT,
    name VARCHAR(200)
);

-- 6. Common Table Expression (CTE):

WITH high_paying_emplyees AS (
    SELECT emp_id, name, salary 
    FROM employees
    WHERE salary > 1000000
)

-- CTE is only supported for mysql version 8.0.19 and more.

-- We can Use Help command in mysql to get documentation of various
-- SQL commands.
-- 
-- 1. help contents
-- 2. help Data Definition
-- 3. help CREATE TABLE

-- ALTER Commands:

DESC employee;

ALTER TABLE employee ADD email VARCHAR(200);

DESC employee;

ALTER TABLE employee DROP email;

DESC employee;

ALTER TABLE employee RENAME TO employees;

SHOW TABLES;

-- Change the constraints.

ALTER TABLE employee MODIFY email VARCHAR(210) NOT NULL;

-- Change the datatype.

ALTER TABLE employee ALTER COLUMN email <newDatatype>;

-- Data Control Commands

CREATE USER "user"@"localhost"
IDENTIFIED BY "password";

GRANT SELECT, INSERT ON database.* 
TO "user"@"localhost";

FLUSH PRIVILEGES;

-- WHERE CLAUSE COMMANDS

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT,
    rider_id INT,
    pickup_location VARCHAR(100),
    dropoff_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10, 2)
);

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
    (1, 101, 201, 'Chennai', 'Coimbatore', '2025-02-01 08:00:00', 500),
    (2, 102, 202, 'Bangalore', 'Hyderabad', '2025-02-03 10:00:00', 800),
    (3, 103, 203, 'Chennai', 'Madurai', '2025-02-02 12:00:00', 400),
    (4, 104, 204, 'Coimbatore', 'Chennai', '2025-02-04 14:00:00', 600),
    (5, 105, 205, 'Bangalore', 'Coimbatore', '2025-02-05 15:00:00', 700);

SELECT * FROM rides;

SELECT * FROM rides WHERE fare < 800;

SELECT * FROM rides WHERE fare < 800 ORDER BY fare;

SELECT * FROM rides WHERE fare < 800 ORDER BY ride_date;

SELECT * FROM rides WHERE fare < 800 ORDER BY ride_date DESC;

SELECT * FROM rides WHERE dropoff_location = 'Coimbatore';

SELECT * FROM rides WHERE dropoff_location = 'Coimbatore' AND fare > 400;

SELECT * FROM rides WHERE dropoff_location = 'Coimbatore' OR dropoff_location = 'Chennai';

SELECT * FROM rides WHERE dropoff_location IN ('Coimbatore','Chennai');

-- NOT NULL CONSTRAINT EXAMPLE:

CREATE TABLE rides2 (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT NOT NULL,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL
);

-- DEFAULT CONSTRAINT EXAMPLE

CREATE TABLE default (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(4) DEFAULT 'IND'
);

-- UNIQUE CONSTRAINT EXAMPLE

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- CHECK CONSTRAINT EXAMPLE

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT NOT NULL,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) CHECK (fare > 0),
);

-- UPDATE TABLE SYNTAX:
UPDATE users SET email = "noemail@abc.com" WHERE user_id = 3;

DELETE FROM users WHERE email = "noemail1@abc.com";

-- Transaction control language:

START TRANSACTION;

-- Ambigious Commands
DELETE FROM table;

-- If the result is OK? Then 
COMMIT;
-- To make changes affect.
-- Else
ROLLBACK;

-- Truncate Table and Drop commands do an IMPLICIT COMMIT!.

-- WHERE Clause LIKE keyword.

CREATE TABLE us_states (
    id INT AUTO_INCREMENT,
    state VARCHAR(200) NOT NULL
);

-- _ Wildcard - Any Single Character
-- % Wildcard - Any Number Characters

-- mysql> SELECT * FROM us_states WHERE state LIKE "%l%";
-- +----+----------------+
-- | id | state          |
-- +----+----------------+
-- |  3 | California     |
-- | 10 | Colorado       |
-- | 19 | Lowa           |
-- | 22 | Louisiana      |
-- | 24 | Illinois       |
-- | 30 | Alabama        |
-- | 34 | Pennsylvania   |
-- | 36 | North Carolina |
-- | 37 | South Carolina |
-- | 38 | Florida        |
-- +----+----------------+

-- mysql> SELECT * FROM us_states ORDER BY state DESC;
-- +----+----------------+
-- | id | state          |
-- +----+----------------+
-- |  9 | Wyoming        |
-- | 23 | Wisconsin      |
-- |  1 | Washington     |
-- | 35 | Virginia       |
-- |  7 | Utah           |
-- | 17 | Texas          |
-- | 29 | Tennessee      |
-- | 13 | South Dakota   |
-- | 37 | South Carolina |
-- | 39 | puerto Rico    |
-- | 34 | Pennsylvania   |
-- |  2 | Oregon         |
-- | 16 | Okiahoma       |
-- | 31 | Ohio           |
-- | 12 | North Dakota   |
-- | 36 | North Carolina |
-- | 33 | New York       |
-- | 11 | New Mexico     |
-- |  4 | Nevada         |
-- | 14 | Nebraska       |
-- |  6 | Montana        |
-- | 20 | Missouri       |
-- | 25 | Mississippi    |
-- | 18 | Minnesota      |
-- | 26 | Michigan       |
-- | 19 | Lowa           |
-- | 22 | Louisiana      |
-- | 28 | Kentucky       |
-- | 15 | Kansas         |
-- | 27 | Indiana        |
-- | 24 | Illinois       |
-- |  5 | Idaho          |
-- | 32 | Georgia        |
-- | 38 | Florida        |
-- | 10 | Colorado       |
-- |  3 | California     |
-- | 21 | Arkansas       |
-- |  8 | Arizona        |
-- | 30 | Alabama        |
-- +----+----------------+

-- BETWEEN Keyword

SELECT * FROM us_states
WHERE id BETWEEN 10 AND 30;


-- NOT BETWEEN Keyword

SELECT * FROM us_states
WHERE id NOT BETWEEN 10 AND 30;


-- IN 

SELECT * FROM us_states
WHERE id IN (1,2,3,4);

-- NOT IN 

SELECT * FROM us_states
WHERE id NOT IN (1,2,3,4);

-- ALIASES Alternate Names

SELECT state AS United_States FROM us_states;

-- Here United_States is alias for state

SELECT us.state FROM us_states us;

-- Write a query to get all the states that end with the letter a.

SELECT * FROM us_states WHERE state LIKE "%a";

-- +----+----------------+
-- | id | state          |
-- +----+----------------+
-- |  3 | California     |
-- |  4 | Nevada         |
-- |  6 | Montana        |
-- |  8 | Arizona        |
-- | 12 | North Dakota   |
-- | 13 | South Dakota   |
-- | 14 | Nebraska       |
-- | 16 | Okiahoma       |
-- | 18 | Minnesota      |
-- | 19 | Lowa           |
-- | 22 | Louisiana      |
-- | 27 | Indiana        |
-- | 30 | Alabama        |
-- | 32 | Georgia        |
-- | 34 | Pennsylvania   |
-- | 35 | Virginia       |
-- | 36 | North Carolina |
-- | 37 | South Carolina |
-- | 38 | Florida        |
-- +----+----------------+
-- 19 rows in set (0.00 sec)

-- JOINS 

-- ACID 
--     Atomicity
--     Consistency
--     Isolation
--     Durability

-- Get the Distinct marks from test table
SELECT DISTINCT marks FROM test;

-- Get the count of the mark = 70
SELECT COUNT(mark) FROM test WHERE mark = 70;


-- mysql> SELECT * FROM test;
-- +----+-------+
-- | id | marks |
-- +----+-------+
-- |  1 |    75 |
-- |  2 |    78 |
-- |  3 |    70 |
-- |  4 |    80 |
-- |  5 |    81 |
-- |  6 |    70 |
-- |  7 |    70 |
-- |  8 |    95 |
-- |  9 |    98 |
-- | 10 |   100 |
-- | 11 |   100 |
-- | 12 |    91 |
-- | 13 |   100 |
-- | 14 |   100 |
-- +----+-------+
-- 14 rows in set (0.00 sec)

-- How to get the total number of students who got centum?

SELECT COUNT(marks) FROM test WHERE marks = 100;

-- How to get student who scored above 70 but below 90? 

SELECT * FROM test WHERE marks > 70 AND marks < 90;

-- CASE Statement

SELECT id, marks,
CASE
    WHEN marks > 90 THEN 'Topper'
    WHEN marks BETWEEN 70 AND 90 THEN 'Average'
    WHEN marks < 70 THEN 'Slow Learner'
    ELSE 'No Data'
END AS 'rank'
FROM test;

-- +----+-------+---------+
-- | id | marks | rank    |
-- +----+-------+---------+
-- |  1 |    75 | Average |
-- |  2 |    78 | Average |
-- |  3 |    70 | Average |
-- |  4 |    80 | Average |
-- |  5 |    81 | Average |
-- |  6 |    70 | Average |
-- |  7 |    70 | Average |
-- |  8 |    95 | Topper  |
-- |  9 |    98 | Topper  |
-- | 10 |   100 | Topper  |
-- | 11 |   100 | Topper  |
-- | 12 |    91 | Topper  |
-- | 13 |   100 | Topper  |
-- | 14 |   100 | Topper  |
-- +----+-------+---------+
-- 14 rows in set (0.00 sec)

-- String Handling

SELECT state, LENGTH(state) AS 'length' FROM us_states;
-- +----------------+--------+
-- | state          | length |
-- +----------------+--------+
-- | Washington     |     10 |
-- | Oregon         |      6 |
-- | California     |     10 |

SELECT state, UPPER(state) AS 'upper' FROM us_states LIMIT 5;
-- +------------+------------+
-- | state      | upper      |
-- +------------+------------+
-- | Washington | WASHINGTON |
SELECT state, LOWER(state) AS 'lower' FROM us_states LIMIT 5;
-- +------------+------------+
-- | state      | lower      |
-- +------------+------------+
-- | Washington | washington |
SELECT id, state, CONCAT(id, ' - ', COALESCE(id, '00')) AS id_converted
FROM us_states LIMIT 5;
-- +----+------------+--------------+
-- | id | state      | id_converted |
-- +----+------------+--------------+
-- |  1 | Washington | 1 - 1        |
-- |  2 | Oregon     | 2 - 2        |
-- |  3 | California | 3 - 3        |
-- |  4 | Nevada     | 4 - 4        |
-- |  5 | Idaho      | 5 - 5        |
-- +----+------------+--------------+
-- 5 rows in set (0.09 sec)

SELECT state, SUBSTRING(state, 1, 5) AS state_prefix FROM test;
-- +----------------+--------------+
-- | state          | state_prefix |
-- +----------------+--------------+
-- | Washington     | Washi        |

SELECT state, TRIM(state) AS 'trimmed state' FROM us_states LIMIT 1;
-- +--------------+---------------+
-- | state        | trimmed state |
-- +--------------+---------------+
-- | New Mexico   | New Mexico    |

SELECT state, LPAD(state, 5, '*') AS 'left_pad' FROM us_states;
-- +----------------+----------+
-- | state          | left_pad |
-- +----------------+----------+
-- | Washington     | Washi    |
-- | Lowa           | *Lowa    |

SELECT state, RPAD(state, 5, '*') AS 'right_pad' FROM us_states;
-- +----------------+-----------+
-- | state          | right_pad |
-- +----------------+-----------+
-- | Washington     | Washi     |
-- | Ohio           | Ohio*     |

SELECT state, LEFT(state, 5) AS 'first_five' FROM us_states LIMIT 2;
-- +----------------+------------+
-- | state          | first_five |
-- +----------------+------------+
-- | Washington     | Washi      |
-- | New Mexico     | New M      |

SELECT state. RIGHT(state, 5) AS 'last_five' FROM us_states LIMIT 2;
-- +----------------+-----------+
-- | state          | last_five |
-- +----------------+-----------+
-- | Washington     | ngton     |
-- | New Mexico     | exico     |

SELECT state, REPLACE(state, ' ', '_') AS underscore_state FROM us_states LIMIT 2;
-- +----------------+------------------+
-- | state          | underscore_state |
-- +----------------+------------------+
-- | Washington     | Washington       |
-- | New Mexico     | New_Mexico       |

SELECT state, INSTR(state, 'a') AS found_a_at FROM us_states LIMIT 2;
-- +----------------+------------+
-- | state          | found_a_at |
-- +----------------+------------+
-- | Washington     |          2 |
-- | Oregon         |          0 |
SELECT state, REVERSE(state) AS reversed_state FROM us_states LIMIT 2;
-- +----------------+----------------+
-- | state          | reversed_state |
-- +----------------+----------------+
-- | Washington     | notgnihsaW     |
-- | North Dakota   | atokaD htroN   |

SELECT state, FORMAT(9876543210, 2) AS formatted_number FROM us_states LIMIT 2;
-- +------------+------------------+
-- | state      | formatted_number |
-- +------------+------------------+
-- | Washington | 9,876,543,210.00 |
-- | Oregon     | 9,876,543,210.00 |
-- +------------+------------------+




Afternoon we can have simple test.

Create a table called as student with the attributes id, name, email, marks

Insert into student table 5 tuples.

Select values from student table.

Delete values using specific condition.

Update values using specific condition.


CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    pickup_location VARCHAR(100) NOT NULL,
    dropoff_location VARCHAR(100) NOT NULL,
    ride_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);
INSERT INTO drivers (driver_id, driver_name, license_number)
VALUES
    (101, 'jhon', 'abcde1234'),
    (102, 'jane', 'xyzq6789')
;
INSERT INTO rides (ride_id, driver_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
    (301, 101, 'Chennai', 'Coimbatore', '2025-02-01 09:00:00', 500.00),
    (302, 102, 'Coimbatore', 'Chennai', '2025-02-01 22:00:00', 600.00),
    (303, 101, 'Bangalore', 'Hydrabad', '2025-02-01 10:00:00', 800.00)
;



ALTER TABLE drivers MODIFY driver_name varchar(100) NOT NULL;


START TRANSACTION;

SAVEPOINT s;                --   <--+
                            --      |
ROLLBACK TO SAVEPOINT s;    --   ---+

COMMIT;

DELETE FROM rides where ride_id = 303;

-- For soft Delete
-- Add a new column
ALTER TABLE rides ADD is_deleted BOOLEAN DEFAULT false;

-- SOFT DELETE USING UPDATE

UPDATE rides SET is_deleted = true WHERE ride_id = 301;


DELETE FROM drivers WHERE driver_id = 101;
-- ERROR 1451 (23000): Cannot delete or update a parent row:
--     a foreign key constraint fails (`example_db`.`rides`, CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`))


-- Slowly Changing Database: SCD:
Slowly changing dimension is a method used to track historical changes over time.

-- Track historical data
-- Data Accuracy
-- Simplyfy Analysis



-- Three Types:
-- 
-- 1. Overwrite
-- 2. Add New Record
-- 3. Add New Attribute

-- Amazon User details:
--     location : city A
-- 
--         |
--         V
-- 
--     location : city B
-- Type 1:
-- 
-- id name location
--  1 abc  city A
-- 
-- id name location
--  1 abc  city B
-- 
-- Type 2: 
-- 
-- id name location_id
--  1 abc  1
-- 
-- location table:
-- location_id user_id location_string is_active
--    1            1    city A           False
--    2            1    city B           False
--    3            1    city C           True
-- 
-- id name location_id
--  1 abc  2


-- User Table:
-- 
-- id     name    previous_location        current_location
-- 1      u1       NULL                     City A
-- 
-- User goes to new location City B
-- 
-- id     name    previous_location        current_location
-- 1      u1       City A                    City B
-- 
-- User goes to new location City C
-- 
-- id     name    previous_location        current_location
-- 1      u1       City B                    City C

Normalization:

- Reduce data redundancy (duplication).
- Improve data integrity.
- Make maintenance easier.

1. 1NF
2. 2NF
3. 3NF

1NF: Each column should be Atomic (cannot be divided)

student (
    id
    name
    phone numbers
);
 1    name    '12345678', '987654321'
student (
    id
    name
); 

phones (
    id
    student_id
    phone number
)

2NF: All non primary key column are fully functionally dependent on the primary key.

enrollment (
    student_id PK
    course_id  PK
    course_name
    instructor
)

Change this to

enrollment (
    student_id PK
    course_id  PK
)
course (
    id
    course_name
    instructor
)


3NF: All the columns are directly dependent on the primary key.

courses (
    course_id PK
    course_name
    instructor_name
    instructor_skills
)

change to 

courses (
    course_id PK
    course_name
    instructorId
)

instructor (
    id PK
    name
    skills
)



CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    dept VARCHAR(200) NOT NULL
);

DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(200) NOT NULL,
    mark INT NOT NULL CHECK (mark > 0),
    FOREIGN KEY (student_id) REFERENCES student (id)
);


INSERT INTO student (id, name, dept) VALUES (1, 'stu1', 'bca'),
    (2, 'stu2', 'bca'),
    (3, 'stu3', 'bca'),
    (4, 'stu4', 'bca')
;

INSERT INTO marks (student_id, subject, mark)
VALUES
       (1, 'MATHS', 98),
       (1, 'SQL', 99),
       (1, 'JAVA', 80)
;

INSERT INTO marks (id, student_id, subject, mark)
VALUES
       (1, 1, 'MATHS', 98),
       (2, 1, 'SQL', 99),
       (3, 1, 'JAVA', 80),
       (4, 2, 'MATHS', 98),
       (5, 2, 'SQL', 99),
       (6, 2, 'JAVA', 80),
       (7, 3, 'MATHS', 98),
       (8, 3, 'SQL', 99),
       (9, 3, 'JAVA', 80),
       (10, 4, 'MATHS', 98),
       (11, 4, 'SQL', 99),
       (12, 4, 'JAVA', 80)
;






