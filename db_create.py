import os,os.path
import sqlite3

DB_NAME = "expensetracker.db"


# load the DDL data from the file db_init.sql
db_ddl_data= ""
with open("db_init.sql", "r") as f:
    db_ddl_data = f.read()
    

if os.path.exists(DB_NAME):
    os.remove(DB_NAME)


con = sqlite3.connect(DB_NAME)

with con:
    cur = con.cursor()
    cur.executescript(db_ddl_data)

