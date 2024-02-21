-- ===================================================================================================================================
-- Selecting the Top GDP of world where Max GDP of Country for any year is selected. 
-- For e.g. USA will come only once in the list for year for which USA GDP is maximum
-- Every country will come only once in the list for year it has maximum GDP

SELECT * FROM
(SELECT Country, 
	   Years, 
	   GDP, 
	   MAX(GDP) OVER(PARTITION BY Country ORDER BY Country) AS Max_GDP_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)')
) AS Temp_Table
WHERE Max_GDP_For_Country = GDP
ORDER BY GDP DESC

-- ===================================================================================================================================

-- ===================================================================================================================================
-- Selecting the Lowest GDP of world where Lowest GDP of Country for any year is selected. 
-- For e.g. Tulavu will come only once in the list for year for which Tulavu GDP is minimum
-- Every country will come only once in the list for year it has minimum GDP

SELECT * FROM
(SELECT Country, 
	    Years, 
	    GDP, 
	    MIN(GDP) OVER(PARTITION BY Country ORDER BY Country) AS Max_GDP_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)'
					 )
) AS Temp_Table
WHERE Max_GDP_For_Country = GDP
ORDER BY GDP ASC
-- ===================================================================================================================================


-- ===================================================================================================================================
-- Selecting the Top GDP_Per_Capita of world where Max GDP_Per_Capita of Country for any year is selected. 
-- For e.g. Monaco will come only once in the list for year for which Monaco GDP_Per_Capita  is maximum
-- Every country will come only once in the list for year it has maximum GDP_Per_Capita 

SELECT * FROM
(SELECT Country, 
	   Years, 
	   GDP_Per_Capita, 
	   MAX(GDP_Per_Capita) OVER(PARTITION BY Country ORDER BY Country) AS Max_GDP_Per_Capita_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)')
) AS Temp_Table
WHERE Max_GDP_Per_Capita_For_Country = GDP_Per_Capita
ORDER BY GDP_Per_Capita DESC

-- ===================================================================================================================================

-- ===================================================================================================================================
-- Selecting the Lowest GDP_Per_Capita of world where Lowest GDP_Per_Capita of Country for any year is selected. 
-- For e.g. Myanmar will come only once in the list for year for which Myanmar GDP_Per_Capita is minimum
-- Every country will come only once in the list for year it has minimum GDP_Per_Capita

SELECT * FROM
(SELECT Country, 
	    Years, 
	    GDP_Per_Capita, 
	    MIN(GDP_Per_Capita) OVER(PARTITION BY Country ORDER BY Country) AS Max_GDP_Per_Capita_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)'
					 )
) AS Temp_Table
WHERE Max_GDP_Per_Capita_For_Country = GDP_Per_Capita
ORDER BY GDP_Per_Capita ASC
-- ===================================================================================================================================



-- ===================================================================================================================================
-- Selecting the Top Inflation of world where Max Inflation of Country for any year is selected. 
-- For e.g. Congo, Dem. Rep. will come only once in the list for year for which Monaco Inflation is maximum
-- Every country will come only once in the list for year it has maximum Inflation

SELECT * FROM
(SELECT Country, 
	   Years, 
	   Inflation, 
	   MAX(Inflation) OVER(PARTITION BY Country ORDER BY Country) AS Max_Inflation_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)')
) AS Temp_Table
WHERE Max_Inflation_For_Country = Inflation
ORDER BY Inflation DESC

-- ===================================================================================================================================

-- ===================================================================================================================================
-- Selecting the Lowest Inflation of world where Lowest Inflation of Country for any year is selected. 
-- For e.g. Equatorial Guinea will come only once in the list for year for which Equatorial Guinea Inflation is minimum
-- Every country will come only once in the list for year it has minimum Inflation

SELECT * FROM
(SELECT Country, 
	    Years, 
	    Inflation, 
	    MIN(Inflation) OVER(PARTITION BY Country ORDER BY Country) AS Max_Inflation_For_Country

FROM dbo.GDP_GDP_per_capita_Inflation_Joined
WHERE Country NOT IN ( 'World', 'High income', 'OECD members', 'Post-demographic dividend', 
					   'IDA & IBRD total', 'Low & middle income', 'Middle income', 'IBRD only',
					   'East Asia & Pacific', 'Upper middle income', 'Late-demographic dividend',
					   'North America', 'Europe & Central Asia', 'East Asia & Pacific (IDA & IBRD countries)',
					   'East Asia & Pacific (excluding high income)'
					 )
) AS Temp_Table
WHERE Max_Inflation_For_Country = Inflation
ORDER BY Inflation ASC
-- ===================================================================================================================================
