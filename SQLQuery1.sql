CREATE TABLE SALESPEOPLE2(SNUM INT PRIMARY KEY,  SNAME CHAR(10),  CITY CHAR(20),  COMM DECIMAL(8,3));

CREATE TABLE CUST2(CNUM INT PRIMARY KEY,  CNAME CHAR(20),  CITY CHAR(20), RATING INT,SNUM INT);

CREATE TABLE ORDERS2(ONUM INT PRIMARY KEY,  AMT INT, ODATE Date, CNUM INT,SNUM INT);

INSERT INTO SALESPEOPLE2 VALUES (1001, 'Peel', 'London',0.12); 
INSERT INTO SALESPEOPLE2 VALUES(1002, 'Serres','San Jose',0.13); 

INSERT INTO CUST2 VALUES (2001, 'Hoffman', 'London',100,1001); 
INSERT INTO CUST2 VALUES (2002, 'Giovanne', 'Rome',200,1003); 

INSERT INTO ORDERS2 VALUES (3001,18,'03-09-94',2008,1007); 
INSERT INTO ORDERS2 VALUES (3003,76,'03-10-94',2001,1001);  

Select snum, sname, city, comm from salespeople;

Select distinct snum from orders;

Select sname,comm from salespeople where city = ‘London’;

Select cname from cust where rating = 100;

Select cname from cust where rating > 200;

Select cname from cust where city = ‘San Jose’ or rating > 200;

Select *  from orders where amt > 1000; 

Select sname, city from salespeople where comm > 0.10 and city = ‘London’;

Select cname from cust where rating <= 100 or city = ‘Rome’; 

Select sname, city from salespeople where city in (‘Barcelona’,’London’); 

Select sname, comm from salespeople where comm > 0.10 and comm < 0.12; 

Select cname from cust where city is null; 

Select cname from cust, orders where orders.cnum = cust.cnum and 
	orders.snum in ( select snum from salespeople where sname in ('Peel','Motika')); 

SELECT * 
FROM CUST 
WHERE CNAME LIKE '[A-B]%';

Select onum from orders where amt != 0 or amt is not null;

Select count(distinct snum) from orders; 

Select odate, snum, max(amt) from orders group by odate, snum order by odate,snum; 

Select odate, snum, max(amt) from orders where amt > 3000 group by odate, snum order by odate,snum; 

Select odate, amt, snum, cnum from orders where amt = (select max(amt)  from orders)	

Select * from orders where odate in (‘03-OCT-94’,’04-OCT-94’); 

Select odate, amt, snum, cnum from orders where amt = (select max(amt)  from orders) 

Select count(*) from orders where odate = ‘03-OCT-94’;

Select count(distinct city) from cust;

Select cnum, min(amt) from orders group by cnum; 

Select min(cname) from cust where cname like ‘G%’; 

Select onum, snum, amt, amt * 0.12 from orders order by snum; 

Select 'For the city (' || city || '), the highest rating is : (' ||  max(rating) || ')' from cust group by city;

Select odate, count(onum) from orders group by odate order by count(onum); 

Select sname, cname from salespeople, cust where salespeople.city = cust.city; 

Select cname, sname from cust, salespeople where cust.snum = salespeople.snum 

Select onum, cname from orders, cust where orders.cnum = cust.cnum; 

Select onum, sname, cname from orders, cust, salespeople where orders.cnum = cust.cnum and orders.snum = salespeople.snum;

Select cname, sname, comm from cust, salespeople where comm > 0.12 and cust.snum = salespeople.snum; 

Select sname, amt * comm from orders, cust, salespeople1 where rating > 100 and salespeople1.snum = cust.snum and salespeople1.snum = orders.snum and cust.cnum = orders.cnum 

Select a.cname, b.cname,a.rating from cust a, cust b where a.rating = b.rating and a.cnum != b.cnum 

Select a.cname, b.cname,a.rating from cust a, cust b where a.rating = b.rating and a.cnum != b.cnum and a.cnum <b.cnum; 


Select cname from cust where city = ( select city  from cust, salespeople
where cust.snum = salespeople.snum and sname = 'Serres');

Select cname  from cust where city in ( select city from cust, orders where cust.cnum = orders.cnum and orders.snum in ( select snum  from salespeople where sname = 'Serres')); 

Select cname from cust where snum in (select snum from cust group by snum having count(snum) > 1); 

Select cname, city from cust where rating = (select rating from cust where cname = 'Hoffman') and cname != 'Hoffman'; 

Select Onum from orders	where snum = ( select snum from salespeople where sname = ‘Motika’);

Select onum, sname, cname, amt from orders a, salespeople b, cust c where a.snum = b.snum and a.cnum = c.cnum and a.snum = ( select snum from orders where cnum = ( select cnum from cust where cname = 'Hoffman')); 

Select *  from orders where amt > ( select avg(amt)  from orders where odate = '03-OCT-94'); 

Select avg(comm) from salespeople where city = ‘London’; 

Select snum, cnum  from orders where cnum in (select cnum  from cust where city = 'London'); 

Select comm from salespeople where snum in (select snum from cust where city = ‘London’);

Select cnum, cname from cust where cnum > ( select snum+1000  from salespeople where sname = 'Serres');

Select cnum, rating from cust where rating > ( select avg(rating)  from cust where city = 'San Jose'); 