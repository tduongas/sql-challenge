/*******************/
/** Data Analysis **/
/*******************/

/* Q1. */
SELECT * FROM "Employees" LIMIT 5; -- preview Employee records 

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM "Employees" emp, "Salaries" sal
WHERE emp.emp_no = sal.emp_no
LIMIT 5; -- limit to just displaying 5 records

/* Q2. */
SELECT first_name, last_name, hire_date, 
EXTRACT(YEAR FROM hire_date) as year
FROM "Employees" 
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

/* Q3. */
SELECT dept_m.dept_no, dept.dept_name, dept_m.emp_no, emp.last_name, emp.first_name
FROM "Department_Manager" dept_m, "Departments" dept, "Employees" emp
WHERE dept_m.dept_no = dept.dept_no
AND dept_m.emp_no = emp.emp_no
ORDER BY dept_no ASC;

/* Q4. */
SELECT dept_e.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM "Department_Employee" dept_e 
INNER JOIN "Departments" dept ON dept.dept_no = dept_e.dept_no 
INNER JOIN "Employees" emp ON emp.emp_no = dept_e.emp_no;

/* Q5. */
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/* Q6. */
SELECT dept_e.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM "Department_Employee" dept_e 
INNER JOIN "Departments" dept ON dept.dept_no = dept_e.dept_no 
INNER JOIN "Employees" emp ON emp.emp_no = dept_e.emp_no
WHERE dept.dept_no = 'd007';

/* Q7. */
SELECT dept_e.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM "Department_Employee" dept_e 
INNER JOIN "Departments" dept ON dept.dept_no = dept_e.dept_no 
INNER JOIN "Employees" emp ON emp.emp_no = dept_e.emp_no
WHERE dept.dept_no IN ('d005','d007');

/* Q8. */
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
