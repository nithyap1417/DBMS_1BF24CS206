show databases;
create database if not exists emp;
use emp;
create table Dept(DeptNo int(10), DName varchar(20), DLOC varchar(20), primary key(DeptNo));
create table employee(EmpNo int(10), MGR_No int(10), HireDate date, Sal int(10), DeptNo int(10), primary key(EmpNo), foreign key(DeptNo) references Dept(DeptNo));
create table Project(PNo int(10), PLOC varchar(20), PName varchar(20), primary key(PNo));
create table Assigned_To(EmpNo int(10), PNo int(10), Job_Role varchar(20), foreign key(EmpNo) references employee(EmpNo), foreign key(PNo) references Project(PNo));
create table Incentives(EmpNo int(10), Incentive_Date date, Incentive_Amount int(10), primary key(Incentive_Date), foreign key(EmpNo) references employee(EmpNo));
insert into Dept values(10,'cse','banglore');
insert into Dept values(11,'ise','banglore');
insert into Dept values(12,'me','hyderabad');
insert into Dept values(13,'ece','chennai');
insert into Dept values(14,'eee','mysore');
insert into employee values(1,'206','2024-10-10',20000,10);
insert into employee values(2,'207','2023-11-11',30000,12);
insert into employee values(3,'208','2024-10-10',40000,13);
insert into employee values(4,'209','2024-10-10',50000,11);
insert into employee values(5,'210','2024-10-10',50000,14);
insert into Project values(201,'banglore','p1');
insert into Project values(202,'banglore','p2');
insert into Project values(203,'hyderabad','p3');
insert into Project values(204,'mysore','p4');
insert into Project values(205,'chennai','p5');
insert into Assigned_To values(1,201,'manager');
insert into Assigned_To values(2,202,'assistant');
insert into Assigned_To values(3,203,'clerk');
insert into Assigned_To values(1,202,'web_dev');
insert into Assigned_To values(4,204,'app_dev');
insert into Assigned_To values(5,205,'ai_ml');
insert into Incentives values(1,'2024-10-11',5000);
insert into Incentives values(2,'2023-11-12',6000);
insert into Incentives values(3,'2024-11-12',7000);
insert into Incentives values(4,'2022-10-12',5000);
insert into Incentives values(5,'2023-11-04',5000);
select * from Dept;
select * from employee;
select * from Project;
select * from Assigned_To;
select * from Incentives;
alter table employee add Ename varchar(20);
update employee set Ename='Nithya' where EmpNo=1;
update employee set Ename='Khushi' where EmpNo=2;
update employee set Ename='Nikitha' where EmpNo=3;
update employee set Ename='Nisha' where EmpNo=4;
update employee set Ename='Nimisha' where EmpNo=5;
SELECT DISTINCT e.EmpNo, p.PLOC FROM employee e JOIN Assigned_To a ON e.EmpNo = a.EmpNo JOIN Project p ON a.PNo = p.PNo WHERE p.PLOC IN ('banglore', 'hyderabad', 'mysore');
SELECT EmpNo FROM employee WHERE EmpNo NOT IN (SELECT EmpNo FROM Incentives);
SELECT e.Ename, e.EmpNo, d.DName, a.Job_Role, d.DLOC AS Dept_Location, p.PLOC AS Project_Location
FROM employee e JOIN Dept d ON e.DeptNo = d.DeptNo JOIN Assigned_To a ON e.EmpNo = a.EmpNo JOIN Project p ON a.PNo = p.PNo WHERE d.DLOC = p.PLOC;
SELECT MGR_No FROM employee GROUP BY MGR_No
HAVING COUNT(EmpNo) = (
    SELECT MAX(EmpCount)
    FROM (
        SELECT COUNT(EmpNo) AS EmpCount
        FROM employee
        GROUP BY MGR_No
    ) AS Temp
);
SELECT e1.Ename AS Manager_Name, e1.EmpNo, e1.Sal FROM employee e1 WHERE e1.Sal > (
    SELECT AVG(e2.Sal)
    FROM employee e2
    WHERE e2.MGR_No = e1.EmpNo);









