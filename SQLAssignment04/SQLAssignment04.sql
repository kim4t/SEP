--Answer following questions
1.	What is View? What are the benefits of using views?
		A view is a virtual table whose contents are defined by a query.

2.	Can data be modified through views?
		Yes,but when view is using more than one base table, it would not be recommended.

3.	What is stored procedure and what are the benefits of using it?
		procedure is sql code that can be reused over and over again.
		so it has benefit for sql query which will be used over and over again.
		Also, Increase database security 

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
2.	Change territory ¡°Gondor¡± to ¡°Arnor¡±.
3.	Delete Region ¡°Middle Earth¡±. (tip: remove referenced data first) (Caution: do not forget WHERE or you will delete everything.) In case of an error, no changes should be made to DB. Unlock the tables mentioned in question 1.
select * from Region
select * from Territories
select * from Employees
select * from EmployeeTerritories
--1.a
	begin tran
	insert into Region values(5,'Middle Earth')
	if @@error !=0
	rollback 
	else begin
--1.b
	insert into Territories values(11111,'Gondor',5)
	if @@error !=0
	rollback 
	else begin
--1.c
	insert into employees values('Aragorn',	'King'	,'Sales Representative',	'Ms.'	,'1966-01-27 00:00:00.000','1994-11-15 00:00:00.000', 'Houndstooth Rd.',	'London',	NULL	,'WG2 7LT',	'UK',	'(71) 555-4444'	,452,NULL,	'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.',	5,	'http://accweb/emmployees/davolio.bmp/')
	insert into EmployeeTerritories values(@@identity, 11111)
	if @@error !=0
	rollback 
	else begin
-- 2
	update territories set territoryDescription = 'Arnor' where territoryDescription = 'Gondor'
	if @@error !=0
	rollback 
	else begin

--3
	DELETE FROM EmployeeTerritories 
WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription = 'Arnor')
DELETE FROM Territories
WHERE TerritoryDescription = 'Arnor'
DELETE FROM Region
WHERE RegionDescription = 'Middel Earth'
IF @@ERROR <>0
ROLLBACK
ELSE BEGIN
COMMIT
end
end
end
end
end
   
4.	Create a view named ¡°view_product_order_[your_last_name]¡±, list all products and total ordered quantity for that product.
	create view view_product_order_¤¿im 
	as
	select p.Productname, sum(od.Quantity) as total
	from Products p join [Order Details] od
	on p.ProductID = od.ProductID
	group by p.Productname
	select* from view_product_order_kim

5.	Create a stored procedure ¡°sp_product_order_quantity_[your_last_name]¡± that accept product id as an input and total quantities of order as output parameter.
	alter procedure sp_product_order_quantity_Kim 
	@Pid int, 
	@TotalOrder int output
	as
	begin
	select 
	@TotalOrder = sum(od.Quantity)
	from [Order Details] od join Products p
	on od.ProductID = p.ProductID
	where p.productId = @pid
	group by  p.ProductID
	end

	declare @res int
	exec sp_product_order_quantity_Kim 3, @res out
	print @res


6.	Create a stored procedure ¡°sp_product_order_city_[your_last_name]¡± that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
	create procedure sp_product_order_city_Kim
	@PName nvarchar(40)
	as
	begin
		select top 5 ShipCity,SUM(Quantity) as "Total"
		from [Order Details] OD JOIN Products P
		on p.productid = od.productid
		join orders o
		on od.orderid = o.orderid
		where p.productname = @pname
		GROUP BY ProductName,ShipCity
		ORDER BY SUM(Quantity) DESC
	end
	sp_product_order_city_Kim 'Chai'
	
