-- Campaign EDA (Exploratory data analysis)

SELECT COUNT( DISTINCT campaign_id)
FROM dbo.campaigns

SELECT 
	COUNT(channel) AS TotalChannels,
	channel
FROM dbo.campaigns
GROUP BY channel

SELECT SUM(budget_usd) AS TotalSpending
FROM dbo.campaigns

SELECT 
	SUM(budget_usd) AS TotalSpending,
	channel
FROM dbo.campaigns
GROUP BY channel
 

 -- Checking for date anamolies 
SELECT 
start_date , 
end_date ,
DATEDIFF(MONTH ,start_date , end_date) AS DateDifference
FROM dbo.campaigns
WHERE end_date < start_date