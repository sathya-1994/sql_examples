-- Compound join conditions

use sql_store;

select * from order_items oi join order_item_notes oin on oi.order_id = oin.order_id and oi.product_id = oin.product_id;

-- Implicit join syntax
select * from orders o, customers ;
select * from orders o, customers c where o.customer_id = c.customer_id;

-- Outer join
select c.customer_id, c.first_name, o.order_id from customers c join orders o on c.customer_id = o.customer_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id from customers c right join orders o on c.customer_id = o.customer_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id from  orders o right join customers c on c.customer_id = o.customer_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id from  orders o right outer join customers c on c.customer_id = o.customer_id order by c.customer_id;

select p.product_id, p.name, oi.quantity from products p left join order_items oi on p.product_id =oi.product_id;


