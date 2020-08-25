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














