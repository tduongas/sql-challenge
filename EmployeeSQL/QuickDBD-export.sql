-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(32)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Department_Employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(32)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(24)   NOT NULL,
    "last_name" VARCHAR(24)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "Employee_Salaries_Junction" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL
);

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee_Salaries_Junction" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee_Salaries_Junction" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee_Salaries_Junction" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_title_id" FOREIGN KEY("title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Employee_Salaries_Junction" ADD CONSTRAINT "fk_Employee_Salaries_Junction_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

