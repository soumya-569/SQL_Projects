create database icici;
use icici;
select database();

-- Customer Churn Rate: What percentage of customers have churned?

select
round((count(*)/(select count(*) from bank_cs))*100,2) as churn_rate
from bank_cs
where Exited = 1;

-- Demographic Analysis: What is the churn rate based on gender, age, and geographical location?

alter table bank_cs
add column age_group varchar (25);

update bank_cs
set age_group =
case
	when Age between 18 and 30 then "18 - 30"
    when Age between 30 and 50 then "30 - 50"
    when Age between 50 and 70 then "50 - 70"
    else "Above 70"
end;

with gender_total_churn as
(select count(*) as total_churn from bank_cs where Exited = 1 group by Gender)

select
Gender,
round((count(*)/(select sum(total_churn) from gender_total_churn))*100,2) as churn_rate
from bank_cs
where Exited = 1
group by Gender;

with age_total_churn as
(select count(*) as total_churn from bank_cs where Exited = 1 group by age_group)

select
age_group,
round((count(*)/(select sum(total_churn) from age_total_churn))*100,2) as churn_rate
from bank_cs
where Exited = 1
group by age_group
order by churn_rate desc;

with location_total_churn as
(select count(*) as total_churn from bank_cs where Exited = 1 group by Geography)

select
Geography,
round((count(*)/(select sum(total_churn) from location_total_churn))*100,2)
as total_churn
from bank_cs
where Exited = 1
group by Geography
order by total_churn desc;

-- High-Value Customers: Who are the top 10% of customers with the highest balance

select
CustomerId,
Surname,
Balance
from bank_cs
order by Balance desc
limit 100;

-- Tenure & Churn Relation: How does the customer tenure impact the likelihood of churn?

select
Tenure,
count(*) as total_churn
from bank_cs
where Exited = 1
group by Tenure
order by total_churn desc;

-- Product & Service Utilization: What percentage of churned customers had a credit card vs. those who didn’t?

select
case
	when HasCrCard = 1 then "Yes"
    else "No"
end
as `credit_card?`,
round((count(*)/(select sum(count(*)) over() as total_churn from bank_cs where Exited = 1))*100,2)
as churn_rate
from bank_cs
where Exited = 1
group by `credit_card?`;

-- Bank Branch Performance: Which geographic regions have the highest customer churn?

select
Geography,
count(*) as total_churn
from bank_cs
where Exited = 1
group by Geography
order by total_churn desc
limit 1;

-- Average Balance Analysis: What is the average balance of churned vs. non-churned customers?

select
case
	when Exited = 1 then "Churned_Customers"
    else "Non-Churned_Customers"
end
as churn_type,
round(avg(Balance),2) as average_balance
from bank_cs
group by churn_type;

-- Transaction Behavior: How does the number of products affect churn probability?

select
NumOfProducts,
round((count(*)/(select sum(count(*)) over() as total from bank_cs))*100,2)
as churn_rate
from bank_cs
group by NumOfProducts
order by churn_rate desc;

-- Income vs. Churn: What is the income distribution of churned customers?

select
round(avg(EstimatedSalary),2) as average_income
from bank_cs
where Exited = 1;

-- Loan & Credit Impact: What is the correlation between credit score and churn rate?

create view score_churn as
select
CreditScore,
count(*) as total_churn
from bank_cs
where Exited = 1
group by CreditScore;

select
@cs:=avg(CreditScore),
@tc:=avg(total_churn),
@sd:= (stddev_samp(CreditScore)*stddev_samp(total_churn))
from score_churn;

select sum((CreditScore-@cs)*(total_churn-@tc))/
((count(CreditScore)-1)*@sd) as co_relation
from score_churn;

-- Salary vs. Churn: Do customers with higher estimated salaries tend to churn more or less?

select
case
	when EstimatedSalary between 0 and 10000 then "0 - 10000"
    when EstimatedSalary between 10000 and 25000 then "10000 - 25000"
    when EstimatedSalary between 25000 and 50000 then "25000- 50000"
    when EstimatedSalary between 50000 and 100000 then "50000 - 100000"
    when EstimatedSalary between 100000 and 150000 then "100000 - 150000"
    when EstimatedSalary between 150000 and 200000 then "150000 - 200000"
    else "Above 200000"
end
as salary_group,
count(*) as total_churn
from bank_cs
where Exited = 1
group by salary_group
order by total_churn desc;

-- Cross-Selling Analysis: How does the number of products held affect churn rate?

select
NumOfProducts,
round((count(*)/(select sum(count(*)) over() as total from bank_cs))*100,2)
as churn_rate
from bank_cs
group by NumOfProducts
order by churn_rate desc;

-- Loyalty Program Effectiveness: Do customers with longer tenure have a lower churn rate?

select
Tenure,
round((count(*)/(select sum(count(*)) over() as total from bank_cs where Exited = 1))*100,2)
as churn_rate
from bank_cs
where Exited = 1
group by Tenure
order by Tenure desc;

-- Customer Age & Churn: What age group has the highest churn rate?

select
age_group,
round((count(*)/(select sum(count(*)) over() as total from bank_cs where Exited = 1))*100,2)
as churn_rate
from bank_cs
where Exited = 1
group by age_group
order by churn_rate desc;

