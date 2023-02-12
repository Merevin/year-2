import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(host='sql4.freemysqlhosting.net',
                                             database='sql4407415',
                                             user='sql4407415',
                                             password='KUGU7i48WW')
    if connection.is_connected():
        cursor = connection.cursor()
        def email_check(x):
             
            sql_select_Query = "select * from Users"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            check = False
            for row in record:
                user_email =(row[3])
                if x == user_email:                    
                    return True 
            
        
        print(email_check("flojlo21@google.com"))
        
except Error as e:
        print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
