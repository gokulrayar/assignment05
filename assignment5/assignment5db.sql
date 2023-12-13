create database Assignment5db

use Assignment5db

create schema bank

create table bank.Customer
(CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) unique,
Contact nvarchar(10) unique,
Cpwd as substring(CName,Len(CName)-1,2)+cast(CId as nvarchar(max))+substring(contact,1,2) persisted
)

create table bank.MailInfo
(
CEmail nvarchar(50),
MailDate datetime default GetDate(),
MailMessage nvarchar(100),
)

--drop table bank.Customer
--drop table bank.MailInfo

select * from bank.Customer
select * from bank.MailInfo

create trigger bank.trgMailToCust
on bank.Customer
after insert
as
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @contact nvarchar(50)
select @name=CName from inserted 
select @email=CEmail from inserted 
select @contact=Contact from inserted 
insert into bank.MailInfo(CEmail,MailDate,MailMessage)
values(@email,getdate(),'Your NetBanking Password is CPWD It is valid upto 2 days only.Update it')
print 'Record Inserted & Action captured in MailInfo Table'


alter trigger bank.trgMailToCust
on bank.Customer
after insert
as
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @contact nvarchar(50)
select @name=CName from inserted 
select @email=CEmail from inserted 
select @contact=Contact from inserted 
insert into bank.MailInfo(CEmail,MailDate,MailMessage)
values(@email,getdate(),'Your NetBanking Password is CPWD It is valid upto 2 days only.Update it')
print 'Record Inserted & Action captured in MailInfo Table'


select * from bank.Customer
select * from bank.MailInfo

insert into bank.Customer(CName,CEmail,Contact) values ('rayar','rayar556@gmail.com',9567890765)
insert into bank.Customer(CName,CEmail,Contact) values ('zoro','zoro@gmail.com',7893456747)
insert into bank.Customer(CName,CEmail,Contact) values ('rock','rockyui@gmail.com',82546494846)

select * from bank.Customer
select * from bank.MailInfo

--delete from bank.Customer
--delete from bank.MailInfo