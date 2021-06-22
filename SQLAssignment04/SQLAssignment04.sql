--Answer following questions
1.	What is View? What are the benefits of using views?
		view is a virtual table based on the result-set of an SQL statement.

2.	Can data be modified through views?
		No

3.	What is stored procedure and what are the benefits of using it?
		procedure is sql code that can be reused over and over again.
		so it has benefit for sql query which will be used over and over again.

4.	What is the difference between view and stored procedure?
	View is simple showcasing data stored in the database tables, 
	whereas a stored procedure is a group of statements that can be executed.

5.	What is the difference between stored procedure and functions?
	The function must return a value but in procedure, it is optional.
	
6.	Can stored procedure return multiple result sets?
		Yes

7.	Can stored procedure be executed as part of SELECT Statement? Why?
		No because procedure may or may not return a value

8.	What is Trigger? What types of Triggers are there?
		special type of stored procedure that automatically runs when an event occurs in the database server
		There are 3 types of Triggers: DDL, DMLand Logan Triggers

9.	What are the scenarios to use Triggers?
	when you want to assure that a certain control shall 
	be performed before or after the defined statement on the defined table. 

10.	What is the difference between Trigger and Stored Procedure?
	Trigger which runs automatically when various events happen is
	subset of stored procedure

Write queries for following scenarios
Use Northwind database. 
All questions are based on assumptions described by the Database Diagram sent to you yesterday. 
When inserting, make up info if necessary. 
Write query for each step. Do not use IDE. BE CAREFUL WHEN DELETING DATA OR DROPPING TABLE.

1.	Lock tables Region, Territories, EmployeeTerritories and Employees. 
	Insert following information into the database. 
	In case of an error, no changes should be made to DB.

a.	A new region called "Middle Earth";
b.	A new territory called ¡°Gondor¡±, belongs to region ¡°Middle Earth¡±;
c.	A new employee ¡°Aragorn King¡± whos territory is ¡°Gondor¡±.
	insert Territories values('00000', 'Gondor',1)
	insert EmployeeTerritories values(1,'00000')
	insert Employees values(1,'Aragon','King',null,null,null,null,null,null,'Middle Earth',null,null,null,null,null,null,null,null)

2.	Change territory ¡°Gondor¡± to ¡°Arnor¡±.
	update Territories
	set TerritoryDescription = 'Arnor'
	where TerritoryID = '00000'

3.	Delete Region ¡°Middle Earth¡±. (tip: remove referenced data first) (Caution: do not forget WHERE or you will delete everything.) In case of an error, no changes should be made to DB. Unlock the tables mentioned in question 1.
	delete from Employees
	where Region = 'Middle Earth'

4.	Create a view named ¡°view_product_order_[your_last_name]¡±, list all products and total ordered quantity for that product.
	create view view_product_order_[kim] as
	select p.ProductID, sum(od.Quantity)
	from Products p join [Order Details] od
	on p.ProductID = od.ProductID
	group by p.ProductID

5.	Create a stored procedure ¡°sp_product_order_quantity_[your_last_name]¡± that accept product id as an input and total quantities of order as output parameter.
	create procedure sp_product_order_quantity_[Kim] 
	@Pid int 
	@TotalOrder int output
	as
	select 
	@TotalOrder = sum(od.Quantity)
	from [Order Details] od, Products p
	on od.ProductID = p.ProductID
	group by  p.ProductID

6.	Create a stored procedure ¡°sp_product_order_city_[your_last_name]¡± that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
	create procedure sp_product_order_city_[Kim]
	@PName nvarchar(40)
	@VCity output
	@Total output
	as
	select top 5 c.City, sum(od.Quantity)
	from [Order Details] od inner join Products p
	on p.ProductName = @Pname and p.ProductID = od.ProductID
	inner join Orders o
	on o.OrderID = od.OrderID
	inner join Customers c
	on c.CustomerID = o.CustomerID
	group by c.City
	order by sum(od.Quantity) desc
	
7.	Lock tables Region, Territories, EmployeeTerritories and Employees. Create a stored procedure ¡°sp_move_employees_[your_last_name]¡± that automatically find all employees in territory ¡°Tory¡±; if more than 0 found, insert a new territory ¡°Stevens Point¡± of region ¡°North¡± to the database, and then move those employees to ¡°Stevens Point¡±.
	create procedure sp_move_employees_[Kim]
	as
	select *
	from EmployeeTerritories et inner join Territories t
	on t.TerritoryID = et.TerritoryID
	inner join Employees e
	on et.EmployeeID = e.EmployeeID
	where t.TerritoryDescription = 'Tory'

8.	Create a trigger that when there are more than 100 employees in territory ¡°Stevens Point¡±, move them back to Troy. (After test your code,) remove the trigger. Move those employees back to ¡°Troy¡±, if any. Unlock the tables.
9.	Create 2 new tables ¡°people_your_last_name¡± ¡°city_your_last_name¡±. City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle. If there was anyone from Seattle, put them into a new city ¡°Madison¡±. Create a view ¡°Packers_your_name¡± lists all people from Green Bay. If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
10.	 Create a stored procedure ¡°sp_birthday_employees_[you_last_name]¡± that creates a new table ¡°birthday_employees_your_last_name¡± and fill it with all employees that have a birthday on Feb. (Make a screen shot) drop the table. Employee table should not be affected.
11.	Create a stored procedure named ¡°sp_your_last_name_1¡± that returns all cites that have at least 2 customers who have bought no or only one kind of product. Create a stored procedure named ¡°sp_your_last_name_2¡± that returns the same but using a different approach. (sub-query and no-sub-query).
12.	How do you make sure two tables have the same data?
	if after union two table, the number of row is still same,
	amd if after union all two table, the number of row become twice,
	then they have same data.

	-- suppose table is t1
14. create table t2(varchar(20))
	insert t2 values('FullName')
	insert t2 values(select (t.FirstName+' 't.LastName) as FullName from t1 t)

15. select top 1 t.Student
	from t1 t
	where t. Sex = 'F'
	order by t.Marks

16. output will be 'Li' the way to output is same as Q15

