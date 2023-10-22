from bottle import route, run, template,view

import sqlite3

DB_NAME = "expensetracker.db"
con = sqlite3.connect(DB_NAME)

def expense_tuple_to_dict(expense_tuple):
    return {"id":expense_tuple[0],"description":expense_tuple[1],"amount":expense_tuple[2],"date":expense_tuple[3],"category":expense_tuple[4]}

@route('/hello')
@view('hello_template')
def hello():
    cursor = con.execute("SELECT * FROM expenses")
    expenses = []
    for row in cursor:
        print(expense_tuple_to_dict(row))
        expenses.append(expense_tuple_to_dict(row))

    return {"name":"Ciao a tutti",'expenses':expenses}

run(host='localhost', port=8080, debug=True)