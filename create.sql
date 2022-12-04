DROP TABLE IF EXISTS orders_taxi;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS drivers;

create table users(
	id int, 
	name varchar(32) not null, 
	surname varchar(32) not null, 
	adress varchar(64) not null, 
	email varchar(64) not null, 
	phone varchar(64) not null
);

create table orders_taxi(
	id int,
	order_date date not null, 
	user_id int not null,  
	driver_id int not null
);

create table drivers(
	id int, 
	name varchar(32) not null, 
	surname varchar(32) not null,
	phone_number varchar(50) not null, 
	email varchar(50) not null,
	rating float
); 


create table cars(
	id int,
	manufacture_name varchar(100) not null, 
	model_name varchar(100) not null,
	driver_id int not null
);


alter table users add primary key(id); 
alter table orders_taxi add primary key(id);
alter table drivers add primary key(id); 
alter table cars add primary key(id); 
 
alter table orders_taxi add foreign key(user_id) references users(id);
alter table cars add foreign key(driver_id) references drivers(id);
alter table orders_taxi add foreign key(driver_id) references drivers(id);
s




insert into users values (1, 'user_1', 'user_1_surname', 'adress_1', 'mail1@gmail.com', '0967776651');
insert into users values (2, 'user_2', 'user_2_surname', 'adress_2', 'mail1@gmail.com' ,'0967776652');
insert into users values (3, 'user_3', 'user_3_surname', 'adress_3', 'mail1@gmail.com' ,'0967776651');
insert into users values (4, 'user_4', 'user_4_surname', 'adress_4', 'mail1@gmail.com' ,'0967776651');
insert into users values (5, 'user_5', 'user_5_surname', 'adress_5', 'mail1@gmail.com' ,'0967776651');
insert into users values (6, 'user_6', 'user_6_surname', 'adress_6', 'mail1@gmail.com' ,'0967776654');
insert into users values (7, 'user_7', 'user_7_surname', 'adress_7', 'mail1@gmail.com' ,'0967776651');
insert into users values (8, 'user_8', 'user_8_surname', 'adress_8', 'mail1@gmail.com' ,'0967776651');
insert into users values (9, 'user_9', 'user_9_surname', 'adress_8', 'mail1@gmail.com' ,'0967776651');
insert into users values (10, 'user_10', 'user_10_surname', 'adress_10', 'mail10@gmail.com' ,'09677766510');

insert into drivers values (1, 'driver_1', 'driver_1_surname',  '0967776651', 'mail1@gmail.com', 1 );
insert into drivers values (2, 'driver_2', 'driver_2_surname',  '0967776652', 'mail1@gmail.com' , 5);
insert into drivers values (3, 'driver_3', 'driver_3_surname',  '0967776651', 'mail1@gmail.com', 5);
insert into drivers values (4, 'driver_4', 'driver_4_surname',   '0667776651', 'mail1@gmail.com', 4);
insert into drivers values (5, 'driver_5', 'driver_5_surname',   '0967876651','mail1@gmail.com' , 4);
insert into drivers values (6, 'driver_6', 'driver_6_surname',   '0967776654', 'mail1@gmail.com', 3);
insert into drivers values (7, 'driver_7', 'driver_7_surname',   '0967766651', 'mail1@gmail.com', 5);
insert into drivers values (8, 'driver_8', 'driver_8_surname',   '0967776651', 'mail1@gmail.com', 5);
insert into drivers values (9, 'driver_9', 'driver_9_surname',   '0967756651', 'mail1@gmail.com', 5);
insert into drivers values (10,'driver_10', 'driver_10_surname','09647766510', 'mail1@gmail.com', 4);

insert into cars values (1, 'company1', 'model1', 1);
insert into cars values (2, 'company2', 'model2', 1);
insert into cars values (3, 'company1', 'model3', 2);
insert into cars values (4, 'company3', 'model4', 6);
insert into cars values (5, 'company1', 'model7', 8);
insert into cars values (6, 'company7', 'model9', 9);
insert into cars values (7, 'company1', 'model12', 9);
insert into cars values (8, 'company10', 'model5', 9);
insert into cars values (9, 'company1', 'model1', 9);
insert into cars values (10, 'company9', 'model1', 7);


insert into orders_taxi values(1, '1999-01-08', 1, 5); 
insert into orders_taxi values(2, '2000-01-08', 2, 1); 
insert into orders_taxi values(3, '2010-01-08', 2, 1); 
insert into orders_taxi values(4, '2012-01-08', 2, 4); 
insert into orders_taxi values(5, '1999-01-07', 6, 3); 
insert into orders_taxi values(6, '1996-01-08', 7, 5); 
insert into orders_taxi values(7, '2016-01-08', 8, 5); 
insert into orders_taxi values(8, '2020-01-08', 4, 1); 
insert into orders_taxi values(9, '2021-01-08', 3, 6); 
insert into orders_taxi values(10, '1999-02-08', 2, 1); 


-- 2 lab 


select * from Printer where color = 'y' order by price desc; 

select name from Ships where name like "%e%e%";

select Printer.model, maker from Printer join Product on Printer.model = Product.model where Printer.price > 300; 

select distinct country, Ships.class from Ships join Classes on Classes.class = Ships.class where country = 'USA'; 

select distinct maker from PC join Product on PC.model = Product.model where speed >= 750; 

select ship, battle, 
CASE WHEN result = 'sunk' THEN 'затонув'
		 WHEN result = 'damaged'  THEN 'пошкоджений'
		 WHEN result = 'OK' THEN 'OK'
	END AS result
from Outcomes; 


select  maker, price from Printer join Product on Printer.model = Product.model where Printer.price = (select distinct min(price) from Printer); 



select maker, max(price) from PC join Product on PC.model = Product.model group by maker; 


select distinct Income.point, Income.date, inc, `out` from Income join Outcome on (Income.date = Outcome.date and Income.point = Outcome.point); 



(select Product.model, max(price), Product.type from Printer join Product on Printer.model = Product.model group by model)
union 
(select Product.model, max(price), type from PC join Product on PC.model = Product.model  group by model)
union 
(select Product.model, max(price),type from Laptop  join Product on Laptop.model = Product.model group by model);