-- Outer join between multiple tables

select c.customer_id, c.first_name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id 
join shippers sh on o.shipper_id= sh.shipper_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id, sh.name as shipper from customers c left join orders o on c.customer_id = o.customer_id 
left join shippers sh on o.shipper_id= sh.shipper_id order by c.customer_id;

select o.order_id, o.order_date, c.first_name as customer, sh.name as shipper from orders o join customers c on o.customer_id = c.customer_id 
join shippers sh on o.shipper_id = sh.shipper_id;

select o.order_id, 
		o.order_date, 
        c.first_name as customer, 
        sh.name as shipper, 
        os.name as status 
        from orders o join customers c on o.customer_id = c.customer_id 
		left join shippers sh on o.shipper_id = sh.shipper_id 
        join order_statuses os on o.status = os.order_status_id;
        
-- Self outer join
use sql_hr;
select e.employee_id,
	   e.first_name,
       m.first_name as manager from employees e join employees m on e.reports_to = m.employee_id;

-- Manager is also employee and join has to include manager
select e.employee_id,
	   e.first_name,
       m.first_name as manager from employees e left join employees m on e.reports_to = m.employee_id;
       
-- Using caluse (if column name is same in the join condition then we can use using)
select c.customer_id, c.first_name, o.order_id from customers c 
	join orders o on c.customer_id = o.customer_id order by c.customer_id;

select c.customer_id, c.first_name, o.order_id from sql_store.customers c 
	-- join orders o on c.customer_id = o.customer_id
    join sql_store.orders o using (customer_id)
    order by c.customer_id;
    
select c.customer_id, c.first_name, o.order_id, sh.name as shipper from sql_store.customers c 
	-- join orders o on c.customer_id = o.customer_id
    join sql_store.orders o using (customer_id)
    join sql_store.shippers sh using (shipper_id)
    order by c.customer_id;

select c.customer_id, c.first_name, o.order_id, sh.name as shipper from sql_store.customers c 
	-- join orders o on c.customer_id = o.customer_id
    join sql_store.orders o using (customer_id)
    left join sql_store.shippers sh using (shipper_id)
    order by c.customer_id;
    
select * from sql_store.order_items oi join sql_store.order_item_notes using (order_id,product_id);

select p.date,
	c.name as client,
    p.amount,
    pm.name as payment_method
 from sql_invoicing.payments p join sql_invoicing.clients c using (client_id) join sql_invoicing.payment_methods pm on p.payment_method = pm.payment_method_id;
 
 -- Natural joins; No join condition based on column name join condition will be added; Database engine will decide the columns to join
select * from orders o natural join customers c;
select o.order_id, c.first_name from orders o natural join customers c;

-- Cross join Join every record in one table with every record in other table
select * from customers c cross join products p;
select c.first_name as customer,
	p.name as product from customers c cross join products p order by c.first_name ;
-- Implicit syntax
select c.first_name as customer,
	p.name as product from customers c , products p order by c.first_name ;
    
select sh.name as shipper, p.name as product from shippers sh,products p order by sh.name;
select sh.name as shipper, p.name as product from shippers sh cross join products p order by sh.name;

