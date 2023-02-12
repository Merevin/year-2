import mysql.connector
from mysql.connector import Error
def Search(x):
    try:
        connection = mysql.connector.connect(host='sql4.freemysqlhosting.net',
                                             database='sql4407415',
                                             user='sql4407415',
                                             password='KUGU7i48WW')
        if connection.is_connected():
        
            counter = int(0)
            ID=[]            
            cursor = connection.cursor()            
            sql_select_Query = "select * from Authors"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            for row in record:
                author_id=(row[0])
                author_name=(row[1])
                counter= counter + 1
                if x in author_name:
                    ID.append(row[0])
                    
            print(ID)
                
        

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")
            
Search("Robert")
