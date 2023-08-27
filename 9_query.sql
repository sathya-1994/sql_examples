-- Unions (Combine rows from multiple tables; Join is Combine columns from multiple tables)

select * from orders;
select * from orders where order_date >='2019-01-01';
select order_id, order_date, 'Active' as status from orders where order_date >='2019-01-01';

select order_id, order_date, 'Active' as status from orders where order_date <='2019-01-01';

select order_id, order_date, 'Active' as status from orders where order_date >='2019-01-01'
union
select order_id, order_date, 'Actived' as status from orders where order_date <='2019-01-01';

select first_name from  customers 
union
select name from shippers;

-- Number of columns returned by each query shoukd be same
select first_name , last_name from customers
union
select name from shippers;

-- Column name is based on first query 
select name from shippers 
union
select first_name from  customers ;

select name as NAME from shippers 
union
select first_name from  customers ;

select c.first_name, c.points, 'Bronze' as Type from customers c where c.points <2000
union
select c.first_name, c.points, 'Silver' as Type from customers c where c.points between 2000 and 3000
union
select c.first_name, c.points, 'Silver' as Type from customers c where c.points between 2000 and 3000
union
select c.first_name, c.points, 'Gold' as Type from customers c where c.points > 3000
order by first_name;