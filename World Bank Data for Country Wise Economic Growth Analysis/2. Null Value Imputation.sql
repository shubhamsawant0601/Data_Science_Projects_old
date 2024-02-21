-- =============================================================================================================
-- Lets fill up the values from GDP_Per_Capita_Year_Col, Inflation_Year_Col into GDP_Year_Col
-- and values from GDP_Per_Capita_Country_Name, Inflation_Country_Name into GDP_Country_Name
-- and then Rename the GDP_Country_Name and GDP_Year_Col to Country and Years

-- Impute the Column GDP_Country_Name from GDP_Per_Capita_Country_Name
BEGIN TRANSACTION 
UPDATE GDP_GDP_per_capita_Inflation_Joined
SET GDP_Country_Name = GDP_Per_Capita_Country_Name
WHERE (GDP_Country_Name IS NULL) AND (GDP_Per_Capita_Country_Name IS NOT NULL)
COMMIT TRANSACTION

-- Impute the Column GDP_Country_Name from Inflation_Country_Name
BEGIN TRANSACTION
UPDATE GDP_GDP_per_capita_Inflation_Joined
SET GDP_Country_Name = Inflation_Country_Name
WHERE (GDP_Country_Name IS NULL) AND (Inflation_Country_Name IS NOT NULL)
COMMIT TRANSACTION

-- Impute the Column GDP_Year_Col from GDP_Per_Capita_Year_Col
BEGIN TRANSACTION
UPDATE GDP_GDP_per_capita_Inflation_Joined
SET GDP_Year_Col = GDP_Per_Capita_Year_Col
WHERE (GDP_Year_Col IS NULL) AND (GDP_Per_Capita_Year_Col IS NOT NULL)
COMMIT TRANSACTION

-- Impute the Column GDP_Year_Col from Inflation_Year_Col
BEGIN TRANSACTION
UPDATE GDP_GDP_per_capita_Inflation_Joined
SET GDP_Year_Col = Inflation_Year_Col
WHERE (GDP_Year_Col IS NULL) AND (Inflation_Year_Col IS NOT NULL)
COMMIT TRANSACTION

-- =============================================================================================================
-- Rename the GDP_Country_Name & GDP_Year_Col to Country and Years respectively

EXEC sp_rename 'dbo.GDP_GDP_per_capita_Inflation_Joined.GDP_Country_Name', 'Country', 'COLUMN';
EXEC sp_rename 'dbo.GDP_GDP_per_capita_Inflation_Joined.GDP_Year_Col', 'Years', 'COLUMN';

-- =============================================================================================================
-- Delete the columns GDP_Per_Capita_Country_Name, GDP_Per_Capita_Year_Col, Inflation_Country_Name, Inflation_Year_Col
-- As this columns having the redundant data which is already captured in the Country and Years columns

ALTER TABLE GDP_GDP_per_capita_Inflation_Joined
DROP COLUMN GDP_Per_Capita_Country_Name, GDP_Per_Capita_Year_Col, Inflation_Country_Name, Inflation_Year_Col

-- ===================================================================================================================================
-- Lets find out the unique values of the columns GDP_Indicator, GDP_Per_Capita_Indicator, Inflation_Indicator so that if only one 
-- value present in the columns it can be deleted from the table

SELECT DISTINCT GDP_Indicator, GDP_Per_Capita_Indicator, Inflation_Indicator
FROM GDP_GDP_per_capita_Inflation_Joined;

-- We found that there is only one value in both the columns which are GDP (current US$), GDP per capita (current US$) and Inflation, 
-- consumer prices (annual %)respectively, hence we will delete the columns
-- ===================================================================================================================================

-- ===================================================================================================================================
-- Deleting the columns GDP_Indicator, GDP_Per_Capita_Indicator, Inflation_Indicator 

BEGIN TRANSACTION deleting_unnecessary_cols
ALTER TABLE GDP_GDP_per_capita_Inflation_Joined DROP COLUMN GDP_Indicator, GDP_Per_Capita_Indicator, Inflation_Indicator
COMMIT TRANSACTION deleting_unnecessary_cols
-- ===================================================================================================================================


-- ===================================================================================================================================
-- Creating the integer column for the years, so that the year column can be manipulated easily for further analysis
UPDATE GDP_GDP_per_capita_Inflation_Joined
SET Years = SUBSTRING(Years, 6, 10)

-- Changing the data type of the year_Col to Integer
ALTER TABLE GDP_GDP_per_capita_Inflation_Joined
ALTER COLUMN Years INT

-- check the data types
sp_help GDP_GDP_per_capita_Inflation_Joined
-- ===================================================================================================================================

-- ===================================================================================================================================

