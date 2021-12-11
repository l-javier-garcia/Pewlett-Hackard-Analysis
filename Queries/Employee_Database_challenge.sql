-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_info;

-- Joining retirement_info and titles tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    title.title
	title.from_date
	title.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = titles.emp_no;