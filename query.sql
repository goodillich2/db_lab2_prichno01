-- скільки машин у кожного водія
select name, count(*) from drivers join cars on cars.driver_id = drivers.id group by name order by count(*); 


-- скільки було поїздок у кожного користувача
select name, count(*) from users join orders_taxi on users.id = orders_taxi.user_id group by name order by count(*); 

-- скільки було поїздок у кожного водія
select name, count(*) from drivers join orders_taxi on drivers.id = orders_taxi.driver_id group by name order by count(*); 