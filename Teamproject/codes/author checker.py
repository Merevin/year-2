import mysql.connector
from mysql.connector import Error
def author_check(x):
    try:
        connection = mysql.connector.connect(host='sql4.freemysqlhosting.net',
                                             database='sql4407415',
                                             user='sql4407415',
                                             password='KUGU7i48WW')
        if connection.is_connected():
        
            counter = int(0)
            #db_Info = connection.get_server_info()
            #print("Connected to MySQL Server version ", db_Info)
            cursor = connection.cursor()
            #cursor.execute("select database();")
            #record = cursor.fetchone()
            #print("You're connected to database: ", record)
            sql_select_Query = "select * from Authors"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            print("Total number of rows in table: ", cursor.rowcount)
            for row in record:
                author_id=(row[0])
                author_name=(row[1])
                counter= counter + 1
                if x in author_name:
                    print("number of steps taken", counter)
                    print(row[0],row[1])
                
        

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
            
author_check("Robert")
