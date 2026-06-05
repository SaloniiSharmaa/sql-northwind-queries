USE northwind;

-- Q1: Who are our customers and where are they from?
SELECT first_name,last_name, city, country_region
from customers
order by first_name;

-- Q2: Which countries do our customers come from?
SELECT DISTINCT country_region
FROM customers;

-- Q3: Which products are discontinued?
--     (discontinued = 1 means the product is no longer sold)
select product_code,product_name,list_price 
from products
where discontinued = '1'; 

-- Q4: Which products are priced between $20 and $100?
select product_code,product_name,list_price
from products
where list_price between 20 and 100;

-- Q5: Which orders have NOT been shipped yet?
select customer_id,order_date,ship_address
from orders
where shipped_date is null;

-- Q6: Show the 5 most expensive products we sell.
select product_code,product_name,list_price
from products
order by list_price desc
limit 5;

-- Q7: Which customers have no email address on record?
SELECT 
    first_name, last_name
FROM
    customers
WHERE
    email_address IS NULL;
    
-- Q8: Find all products in the 'Beverages' or 'Sauces' category.
select product_code,product_name
from products
where category in ('Beverages','Sauces');
 
 -- Q9: Which employees are based in Seattle or Redmond?
 select *
 from employees
 where city in ('Seattle', 'Redmond');
 
 -- Q10: Show each order's shipping fee — display 'No fee' if it is NULL or zero.
select id as order_id,ship_name,ship_country_region,
coalesce(NULLIF(shipping_fee, 0), 0) as shipping_fee,
case when shipping_fee is null or shipping_fee = 0
then 'No fee'
else CONCAT('$', shipping_fee)
end as fee_display
from orders
order by shipping_fee desc;
