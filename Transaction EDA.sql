-- Transaction EDA
-- Checking for duplicates
SELECT 
	COUNT(DISTINCT transaction_id)
FROM dbo.transactions1


-- Customer activity Exploration
SELECT 
	COUNT(DISTINCT customer_id)
FROM dbo.transactions1

SELECT
	clicks ,
	COUNT(campaign_id) AS TotalCampaigns
FROM dbo.transactions1
GROUP BY clicks
ORDER BY Clicks


-- Exploring how many campaign failed to get clicks
SELECT 
	clicks ,
	COUNT(campaign_id )
FROM dbo.transactions1
WHERE clicks = 0
GROUP BY clicks

-- Exploring the number of conversions
SELECT
	conversions ,
	COUNT(clicks) AS TotalClicks
FROM dbo.transactions1
GROUP BY conversions
ORDER BY COUNT(clicks)

-- Checking for anamolies

SELECT 
	conversions , 
	clicks 
FROM dbo.transactions1
WHERE conversions = 1 AND clicks = 0


SELECT 
MAX(transaction_date) AS LastDate , 
MIN(transaction_date) AS FirstDate
FROM dbo.transactions1