7.	Lock tables Region, Territories, EmployeeTerritories and Employees. 
	Create a stored procedure ¡°sp_move_employees_[your_last_name]¡± 
	that automatically find all employees in territory ¡°Tory¡±; 
	if more than 0 found, insert a new territory ¡°Stevens Point¡± of region ¡°North¡± to the database, 
	and then move those employees to ¡°Stevens Point¡±.

	BEGIN TRAN
	GO
	create PROC sp_move_employees_kim
	AS
	BEGIN
	IF EXISTS(SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Troy'))
	BEGIN
	DECLARE @TerritotyID INT
	SELECT @TerritotyID = MAX(TerritoryID) FROM Territories
	BEGIN TRAN
	INSERT INTO Territories VALUES(@TerritotyID+1 ,'Stevens Point',3)
	UPDATE EmployeeTerritories
	SET TerritoryID = @TerritotyID+1
	WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Troy'))
	IF @@ERROR <> 0
	BEGIN
	ROLLBACK
	END
	ELSE
	COMMIT
	END
	END
	
8.	Create a trigger that when there are more than 100 employees in territory ¡°Stevens Point¡±, move them back to Troy. (After test your code,) remove the trigger. Move those employees back to ¡°Troy¡±, if any. Unlock the tables.
	Did not cover yet

9.	Create 2 new tables ¡°people_your_last_name¡± ¡°city_your_last_name¡±. 
	City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. 
	People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. 
	Remove city of Seattle. If there was anyone from Seattle, put them into a new city ¡°Madison¡±. 
	Create a view ¡°Packers_your_name¡± lists all people from Green Bay. 
	If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.

	create table people_kim(id int, name varchar(100), city int)
	create table city_kim(id int, city varchar(100))
	insert into city_kim values(1,'Seattle')
	insert into city_kim values(2,'Green Bay')
	insert into people_kim values(1,'Aaron Rodgers',1)
	insert into people_kim values(2,'Russell Wilson',2)
	insert into people_kim values(3,'Jody Nelson',2)
	if exists(select id from people_kim where city = (select id from city_kim where city = 'Seatle'))
	begin
	insert into city_kim values(3,'Madison')
	update people_kim
	set city = 'Madison'
	where id in (select id from People_Gaddam where city = (select id from City_Gaddam where city = 'Seatle'))
	end
	delete from city_kim where city = 'Seattle'

	create view packers_kim
	as
	select name
	from people_kim 
	where city = 'Green Bay'
	
	select * from packers_kim
	drop table people_kim
	drop table city_kim
	drop view packers_kim


10.	 Create a stored procedure ¡°sp_birthday_employees_[you_last_name]¡± 
	 that creates a new table ¡°birthday_employees_your_last_name¡± and 
	 fill it with all employees that have a birthday on Feb. 
	 (Make a screen shot) drop the table. Employee table should not be affected.

	 create proc sp_birthday_employees_kim
	 as
	 begin
	 select * into #Emptmp
	 from employees 
	 where datepart(m,birthdate) = 02
	 select * from #Emptmp
	 end
	 sp_birthday_employees_kim

11.	Create a stored procedure named ¡°sp_your_last_name_1¡± 
	that returns all cites that have at least 2 customers who have bought no or only one kind of product. 
	Create a stored procedure named ¡°sp_your_last_name_2¡± 
	that returns the same but using a different approach. (sub-query and no-sub-query).

	CREATE PROC sp_kim_1
	AS
	BEGIN
	SELECT City FROM CUSTOMERS
	GROUP BY City
	HAVING COUNT(*)>2
	INTERSECT
	SELECT City FROM Customers C JOIN Orders O 
	ON O.CustomerID=C.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	GROUP BY OD.ProductID,C.CustomerID,City
	HAVING COUNT(*) BETWEEN 0 AND 1
	END
	
	sp_kim_1

	CREATE PROC sp_kim_2
	AS
	BEGIN
	SELECT City FROM CUSTOMERS
	WHERE CITY IN (SELECT City FROM Customers C JOIN Orders O ON O.CustomerID=C.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID
	GROUP BY OD.ProductID,C.CustomerID,City
	HAVING COUNT(*) BETWEEN 0 AND 1)
	GROUP BY City
	HAVING COUNT(*)>2
	END
	
12.	How do you make sure two tables have the same data?
	if after union two table, the number of row is still same,
	amd if after union all two table, the number of row become twice,
	then they have same data.

	or use except keword
	select* from products
	except
	select* from products

	-- suppose table is t1
14. create table t2(varchar(20))
	insert t2 values('FullName')
	insert t2 values(select (t.FirstName+' 't.LastName) as FullName from t1 t)

15. select top 1 t.Student
	from t1 t
	where t. Sex = 'F'
	order by t.Marks

16. output will be 'Li' the way to output is same as Q15

