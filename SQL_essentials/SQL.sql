-- Active: 1720566368068@@nnmm.postgres.database.azure.com@5432@postgres@public
-- Course: Advanced SQL
-- School: 365 Data Science
-- Teacher: 

-- CREATE DATABASE

-- CREATE SCHEMA

-- CREATE TABLE
create table employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);

select * from employees;

-- ALTER TEMPLATE
-- ALTER [object] [object_name] [command];
ALTER TABLE employees ADD COLUMN age INT;
-- We can drop a column
ALTER TABLE employees DROP COLUMN age;
-- We can also set a default value
ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'Reassigned';

INSERT INTO employees (id, first_name, last_name, email) 
VALUES (1, 'John', 'Doe', 'johndoe@example.com');

select * from employees e;

INSERT INTO employees (id, first_name, last_name, email) VALUES
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com');

-- UPDATE
UPDATE employees
	SET first_name = 'Jane',
		last_name = 'Doe',
		email = 'janedoe@example.com'
WHERE id = 2;

-- DELETE
delete from employees where id = 3;
delete from employees where id in (1, 4);

-- TRUNCATE
TRUNCATE TABLE employees;

-- INSERT
INSERT INTO employees (id, first_name, last_name, email) VALUES
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com');

CREATE TABLE tutorial.employees_two (
    id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tutorial.employees_two (id, first_name, last_name, email, hire_date, department)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', '2022-01-01', 'Sales'),
    (2, 'Jane', 'Doe', 'janedoe@example.com', '2022-01-02', 'Marketing'),
    (3, 'Bob', 'Smith', 'bobsmith@example.com', '2022-01-03', 'Human Resources'),
    (4, 'Alice', 'Jones', 'alicejones@example.com', '2022-01-04', 'Sales'),
    (6, 'Tom', 'Wilson', 'tomwilson@example.com', '2022-01-05', 'Marketing');


MERGE INTO tutorial.employees AS e
USING tutorial.employees_two AS e2
ON e.id = e2.id
WHEN MATCHED THEN
    UPDATE SET 
        first_name = e2.first_name,
        last_name = e2.last_name,
        email = e2.email,
        hire_date = e2.hire_date,
        department = e2.department
WHEN NOT MATCHED THEN
    INSERT (id, first_name, last_name, email, hire_date, department)
    VALUES (e2.id, e2.first_name, e2.last_name, e2.email, e2.hire_date, e2.department);

drop table tutorial.employees;
drop table tutorial.employees_two;
	