use study


SELECT 
SEOUL.Name
, SEOUL.close_
FROM
(
		SELECT A.Name, S.Date_, S.close_
		FROM Companyinfo A
		JOIN StockPrice S
		ON A.ID = S.ID
		WHERE CITY = 'SEOUL' AND S.DATE_='20201012'
) SEOUL
WHERE close_>=500000


SELECT *
FROM StockPrice
WHERE ID = 40853
AND CLOSE_ = (SELECT MAX(CLOSE_) FROM StockPrice WHERE ID=40853)


SELECT 
Name
FROM companyinfo
WHERE ID IN
(
		SELECT ID
		FROM StockPrice S
		GROUP BY ID
		HAVING MAX(CLOSE_)>=500000
)


CREATE VIEW VW_StockPriceWithName
AS
SELECT a.Name
, a.ID
, s.Date_
, s.close_
FROM Companyinfo a
JOIN StockPrice S
ON A.ID = s.ID

﻿SELECT *
FROM VW_StockPriceWithName
WHERE NAME ='NVIDIA'
ORDER BY DATE_

﻿DROP VIEW VW_StockPriceWithName﻿


﻿WITH CTE_PRICE AS
(
SELECT a.Name
, a.ID
, s.Date_
, s.close_
FROM Companyinfo a
JOIN StockPrice S
ON A.ID = s.ID
)


SELECT * FROM CTE_PRICE WHERE NAME='NVIDIA'