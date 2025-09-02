--“Are we attracting younger or older customers in each country, and how do their average transaction sizes differ?”
WITH ages AS (
-- Getting the number of customers and their average transaction size
SELECT 
	COUNT(c.customer_id) AS TotalCustomers,
	c.age AS Age ,
	c.country AS Country ,
	AVG(t.transaction_amount) AS TotalAmount
FROM dbo.customers c
LEFT JOIN dbo.transactions1 t
ON c.customer_id = t.customer_id
GROUP BY age , c.country
) 
SELECT
-- Getting the segment total (total customers in each segment)
Country ,
SUM(TotalCustomers) AS SegmentTotal , 
CustomerSegmentation ,
-- Formatting the Total transaction with the $ sign
CONCAT(CAST(ROUND(AVG(TotalAmount),2) AS VARCHAR),'$') AS TotalTransactions 
FROM (
SELECT 
-- Customer segmentation in 3 segments (Young 18-25 , Old 26-40 , 40+)
	TotalCustomers ,
	Country ,
	CASE
		WHEN age BETWEEN 18 AND 25 THEN 'Young'
		WHEN age BETWEEN 26 AND 40 THEN 'Old'
		WHEN age > 40 THEN '40+'
	END AS CustomerSegmentation ,
	TotalAmount

FROM ages
) t
GROUP BY CustomerSegmentation , Country