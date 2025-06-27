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