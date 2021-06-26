Answer following questions
1.	What is an object in SQL?
	views, tables, functions, stored procedures, etc are object in SQL

2.	What is Index? What are the advantages and disadvantages of using Indexes?
	index in sql are used to speed up the performance of select statement	but it will decrease the performance of Insert, update and delete statement

3.	What are the types of Indexes?
	clustered index and nonclustered index

4.	Does SQL Server automatically create indexes when a table is created? If yes, under which constraints?
	clustered, unique index is created under primary key column,
	nonclustered, unique index is created under unique constraint

5.	Can a table have multiple clustered index? Why?
	No, because clustered index sort table ascending order 

6.	Can an index be created on multiple columns? Is yes, is the order of columns matter?
	Yes, the order will be first column > second column > third comlumn and so on

7.	Can indexes be created on views?
	Yes

8.	What is normalization? What are the steps (normal forms) to achieve normalization?
	Normalization is a process of organizing data to minimize redundancy.
	There are first, second and thrid form of normalization.

9.	What is denormalization and under which scenarios can it be preferable?
	Denormalization is a strategy used on a previously-normalized database to increase performance

10.	How do you achieve Data Integrity in SQL Server?
	By using constraint

11.	What are the different kinds of constraint do SQL Server have?
	Not null, unique, PK, FK, check constraints

12.	What is the difference between Primary Key and Unique Key?
	Primary key sort the data, but Unique key does not

13.	What is foreign key?
	A foreign key (FK) is a column or combination of columns 
	that is used to establish and enforce a link between the data in two tables

14.	Can a table have multiple foreign keys?
	Yes, but each references must 

15.	Does a foreign key have to be unique? Can it be null?
	Yes. foreign key references a unique row in the parent table.
	but foreign key column can be NULL. in this case, it references no row in the parent table.
	
16.	Can we create indexes on Table Variables or Temporary Tables?
	No

17.	What is Transaction? What types of transaction levels are there in SQL Server?
	Transaction is single recoverable unit of work that executes either working completely, or not at all.
	There is 5  isolation levels for transaction.
	They are Read uncommitted, Read committed, repeatable read, serializable and snapshot isolation 


Write queries for following scenarios
1.	Write an sql statement that will display the name of each customer 
	and the sum of order totals placed by that customer during the year 2002
	Create table customer(cust_id int,  iname varchar (50)) 
	create table order(order_id int,cust_id int,amount money,order_date smalldatetime)

	Create table Customer(CustomerId int primary key, CustomerName varchar(50))
	Create table Order(OrderId int, CustomerId int foreign key references Customer(CustomerID), 
					   AmountMoney decimal(10,2), orderDate datetime)
	
	select c.CustomerName, sum(o.orderId)
	from Customer c inner join Orders o
	on c.CustomerId = o.OrderId
	where o.orderDate >='2002:01:01' and o.orderDate <='2002:12:31'
	group by c.CustomerName

 2.  The following table is used to store information about company¡¯s personnel:
	Create table person (id int, firstname varchar(100), lastname varchar(100)) 
	write a query that returns all employees whose last names  start with ¡°A¡±.

	Create table Person(Id int, FirstName varchar(100), LastName varchar(100))
	create proc spEmpWithLastName
	@emp varchar(100) out
	as
	begin
		select @emp = p.id, p.FirstName, p.LastName
		from Person p
		where p.LastName like('a%')
	end

3.  The information about company¡¯s personnel is stored in the following table:
	Create table person(person_id int primary key, manager_id int null, name varchar(100)not null) 
	The filed managed_id contains the person_id of the employee¡¯s manager.
	Please write a query that would return the names of all top managers
	(an employee who does not have  a manger, and the number of people that report directly to this manager.)

	create table Person(person_id int primary key, manager_id int null, name varchar(100)not null)
	create proc spTopManagers
	@ManagerName varchar(100) out
	as
	begin
		select @ManagerName = p.name
		from Person p
		where p.manager_id is null
	end
	
4.  List all events that can cause a trigger to be executed.
	insert, update and delete 

5. Generate a destination schema in 3rd Normal Form.  
   Include all necessary fact, join, and dictionary tables, 
   and all Primary and Foreign Key relationships.  
   The following assumptions can be made:

a. Each Company can have one or more Divisions.
	Create table Company(DivisionID, int)
	Create talbe Division(Id int unique)
	
b. Each record in the Company table represents a unique combination 
	we can set a field in Company table as primary key

c. Physical locations are associated with Divisions.
	Create talbe Division(Id int unique, Loc varchar(20))

d. Some Company Divisions are collocated at the same physical of Company Name and Division Name.
e. Contacts can be associated with one or more divisions and the address, 
   but are differentiated by suite/mail drop records.
   status of each association should be separately maintained and audited.
