-- ===================================================================================================================================
-- Creating the unpivoted table from original table to converts columns of year into single column. So that we can analyse the data easily.

SELECT [Country_Name], [Country_Code], [Indicator_Name], [Indicator_Code], Year_Col, Inflation_Rate_Flat
INTO Inflation_Rate_Flat_Updated
FROM
 (SELECT [Country_Name]
	,[Country_Code]
	,[Indicator_Name]
	,[Indicator_Code]
	,[year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022]
  FROM [dbo].[Inflation Rate Flat - World Bank]) pivot_table
  UNPIVOT(Inflation_Rate_Flat for Year_Col IN
	([year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022])
  )AS unpivot_table

-- We have created the columns as Country_Name, Country_Code, Indicator_Name, Indicator_Code, Year_Col & Inflation_Rate_Flat by 
-- transforming the Yearwise columns into single column as Year_Col and save the changes as new table called 'Inflation_Rate_Flat_Updated'
-- ===================================================================================================================================



-- ===================================================================================================================================
-- Creating the unpivoted table from original table to converts columns of year into single column. So that we can analyse the data easily.

SELECT [Country_Name], [Country_Code], [Indicator_Name], [Indicator_Code], Year_Col, GDP_Flat
INTO GDP_Flat_Updated
FROM
 (SELECT [Country_Name]
	,[Country_Code]
	,[Indicator_Name]
	,[Indicator_Code]
	,[year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022]
  FROM [dbo].[GDP Flat - World Bank]) pivot_table
  UNPIVOT(GDP_Flat for Year_Col IN
	([year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022])
  )AS unpivot_table

-- We have created the columns as Country_Name, Country_Code, Indicator_Name, Indicator_Code, Year_Col & GDP_Flat by 
-- transforming the Yearwise columns into single column as Year_Col and save the changes as new table called 'GDP_Flat_Updated'
-- ===================================================================================================================================



-- ===================================================================================================================================
-- Creating the unpivoted table from original table to converts columns of year into single column. So that we can analyse the data easily.

SELECT [Country_Name], [Country_Code], [Indicator_Name], [Indicator_Code], Year_Col, GDP_Per_Capita_Flat
INTO GDP_Per_Capita_Flat_Updated
FROM
 (SELECT [Country_Name]
	,[Country_Code]
	,[Indicator_Name]
	,[Indicator_Code]
	,[year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022]
  FROM [dbo].[GDP Per Capita Flat - World Bank]) pivot_table
  UNPIVOT(GDP_Per_Capita_Flat for Year_Col IN
	([year_1960] ,[year_1961] ,[year_1962] ,[year_1963] ,[year_1964] ,[year_1965] ,[year_1966] ,[year_1967] ,[year_1968] ,[year_1969]
	,[year_1970] ,[year_1971] ,[year_1972] ,[year_1973] ,[year_1974] ,[year_1975] ,[year_1976] ,[year_1977] ,[year_1978] ,[year_1979] 
	,[year_1980] ,[year_1981] ,[year_1982] ,[year_1983] ,[year_1984] ,[year_1985] ,[year_1986] ,[year_1987] ,[year_1988] ,[year_1989] 
	,[year_1990] ,[year_1991] ,[year_1992] ,[year_1993] ,[year_1994] ,[year_1995] ,[year_1996] ,[year_1997] ,[year_1998] ,[year_1999] 
	,[year_2000] ,[year_2001] ,[year_2002] ,[year_2003] ,[year_2004] ,[year_2005] ,[year_2006] ,[year_2007] ,[year_2008] ,[year_2009] 
	,[year_2010] ,[year_2011] ,[year_2012] ,[year_2013] ,[year_2014] ,[year_2015] ,[year_2016] ,[year_2017] ,[year_2018] ,[year_2019] 
	,[year_2020] ,[year_2021] ,[year_2022])
  )AS unpivot_table

-- We have created the columns as Country_Name, Country_Code, Indicator_Name, Indicator_Code, Year_Col & GDP_Flat by 
-- transforming the Yearwise columns into single column as Year_Col and save the changes as new table called 'GDP_Per_Capita_Flat'
-- ===================================================================================================================================

-- ===================================================================================================================================
-- Display all the tables and then join the tables together to get the GDP_Per_Capita_Flat, Inflation_Rate_Flat and GDP_Flat added 
-- to single column on basis of Country and Year Column
SELECT * FROM [dbo].[GDP_Flat_Updated]

SELECT * FROM [dbo].[Inflation_Rate_Flat_Updated]

SELECT * FROM [dbo].[GDP_Per_Capita_Flat_Updated]

-- ===================================================================================================================================
-- Display all the tables and then join the tables together to get the GDP_Per_Capita_Flat, Inflation_Rate_Flat and GDP_Flat added 
-- to single column on basis of Country and Year Column

SELECT gdp_flat.Country_Name AS GDP_Country_Name, 
       gdp_flat.Year_Col AS GDP_Year_Col,
	   gdp_flat.Indicator_Name AS GDP_Indicator,
	   gdp_flat.GDP_Flat AS GDP,

	   inflation_flat.Country_Name AS Inflation_Country_Name, 
       inflation_flat.Year_Col AS Inflation_Year_Col,
	   inflation_flat.Indicator_Name AS Inflation_Indicator,
	   inflation_flat.Inflation_Rate_Flat AS Inflation,

	   gdp_per_capita_flat.Country_Name AS GDP_Per_Capita_Country_Name, 
       gdp_per_capita_flat.Year_Col AS GDP_Per_Capita_Year_Col,
	   gdp_per_capita_flat.Indicator_Name AS GDP_Per_Capita_Indicator,
	   gdp_per_capita_flat.GDP_Per_Capita_Flat AS GDP_Per_Capita

INTO GDP_GDP_per_capita_Inflation_Joined

FROM [dbo].[GDP_Flat_Updated] gdp_flat

FULL OUTER JOIN [dbo].[Inflation_Rate_Flat_Updated] inflation_flat
ON (gdp_flat.[Country_Name] = inflation_flat.[Country_Name]) AND (gdp_flat.[Year_Col] = inflation_flat.[Year_Col])

FULL OUTER JOIN [GDP_Per_Capita_Flat_Updated] gdp_per_capita_flat
ON (gdp_per_capita_flat.[Country_Name] = inflation_flat.[Country_Name]) AND (gdp_per_capita_flat.[Year_Col] = inflation_flat.[Year_Col])
-- ===================================================================================================================================


