1)
--пробовал 2 варианта и ничего не получилось
SELECT first_name
FROM employees
WHERE LEN(first_name) = (SELECT MAX(LEN(first_name) FROM employess);
--и
SELECT first_name
FROM employees
WHERE LEN(first_name) = MAX(LEN(first_name));
--но если написать SELECT MAX(LEN(first_name)) FROM employees
-- то выведет 11, ак что если написать так  
SELECT first_name
FROM employees
WHERE LEN(first_name) = 11
--то вывод получается правильным, но решение нет
2)
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
3)
-- не получилось сделать, пытался сделать таким оброзом, но не получилось
SELECT city 
FROM employees 
	JOIN departments ON (employees.department_id = departments.department_id)
    JOIN locations ON (departments.location_id = locations.location_id)
GROUP BY city
HAVING SUM (salary) =
         (SELECT MIN(SUM(salary))
FROM employees 
	JOIN departments ON (employees.department_id = departments.department_id)
    JOIN locations ON (departments.location_id = locations.location_id)
    GROUP BY city);
--ошибка выводит что это в этом SELECT MIN(SUM(salary)), но если в этом, то я не понимаю как решить 
4)
-- в никакой таблице не нашел зарплату менеджера, проверил все
5)
--во всех департаметах есть сотрудники, ну а так вот
SELECT d.department_name
FROM employees  e
JOIN departments d ON (e.department_id = d.department_id)
WHERE d.department_id IS NULL;
-- вывод только назывние колумны
6)
-- как я понял тут нужно вывести у которых менеджер ид равна нулю, так что вот 
SELECT *
FROM employees
WHERE manager_id IS NULL;
7)
SELECT d.department_name, COUNT(e.first_name)
FROM employees e
	JOIN departments d ON (e.department_id = d.department_id)
GROUP BY d.department_name
HAVING COUNT(e.first_name) > 6; 
8)
SELECT * FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
WHERE d.department_name = 'IT';
9)
SELECT CONCAT(e.first_name, ' | ' ,j.job_title, ' | ',d.department_name) 'полное инфо'
FROM employees e
	 JOIN jobs j ON (e.job_id = j.job_id)
	 JOIN departments d ON (e.department_id = d.department_id)
10)
-- в мс нет ни того когда менеджер устройлся на работу, ни того сколько у него зп, в оракле мб есть, но тут нет
11) 
-- у меня тут тоже ничего не вывело, хотя по мне все правильно 
SELECT e.* 
FROM employees e 
	JOIN jobs j ON (e.job_id = j.job_id)
WHERE FORMAT(e.hire_date, 'mm') = 01 AND LEN(j.job_title) > 15