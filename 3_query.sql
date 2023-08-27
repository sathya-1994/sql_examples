select * from customers where phone is Null ;
select * from customers where phone is NOT Null ;

select * from  sql_store.orders where shipped_date is not null;

select * from customers order by first_name;

select * from customers order by state,first_name;

select * from customers order by state DESC,first_name DESC;

-- Valid in My sql ; In few other data bases we cannot sort the column which are not there in select statement
select first_name ,last_name from customers order by birth_date;

-- sort by alias
select first_name ,last_name, 10 AS points from customers order by points,birth_date;
select first_name ,last_name, 10 AS points from customers order by 2,1;

select * from order_items where order_id=2 order by product_id, unit_price desc;
select * , quantity * unit_price as total_price from order_items where order_id=2 order by total_price desc;

-- Limit clause
select * from customers LIMIT 3;

select * from customers LIMIT 6,3;

-- Get the top three loyal customers(limit always at end)
select * from customers order by points DESC Limit 3;



