--Titles Table
	DROP TABLE IF EXISTS titles;
	CREATE TABLE titles (
	    title_id VARCHAR(10) PRIMARY KEY,
	    title VARCHAR(255) NOT NULL
	);

--Employees Table
	DROP TABLE IF EXISTS employees;
	CREATE TABLE employees (
	    emp_no INT PRIMARY KEY,
		emp_title_id VARCHAR(10),
		birth_date date NOT NULL,
		first_name VARCHAR(255) NOT NULL,
	    last_name VARCHAR(255) NOT NULL,
	    sex VARCHAR(1) NOT NULL,
	    hire_date date NOT NULL,
	    CONSTRAINT fk_emp_title FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);

--Departments Table
	DROP TABLE IF EXISTS departments;
	CREATE TABLE departments (
	    dept_no VARCHAR(10) PRIMARY KEY,
	    dept_name VARCHAR(255) NOT NULL
	);

--Department Managers Table (dept_manager)
	DROP TABLE IF EXISTS dept_manager;
	CREATE TABLE dept_manager (
	    dept_no VARCHAR(10),
	    emp_no INT,
	    PRIMARY KEY (dept_no, emp_no),
	    CONSTRAINT fk_dept_manager_dept FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	    CONSTRAINT fk_dept_manager_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

--Department Employees Table (dept_emp)
	DROP TABLE IF EXISTS dept_emp;
	CREATE TABLE dept_emp (
	    emp_no INT,
	    dept_no VARCHAR(10),
	    PRIMARY KEY (emp_no, dept_no),
	    CONSTRAINT fk_dept_emp_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	    CONSTRAINT fk_dept_emp_dept FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

--Salaries Table
	DROP TABLE IF EXISTS salaries;
	CREATE TABLE salaries (
	    emp_no INT PRIMARY KEY,
	    salary INT NOT NULL,
	    CONSTRAINT fk_salaries_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);


-- to view the tables data
select * from titles
select * from employees
select * from departments
select * from dept_manager
select * from dept_emp
select * from salaries


	