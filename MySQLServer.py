import mysql.connector

try:
    # Connect to MySQL
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Barshosho@047"
    )
    
    # Run SQL to create database
    connection.cursor().execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print("Error connecting to MySQL:", e)

finally:
    # Close connection safely
    if 'connection' in locals() and connection.is_connected():
        connection.close()
    print("MySQL connection is closed")
