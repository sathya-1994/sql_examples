-- Self joins
use sql_hr;
select * from employees e join employees managers on e.reports_to= managers.employee_id;

select  e.employee_id, e.first_name, managers.first_name as manager from employees e join employees managers on e.reports_to= managers.employee_id;