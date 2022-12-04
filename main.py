# -- скільки машин у кожного водія
# select name, count(*) from drivers join cars on cars.driver_id = drivers.id group by name order by count(*); 


# -- скільки було поїздок у кожного користувача
# select name, count(*) from users join orders_taxi on users.id = orders_taxi.user_id group by name order by count(*); 

# -- скільки було поїздок у кожного водія
# select name, count(*) from drivers join orders_taxi on drivers.id = orders_taxi.driver_id group by name order by count(*); 


import psycopg2

username = 'postgres'
password = '2509' 
database = 'Taxi_station'
host = 'localhost'
port = '5432'

query_1 = '''
select name, count(*) from drivers join cars on cars.driver_id = drivers.id group by name order by count(*)
'''
query_2 = '''
select name, count(*) from users join orders_taxi on users.id = orders_taxi.user_id group by name order by count(*)
'''

query_3 = '''
select name, count(*) from drivers join orders_taxi on drivers.id = orders_taxi.driver_id group by name order by count(*)
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(conn))

with conn:

    cur = conn.cursor()
    print('\n1.  скільки машин у кожного водія\n')

    cur.execute(query_1)

    for row in cur:
        print(row)

    print('\n2.  скільки було поїздок у кожного користувача\n')

    cur.execute(query_2)

    for row in cur:
        print(row)

    print('\n3.  скільки було поїздок у кожного водія\n')

    cur.execute(query_3)

    for row in cur:
        print(row)