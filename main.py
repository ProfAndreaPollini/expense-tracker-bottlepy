from bottle import route, run, template,view, static_file,request,post, redirect,get

import sqlite3

DB_NAME = "expensetracker.db"
con = sqlite3.connect(DB_NAME)

def expense_tuple_to_dict(expense_tuple):
    return {"id":expense_tuple[0],"description":expense_tuple[1],"amount":expense_tuple[2],"date":expense_tuple[3],"category":expense_tuple[4]}

@get('/expenses')
@view('hello_template')
def hello():
    cursor = con.execute("SELECT * FROM expenses")
    expenses = []
    for row in cursor:
        print(expense_tuple_to_dict(row))
        expenses.append(expense_tuple_to_dict(row))
 
    return {"name":"Ciao a tutti",'expenses':expenses}




@post("/expenses")
def create_expense():
    if request.forms.get('_method') == 'delete':
        return delete_expense(request.forms.get('id'))
    
    data = {
        "date": request.forms.get('date'),
       "description" : request.forms.get('description'),
        "amount": request.forms.get('amount'),
        "category": request.forms.get('category')
    }
    print(request.forms)
    cursor = con.execute("INSERT INTO expenses (date,description,amount,category) VALUES (?,?,?,?)",
                         (data["date"],data["description"],data["amount"],data["category"]))
    con.commit()
    return redirect("/expenses")

def delete_expense(id):
    cursor = con.execute("DELETE FROM expenses WHERE id = ?",(id,))
    con.commit()
    return redirect("/expenses")

@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='static/')

run(host='localhost', port=8080, debug=True)