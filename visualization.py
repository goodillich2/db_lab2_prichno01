# -- скільки машин у кожного водія
# select name, count(*) from drivers join cars on cars.driver_id = drivers.id group by name order by count(*); 


# -- скільки було поїздок у кожного користувача
# select name, count(*) from users join orders_taxi on users.id = orders_taxi.user_id group by name order by count(*); 

# -- скільки було поїздок у кожного водія
# select name, count(*) from drivers join orders_taxi on drivers.id = orders_taxi.driver_id group by name order by count(*); 



import psycopg2
import matplotlib.pyplot as plt

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

with conn:
    cur1 = conn.cursor()
    cur1.execute(query_1)
    name = []
    points = []

    for row in cur1:
        name.append(row[0])
        points.append(row[1])

    plt.bar(name, points)
    plt.title('name of driver', size=20)
    plt.ylabel('count of cars', size=15)
    plt.xticks(rotation=10)
    plt.show()


    cur2 = conn.cursor()
    cur2.execute(query_2)
    country = []
    points = []

    for row in cur2:
        country.append(row[0])
        points.append(row[1])

    x, y = plt.subplots()
    plt.title('скільки було поїздок у кожного користувача', size=20)
    y.pie(points, labels=country, autopct='%1.1f%%')
    plt.show()


    cur3 = conn.cursor()
    cur3.execute(query_3)
    name1 = []
    points1 = []

    for row in cur3:
        name1.append(row[0])
        points1.append(row[1])

    plt.bar(name1, points1)
    plt.title('name of driver', size=20)
    plt.ylabel('count of orders', size=15)
    plt.xticks(rotation=10)
    plt.show()