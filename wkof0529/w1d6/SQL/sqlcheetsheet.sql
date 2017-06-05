-- https://community.modeanalytics.com/sql/tutorial/introduction-to-sql/
-- STRUCTURED QUERY LANGUAGE
1. Think of INNER JOIN as the set intersection of a venn diagram
2. Think of OUTER JOIN
  - LEFT OUTER JOIN as similar to the entire left circle of the venn diagram including the intersection of the left and right circles. This makes use of foreign keys
  - RIGHT OUTER JOIN as simialr to the entire right circle of the venn diagram including the intersection of the left and right circles. This makes use of foreign keys
  - FULL OUTER JOIN as the union of the two circles including the intersection, that makes use of foreign keys.


-- SELECT
-- FROM
-- WHERE
-- COUNT 
-- SUM
-- IN (a group or list to filter)
-- NOT IN
-- JOIN 
-- AS 
-- ON 
-- IS 
-- BETWEEN (A-inclusive AND B-exclusive)
-- NULL 
-- NOT NULL 
-- ORDER BY 
-- GROUP BY 
-- DESC 
-- ASC 
-- =, !=, >, >=, <, <= 



SOME EXAMPLES OF QUERYING
-- 1. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- For all cars in the database, show Model Name, VIN and Sticker Price from the Model and Car tables in one result set.
SELECT ModelName, VIN, StickerPrice FROM model INNER JOIN car ON model.ModelID = car.ModelID;

-- 2. In a car database there is a Make table with columns, MakeID and MakeName, a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- For all cars in the database, show Make Name, Model Name, VIN and Sticker Price from the Model and Car tables in one result set.
SELECT MakeName, ModelName, VIN, StickerPrice FROM make INNER JOIN model ON make.MakeID = model.MakeID INNER JOIN car ON model.ModelID = car.ModelID;

-- 3. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Show all Model names from the Model table along with VIN from the Car table. Make sure models that aren’t in the Car table still show in the results!
SELECT ModelName, VIN FROM model LEFT OUTER JOIN car ON car.ModelID = model.ModelID;

-- 4. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate. The database also has a SalesRep table with columns, SalesRepID, FirstName, LastName, SSN, PhoneNumber, StreetAddress, City, State and ZipCode.
-- Show all SaleDate, SaleAmount, and SalesRep First and Last name from Sale and SalesRep. Make sure that all Sales appear in results even if there is no SalesRep associated to the sale.
SELECT sale.SaleDate, sale.SaleAmount, salesRep.firstName, salesRep.lastName FROM sale LEFT OUTER JOIN salesrep ON sale.SalesRepID = salesrep.SalesRepID;

-- 5. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a distinct result set of fruit and vegetable names.
SELECT fruit.Name FROM fruit UNION SELECT vegetable.Name FROM vegetable;

-- 6. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a list of all fruits and vegetables starting with the letters A through K . In other words all fruit and vegetables that don't start with the letter L to Z.
SELECT fruit.Name FROM fruit WHERE fruit.Name BETWEEN "A" AND "L" UNION SELECT vegetable.Name FROM vegetable WHERE vegetable.Name BETWEEN "A" AND "L";

-- 7. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a list of fruits and vegetables that includes any potential duplicate values. Ensure that it is in alphabetical order so that the duplicates are next to each other!
SELECT fruit.Name FROM fruit UNION ALL SELECT vegetable.Name FROM vegetable ORDER BY Name ASC;

-- 8. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of produce that is considered both a fruit and a vegetable.
SELECT name FROM fruit INTERSECT SELECT name FROM vegetable ORDER BY name ASC;

-- 9. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of fruits that are NOT considered a vegetable.
SELECT name FROM fruit EXCEPT SELECT name FROM vegetable ORDER BY name ASC;

-- 10. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of vegetables that are NOT considered a fruit.
SELECT name FROM vegetable EXCEPT SELECT name FROM fruit ORDER BY name ASC;

-- 11. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Use a subquery along with IN to list all the Model Names with a Sticker Price greater than $30000
SELECT ModelName FROM Model WHERE ModelID IN ( SELECT ModelID FROM Car WHERE StickerPrice > 30000 );

-- 12. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Use a subquery along with IN to list all sales of cars with Sticker Price greater than $30000. Include all columns.
SELECT * FROM Sale WHERE CarID IN ( SELECT CarID FROM Car WHERE StickerPrice > 30000 );

-- 13. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Customer table with columns, CustomerID, FirstName, LastName, Gender and SSN.
-- Use a subquery along with IN to list all sales to female customers. (Gender = 'F') Select all columns.
SELECT * FROM sale WHERE sale.CustomerID IN (SELECT CustomerID FROM customer WHERE customer.Gender = 'F');


-- 14. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Customer table with columns, CustomerID, FirstName, LastName, Gender and SSN.
-- Use a subquery as a derived table to show all sales to female ('F') customers. Select all columns from the Sale table only.
SELECT * FROM Sale AS s 
INNER JOIN (
  SELECT CustomerID FROM Customer
  WHERE Gender = 'F'
) AS c 
ON s.CustomerID = c.CustomerID;






-- Querying Relational Databases Cheatsheet
-- SQL JOINs

-- JOINs merge related data from multiple tables together in to result set.
-- The two most common types of joins are:
-- INNER JOIN
-- OUTER JOIN
-- INNER JOINs

-- INNER JOINs return rows that match from both tables.
SELECT <columns> FROM <table 1> 
  INNER JOIN <table 2> ON <table 1>.<column> = <table 2>.<column>;

