1)
SELECT r.region_name, COUNT (*)
FROM employees e
	JOIN departments d ON (e.department_id = d.department_id)
	JOIN locations l ON (d.location_id = l.location_id)
	JOIN countries c ON (l.country_id = c.country_id)
	JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name;
--было супер сложно но меня спас сололерн
2)
SELECT e.first_name, e.last_name, d.department_name, j.job_title, l.street_address, c.country_name, r.region_name
FROM employees e
	JOIN departments d ON (e.department_id = d.department_id)
	JOIN locations l ON (d.location_id = l.location_id)
	JOIN countries c ON (l.country_id = c.country_id)
	JOIN regions r ON (c.region_id = r.region_id)
	JOIN jobs j ON (e.job_id = j.job_id);
3)
SELECT e.manager_id, COUNT (*)
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
GROUP BY e.manager_id
HAVING COUNT (*) > 3;
-- тут я сделал больше 3, тк больше 6 всего 1 менеджер, вообще в мс sql всего 40 сотрудников, а в оракле около 120
4)
SELECT * FROM employees
WHERE manager_id IS NULL;
5)
--в мс sql нет таблицы jobs_history, только 
6)
SELECT e.first_name, e.last_name, r.region_name
FROM employees e
	JOIN departments d ON (e.department_id = d.department_id)
	JOIN locations l ON (d.location_id = l.location_id)
	JOIN countries c ON (l.country_id = c.country_id)
	JOIN regions r ON (c.region_id = r.region_id)
WHERE r.region_id = 1;

7)
SELECT d.department_name, COUNT(e.first_name)
FROM employees e
	JOIN departments d ON (e.department_id = d.department_id)
GROUP BY d.department_name
HAVING COUNT(e.first_name) > 5; 
-- норм тут макс сотрудников 7 
8)
--все сотрудники состоят в департаметах, нет того кто не состоит 
9)
--во всех департаметах есть сотрудники, ну а так вот
SELECT d.department_name
  FROM employees  e
       JOIN departments d ON (e.department_id = d.department_id)
 WHERE d.department_id IS NULL;
10)
--попробовал так и по разному, но ничего не вывело, мб подскажешь что тут не так
SELECT e.*
FROM employees e
	JOIN dependents d ON (e.employee_id = d.employee_id)
WHERE e.employee_id != d.employee_id 
11)
SELECT CONCAT(e.first_name, ' | ' ,j.job_title, ' | ',d.department_name) 'полное инфо'
FROM employees e
	 JOIN jobs j ON (e.job_id = j.job_id)
	 JOIN departments d ON (e.department_id = d.department_id)
12)
--честно не понял как это делать, я не нашел столбца где указана когда устроились менеджеры 
13)
-- у меня тут тоже ничего не вывело, хотя по мне все правильно 
SELECT e.* 
FROM employees e 
	JOIN jobs j ON (e.job_id = j.job_id)
WHERE FORMAT(e.hire_date, 'mm') = 01 AND LEN(j.job_title) > 15
