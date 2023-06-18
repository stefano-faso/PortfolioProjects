--name: the name of the meteorite (typically a location, often modified with a number, year, composition, etc)
--id: a unique identifier for the meteorite
--nametype: one of:
-- valid: a typical meteorite
-- relict: a meteorite that has been highly degraded by weather on Earth
--recclass: the class of the meteorite; one of a large number of classes based on physical, chemical, and other characteristics (see the Wikipedia article on meteorite classification for a primer)
--mass: the mass of the meteorite, in grams
--fall: whether the meteorite was seen falling, or was discovered after its impact; one of:
-- Fell: the meteorite's fall was observed
-- Found: the meteorite's fall was not observed
--year: the year the meteorite fell, or the year it was found (depending on the value of fell)
--reclat: the latitude of the meteorite's landing
--reclong: the longitude of the meteorite's landing
--GeoLocation: a parentheses-enclose, comma-separated tuple that combines reclat and reclong

-- Meteors per year

DROP TABLE IF EXISTS #CountMeteorsPerYear
CREATE TABLE #CountMeteorsPerYear
(
year float,
MeteorsPerYear int
)
INSERT INTO #CountMeteorsPerYear (year,MeteorsPerYear)
SELECT year, COUNT(CAST(id AS int)) as MeteorsPerYear
FROM PortfolioProject..Meteorite_Landings
WHERE year is not NULL AND year <=2013
GROUP BY year
ORDER BY year


SELECT *
FROM #CountMeteorsPerYear 
ORDER BY year

-- Max Mass by class

SELECT recclass, MAX([mass (g)]) as MaxMass
FROM PortfolioProject..Meteorite_Landings
GROUP BY recclass
ORDER BY MaxMass DESC

-- Max Mass by fall
SELECT fall, MAX([mass (g)]) as MaxMass
FROM PortfolioProject..Meteorite_Landings
GROUP BY fall
ORDER BY MaxMass DESC

-- Max mass by geolocation
SELECT MAX([mass (g)]) as MaxMass, GeoLocation, reclat, reclong
FROM PortfolioProject..Meteorite_Landings
WHERE GeoLocation != '(0.0,0.0)'AND GeoLocation != '(0.0, 0.0)'  AND GeoLocation is not NULL 
GROUP BY GeoLocation, reclat, reclong
HAVING  MAX([mass (g)]) >= 0.01
ORDER BY GeoLocation