SELECT <columns> FROM <table 1> AS <table 1 alias> 
  INNER JOIN <table 2> AS <table 2 alias> ON <table 1 alias>.<column> = <table 2 alias>.<column>;

-- Examples:
SELECT product_name, category FROM products
  INNER JOIN product_categories ON products.category_id = product_categories.id;

SELECT products.product_name, product_categories.category FROM products
  INNER JOIN product_categories ON products.category_id = product_categories.id;

SELECT p.product_name, c.category FROM products AS p
  INNER JOIN product_categories AS c ON p.category_id = c.id;  

-- INNER JOINing multiple tables:
SELECT <columns> FROM <table 1> 
  INNER JOIN <table 2> ON <table 1>.<column> = <table 2>.<column>
  INNER JOIN <table 3> ON <table 1>.<column> = <table 3>.<column>;

-- Examples:
SELECT users.full_name, sales.amount, products.name FROM sales 
  INNER JOIN users ON sales.user_id = users.id
  INNER JOIN products ON sales.product_id = products.id;


-- OUTER JOINs
-- There are 3 types of OUTER JOINs:
-- LEFT OUTER JOIN - JOINs all matching data and all non-matching rows from the left table in the query

-- RIGHT OUTER JOIN - JOINs all matching data and all non-matching rows from the right table in the query

-- FULL OUTER JOIN - JOINs all matching data and then all non-matching rows from both tables.


SELECT <columns> FROM <left table> 
  LEFT OUTER JOIN <right right> ON <left table>.<column> = <right table>.<column>;

SELECT <columns> FROM <left table> AS <left alias> 
  LEFT OUTER JOIN <right table> AS <right alias> 
  ON <left alias>.<column> = <right alias>.<column>;

-- Example
-- If you wanted to get the product count for every category, even categories without products, an OUTER JOIN is the best solution. The following two examples will yield the same results, however one is an

SELECT categories.name, COUNT(products.id) AS "Product Count" FROM categories
  LEFT OUTER JOIN products ON categories.id = products.category_id;

SELECT categories.name, COUNT(products.id) AS "Products Count" FROM products
  RIGHT OUTER JOIN categories ON categories.id = products.category_id;



-- Set Operations
-- Set operations merge data in to one set based on column definitions and the data contained within each column.
-- The four set operations are:
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT

-- The number of columns need to match. If number of columns don't match it'll result in an error.
-- <query 1> <set operation> <query 2>
SELECT <column> FROM <table 1> <set operation> SELECT <column> FROM <table 2>;
SELECT <column>, <column> FROM <table 1> <set operation> SELECT <column>, <column> FROM <table 2>;

-- UNION Examples
-- Unions return all distinct values from both data sets with no duplicates.
-- Get a list of unique restaurants from both north and south malls.
SELECT store FROM mall_south WHERE type = "restaurant"
  UNION 
SELECT store FROM mall_north WHERE type = "restaurant";

-- Get a list of unique classes taught in two schools. Order them by their class name.
SELECT evening_class FROM school_1 UNION SELECT evening_class FROM school_2
  ORDER BY evening_class ASC;


-- UNION ALL
-- Union all returns all values from both data sets – with duplicates.
-- Get a list of all names for boys and girls and order them by name.
SELECT boy_name AS name FROM boy_baby_names 
  UNION ALL 
SELECT girl_name AS name FROM girl_baby_names
  ORDER by name;


-- INTERSECT
-- Returns only values that are in both data sets.
-- Get list of classes offered in both schools.
SELECT evening_class FROM school_1 INTERSECT SELECT evening_class FROM school_2
  ORDER BY evening_class ASC;

-- Get list of restaurants at both mall locations.
SELECT store FROM mall_south WHERE type = "restaurant"
  INTERSECT 
SELECT store FROM mall_north WHERE type = "restaurant";


-- EXCEPT
-- Returns data from the first data set that's not in the second.
-- Get a list of local stores in a mall.
SELECT store FROM mall
  EXCEPT
SELECT store FROM all_stores WHERE type = "national"


-- Subqueries
-- Subqueries are queries within queries. A subquery can also be called an inner query with the "parent" query being called the outer query.
-- There are two main ways to use a subquery:
-- In an IN condition
-- As a derived or temporary table
-- A subquery in an IN condition must only have one column.

SELECT <columns> FROM <table 1> WHERE <table 1>.<column> IN (<subquery>);
SELECT <columns> FROM <table 1> 
  WHERE <table 1>.<column> IN (SELECT <a single column> FROM <table 2> WHERE <condition>);
-- Examples:
-- Get a list of user's names and emails for users who have spent over 100 dollars in a single transaction.
SELECT name, email FROM users 
  WHERE id IN (SELECT DISTINCT(user_id) FROM sales WHERE saleAmount > 100);
-- // OR
SELECT name, email FROM users
  INNER JOIN (SELECT DISTINCT(user_id) FROM sales WHERE saleAmount > 100) AS best_customers
  ON users.id = best_customers.user_id;

-- Get a list of user's names and emails for users who have spent over 1000 dollars in total.
SELECT name, email FROM users WHERE id IN (SELECT user_id FROM sales WHERE SUM(saleAmount) > 1000 GROUP BY user_id);
-- // OR
SELECT name, email, total FROM users 
  INNER JOIN (SELECT user_id, SUM(saleAmount) AS total FROM sales WHERE total > 1000 GROUP BY user_id) AS ultimate_customers
  ON users.id = ultimate_customers.user_id;