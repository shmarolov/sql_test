1)
SELECT * FROM employees
WHERE LENGTH(first_name)>10;
2)
SELECT * FROM employees
WHERE LOWER(first_name) LIKE('%b%'); 
3)
SELECT * FROM employees
WHERE first_name LIKE '%a%a%';
4)
SELECT * FROM employees
WHERE mod(salary,1000)=0;
5)
SELECT first_name, SUBSTRB(phone_number, 0, 3) FROM employees
WHERE LENGTH(phone_number) = 12;
6)

7)
SELECT SUBSTRB(first_name, 2, Length(first_name)-2) "irst_nam" FROM employees;
8)
SELECT * FROM employees
WHERE first_name LIKE '%m' AND LENGTH(first_name)>5;
9)
Таблицы dual не существует
10)
почему то DATEDIFF не работает на оракле
11)
Я пытался провернуть такой трюк, но не получилось
SELECT first_name, phone_number FROM employees
WHERE mod(SUBSTR(phone_number, 11, LENGTH(phone_number)-1), 2)=1;
12)
SELECT * FROM employees
WHERE LENGTH(job_id) >= 6 AND job_id NOT LIKE '%CLERK';
13)
SELECT first_name, REPLACE(phone_number, '.', '-') "Phone_number" 
FROM employees;