
select distinct Commute_Distance
from PortfolioProject..bike_buyers

SELECT Gender,Purchased_Bike, AVG(Income) AS AverageIncome
FROM PortfolioProject..bike_buyers
GROUP BY Gender, Purchased_Bike
ORDER BY 1,2


ALTER TABLE PortfolioProject..bike_buyers
ADD Age_Range nvarchar(255)

UPDATE PortfolioProject..bike_buyers
SET Age_Range = 
				  Case When Age  between 1 AND 25 THEN 'Young' 
					When Age  between 26 AND 40 THEN 'Middle Age'
					When Age >=41 THEN 'Old'
					ELSE Null
				END 

SELECT Age_Range,Purchased_Bike,COUNT(Purchased_Bike) AS NumberBikes
FROM PortfolioProject..bike_buyers
GROUP BY Age_Range, Purchased_Bike
ORDER BY 1,2


ALTER TABLE PortfolioProject..bike_buyers
ADD Distance int

UPDATE PortfolioProject..bike_buyers
SET Distance = 
	Case 
	When Commute_Distance = '0-1 Miles' Then 1
	When Commute_Distance = '1-2 Miles' Then 2
	when Commute_Distance = '2-5 Miles' Then 5
	when Commute_Distance = '5-10 Miles' Then 10
	when Commute_Distance = '10+ Miles' Then 20
	ELSE Null
	END
SELECT Purchased_Bike,COUNT(Purchased_Bike) as TotalBikesPurchased, Distance
FROM PortfolioProject..bike_buyers
GROUP By Distance,Purchased_Bike
ORDER By Distance


