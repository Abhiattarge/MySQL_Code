use mypracticedb;

create table WORKER
(
WORKER_ID int not null primary key,
FIRST_NAME VARCHAR(18) NOT NULL ,
LAST_NAME VARCHAR(18) NOT NULL,
SALARY INT DEFAULT 5000.00 NOT NULL,
JOINING_DATE DATE NOT NULL,
DEPARTMENT VARCHAR(25) NOT NULL
);
desc worker;

insert into worker values(101,'Mahesh','Patil',35000,'2020/09/12','accounts'),
                         (103,'Suraj','Kondear',32000,'2020/05/07','maintances'),
                         (102,'Ravi','Mote',40000,'2020/09/12','production'),
                         (105,'Vivek','Bhati',35000,'2020/04/12','accounts'),
                         (104,'Abhishek','Attarge',45000,'2018/08/02','accounts');
select * from worker;

create table Bonus
(
WORKER_REF_ID int not null,
BONUS_DATE date,
BONUS_AMOUNT int,
foreign key(worker_ref_id) references worker (worker_id)
);
desc bonus;
insert into bonus values
(101,'2022/05/01',15000),(102,'2022/05/01',null),
(103,'2022/05/01',20500),(104,'2022/05/01',25000),(105,'2022/05/01',15050);

select * from bonus;
select * from worker;

#3 write an sql query to display full name of worker from worker
# table using the alis name as workr name.
select concat(first_name,"",last_name)as "Worker Name" from worker;

#4 write a sql query to fetch unique values of department from worker table.
select distinct department from worker ;

#5 write sql query to display count department.
select count(distinct department) as "no of department" from worker;

#6 write a sql query to display total salary expense of company.
select sum(salary) "total salary" from worker;

#7 write a query to get full name of worker who have salary in range of 30000 to 60000.
select concat(first_name,"",last_name)"worker name" from worker where salary between 30000 and 60000;

#8 write a sql query to print all worker details from the worker table sorted first_name ascending
#order and if name is same than according to salary in descending order.
select * from worker order by first_name,salary desc;

#9 display all details from bunus table where bouns is above 20000 in april 2018.
select * from bonus where bonus_amount > 20000 and bonus_date = 2018/06/01 and "2018/09/30";

#10 write query to display department wise total salary in descending order.
select department ,sum(salary) "total salary" from worker group by department order by sum(salary) desc;

#11 createduplicate table of bunus table
create table bonus_duplicate(select * from bonus);

#12 display worker and his title details for records whose titles affected from 1st jan 2015

#13 show worker details with 3rd highest salary
select * from worker w1 where 2=(select count(distinct w2.salary)from worker w2 where w2.salary > w1.salary);

#14 show number of people working in department production,maintance and accounts
select count(*) from worker where department in ("accounts","Maintances","production");

#15 

#16
update worker set salary = salary+2000 where salary<60000;

#17
delete from worker where joining_date < "2015/04/01";

#18
delete from bonus where bonus_amount is null;

#19
select min(bonus_amount)from bonus where bonus_date > "2020/09/01";

#20
select concate(substring(first_name,1,1),".",last_name) "worker name" from worker;