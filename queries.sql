-- creating a database for employees in a company in terms of name, salary, job title, phone extension, whether they are full/part tim

--  Create a database: CompanyDatabase.
createdb CompanyDatabase

pgcli CompanyDatabase


-- Create a table: Employees with the following columns. Use your best judgment for data types. Copy the query you used to create this table and paste it into queries.sql.
CREATE TABLE "Employees" (
  "FullName"      VARCHAR(20) NOT NULL,
  "Salary"         INT,
  "JobPosition"    TEXT,
  "PhoneExtension" INT,
  "IsPartTime"     VARCHAR(3),
  "Id"             SERIAL PRIMARY KEY

);
-- Insert each employee's name, salary, job title, phone extension, whether they are full/part time 

--  Create a few employees. Review the requirements below to see some examples of the values you may need. 
--  For instance, you may need employees of certain job positions, employees with certain names, etc. 
--  Add enough data (maybe 10 rows) such that you can validate your queries. 
--  Copy the queries you used to create your data into queries.sql


INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Tom Cruise', 320, 'Database Administrator', 44512, 'yes');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Mark Zuckerburg', 580, 'Information Security Analyst', 44503, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Warren Buffet', 460, 'Cook', 44601, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Elon Musk', 475, 'Software Developer', 44515, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Tom Hanks', 256, 'Database Administrator', 44514, 'yes');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gordon Ramsay', 305, 'Cook',44317, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension","IsPartTime")
VALUES ('Dwayne Johnson', 412, 'Software Developer', 44701,'yes');

INSERT INTO "Employees" ("FullName", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 'Database Administrator', 44565, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Bill Gates', 543, 'Computer Network Architect', 44526, 'no');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jeff Bezos', 296, 'Information Security Analyst', 44698, 'no');

--  Select all columns for all employees.

SELECT * FROM "Employees"

--  Select only the full names and phone extensions for only full-time employees.

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'no';

-- Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES('Mohamed Ammar', 450, 'Software Developer', 44653, 'yes');

--  Update all employees that are cooks to have a salary of 500.

UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'cook'; -- this one didn't work when I re-selected the table to view

--  Delete all employees that have the full name of "Lazy Larry".

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

--  Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.

ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

------------------------------------------------------------------------------

-- 03-03 - Foreign Keys - The SQL



-- In your CompanyDatabase, add a table named Departments with the following columns:
-- Id as a primary key
-- DepartmentName as text
-- Building as text

CREATE TABLE "Departments" (
  "Id"                SERIAL PRIMARY KEY, 
  "DepartmentName"    TEXT,
  "Building"          TEXT

);

--  Add a Foreign key DepartmentId to your Employees Table. If you have trouble, remove the existing employees by running truncate table "Employees".

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");


-- Add tables named Products and Orders.

-- Products should have the columns:
-- Id as a primary key
-- Price as a double
-- Name as a string
-- Description as a string
-- QuantityInStock as an integer

-- Orders should have the columns:
-- Id as a primary key
-- OrderNumber as a string
-- DatePlaced as a datetime
-- Email as a string

CREATE TABLE "Products" (
  "Id"               SERIAL PRIMARY KEY,
  "Price"            FLOAT,
  "Name"             TEXT,
  "Description"      TEXT,
  "QuantityInStock"  INT
);

CREATE TABLE "Orders" (
  "Id"             SERIAL PRIMARY KEY,
  "OrderNumber"    TEXT,
  "Name"           TEXT,
  "DatePlaced"     TIMESTAMP,
  "Email"          TEXT
);


--  In our company, one Order can have many Products and one Product can have many Orders. This will be a Many-to-Many relationship. Create the necessary table ProductOrders, foreign keys, and the OrderQuantity field needed for this to happen.


CREATE TABLE "ProductOrders" (
  "Id"            SERIAL PRIMARY KEY,
  "productId"     INTEGER REFERENCES "Products" ("Id"),
  "OrderId"       INTEGER REFERENCES "Orders" ("Id"),
  "OrderQuantity" INT
);


--  Insert the following Departments

INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Development', 'Main');
INSERT INTO "Departments" ("DepartmentName", "Building") VALUES ('Marketing', 'North');

-- Insert the following Employees

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', '40000', 'Programmer', 123, 'false', 1);  --should I add the bool value into quotes?!

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manager', 234, 'false', 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, 'true', 2);


--Insert the following Products

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);


--  Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com"

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', 'Jan 1 2020 at 4:55PM', 'person@example.com');


--  Add an order quantity of 3 for the product named Widget to the order X529

INSERT INTO "ProductOrders" ("productId", "OrderId", "OrderQuantity")
VALUES (1, 1, 3);

--  Add an order quantity of 2 for the product named Flowbee to the order X529

INSERT INTO "ProductOrders" ("productID", "OrderID", "OrderQuantity")
VALUES (2, 1, 2);

--  Given a department id, return all employees in the department.

SELECT "FullName" FROM "Employees" WHERE "DepartmentId" = 2;

--  Given a department name, return all the phone extensions.

SELECT "Employees"."PhoneExtension"
FROM "Employees" 
JOIN "Departments" ON "Departments"."Id" = "Employees"."DepartmentId"
WHERE "Departments"."DepartmentName" = 'Development';


--  Find all orders that contain the product id of 2.

SELECT *
FROM "Orders"
JOIN "ProductOrders" ON "ProductOrders"."OrderId" = "Orders"."Id"
JOIN "Products" ON "Products"."Id" = "ProductOrders"."productId"
WHERE "productId" = 2;

--  Remove the Flowbee product from order with order number X529.

DELETE FROM "ProductOrder"
WHERE "Orders"."Number" = "X529" AND "Product"."Name" = "Flowbee"; -- not sure if it will Work


