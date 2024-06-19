select * from finance_1 ;
select * from finance_2 ;

/*
> Year Wise loan Amount
> Grade-Subgrade wise revolution balance
> TotalPayment For Verified Status Vs Non Verified Status
> State Wise last Credit pull _d wise loan status
> Home Ownership Vs Last Payment Date Stats.

*/


# KPI 1
select year (issue_D) as Year_of_issue_d , sum(loan_amnt) as Total_loan_amnt
from finance_1
group by Year_of_issue_d
order by Year_of_issue_d;

# KPI 2
select
grade , sub_grade ,sum(revol_bal) as total_revol_bal 
from finance_1 
inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade ;

# KPI 3

select verification_status ,
concat ("$",format (round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status ;

# KPI 4
select addr_State, last_Credit_pull_D , loan_status

from finance_1 
inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state ,last_credit_pull_D ,loan_Status
order by last_Credit_pull_D ; 

# KPI 5

select 
home_ownership ,(last_pymnt_d),
concat ("$",format (round(sum(last_pymnt_amnt)/10000,2),2),"K") as total_payment
from finance_1 
inner join finance_2
on(finance_1.id = finance_2.id)
group by
home_ownership ,last_pymnt_d
order by
last_pymnt_d DESC, home_ownership DESC;


