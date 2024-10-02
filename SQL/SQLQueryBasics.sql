/*Structured Query Language*/

/*Types of SQL Commands
SQL commands are divided into different categories based on their functionality. The main types are:

DML (Data Manipulation Language):
DML commands are used to manipulate data stored in database tables. These commands are responsible for retrieving, inserting, modifying, and deleting data.

SELECT: Retrieves data from a table.
INSERT: Inserts new data into a table.
UPDATE: Modifies existing data in a table.
DELETE: Deletes data from a table.*/

/*DDL (Data Definition Language):
DDL commands define and modify the structure of database objects such as tables, indexes, and schemas. These commands affect the schema of the database.

CREATE: Creates new database objects like tables or indexes.
ALTER: Modifies existing database objects.
DROP: Deletes database objects.
TRUNCATE: Removes all data from a table without deleting the table itself.*/

/** Grocery list: 
Bananas (4)
Peanut Butter (1)
Dark Chocolate Bars (2)
**/

CREATE TABLE Groceries (GroceryId INT PRIMARY KEY, GroceryName TEXT, Quantity INT)

INSERT INTO Groceries VALUES(1,'Banana',4)
INSERT INTO Groceries VALUES(2,'Peanut Butter',1)
INSERT INTO Groceries VALUES(3,'Chocolate Bars',2)

SELECT*FROM Groceries

/*Challange 1
What are your favorite books? 
You can make a database table to store them in! 
In this first step, create a table to store your list of books. 
It should have columns for id, name, and rating.
Then add three of books into the table*/

CREATE TABLE My_Library(BookId INT PRIMARY KEY, BookTitle VARCHAR(50), Rating FLOAT)
INSERT INTO My_Library VALUES(1,'To Kill a Mockingbird',4.8)
INSERT INTO My_Library VALUES(2,'1984',4.6)
INSERT INTO My_Library VALUES(3,'The Catcher in the Rye',4.1)
SELECT * FROM My_Library

SELECT GroceryName FROM Groceries
SELECT*FROM Groceries ORDER BY Quantity

/*Challange 2
Filter recent movies
Select all movies from table first,
then add a second query after the first, 
that retrieves only the movies that were released in the year 2000 or later, not before. 
Sort the results so that the earlier movies are listed first. 
You should have 2 SELECT statements after this step.*/

CREATE TABLE Movies (MovieId INTEGER PRIMARY KEY, MovieName TEXT, Release_year INTEGER)
INSERT INTO Movies VALUES (1, 'Avatar', 2009)
INSERT INTO Movies VALUES (2, 'Titanic', 1997)
INSERT INTO Movies VALUES (3, 'Star Wars: Episode IV - A New Hope', 1977)
INSERT INTO Movies VALUES (4, 'Shrek 2', 2004)
INSERT INTO Movies VALUES (5, 'The Lion King', 1994)
INSERT INTO Movies VALUES (6, 'Disneys Up', 2009)

SELECT*FROM Movies
SELECT*FROM Movies WHERE Release_year >= 2000 ORDER BY Release_year
SELECT MovieName FROM Movies WHERE Release_year >= 2000 ORDER BY Release_year

SELECT SUM(Quantity) FROM Groceries
SELECT MAX(Quantity) FROM Groceries 

/*Challange 3
Here's a table containing a TODO list with the number of minutes it will take to complete each item. 
Insert another item to your todo list with the estimated minutes it will take.
Select the SUM of minutes it will take to do all of the items on your TODO list. 
You should only have one SELECT statement.*/

CREATE TABLE Todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER)
INSERT INTO Todo_list VALUES (1, 'Wash the dishes', 15)
INSERT INTO Todo_list VALUES (2, 'Vacuuming', 20)
INSERT INTO Todo_list VALUES (3, 'Learn some stuff on KA', 30)
INSERT INTO Todo_list VALUES (4,'Drop the garbage',10)

SELECT SUM(minutes) FROM Todo_list 
SELECT TOP 1 * FROM Todo_list ORDER BY minutes DESC