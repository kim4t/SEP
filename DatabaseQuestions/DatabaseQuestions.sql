1.	Design a Database for a company to Manage all its projects.
Company has diverse offices in several countries, which manage and co-ordinate the project of that country.
Head office has a unique name, city, country, address, phone number and name of the director.
Every head office manages a set of projects with Project code, title, project starting and end date, assigned budget and name of the person in-charge. One project is formed by the set of operations that can affect to several cities.
We want to know what actions are realized in each city storing its name, country and number of inhabitants.

create table Company(CompanyName varchar(40) primary key, City varchar(20), Country varchar(20), 
					Address varchar(60),Phone varchar(24), DirectorName varchar(30))

create table Project(ProjectId int primary key identity(1,1), PName varchar(20), StartDate datetime,
					 EndDate datetime, Buget decimal(10,2), ManagerName varchar(20), NumOfPeople int)

create table ProjectManage(ProjectId int foreign key references Project(ProjectId),
						   CompanyName varchar(40) foreign key references Company(CompanyName),
						   City varchar(20), Country varchar(20))

insert into Company values('CompanyA', 'Mt.Pleasant','USA','1204EastBroomField',null,'Kim')
insert into Project values('ProjectA',null,null,1500000,'Park',10)
insert into ProjectManage values(1,'CompanyA','Mt.Pleasant','USA')

select* from Company
select* from Project
select* from ProjectManage

2.	Design a database for a lending company which manages lending among people (p2p lending)
Lenders that lending money are registered with an Id, name and available amount of money for the financial operations. 
Borrowers are identified by their id and the company registers their name and a risk value depending on their personal situation.
When borrowers apply for a loan, a new loan code, the total amount, the refund deadline, the interest rate and its purpose are stored in database. 
Lenders choose the amount they want to invest in each loan. A lender can contribute with different partial amounts to several loans.

create table Lender(Id int primary key identity(1,1), LName varchar(20), AvailableAmount decimal(10,2))
create table Borrower(Id int primary key identity(1,1),BName varchar(20), LiskValue int)
create table Loan(LoanId int primary key identity(1,1),
				  LenderId int foreign key references Lender(Id),
				  BorrowerId int foreign key references Borrower(Id),
				  LoanCode varchar(20), TotalAmount decimal(10,2), 
				  RefundDedaLine datetime, InterestRate decimal(6,4), Purpose varchar(20))
create table LoanManager(LoanId int foreign key references Loan(LoanId),
						 LenderId int unique, BorrowerId int unique )

insert into Lender values('Kim',9999999)
insert into Borrower values('Park', 5)
insert into Loan values(1,1,'00001234',6789,null,3.5,'Invest')
insert into LoanManager values (1,1,1)
select* from Lender
select* from Borrower
select* from Loan
select* from LoanManager

3.	Design a database to maintain the menu of a restaurant.
Each course has its name, a short description, photo and final price.
Each course has categories characterized by their names, short description, name of the employee in-charge of them.
Besides the courses some recipes are stored. They are formed by the name of their ingredients, the required amount, units of measurements and the current amount in the store.

create table Course(DescriptID int primary key identity(1,1), RecipeId int unique, CourseName varchar(20), 
					Description nvarchar(40), Photo image, Price decimal(5,2))
insert into Course values (1,'CourseA',null,null,10.25)
insert into Course values (2,'CourseB',null,null,55.42)

create table Description(DescriptID int foreign key references Course(DescriptID) on delete cascade,
						CourseName varchar(20), Description nvarchar(40), EName varchar(20))
insert into Description values(2,'CourseB',null,'Kim')

create table Recipe(RecipeId int unique,IngredientName varchar(20), NeededAmount int, Measurement varchar(10), CurrentAmount int) 
insert into Recipe values (2,'Orange',600,'g',1000)

select* from Course
select* from Description
select* from Recipe