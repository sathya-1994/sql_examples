-- Joining multiple tables

USE sql_store;

select * from orders o join customers c on o.customer_id = c.customer_id
join order_statuses os on o.status = os.order_status_id;

select o.order_id, o.order_date, c.first_name, c.last_name, os.name as status from orders o join customers c on o.customer_id = c.customer_id
join order_statuses os on o.status = os.order_status_id;

use sql_invoicing;
SELECT * FROM sql_invoicing.payments;

select p.date, p.invoice_id, p.amount, c.name, pm.name from sql_invoicing.payments p join sql_invoicing.clients c on p.client_id = c.client_id 
join sql_invoicing.payment_methods pm on p.payment_method = pm.payment_method_id ;