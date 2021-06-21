----Answer the question
----1.	In SQL Server, assuming you can find the result by using both joins and subqueries, which one would you prefer to use and why?
--		When I need to data from more than one table, I will use join.
--		I use subquery when it provides a subset of the table involved in the query

----2.	What is CTE and when to use it?
--		Common Table expression(CTE) is the result set of a query which exists temporarily

----3.	What are Table Variables? What is their scope and where are they created in SQL Server?
--		The table variable is a special type of the local variable that helps to store data temporarily.
--		Table variable scope is within the batch.
--		It is stored in the tempdb system database.

----4.	What is the difference between DELETE and TRUNCATE? Which one will have better performance and why?
--		DELETE removes rows one at a time but TRUNCATE removes all rows in a table by deallocating.
--		TRUNCATE is faster than DELETE because it does not scan every record before removing it.

----5.	What is Identity column? How does DELETE and TRUNCATE affect it?
--		A SQL Server IDENTITY column is a special type of column that is used to automatically 
--		generate key values based on a provided seed (starting point) and increment.

----6.	What is difference between ¡°delete from table_name¡± and ¡°truncate table table_name¡±?
--		The DELETE statement allows a WHERE clause that identifies which records to remove, 
--		whereas TRUNCATE TABLE always removes all records.

--Write queries for following scenarios
--All scenarios are based on Database NORTHWND

--1.	List all cities that have both Employees and Customers.
		select distinct e.City
		from Employees e
		where e.City in (select c.City from Customers c)
	
		select distinct c.City
		from Customers c
		where c.City in (select e.City from Employees e)

--2.	List all cities that have Customers but no Employee.
--a.	Use sub-query
		select distinct c.City
		from Customers c
		where c.City is not null and c.City not in 
	   (select e.City from Employees e where e.City is not null)
--b.	Do not use sub-query
		select distinct c.City
		from Customers c
		inner join Employees e
		on c.City is not null and c.City not in( e.City) 

--3.	List all products and their total order quantities throughout all orders.
		select p.ProductName, dt.TotalOrder
		from Products p inner join
		(select od.ProductID, count(od.ProductID) as "TotalOrder"
		from Orders o inner join [Order Details] od
		on o.OrderID = od.OrderID
		group by od.ProductID)dt
		on p.ProductID = dt.ProductID
		order by dt.TotalOrder desc
--4.	List all Customer Cities and total products ordered by that city.
		with cteProductCount
		as
		(
			select o.CustomerID, count(od.OrderId) as "Total"
			from Orders o inner join [Order Details] od
			on o.OrderID = od.OrderID
			group by o.CustomerID
		),
		cteCityAndNumOfProducts
		as
		(
		    select c.City, total
			from Customers c inner join cteProductCount cpc
			on c.CustomerID = cpc.CustomerID
			
		)
		select City, sum(total) as "TotalP" from cteCityAndNumOfProducts
		group by City
		
--5.	List all Customer Cities that have at least two customers.
--a.	Use union
		select c.City, count(c.CustomerID) as "NumOfCustomers"
		from Customers c
		group by c.City
		having  count(c.CustomerID) > 1
		union
		select s.City, count(s.SupplierId) 
		from Suppliers s
		group by s.City
--b.	Use sub-query and no union
		select dt.City, dt.NumOfCustomers
		from	
		(select c.City, count(c.CustomerID) as "NumOfCustomers"
		from Customers c
		group by c.city) dt full join Suppliers s
		on dt.City = s.City
		where dt.NumOfCustomers > 1
		
--6.	List all Customer Cities that have ordered at least two different kinds of products.
		
--7.	List all Customers who have ordered products, but have the ¡®ship city¡¯ on the order different from their own customer cities.
		select s.ContactName, s.City as "ShipCity", dt.City as "CustomerCity"
		from Suppliers s inner join
		(select c.ContactName,c.City
		from Customers c
		where c.CustomerID in (select o.CustomerID from Orders o))dt
		on dt.City != s.City

--8.	List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
		
			select top 5 p.ProductName, avg(p.UnitPrice) as "Avg", count(od.ProductID) as "Qty", c.City
			from [Order Details] od inner join Products p
			on od.ProductID = p.ProductID
			inner join Orders o
			on o.OrderID = od.OrderID
			inner join Customers c
			on c.CustomerID = o.CustomerID
			group by p.ProductName, c.City
			order by qty desc
		
		
--9.	List all cities that have never ordered something but we have employees there.
--a.	Use sub-query
		select distinct c.City
		from Customers c inner join Orders o
		on c.CustomerID not in(o.CustomerID)
		where o.EmployeeID in (select e.EmployeeID from Employees e)

--b.	Do not use sub-query
		select distinct c.City
		from Employees e inner join Orders o
		on o.EmployeeID = e.EmployeeID
		inner join Customers c
		on c.CustomerID not in(o.CustomerID)

--10.	List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
		with EmployeeIdCount
		as
		(
		 select  e.City, e.EmployeeID, count(o.EmployeeID) as "Total"
		 from Employees e inner join orders o
		 on e.EmployeeID = o.EmployeeID
		 group by e.EmployeeID,e.City
		),
		CustomerCTE
		as
		(
			select eic.city, sum(eic.Total) as "TotalOrders"
			from EmployeeIdCount eic
			group by eic.city
		)
		select top 1 city,TotalOrders from CustomerCTE
		order by TotalOrders desc
		
--11. How do you remove the duplicates record of a table?
		Find duplicate rows using GROUP BY clause or ROW_NUMBER() function.
		Use DELETE statement to remove the duplicate rows.

--12. Sample table to be used for solutions below- Employee ( empid integer, mgrid integer, deptid integer, salary integer) Dept (deptid integer, deptname text)
-- Find employees who do not manage anybody.
		select *
		from Employee e
		where e.mgrid is null
--13. Find departments that have maximum number of employees. (solution should consider scenario having more than 1 departments that have maximum number of employees). Result should only have - deptname, count of employees sorted by deptname.
		select top 1 d.deptname. count(e.deptid)
		from Dept d inner join Employee e
		on e.deptid = d.deptid
		group by d.deptname
		order by count(e.deptid) desc
--14. Find top 3 employees (salary based) in every department. 
--    Result should have deptname, empid, salary sorted by deptname and then employee with high to low salary.
	  select dt.deptname, dt.empid, dt.salary
	  from
	  (select deptname, empid, salary
	  from Employee e inner join Dept d
	  on e.deptid = d.deptid
	  order by deptname)dt
	  order by dt.salary desc