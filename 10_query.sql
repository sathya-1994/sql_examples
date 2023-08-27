-- Column attributes

-- Inserting a Single Row 
insert into customers values (DEFAULT,'John','Smith','1990-01-01',null,'address','city','CA',default);

insert into customers(first_name,last_name,birth_date,address,city,state) values ('John','Raj','1990-01-01','address','city','CA');

insert into customers(last_name,first_name,birth_date,address,city,state) values ('John','John','1990-01-01','address','city','CA');

-- Inserting multiple values
insert into shippers(name) values('Shipper1'), ('Shipper2'),('Shipper3'),('Shipper4');
insert into products(name,quantity_in_stock,unit_price) values ('Product1',10,11.1),('Product2',18,11.3),('Product3',14,11.3);

-- Inserting Hierarchical Rows 
insert into orders(customer_id, order_date, status) values (1,'2019-01-02',1);
insert into order_items values (last_insert_id(), 1,1,2.95),
							(last_insert_id(),  2,1,3.95);
select last_insert_id();

-- Creating a Copy of a table 
create table orders_archived as 
-- sub query
select * from orders;
-- Use sub query in insert statement
insert into orders_archived ()
select * from orders where order_date <'2019-01-01';