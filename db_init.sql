--- 1. Create expenses table
CREATE TABLE expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL,
    amount REAL NOT NULL,
    date TEXT NOT NULL,
    category TEXT NOT NULL
);

--- 2. Create categories table
CREATE TABLE categories (
    name TEXT PRIMARY KEY
);

--- 3. create tags table
CREATE TABLE tags (
    name TEXT PRIMARY KEY
);

--- 4. create expenses_tags table
CREATE TABLE expenses_tags (
    expense_id INTEGER NOT NULL,
    tag_name TEXT NOT NULL,
    PRIMARY KEY (expense_id, tag_name),
    FOREIGN KEY (expense_id) REFERENCES expenses(id),
    FOREIGN KEY (tag_name) REFERENCES tags(name)
);

-- Path: db_populate.sql

--- 1. Populate categories table
INSERT INTO categories (name) VALUES ('Food');
INSERT INTO categories (name) VALUES ('Transportation');
INSERT INTO categories (name) VALUES ('Entertainment');
INSERT INTO categories (name) VALUES ('Clothing');
INSERT INTO categories (name) VALUES ('Rent');
INSERT INTO categories (name) VALUES ('Health');
INSERT INTO categories (name) VALUES ('Other');

--- 2. Populate tags table
INSERT INTO tags (name) VALUES ('lunch');
INSERT INTO tags (name) VALUES ('dinner');
INSERT INTO tags (name) VALUES ('snacks');
INSERT INTO tags (name) VALUES ('coffee');

--- 3. Populate expenses table
INSERT INTO expenses (description, amount, date, category) VALUES ('Lunch at McDonalds', 5.99, '2019-01-01', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Dinner at Burger King', 7.99, '2019-01-01', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Snacks at 7-11', 2.99, '2019-01-01', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Coffee at Starbucks', 3.99, '2019-01-01', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Lunch at McDonalds', 5.99, '2019-01-02', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Dinner at Burger King', 7.99, '2019-01-02', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Snacks at 7-11', 2.99, '2019-01-02', 'Food');
INSERT INTO expenses (description, amount, date, category) VALUES ('Coffee at Starbucks', 3.99, '2019-01-02', 'Food');

--- 4. Populate expenses_tags table
INSERT INTO expenses_tags (expense_id, tag_name) VALUES (1, 'lunch');
INSERT INTO expenses_tags (expense_id, tag_name) VALUES (2, 'dinner');
INSERT INTO expenses_tags (expense_id, tag_name) VALUES (3, 'snacks');
INSERT INTO expenses_tags (expense_id, tag_name) VALUES (4, 'coffee');
INSERT INTO expenses_tags (expense_id, tag_name) VALUES (5, 'lunch');
