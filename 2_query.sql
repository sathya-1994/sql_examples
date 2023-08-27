SELECT 
	first_name ,
	last_name,
	points, 
	(points+10) *10 AS 'DISCOUNT FACTOR'
FROM customers;

SELECT distinct state from customers; 

SELECT * from customers where points >3000;
-- > >= < <= = != <>(both not equal)
SELECT * from customers where state <> 'VA';

SELECT * from customers where birth_date > '1990-01-01' order by birth_date;

SELECT * from customers where birth_date > '1990-01-01' OR (points > 1000 AND state='VA') order by birth_date;

SELECT * from customers where (birth_date > '1990-01-01' OR points > 1000) AND state='VA' order by birth_date;

SELECT * from customers where NOT( birth_date > '1990-01-01' OR points > 1000) ;

SELECT * from customers where birth_date <= '1990-01-01' AND points <= 1000;

select * from customers where state = 'VA' OR state = 'GA';

select * from customers where state IN('VA','GA','FL');

select * from customers where state NOT IN('VA','GA','FL');

select * from customers where points >=1000 AND points<=3000;
select * from customers where points between 1000 AND 3000;

select * from customers where last_name LIKE 'b%';
select * from customers where last_name LIKE '%b%';
select * from customers where last_name LIKE '%y';
select * from customers where last_name LIKE '_____y';
select * from customers where last_name LIKE 'b____y';
-- % any number of characters
-- _ single character

select * from customers where last_name LIKE '%field%';
select * from customers where last_name regexp 'field';
select * from customers where last_name regexp 'field|mac|rose';
select * from customers where last_name regexp '^field|mac|rose';
select * from customers where last_name regexp 'field$|mac|rose';
select * from customers where last_name regexp 'e';
select * from customers where last_name regexp '[gim]e';
select * from customers where last_name regexp 'e[y]';
select * from customers where last_name regexp '[a-h]e';
-- ^ beginning of the string
-- $ end of the string
-- | logical or
-- [abcd] macth any single character listed in braket;
-- [a-f] range

SELECT name,unit_price, (unit_price*1.1) AS 'NEW PRICE' from products;
select * from orders where order_date >= '2019-01-01';
select * from order_items where order_id = 6 AND unit_price*quantity>30;
select * from products where quantity_in_stock IN (49,38,78);
select * from customers where birth_date between '1990-01-01' and '2000-01-01';

select * from customers where address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';
select * from customers where phone LIKE '%9';
select * from customers where phone NOT LIKE '%9';

select * from customers where first_name regexp 'ELKA|AMBUR';
select * from customers where last_name regexp 'EY$|ON$';
select * from customers where last_name regexp '^MY|SE';
select * from customers where last_name regexp 'B[RU]';
select * from customers where last_name regexp 'BR|BU';
