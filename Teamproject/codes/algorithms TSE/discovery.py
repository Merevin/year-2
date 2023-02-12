import mysql.connector
import numpy as np
from mysql.connector import Error

try:
    connection = mysql.connector.connect(host='sql4.freemysqlhosting.net',
                                             database='sql4407415',
                                             user='sql4407415',
                                             password='KUGU7i48WW')
    if connection.is_connected():
        books_found=[]
        cursor = connection.cursor()
        def discovery(x,y,z):
            print("user input genre",x)
            sql_select_Query = "select * from User_Likes_Genres"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            user_match=[]
            
            
            for row in record:
                genre_id =str(row[0])
                user_id =str(row[1])
                if x == genre_id:
                    user_match.append(row[1])
            print("users found",user_match)

            sql_select_Query = "select * from User_History ORDER BY user_id Asc"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            user_match_book=[]

            for row in record:
                user_id =(row[1])
                book_id =(row[2])
                for i in user_match:
                    if user_id == i:                        
                        user_match_book.append(row[2])
            print("user book ids",user_match_book)

            
                        

            sql_select_Query = "select * from Books ORDER BY book_id Desc"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            user_match_book_score=user_match_book

            for row in record:
                book_id =(row[0])
                score =(row[3])
                user_match_book_score = np.where(user_match_book_score == book_id, score, user_match_book_score)

            
            
            user_match_book_score= np.add.reduceat(user_match_book_score, np.arange(0, len(user_match_book_score), 3))
            
            print("book scores",user_match_book_score)

            user_match = [user_match for _,user_match in sorted(zip(user_match_book_score,user_match))]
            user_match_book_score= sorted (user_match_book_score)

            user_match=user_match[-3:]
            print("final 3 users",user_match)

            sql_select_Query = "select * from User_History ORDER BY user_id Asc"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            user_match_book=[]

            for row in record:
                user_id =int(row[1])
                book_id =int(row[2])
                for i in user_match:
                    if user_id == i:                        
                        user_match_book.append(row[2])
            

            final_match_book=sorted(user_match_book)
            print("book ids of final 3 users",final_match_book)
            final_book_genre=[]
            
            sql_select_Query = "select * from Categorised_By"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()

            for row in record:
                book_id =(row[0])
                genre_id =(row[1])
                
                for i in final_match_book:
                    if book_id == i:                        
                        final_book_genre.append(row[1])
                        

            print("final 9 book genres",final_book_genre)

            z=int(z)

            sql_select_Query = "select * from Language_Written"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()

                                  
                        
            
            


            unique = set()
            duplicate=[]
            for n in final_match_book:
              if n in unique:
                duplicate.append(n)                
                final_book_genre.pop(0)
                
              else:
                unique.add(n)
                final_book_genre.pop(0)
                
                
            print("duplicate books",duplicate)
            print("genres",final_book_genre)
            
            final_book_genre= final_book_genre[len(duplicate):]
            
            final_match_book=list(set(final_match_book)-set(duplicate))
            duplicate=list(set(duplicate))


            sql_select_Query = "select * from Books ORDER BY book_id Desc"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            final_book_age=[]
            y=int(y)
            
            
            for row in record:
                book_id=(row[0])
                age_rating_id=(row[2])                
                for i in final_match_book:
                    if book_id ==i and age_rating_id != y:
                        print(age_rating_id,"not this age",y)                
                                               
                        final_match_book.remove(book_id)
                        final_book_age.append(book_id)
                for i in duplicate:
                    if book_id ==i and age_rating_id != y:
                        print(age_rating_id,"not this age",y)                
                                               
                        duplicate.remove(book_id)
                        final_book_age.append(book_id)


            sql_select_Query = "select * from Language_Written"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            z=int(z)
            
            
            for row in record:
                book_id=(row[0])
                language_id=(row[1])                
                for i in final_match_book:
                    if book_id ==i and language_id != z:
                        print(language_id,"not this lang",z)                
                                               
                        final_match_book.remove(book_id)
                for i in duplicate:
                    if book_id ==i and language_id != z:
                        print(language_id,"not this lang",z)        
                                               
                        duplicate.remove(book_id)
                for i in final_book_age:
                    if book_id == i and language_id !=z:
                        print(language_id,"not this lang",z)
                        final_book_age.remove(book_id)
                    
                    
            print("testasdasda",final_book_age)

            

            

            sql_select_Query = "select * from Books ORDER BY average_rating Desc"
            cursor.execute(sql_select_Query)
            record= cursor.fetchall()
            
            

            
#duplicates
            for row in record:
                book_id =int(row[0])
                for i in duplicate:
                    if book_id== i:                        
                        print(row[0],row[1],row[2],row[3],row[4])
                        

#same genre
            x=int (x)
            for i in final_book_genre:
                if x == i:
                    for row in record:
                        book_id =int(row[0])
                        for i in final_match_book:
                            if book_id== i:                        
                                print(row[0],row[1],row[2],row[3],row[4])
                                final_match_book=final_match_book[1:]
                    
                    

#any leftover
            final_match_book = final_match_book + final_book_age
            if len(final_match_book) > 0:           
                for row in record:
                    book_id =int(row[0])
                    for i in final_match_book:
                        if book_id== i:                        
                            print(row[0],row[1],row[2],row[3],row[4])    
            print("no more books")
            
                  
        #genre,age,language           
        discovery("3","2","2")
        
except Error as e:
        print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
