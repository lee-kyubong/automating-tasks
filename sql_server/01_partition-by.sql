USE study
GO

EXEC sp_help stockprice
GO

SELECT 
	city, 
	SUM(employees) as total_emp,
	MAX(employees) as max_num_emp,
	COUNT(*)
FROM
	companyinfo
GROUP BY 
	City
HAVING
	SUM(employees) >= 2000000

GO

-- rank fn, partition by
SELECT
	Name,
	Employees,
	ROW_NUMBER() OVER (ORDER BY Employees DESC) AS ranking
FROM
	companyinfo
ORDER BY ranking
GO

-- moving_fn / offset n
SELECT
	date_,
	LAG(close_, 1) OVER (ORDER BY date_) as 'D-1 closing',
	close_,
	LEAD(close_, 1) OVER (ORDER BY date_) as 'D+1 closing'
FROM
	StockPrice
WHERE
	ID = 40853
ORDER BY
	Date_

EXEC sp_help companyinfo
SELECT TOP 10 * FROM companyinfo


SELECT 
	name,
	incinctrycode,
	employees,
	RANK() OVER (PARTITION BY incinctrycode ORDER BY employees DESC) AS 'ranking'
FROM
	companyinfo
WHERE
	IncInCtryCode = 'KOR'


SELECT
	date_
	, ID
	, close_/LAG(close_, 1) OVER (PARTITION BY ID ORDER BY date_)-1 AS 'return_ratio'
FROM
	StockPrice
order by
	date_ DESC



