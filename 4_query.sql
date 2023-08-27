-- Inner joins

select * from orders inner join customers ON orders.customer_id = customers.customer_id;

select order_id, first_name, last_name from orders inner join customers ON orders.customer_id = customers.customer_id;

select order_id, first_name, last_name, customer_id from orders inner join customers ON orders.customer_id = customers.customer_id;

select order_id, first_name, last_name, orders.customer_id from orders inner join customers ON orders.customer_id = customers.customer_id;

select order_id, first_name, last_name, o.customer_id from orders o inner join customers c ON o.customer_id = c.customer_id;

select * from order_items oi join products p ON oi.product_id = products.product_id;

select * from order_items oi join products p ON oi.product_id = p.product_id;

select order_id, oi.product_id, quantity,oi.unit_price from order_items oi join products p ON oi.product_id = p.product_id;


-- Joining across databases
select * from order_items oi join sql_inventory.products p on oi.product_id = p.product_id;
select * from order_items oi join sql_inventory.products p on oi.product_id = p.product_id;

use sql_inventory;
select * from order_items oi join sql_inventory.products p on oi.product_id = p.product_id;
select * from  sql_store.order_items oi join sql_inventory.products p on oi.product_id = p.product_id;
select * from  sql_store.order_items oi join products p on oi.product_id = p.product_id;