---Calculate the net change in the number of products launched by companies in 2020 compared to 2019. Your output should include the company names and the net difference.
--Net difference = Number of products launched in 2020 - The number launched in 2019.

WITH brand_2020 AS (SELECT company_name, 
COUNT(product_name) AS products 
FROM car_launches 
WHERE year = '2020'
GROUP BY company_name), 
brand_2019 AS ( SELECT company_name, 
COUNT(product_name) AS products_ 
FROM car_launches 
WHERE year = '2019'
GROUP BY company_name)
SELECT brand_2020.company_name, products-products_ AS net_products
FROM brand_2020 JOIN brand_2019
ON brand_2020.company_name = brand_2019.company_name




--Count the total number of violations that occurred at 
--'Roxanne Cafe' for each year,based on the inspection date. 
--Output the year and the corresponding number of violations 
--in ascending order of the year.
SELECT DATE_PART('year', inspection_date) AS violation_year, 
COUNT(violation_id) AS no_of_violations
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY violation_year
ORDER BY violation_year


----Compare each employee's salary with the average salary of the corresponding
----department.Output the department, first name, and salary of employees along 
----with the average salary of that department.
WITH dept_avg AS ( SELECT department, AVG(salary) AS avg_salary 
FROM employee 
GROUP BY department)
SELECT e.department, 
e.first_name,
e.salary,
d.avg_salary
FROM employee e 
JOIN dept_avg d ON e.department = d.department
order by  e.department


