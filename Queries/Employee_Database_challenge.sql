-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM employees

CREATE TABLE titles(
   emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
   from_date DATE NOT NULL,
   to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
   PRIMARY KEY (emp_no, title, from_date)
);

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles


-- Create a new table using the INTO clause.
SELECT employees.emp_no,
  employees.first_name,
  employees.last_name,
  employees.birth_date,
  employees.hire_date,
  titles.title,
  titles.from_date,
  titles.to_date
INTO retirement_info
FROM employees
  INNER JOIN titles
    ON (employees.emp_no = titles.emp_no)

-- Retirement eligibility
SELECT emp_no, first_name, last_name, title, from_date, to_Date
INTO retirement_titles
FROM retirement_info
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY emp_no;

SELECT emp_no, first_name, last_name, title
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles