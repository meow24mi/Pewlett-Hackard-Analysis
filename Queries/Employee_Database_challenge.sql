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

--deliverable 2
--mentorship-elgibility employees 
DROP TABLE intermediate_mentorship;
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO intermediate_mentorship
FROM employees AS e JOIN dept_emp AS de
ON e.emp_no = de.emp_no JOIN title AS t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01');

SELECT DISTINCT ON (emp_no) emp_no,first_name,last_name,birth_date,from_date,to_date,title
INTO mentorship_eligibilty
FROM intermediate_mentorship
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;