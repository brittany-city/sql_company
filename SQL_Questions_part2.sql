#11.Provide the name of projects in either Department number 4 or 5
SELECT pname, dnum
FROM project 
WHERE dnum IN (4,5);

SELECT pname, dnum
FROM project 
WHERE dnum = 4 OR dnum=5;

#12. Provide the names of employees with either a son or wife dependent
SELECT employee.Fname, employee.Lname, dependent.relationship, dependent.sex
FROM employee
INNER JOIN dependent #only matches what is in common in both tables
ON ssn=essn
WHERE (dependent.relationship='Spouse' AND dependent.sex='F') OR dependent.relationship='Son';

#13. Provide the names of employees with salary between $5k and $30k
Select Fname, Lname, Salary
FROM employee
WHERE salary BETWEEN 5000 AND 30000;

Select Fname AS first_name, Lname, Salary
FROM employee
WHERE salary>5000 AND salary<30000;

#14. Provide the names of employees that worked between 30 and 40 hours
SELECT employee.Fname, employee.Lname, SUM(works_on.hours) AS total_hours
FROM employee
RIGHT JOIN works_on
ON employee.ssn=works_on.essn
GROUP BY employee.Fname, employee.Lname
HAVING SUM(works_on.hours) BETWEEN 30 AND 40;

SELECT employee.Fname, employee.Lname, SUM(works_on.hours) AS total_hours
FROM employee
RIGHT JOIN works_on
ON employee.ssn=works_on.essn
GROUP BY employee.Fname, employee.Lname
HAVING SUM(works_on.hours)>30 AND SUM(works_on.hours)<40;

#15.	Provide the department name and project name for projects in Houston, Sugarland, or Stafford
SELECT department.dname, project.pname, plocation
FROM department
INNER JOIN project
ON department.dnumber=project.dnum
WHERE plocation='Houston' OR plocation='Sugarland' OR plocation='Stafford';

#projects NOT in Houston, Sugarland, Stafford
SELECT department.dname, project.pname, plocation
FROM department
INNER JOIN project
ON department.dnumber=project.dnum
WHERE NOT plocation IN ('Houston','Sugarland','Stafford');

#16.Provide employees with A in First Name
SELECT Fname,Lname
FROM employee
WHERE Fname LIKE '%a%';  #percent(%) wildcard represents zero, one, or infinite characters

#17.Provide employees with Last Name that does not begin with W
SELECT Fname, Lname
FROM employee
WHERE Lname NOT LIKE 'W%'; 

SELECT Fname, Lname
FROM employee
WHERE Lname NOT LIKE 'W_'; #doesnt remove Wong or Wallace because it only filters for 2 letters

#18.	Provide employees with ‘a’ as the second letter
SELECT Fname, Lname
FROM employee
WHERE Fname LIKE '_a%';

SELECT Fname, Lname
FROM employee
WHERE Lname LIKE '_a%';

#19.What is the average hours worked for employees in the Research department?
SELECT department.dname,AVG(works_on.hours)
FROM works_on #table1
INNER JOIN project #table2
ON works_on.pno=project.pnumber #table1.column=table2.column
INNER JOIN department #table3
ON project.dnum=department.dnumber #table2.column=table3.column
WHERE department.dname='Research'
GROUP BY department.dname;

SELECT *
FROM works_on;

#20. What is the total salary for employees that worked on either Product Z or X?
SELECT SUM(employee.salary), project.pname
FROM employee
INNER JOIN project
ON employee.Dno=project.dnum
WHERE project.pname IN ('ProductZ', 'ProductX')
GROUP BY project.pname;

#21.	Name of employees who first name start with A and order last name alphabetically
SELECT Fname, Lname
FROM employee
WHERE Fname LIKE 'A%'
ORDER BY Lname; #by default A-Z

#22. Name of employees in Department number 5 and salary ordered largest to smallest
SELECT Fname, Lname, Dno, Salary
FROM employee
WHERE Dno=5
ORDER BY Salary DESC;

#23. Sort employee birthdates from oldest to newest and then sort first names in alphabetical order
SELECT bdate, Fname
FROM employee
ORDER BY bdate DESC, Fname;

#24. Sort employee salaries by largest to smallest and employee last names alphabetically
SELECT salary, Lname
FROM employee
ORDER BY salary DESC, Lname;

#25. How many male and female employees are there?
SELECT sex, COUNT(Sex) AS total #count all rows in the sex column
FROM employee
GROUP BY sex;

SELECT sex, COUNT(*) #count all rows and all columns 
FROM employee
GROUP BY sex; #same answer 

#26. How many male and female dependents are there?
SELECT sex, COUNT(Sex) AS total #count all rows in the sex column
FROM dependent
GROUP BY sex;

#27. How many projects are there for each location?
SELECT plocation, COUNT(plocation)
FROM project
GROUP BY plocation;

#28.Identify the number of projects in each location and order by most to least projects
SELECT plocation, COUNT(plocation)
FROM project
GROUP BY plocation
ORDER BY COUNT(plocation) DESC;

#29.Identify the number of male and female employees and order from most to least
SELECT sex, COUNT(Sex) AS total #count all rows in the sex column
FROM employee
GROUP BY sex
ORDER BY COUNT(sex) DESC; 

#30.How many male and female spouses are there?
SELECT sex, COUNT(Sex) AS total #count all rows in the sex column
FROM dependent
WHERE relationship='Spouse'
GROUP BY sex;

#31.What departments pay over $50,000 to employees?
SELECT dname, SUM(salary)
FROM department
INNER JOIN employee
ON department.dnumber=employee.Dno
GROUP BY dname
HAVING SUM(salary) > 50000;

#32. Provide the employee SSN and number of dependents for employees with more than 1 dependent
SELECT essn, COUNT(dependent_name)
FROM dependent
GROUP BY essn
HAVING COUNT(dependent_name) > 1;

#33.Provide the project locations with more than 1 project
SELECT plocation, COUNT(pname)
FROM project
GROUP BY plocation
HAVING COUNT(pname) > 1;

#34.Get the name, birthdate, sex, and salary for each employee.
SELECT Fname, Lname, bdate, sex, salary
FROM employee;

#a.	Modify query to get only employees born after 1960.
SELECT Fname, Lname, bdate, sex, salary
FROM employee
WHERE bdate > '1960-12-31';

#b.	Modify query to group by sex for those born after 1960 (remove name and salary)
SELECT COUNT(bdate), sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex;

#c.	Modify query to get the average salary for men and women employees born after 1960
SELECT AVG(salary), sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex;

#d.	Modify query to get the average salary for men and women employees born after 1960 and with an average over $15,000 ranke
SELECT AVG(salary), sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex
HAVING AVG(salary) > 15000
ORDER BY AVG(salary);
