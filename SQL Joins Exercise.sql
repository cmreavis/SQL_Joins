/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name as Product, c.Name as Category
FROM products as p
INNER JOIN categories as c ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name as Product, p.Price as Price, r.Rating as Rating
 FROM products as p
 INNER JOIN reviews as r ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Sum
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID 		/*without the group by statement, only one employee will show up! */
ORDER BY Sum DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as Department, c.Name as Category
FROM departments as d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS Name, Sum(s.Quantity) AS Quantity_Sold, Sum(s.PricePerUnit) AS Total_Price_Sold
FROM products as p
INNER JOIN sales as s ON s.ProductID = p.ProductID
WHERE s.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT *
FROM products
WHERE Name LIKE '%Visio%';

SELECT p.Name, r.Reviewer AS Reviewer_Name, r.Rating AS Rating, r.Comment AS Comment
FROM products AS p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE r.ProductID = 857
ORDER BY r.Rating ASC
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product_Name, Sum(s.Quantity) AS Total_Sales
FROM Sales as s
INNER JOIN employees as e ON e.EmployeeID = s.EmployeeID  /* two joins */
INNER JOIN products as p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID 		/* had to remember to group by the productID AS WELL AS the employeeID */
ORDER BY EmployeeID;

