#1. For the following questions, use the table:

STUDENTS table with columns: 
student_code, first_name, last_name, email, phone_no, date_of_birth, honors_subject, grade

a. Provide a SQL query that would display all the students where the second letter in their first name is "i". 
b. Provide a query that gives the number of students in each subject. 
c. Provide a query that displays the full name of students that have a grade A or grade B. 
d. Provide a query that counts the number of students in more than one honors subject and born after September 11, 2001. 
e. Provide a query that would display full name of students whose phone number begins with 615 or 629. 


2. Which of the following SQL queries will result in an error? 

a. SELECT dept_id, AVG(salary) FROM employees GROUP BY dept_id;
b. SELECT AVG(salary) FROM employees GROUP BY dept_id;
c. SELECT dept_id, COUNT(name) FROM employees;
d. SELECT dept_id, job_id, AVG(salary) FROM employees GROUP BY dept_id, job_id;

3. For the following questions, use the table:

HONORS table with columns: 
subject_code, subject_name, instructor_lname, instructor_fname, sex, salary, bdate

a. Provide a query that would display all instructors whose first name starts with an 'A'
b. Provide a query that would display the average salary of Math instructors and English instructors 
c. Provide a query that would display the total salary of male and female instructors born after 1950
d. Provide a query that displays the full name of instructors and their subject for instructors making over $50,000 salary and the incomes ordered from largest to smallest
e. Provide a query that will provide the average salary by male and female Math or English instructors

4. The OR operator displays a record if ANY conditions listed are true. The AND operator displays a record if ALL of the conditions listed are ____. 

5. How do you select all the records from a table named "Persons" where the "LastName" is alphabetically between (and including) "Harden" and "Peterson"?
a. SELECT * FROM Persons ORDER BY LastName DESC
b. SELECT * FROM Persons WHERE LastName BETWEEN 'Harden' AND 'Peterson'
c. SELECT LastName FROM Persons WHERE LastName BETWEEN 'Harden' AND 'PETERSON'
d. SELECT * FROM Persons WHERE LastName > 'Harden'

6. What does the IN SQL operator do? 

7. The LIKE SQL operator is used with

8. or the following questions, use the table:

EMPLOYEE table, with columns: 
Fname, Lname, sex, salary, company name

a. Provide the query that will display the full names of employees that do not work at Amazon
b. Provide the query that will display the full names of employees with salaries between $80k and $100k
c. Provide the query that will display the total salary and company name for employees that worked at either Facebook or Amazon

9. What is the difference between ‘%’ and ‘_’ wildcards?

10. What is BETWEEN used for?

11. What IN used for?

12. Which SQL statement is used to delete data from a database?

13. Which SQL statement is used to insert new data in a database?

14. Select all the records, where the value of the column "FName" starts with an "a"?

15. Select all the records where the "FName" is "John" and the "LName" is "Smith”?

16. Find the supervisors’ names and number of employees they have

17. Update James Borg's supervisor info to ‘123456789’

18. What Department pays the highest average salary to women? 

19. Insert a new project:
Name: MyTechBestFriend
Project Number: 100
Location: Houston
Department: 1

20. Update MyTechBestFriend department to 5

21. Retrieve the name and address of all employees who work for the
‘Research’ department

22. For every project located in ‘Stafford’, list the project number, the
controlling department number, and the department manager’s last name,
address, and birth date.

SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum=Dnumber AND Mgr_ssn=Ssn AND
Plocation=‘Stafford’;


23. Make a list of all project numbers for projects that involve an
employee whose last name is ‘Smith’, either as a worker or as a manager of the
department that controls the project.

(SELECT DISTINCT Pnumber
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum=Dnumber AND Mgr_ssn=Ssn
AND Lname=‘Smith’ )
UNION
( SELECT DISTINCT Pnumber
FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE Pnumber=Pno AND Essn=Ssn
AND Lname=‘Smith’ );

24. Retrieve all employees whose address is in Houston, Texas.

SELECT Fname, Lname
FROM EMPLOYEE
WHERE Address LIKE ‘%Houston,TX%’;
25. Find all employees who were born during the 1950s.

SELECT Fname, Lname
FROM EMPLOYEE
WHERE Bdate LIKE ‘_ _ 5 _ _ _ _ _ _ _’;

26. Show the resulting salaries if every employee working on the
‘ProductX’ project is given a 10 percent raise.

SELECT E.Fname, E.Lname, 1.1 * E.Salary AS Increased_sal
FROM EMPLOYEE AS E, WORKS_ON AS W, PROJECT AS P
WHERE E.Ssn=W.Essn AND W.Pno=P.Pnumber AND
P.Pname=‘ProductX’;

27. Retrieve all employees in department 5 whose salary is between $30,000 and $40,000.
SELECT *
FROM EMPLOYEE
WHERE (Salary BETWEEN 30000 AND 40000) AND Dno = 5;

