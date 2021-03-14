--Retrieve emp_no, first_name, last_name from eployees
SELECT * FROM title
SELECT emp_no, first_name, last_name 
FROM employees
--Retrieve title, from_date, to_date from title
SELECT title, from_date, to_date 
FROM title
--Join employees and title tables
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	title.title,
	title.from_date,
	title.to_date
--Create Retirement Titles table
INTO retirement_titles
FROM employees
LEFT JOIN title
ON employees.emp_no = title.emp_no
--Filter by birthday btween 1952-1955
WHERE(birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no

--Unique_Titles 
SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,title 
INTO unique_titles 
FROM retirement_titles 
ORDER BY emp_no, to_date DESC

--New table Retiring_titles
SELECT COUNT(emp_no) AS count, title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER By count DESC