DROP TABLE retirement_info

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
INTO retirement_titles
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_titles;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
INTO retirement_titles
FROM titles

-- Joining retirement_titles and titles tables
SELECT retirement_titles.emp_no,
    retirement_titles.first_name,
retirement_titles.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
FROM retirement_titles
LEFT JOIN titles
ON retirement_titles.emp_no = titles.emp_no;

SELECT * FROM titles

CREATE TABLE titles(
    emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

DROP TABLE titles

CREATE TABLE titles(
   emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
   from_date DATE NOT NULL,
   to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
   PRIMARY KEY (emp_no, title, from_date)
);

DROP TABLE retirement_info

SELECT * FROM retirement_titles

SELECT * FROM titles

--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
SELECT emp_no, first_name, last_name, title
INTO retirement_titles
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;