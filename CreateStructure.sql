if object_id('dbo.Basket', 'u') is not null
drop table dbo.Basket;

if object_id('dbo.Sku', 'u') is not null
drop table dbo.Sku;

if object_id('dbo.Family', 'u') is not null
drop table dbo.Family;

create table dbo.Sku(
id varchar(20)  primary key,
code as ('s' + id) unique,
name varchar(40));

create table dbo.Family(
id varchar(20) primary key, 
surname varchar(20), 
budgetvalue numeric);

create table dbo.Basket (
id int primary key, 
id_Sku varchar(20) references dbo.Sku(id), 
id_Family varchar(20) references dbo.Family(id),
quantity numeric, 
value numeric , 
purchasedate date default (sysdatetime()), 
discountvalue int,
check(quantity >= 0 and value >= 0))


