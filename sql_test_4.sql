1)
SELECT	MIN(salary)'min_salary',
		MAX(salary)'max_salary',
		MIN(hire_date)'min_hire_date',
		MAX(hire_date)'max_hire_date', COUNT(*)'кол-во сотрудников'
FROM employees
GROUP BY (department_id)
ORDER BY COUNT(*) DESC;
2)
SELECT SUBSTRING (first_name, 1, 1), COUNT (*)
FROM employees
GROUP BY SUBSTRING (first_name, 1, 1)
HAVING COUNT (*) > 1
ORDER BY COUNT(*) DESC;
// сперва я проьовал сделать так но не полуичлось
SELECT COUNT(SUBSTRING(first_name, 1, 1)) AS 'кол-во од. первых юукв'
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 1 
ORDER BY COUNT(first_name);
//
3)
SELECT salary, department_id, COUNT(*)'кол-во'
FROM employees
GROUP BY salary, department_id
HAVING COUNT(*)>1
4)
SELECT FORMAT(hire_date, 'dd'), COUNT(*)
FROM employees
GROUP BY FORMAT(hire_date, 'dd')
ORDER BY COUNT(*) DESC;
5)
SELECT FORMAT(hire_date, 'yy'), COUNT(*)
FROM employees
GROUP BY FORMAT(hire_date, 'yy')
ORDER BY COUNT(*) DESC;
6)
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;
7)
--тк тут в деп_ид максимум 7 сотрудников, я для видимости сделал в которых больше 5, нежели 30
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;
8)
SELECT department_id, ROUND(AVG(salary),0)'средняя зп'
FROM employees
GROUP BY department_id
ORDER BY ROUND(AVG(salary),0) DESC;
9)
SELECT region_id
FROM countries
GROUP BY region_id
HAVING SUM(LEN(country_name)) > 40;
--тут так же я сделал больше 40, а не 60, потамучто такой регион всего 1, чисто для видимости сделал
10)
SELECT department_id, COUNT(job_id) 'кол-во професий'
FROM employees
GROUP BY department_id
HAVING COUNT(job_id)>1
ORDER BY COUNT(job_id) DESC;
11)
SELECT manager_id, COUNT(*)'кол-во подчиненных'
FROM employees
GROUP BY manager_id
HAVING COUNT(*)>5 AND SUM(salary)>50000;
12)
SELECT manager_id, AVG(salary)'средняя зп', COUNT(*)'кол-во подчиненных'
FROM employees
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;
-- в мс скюл нет столбца commission_pct
13)
SELECT job_id, MAX(salary)'max_salary'
FROM employees
WHERE job_id IN (13,17,18)
GROUP BY job_id;
--в мс столбес джоб ид цифры вместо наименований работы, 
--те там только айди, на проффесию которая находится в ТАБЛИЦЕ джобс
--так что я узнал в таблице джобс, айди работы которые заканчивабться на клерк
14)
SELECT MAX(avgsalary)
FROM employees, 
	(SELECT department_id, AVG(salary) AS avgsalary
	FROM employees
	GROUP BY department_id)AS maxsalary;
-- мне кажется тут не правльно получилось, сделал как сделал
-- просто в мс оказывается не работает MAX(AVG())
15)
SELECT LEN (first_name)'длина имени', COUNT (*)'колво сотрудников'
FROM employees
GROUP BY LEN (first_name)
HAVING LEN (first_name) > 4 AND COUNT (*) > 5
ORDER BY LEN (first_name);
--тут я поставил колво сотрудников 5, потамучто максимум тут с одинаковым длиной имени всего 13, а 2 месте 7
--а длину имени 4, потому что максимум 7, а на втором месте 5
