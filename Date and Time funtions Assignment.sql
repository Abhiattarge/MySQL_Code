#Date_String_Function
use mypracticedb;
select * from employee;
select * from department;

#1 write a query to display the first day of the month (in datetime format three months before the current month).

select date (((period_add(extract(year_month from curdate()),-3)*100)+1));

#2 write a query to display the last day of the month (in datetime format three months before the current month).

select (subdate(adddate(curdate(),interval 1 month),interval dayofmonth(curdate()) day )) as lastdayofthemonth;

#3 write a query to get the distinct mondays from hire_date in employees tables.
#select distinct (str_to_date(concate(yearweek(empjdate), '1'), '%x%v%w'))from employee;

#4 write a query to get the first day of the current year.

select makedate(extract(year from curdate()),1);

#5 write a query to get the last day of the current year.

select last_day(date_add(now(),interval 12-month(now())month));

#6 write a query to calculate the age in year.

select year(current_timestamp) - year("1998/04/09") - (right(current_timestamp , 5) < right("2021/06/01",5)) as age;

#7 write a query to get the current date in the following format
#simple date : 2014-09-04
#output : september 4, 2014

select date_format(curdate(),'%M %e, %Y') as 'Current_date';

#8 write a query to get the current date in the following format
# Thursday september 2014

select date_format(now(), '%W %M %Y');

#9 write a query to extract the year from the current date

select extract(year from now());

#10 write a query to get the DATE value from a given day (number in N)
#sample : 730677
#output : 2000-07-11

select from_days(730677);

#11 write a query to get the first name and hire date from employees table where hire date between 1987-06-01 and 1987-07-30

select empname,empjdate from employee where empjdate between '2012/05/05' and  '2020/05/11';

#12 write a query to display the current date in the following format sample output Thursday 4th september 2014 00:00:00

select date_format(curdate(),'%W %D %M %Y %T');

#13 write a query to display the current date in the following format sample : 05/09/2014

select date_format(curdate(),'%d %m %Y');

#14 write a query to display the current date in the following format sample : 12:00 am sep 5, 2014

select date_format(curdate(),'%l:%i %p %b %e %Y');

#15 write a query to get the firstname,lastname who joining in the month of june sample table : employee

select empname from employee where month(empjdate) = 5;

#16 write a query to get the year in which more then 10 employee joined sample table : employee

select date_format(empjdate,'%Y') from employee group by date_format(empjdate,'%Y') having count(empid) > 2;

#17 write a query to get first name of employee who joined in 1987 sample table : employee

select empname,empjdate from employee where year(empjdate)=2020;

#18 write a query to get department name, mamager name, and salary of the manager for all manager whose experience is more than 5 years
#sample table : department

select deptname,empname,empsal from department d join employee e on(d.deptid=e.deptid) where (sysdate()-empjdate)/365 >5;

#19 write a query to get employee id , lase name , and date of first salary of the employee
#sample table : employee

select empid,empname,empjdate, last_day(empjdate) from employee;

#20 write a query to get the first name,hire date and experience of the employee
# sample table : employee

select empname,sysdate(),empjdate,datediff(sysdate(),empjdate)/365 from employee;
