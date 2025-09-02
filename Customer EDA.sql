-- Customer EDA
-- Checking for Duplicates
SELECT COUNT(DISTINCT customer_id)
FROM dbo.customers

-- Checking for age outliers and figuring out the age groups
-- Could be segmented to 3 age groups later on
SELECT 
	COUNT(age) AS TotalCustomers ,
	age 
FROM dbo.customers
GROUP BY age
ORDER BY age

-- Countries are USA , Egypt , Brazil , Germany , India , UK , Canada
SELECT 
COUNT(country) AS TotalCustomers ,
country
FROM dbo.customers
GROUP BY country


-- Gender Exploration
SELECT 
	COUNT(gender) AS TotalCustomers ,
	gender
FROM dbo.customers
GROUP BY gender