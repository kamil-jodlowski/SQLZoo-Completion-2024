# Module 8: USING NULL

## Query 1: List the teachers who have NULL for their department

```sql
SELECT name 
FROM teacher 
WHERE dept IS NULL;
This query retrieves the names of all teachers who do not have an assigned department.

Query 2: Note the INNER JOIN misses the teachers with no department and the departments with no teacher

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept = dept.id);
This query retrieves the names of teachers and their corresponding departments using an INNER JOIN, which excludes teachers without a department and departments without a teacher.

Query 3: Use a different JOIN so that all teachers are listed

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept = dept.id);
This query lists all teachers along with their departments using a LEFT JOIN, ensuring that all teachers are included even if they don't have a department.

Query 4: Use a different JOIN so that all departments are listed

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept = dept.id);
This query lists all departments along with their teachers using a RIGHT JOIN, ensuring that all departments are included even if they don't have any teachers.

Query 5: Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;
This query retrieves the names of teachers along with their mobile numbers, using '07986 444 2266' if no mobile number is provided.

Query 6: Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;
This query lists all teachers and their corresponding departments using a LEFT JOIN, displaying 'None' for teachers without a department.

Query 7: Use COUNT to show the number of teachers and the number of mobile phones

SELECT COUNT(name), COUNT(mobile)
FROM teacher;
This query counts the total number of teachers and the number of teachers with mobile phones.

Query 8: Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed

SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;
This query lists each department and the number of staff in each department, using a RIGHT JOIN to ensure that all departments, including Engineering, are listed.

Query 9: Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise

SELECT name, 
       CASE 
           WHEN dept = 1 OR dept = 2 THEN 'Sci'
           ELSE 'Art'
       END
FROM teacher;
This query lists the names of teachers followed by 'Sci' if the teacher is in department 1 or 2, and 'Art' otherwise.

Query 10: Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise

SELECT name, 
       CASE 
           WHEN dept = 1 OR dept = 2 THEN 'Sci'
           WHEN dept = 3 THEN 'Art'
           ELSE 'None'
       END
FROM teacher;
This query lists the names of teachers followed by 'Sci' if the teacher is in department 1 or 2, 'Art' if the teacher is in department 3, and 'None' otherwise.


### Summary
1. **Query 1-10** retrieves various information from the `teacher` and `dept` datasets, including details about teachers and departments, handling NULL values, and using different types of JOINs, the COALESCE function, and CASE statements. Each query provides insights into teacher and department-related data using SQL joins, aggregation functions, and conditional logic.
