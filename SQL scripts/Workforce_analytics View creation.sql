-- Creating views for importing to PowerBI
create or replace view employee_vw as
select * from dim_employee;

create or replace view record_vw as
select * from fact_record;

create or replace view workload_vw as
select * from fact_workload;

create or replace view hiring_year_vw as
select employee_id,
	str_to_date(hire_date, '%Y-%m-%d') as hiring_date, 
    year(str_to_date(hire_date, '%Y-%m-%d')) as hiring_year
from fact_record;

