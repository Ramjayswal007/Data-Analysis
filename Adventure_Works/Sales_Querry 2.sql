create database SQL_Project;
use SQL_Project;


create table salespeople (snum int not null unique,
sname char(22) not null,
city char(22) not null,
comm decimal(10,2) not null);

insert into salespeople values (1001,'Peel','London',0.12),
(1002,'Serres','San Jose',0.13),
(1003,'Axelord','New York',0.10),
(1004,'Motika','London',0.11),
(1005,'Rafkin','Barcelona',0.15);
select * from salespeople;

create table Customer (cnum int not null unique,
cname char(22) not null,
city char(22) not null,
rating int not null,
snum int not null);

insert into Customer values (2001, 'Hoffman','London',100,1001),
(2002,'Giovanne','Rome',200,1003),
(2003,'Liu','San Jose',300,1002),
(2004,'Grass','Berlin',100,1002),
(2005,'clemens','London',300,1007),
(2007,'Pereira','Rome',100,1004),
(2008,'James','London',200,1007);
select * from Customer;

create table Orders (onum int not null primary key,
amt decimal(10,2),
Odate date not null,
 cnum int not null,
 snum int not null);
insert into Orders values 
(3001,18.69,'1994-10-03',2008,1007),
(3002,1900.10,'1994-10-03',2007,1004),
(3003,767.19,'1994-10-03',2001,1001),
(3005,5160.45,'1994-10-03',2003,1002),
(3006,1098.16,'1994-10-04',2008,1007),
(3007,75.75,'1994-10-05',2004,1002),
(3008,4723.00,'1994-10-05',2006,1001),
(3009,1713.23,'1994-10-04',2002,1003),
(3010,1309.95,'1994-10-06',2004,1002),
(3011,9891.88,'1994-10-06',2006,1001);
select * from orders;

# Que.4--->> Write a query to match the salespeople to the customers according to the city they are living.
select salespeople.sname as "Salespeople",
Customer.cname, salespeople.city
from salespeople,Customer
where salespeople.city=Customer.city;

# Que.5--->> Write a query to select the names of customers and the salespersons who are providing service to them.
select Customer.cname,salespeople.sname
from Customer,salespeople
where salespeople.snum = Customer.snum;

# Que.6--->> Write a query to find out all orders by customers not located in the same cities as that of their salespeople.
select onum,cname,Orders.cnum,Orders.snum
from salespeople,Customer,Orders
where Customer.city <> salespeople.city
and Orders.cnum = Customer.cnum
and Orders.snum = salespeople.snum;

# Que.7---> Write a query that lists each order number followed by name of customer who made that order.
SELECT Orders.onum, Customer.cname
FROM Orders, Customer
WHERE Orders.cnum = Customer.cnum;

# Que.8---> Write a query that finds all pairs of customers having the same rating………………
select * from Customer order by rating;

# Que.9---> Write a query to find out all pairs of customers served by a single salesperson…………
select a.cname,b.cname,c.sname 
from customer a,customer b,salespeople c 
where a.snum=b.snum and a.snum=c.snum;


# Que.10---> Write a query that produces all pairs of salespeople who are living in same city………………
select salespeople .sname as "Salespeople name",
customer.cname,Customer.city
from salespeople,Customer
where salespeople.city = Customer.city;

# Que.11---> Write a Query to find all orders credited to the same salesperson who services Customer 2008;
select * from orders
where snum = (select snum 
from Customer 
where cnum = 2008);

# Que.12---> Write a Query to find out all orders that are greater than the average for Oct 4th.
select * from Orders
where amt > (select avg(amt) from orders where odate = '1994-10-04');

# Que.13--->> Write a Query to find all orders attributed to salespeople in London.
select * from orders
where snum in 
(select snum from salespeople
where city = 'London');

# Que.14--->> Write a query to find all the customers whose cnum is 1000 above the snum of Serres. 
select * from Customer
where cnum > (select snum +1000 from Salespeople where sname = 'Serres');

select * from Orders;
select * from customer; 
select * from Salespeople;

# Que.15--->> Write a query to count customers with ratings above San Jose’s average rating.
select count(*) from customer
where rating > (select avg(rating) from Customer where city = 'San Jose');

# Que.16--->> Write a query to show each salesperson with multiple customers.
select a.sname,b.cname
from Salespeople a, Customer b
where a.snum = b.snum;

select salespeople.sname,Customer.cname
from salespeople,Customer
where salespeople.snum = Customer.snum;


