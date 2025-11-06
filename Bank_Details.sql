show databases;
create database if not exists Bank_Details;
use Bank_Details;
create table Branch(BranchName varchar(30), BranchCity varchar(20), Assests int(7), primary key(BranchName));
create table BankAccount(AccNo int(7), BranchName varchar(30), Balance int(7), primary key(AccNo), foreign key(BranchName) references Branch(BranchName));
create table BankCustomer(CustomerName varchar(20), CustomerStreet varchar(30), CustomerCity varchar(20), primary key(CustomerName));
create table Depositor(CustomerName varchar(20), AccNo int(7), primary key(CustomerName,Accno),foreign key(CustomerName) references BankCustomer(CustomerName),foreign key(AccNo) references BankAccount(AccNo));
create table Loan(LoanNumber int(10), BranchName varchar(30), Amount int(7), primary key(LoanNumber), foreign key(BranchName) references Branch(BranchName));
show tables;
insert into Branch values('SBI_Chamrajpet','Banglore',50000);
insert into Branch values('SBI_ResidencyRoad','Banglore',10000);
insert into Branch values('SBI_ShivajiRoad','Bombay',20000);
insert into Branch values('SBI_ParliamentRoad','Delhi',10000);
insert into Branch values('SBI_JantarMantar','Delhi',20000);
insert into BankAccount values(1,'SBI_Chamrajpet',2000);
insert into BankAccount values(2,'SBI_ResidencyRoad',5000);
insert into BankAccount values(3,'SBI_ShivajiRoad',6000);
insert into BankAccount values(4,'SBI_ParliamentRoad',9000);
insert into BankAccount values(5,'SBI_JantarMantar',8000);
insert into BankAccount values(6,'SBI_ShivajiRoad',4000);
insert into BankAccount values(8,'SBI_ResidencyRoad',4000);
insert into BankAccount values(9,'SBI_ParliamentRoad',3000);
insert into BankAccount values(10,'SBI_ResidencyRoad',5000);
insert into BankAccount values(11,'SBI_JantarMantar',2000);
insert into BankCustomer values('Avinash','Bull_Temple_Road','Banglore');
insert into BankCustomer values('Dinesh','Bannergatta_Road','Banglore');
insert into BankCustomer values('Mohan','NationalCollege_Road','Banglore');
insert into BankCustomer values('Nikil','Akbar_Road','Delhi');
insert into BankCustomer values('Ravi','Prithviraj_Road','Delhi');
insert into Depositor values('Avinash',1);
insert into Depositor values('Dinesh',2);
insert into Depositor values('Nikil',4);
insert into Depositor values('Ravi',5);
insert into Depositor values('Avinash',8);
insert into Depositor values('Nikil',9);
insert into Depositor values('Dinesh',10);
insert into Depositor values('Nikil',11);
insert into Loan values(1,'SBI_Chamrajpet',1000);
insert into Loan values(2,'SBI_ResidencyRoad',2000);
insert into Loan values(3,'SBI_ShivajiRoad',3000);
insert into Loan values(4,'SBI_ParliamentRoad',4000);
insert into Loan values(5,'SBI_JantarMantar',5000);
select * from Branch;
select * from BankAccount;
select * from BankCustomer;
select * from Depositor;
select * from Loan;
select BranchName,Assests from Branch;
alter table Branch change column Assests Assests_in_Lakhs real;
select * from Branch;
select CustomerName from Depositor d join BankAccount b on d.AccNo=b.AccNo where BranchName='SBI_ResidencyRoad' group by CustomerName having count(*)>=2;
create view Loan_Sum as select BranchName, sum(Amount) as Total_Loan from Loan group by BranchName;
select * from Loan_Sum;






