1)
SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'dd')=01;
2)
SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'yy')=08;
3)
тут нужно использовать NEXT_DAY, но я не понимаю как
4)

5)
SELECT first_name, TO_CHAR(salary * 1.20) "увеличенное зп" FROM employees
6)
SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'yy')=07 AND TO_CHAR(hire_date, 'mm')=02;
7)
SELECT FORMAT (getdate(), 'yyyy.MM.dd hh:mm:ss') as date 
--это уже на ms sql 
8)
SELECT first_name, last_name, CONCAT('$', TO_CHAR(salary + salary * commission_pct)) "salary+pct" FROM employees
WHERE commission_pct > 0;
9)
SELECT first_name, last_name, salary,
CASE 
    WHEN commission_pct > 0 THEN 'YES'
    ELSE 'NO'
    END "commission_pct"
FROM employees;
10)
SELECT first_name, last_name, salary,
CASE 
    WHEN salary < 5000 THEN 'Low lvl'
    WHEN salary >= 5000 AND salary < 10000 THEN 'Normal lvl'
    WHEN salary >= 10000 THEN 'High lvl'
    ELSE 'ERROR'
    END "salary_lvl"
FROM employees;
11)
SELECT country_name,
CASE
    WHEN region_id = 1 THEN 'Europe'
    WHEN region_id = 2 THEN 'America'
    WHEN region_id = 3 THEN 'Asia'
    WHEN region_id = 4 THEN 'Africa'
    ELSE 'ERROR'
    END "Сontinent"
FROM Countries
ORDER BY region_id;
