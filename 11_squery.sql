-- Creating a Copy of a table 
create table orders_archived_1 as 
select * from sql_store.orders;

insert into orders_archived_1
select * from orders where order_date <'2019-01-01';

use sql_invoicing;
select i.invoice_id , i.number, c.name as client, i.invoice_total, i.payment_total, i.payment_date, i.due_date from invoices i join clients c using(client_id);

select i.invoice_id , i.number, c.name as client, i.invoice_total, i.payment_total, i.payment_date, i.due_date from invoices i join clients c using(client_id)
where payment_date is not null;

create table invoices_archived as 
select i.invoice_id , i.number, c.name as client, i.invoice_total, i.payment_total, i.payment_date, i.due_date from invoices i join clients c using(client_id)
where payment_date is not null;

-- Updating a Single Row 
update invoices set payment_total = 10, payment_date = '2019-03-01'  where invoice_id = 1;
update invoices set payment_total = 0, payment_date = null  where invoice_id = 1;
update invoices set payment_total = default, payment_date = null  where invoice_id = 1;

update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where invoice_id = 1;

-- Updating Multiple Rows 
update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where invoice_id = 3;
update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where invoice_id in (3.4);

use sql_store;
update customers set points=points+50 where birth_date < '1990-01-01';

-- Using Subqueries in Updates 
use sql_invoicing;
select client_id from clients where name= 'Myworks';

update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where 
client_id = (select client_id from clients where name= 'Myworks');

update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where 
client_id in (select client_id from clients where state  in('CA','NY'));

update invoices set payment_total = invoice_total*0.5, payment_date = due_date  where 
payment_date is null;

use sql_store;
update orders set comments= 'Gold customer' where customer_id in
(select customer_id from customers where points > 3000);

-- Deleting Rows
use sql_invoicing;
delete from invoices where invoice_id = 1 ;
delete from invoices where client_id =  (select client_id from clients where name = 'Myworks');