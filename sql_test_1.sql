1)
SELECT *
FROM employees;
2)
SELECT *
FROM employees
WHERE first_name = 'David';
3)
SELECT *
FROM employees
WHERE job_id = 'IT_PROG';
4)
SELECT * FROM employees
Where department_id = 50 AND salary > 4000;
5)
SELECT * FROM employees
WHERE department_id IN ('20','30');
6)
SELECT * FROM employees
WHERE first_name LIKE '%a';
7)
SELECT * FROM employees
WHERE department_id IN (50,80) AND commission_pct > 0;
8)
SELECT * FROM employees
WHERE first_name LIKE '%n%n%';
9)
SELECT * FROM employees
WHERE LENGTH(first_name)>4;
10)
SELECT * FROM employees
WHERE salary >= 8000 AND salary <= 9000;
11)
SELECT * FROM employees
WHERE first_name LIKE '%';
ИЛИ
SELECT * FROM employees
WHERE first_name LIKE '%%%';
12)
SELECT manager_id FROM employees
GROUP BY manager_id
ORDER BY manager_id;
13)
