import mysql.connector

mydb = mysql.connector.connect(host="localhost", user= "root", password= "Barshosho@047")

mycursor = mydb.cursor()
mycursor.execute ("CREATE DATABASE IF NOT EXISTS alx_book_store")
mycursor.execute ("USE alx_book_store")

mycursor.execute ("""
    CREATE TABLE Authors(
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        author_name VARCHAR(215)

    )

""")

mycursor.execute ("""
    CREATE TABLE BOOKS(
        BOOK_ID INT AUTO_INCREMENT PRIMARY KEY,
        TITLE VARCHAR(130),
        AUTHOR_ID INT,
        PRICE DOUBLE,
        PUBLICATION_DATE DATE,
        FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)

    )
    
""")

mycursor.execute ("""
    CREATE TABLE CUSTOMERS(
        CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
        CUSTOMER_NAME VARCHAR(215),
        EMAIL VARCHAR(215),
        ADDRESS TEXT
    )

""")    

mycursor.execute ("""
    CREATE TABLE ORDERS(
        ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
        CUSTOMER_ID INT,
        ORDER_DATE DATE,
        FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
    )
    
""")  

mycursor.execute ("""
    CREATE TABLE ORDER_DETAILS(
        ORDERDETAILID INT AUTO_INCREMENT PRIMARY KEY,
        ORDER_ID INT,
        BOOK_ID INT, 
        QUANTITY DOUBLE,
        FOREIGN KEY (ORDER_ID)REFERENCES ORDERS(ORDER_ID),
        FOREIGN KEY(BOOK_ID ) REFERENCES BOOKS (BOOK_ID)
    )
    
""")  

print("DATABASE AND ALL TABLES CREATED SUCCESSFULLY")