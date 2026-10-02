select * from dim_employee limit 10;
select * from fact_record limit 10;
select * from fact_workload limit 10;

-- 1. Analyze salary trends over department
-- Approach: calculating average of salary and ordering by salary descending.

select e.department, round(avg(r.monthly_salary),2) as Avg_salary
from dim_employee e
inner join fact_record r on e.Employee_ID = r.Employee_ID
group by e.department
order by Avg_salary desc;

-- 2. Identify most common education levels per role
-- approach: Ranking the education level for each job title based on the number of candidate falling in each category, then fetching the 1st ranks for each job title.

with cte as (
	select job_title, education_level, count(education_level),
    dense_rank() over(partition by job_title order by count(education_level) desc) as rk
    from dim_employee
    group by job_title, education_level
)

select job_title, education_level
from cte
where rk = 1;

-- 3. Determine the impact of remote work on performance
-- Approach: joining workload and record tables, then taking average value of employee satisfaction score and performance score, grouped by Remote work frequency.

select w.Remote_Work_Frequency, 
	round(avg(w.employee_satisfaction_score),2) as avg_employee_satisfaction_score, 
	round(avg(r.performance_score),2) as avg_performance_score
from fact_record r
inner join fact_workload w on r.Employee_ID = w.Employee_ID
group by w.Remote_Work_Frequency;


-- 4. Analyze employee retention trends by age group
-- Approach: Join the dim_employee and fact_record and using case when do bucketing of the age group, after that 
-- calculate the resignation % and group it by age group to get the solution.

with cte as (
	select e.employee_id, e.age,
    case 
		when e.age between 18 and 30 then '18-30'
        when e.age between 31 and 45 then '31-45'
        when e.age between 46 and 60 then '46-60'
	end as age_group,
    r.resigned
    from dim_employee e
    inner join fact_record r on e.Employee_ID = r.Employee_ID
)

select age_group, 
	round(count(case when resigned = 1 then 1 end)*100/count(employee_id),2) as `Resignation %`
from cte
group by age_group;
    
    
-- 5. Department-wise education level distribution
-- Approach: use case when to calculate percentage of employees from each education level, and group them by department.

select department,
	round(count(case when education_level = "Bachelor" then 1 end)*100/count(*),2) as "Bachelor",
    round(count(case when education_level = "High School" then 1 end)*100/count(*),2) as "High School",
    round(count(case when education_level = "Master" then 1 end)*100/count(*),2) as "Master",
    round(count(case when education_level = "PhD" then 1 end)*100/count(*),2) as "PhD"
from dim_employee
group by Department;

-- 6. Year-wise hiring trends in the company
-- Approach: Join dim_employee and fact_record and calculate count of hires for each department. Then group the counts on hiring_year.

select 
	year(str_to_date(r.hire_date, '%Y-%m-%d')) as hiring_year,
    count(case when e.department = "Customer Support" then 1 end) as `Customer Support`,
    count(case when e.department = "Engineering" then 1 end) as `Engineering`,
	count(case when e.department = "Finance" then 1 end) as `Finance`,
    count(case when e.department = "HR" then 1 end) as `HR`,
    count(case when e.department = "IT" then 1 end) as `IT`,
    count(case when e.department = "Marketing" then 1 end) as `Marketing`,
    count(case when e.department = "Operations" then 1 end) as `Operations`,
    count(case when e.department = "Sales" then 1 end) as `Sales`
from fact_record r
inner join dim_employee e on r.employee_id = e.employee_id
group by year(str_to_date(r.hire_date, '%Y-%m-%d'))
order by hiring_year;

-- 7. Gender distribution across departments
-- Approach: genderwise count grouped at department level.

select department,
	round(count(case when Gender = "Male" then 1 end)*100/count(*),2) as "Male %",
    round(count(case when Gender = "Female" then 1 end)*100/count(*),2) as "Female %"
from dim_employee
group by Department;

-- 8. Department wise attrition rates
-- Approach: Join dim_employee and fact_record tables then calculate attrition rate eventually grouping the values at department level.

select 
	e.Department,
	round(count(case when r.resigned = 1 then 1 end)*100/count(*),2) as `Attrition rate`
from fact_record r 
inner join dim_employee e on r.Employee_ID = e.Employee_ID
group by e.department
order by `Attrition rate` desc;


-- 9. Job title and department wise, performance score relation
-- Approach: Create a cte by joining all tables and calling relevant columns, then create a pivot table like structure and 
-- calculate avergae Employee_Satisfaction_Score grouped by Remote_Work_Frequency.

with cte as (
	select e.Employee_ID, department, Performance_Score, Employee_Satisfaction_Score, Remote_Work_Frequency
    from dim_employee e
    inner join fact_record r on e.employee_id = r.Employee_ID
    inner join fact_workload w on w.Employee_ID = r.Employee_ID
 )
 
select Remote_Work_Frequency,
	round(avg(case when department = "Customer Support" then Employee_Satisfaction_Score end),2) as `Customer Support`,
    round(avg(case when department = "Engineering" then Employee_Satisfaction_Score end),2) as `Engineering`,
    round(avg(case when department = "Finance" then Employee_Satisfaction_Score end),2) as `Finance`,
    round(avg(case when department = "HR" then Employee_Satisfaction_Score end),2) as HR,
    round(avg(case when department = "IT" then Employee_Satisfaction_Score end),2) as IT,
    round(avg(case when department = "Legal" then Employee_Satisfaction_Score end),2) as `Legal`,
    round(avg(case when department = "Marketing" then Employee_Satisfaction_Score end),2) as `Marketing`,
    round(avg(case when department = "Operations" then Employee_Satisfaction_Score end),2) as `Operations`,
    round(avg(case when department = "Sales" then Employee_Satisfaction_Score end),2) as Sales
from cte
group by Remote_Work_Frequency;

-- 10. Calculate the average Monthly Salary for each Gender within each Job title to check for compensation parity.
-- Approach: Join dim_employee and fact_record and calculate average monthly_salary for each gender grouped at department level.

select e.department,
	round(avg(case when e.gender = "Male" then r.Monthly_Salary end),2) as Male,
    round(avg(case when e.gender = "Female" then r.Monthly_Salary end),2) as Female
from fact_record r
inner join dim_employee e on r.Employee_ID = e.Employee_ID
group by e.department;