show databases;
create database if not exists car_insurance;
use car_insurance;
create table Person(driver_id varchar(5), driver_name varchar(20), driver_address varchar(20), primary key(driver_id));
create table Car_info(reg_num varchar(10), model varchar(20), car_year int(5), primary key(reg_num));
create table accident_info(report_num int(5), accident_date date, location varchar(20), primary key(report_num));
create table owns_info(driver_id varchar(5), reg_num varchar(10), foreign key(driver_id) references Person(driver_id), foreign key(reg_num) references Car_info(reg_num));
create table Participated(driver_id varchar(5), reg_num varchar(10), report_num int(5), damage_amount int(7),foreign key(driver_id) references Person(driver_id), foreign key(reg_num) references Car_info(reg_num), foreign key(report_num) references accident_info(report_num));
insert into Person values("A01","Richard","Srinivasnagar");
insert into Person values("A02","Pradeep","Rajajinagar");
insert into Person values("A03","Smith","Ashoknagar");
insert into Person values("A04","Venu","NR Colony");
insert into Person values("A05","Jhon","Hanumanthnagar");
insert into Car_info values("KA052250", "Indica", 1990);
insert into Car_info values("KA031181", "Lancer", 1957);
insert into Car_info values("KA095477", "Toyota", 1998);
insert into Car_info values("KA053408", "Honda", 2008);
insert into Car_info values("KA041702", "Audi", 2005);
insert into accident_info values(11,'2001-01-03','Mysore road');
insert into accident_info values(12,'2002-02-04','South end circle');
insert into accident_info values(13,'2021-01-03','Bull temple road');
insert into accident_info values(14,'2017-02-08','Mysore road');
insert into accident_info values(15,'2004-03-05','Kanakpura road');
insert into accident_info values(16,'2008-03-15','Domlur');
insert into owns_info values('A01','KA052250');
insert into owns_info values('A02','KA053408');
insert into owns_info values('A03','KA031181');
insert into owns_info values('A04','KA095477');
insert into owns_info values('A05','KA041702');
insert into Participated values('A01','KA052250',11,10000);
insert into Participated values('A02','KA053408',12,50000);
insert into Participated values('A03','KA031181',13,25000);
insert into Participated values('A04','KA095477',14,3000);
insert into Participated values('A05','KA041702',15,5000);
select * from Person;
select * from Car_info;
select * from accident_info;
select * from owns_info;
select * from Participated;
update Participated set damage_amount=25000 where reg_num='KA053408';
select * from Participated;
select accident_date,location from accident_info;
select driver_id from Participated where damage_amount>=25000;
select * from Car_info order by car_year asc;
select count(*) as count_info from Participated p,Car_info c where p.reg_num=c.reg_num and model='Lancer';
select * from Participated order by damage_amount desc;
select avg(damage_amount) from Participated;
select max(damage_amount) as maximum from Participated;
select driver_name from Person,Participated where Person.driver_id=Participated.driver_id and damage_amount>avg(damage_amount);














