-- Step 1: Create the Database (if not already created)
CREATE DATABASE WorkerDatabase;

-- Step 2: Use the Database
USE WorkerDatabase;

-- Step 3: Create the Workers Table
CREATE TABLE Workers (
    WorkerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Department VARCHAR(50)
);

-- Step 4: Insert Sample Data into Workers Table
INSERT INTO Workers (FirstName, LastName, DateOfBirth, Position, Salary, HireDate, Department) VALUES
('Amit', 'Sharma', '1985-01-15', 'Software Engineer', 75000.00, '2010-06-01', 'Engineering'),
('Priya', 'Singh', '1990-02-20', 'Project Manager', 85000.00, '2012-09-15', 'Management'),
('Neha', 'Patel', '1988-03-30', 'HR Specialist', 60000.00, '2015-03-22', 'Human Resources'),
('Rohit', 'Verma', '1975-04-10', 'Senior Developer', 95000.00, '2008-11-11', 'Engineering'),
('Sneha', 'Reddy', '1983-05-25', 'Data Analyst', 70000.00, '2016-05-30', 'Data Science'),
('Vikram', 'Nair', '1992-06-14', 'Marketing Manager', 78000.00, '2014-02-18', 'Marketing'),
('Anjali', 'Kumar', '1987-07-19', 'Sales Executive', 67000.00, '2017-10-05', 'Sales'),
('Rajesh', 'Gupta', '1981-08-05', 'Chief Financial Officer', 120000.00, '2005-08-20', 'Finance');

-- Step 5: Create the Projects Table
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    WorkerID INT,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (WorkerID) REFERENCES Workers(WorkerID)
);

-- Step 6: Insert Sample Data into Projects Table
INSERT INTO Projects (WorkerID, ProjectName, StartDate, EndDate) VALUES
(1, 'Website Redesign', '2023-01-01', '2023-06-30'),
(2, 'Mobile App Development', '2023-02-15', '2023-08-15'),
(3, 'Employee Onboarding', '2023-03-01', '2023-05-31'),
(4, 'Backend Migration', '2023-04-01', '2023-09-30'),
(5, 'Data Analysis Project', '2023-05-01', '2023-10-31');

SELECT * FROM Workers;
SELECT * FROM dbms_example;
SELECT * FROM Projects;

SELECT * FROM Workers WHERE Department = 'Engineering';

SELECT * FROM Workers
WHERE FirstName LIKE '%a%'
   AND FirstName LIKE '%n%'
   AND FirstName LIKE '%i%';
   
select * from Workers ORDER BY WorkerID DESC,Salary ASC;

SELECT * from Workers ORDER BY Salary DESC;

SELECT DISTINCT Department from Workers;

SELECT COUNT(*) FROM Workers;

SELECT Department , COUNT(Department) FROM Workers GROUP BY Department;

SELECT AVG(Salary) FROM Workers WHERE Salary>'95000';

SELECT Department , AVG(Salary) FROM Workers GROUP BY Department;

SELECT Department , MIN(Salary) FROM Workers GROUP BY Department;

SELECT Department , MAX(Salary) FROM Workers GROUP BY Department;

SELECT Department , COUNT(Department) FROM Workers GROUP BY Department HAVING COUNT(Department)>=2;

SELECT SUM(Salary)  FROM dbms_example;

SELECT AVG(Salary)  FROM dbms_example;

SELECT MIN(Salary)  FROM dbms_example;

SELECT MAX(Salary)  FROM dbms_example;

SELECT COUNT(*) FROM dbms_example;

SELECT AVG(age) FROM dbms_example;

SELECT SUM(Salary)  FROM dbms_example;

SELECT COUNT(*)  FROM dbms_example WHERE Salary>50000 ;

SELECT SUM(salary) FROM dbms_example WHERE age < 30;

SELECT COUNT(age) FROM dbms_example WHERE age BETWEEN 30 AND 40;

SELECT SUM(salary) FROM dbms_example WHERE name = 'Allison Alexander';

SELECT COUNT(DISTINCT name) FROM dbms_example;

SELECT AVG(Salary) FROM dbms_example WHERE name LIKE '%Doe%';

SELECT MAX(salary) AS second_highest_salary FROM dbms_example WHERE salary < (SELECT MAX(salary) FROM dbms_example);

SELECT * FROM dbms_example;

SELECT age , COUNT(*) FROM dbms_example GROUP BY AGE order by AGE ASC;

SELECT age , AVG(Salary) FROM dbms_example GROUP BY AGE order by AGE ASC;

SELECT age , AVG(Salary) FROM dbms_example WHERE Age>=30 AND AGE<40 GROUP BY AGE order by AGE ASC;

SELECT * FROM dbms_example LIMIT 5;

SELECT * FROM dbms_example ORDER BY salary DESC LIMIT 1 OFFSET 2;

SELECT NAME FROM dbms_example ORDER BY name asc LIMIT 10 OFFSET 10;

SET SQL_SAFE_UPDATES=0;

UPDATE Workers set name='Amit',Salary=75000.00 where id=1;

DELETE FROM Workers Where ProjectID= 1;

SELECT Age from dbms_example union all SELECT Age from dbms_example;

CREATE TABLE student(
Student_ID INT,
Student_Name VARCHAR(40),
Course_ID INT
);

CREATE TABLE Course(
 Course_ID INT,
Course_Name VARCHAR(40)
);

INSERT INTO student (Student_ID,Student_Name,Course_ID) VALUES 
(1,"John", 101),
(2,"Alice", 102),
(3,"Bob", 103),
(4,"Carol", 101);

INSERT INTO Course (Course_ID,Course_Name) VALUES 
(101,"CSE"),
(102,"Physics"),
(104,"Electrical");

SELECT * FROM student;
SELECT * FROM Course;

SELECT Student_Name, Course_Name FROM student INNER JOIN Course ON Student.Course_ID = Course.Course_ID;

SELECT Student_Name, Course_Name FROM student LEFT JOIN Course ON Student.Course_ID = Course.Course_ID;

