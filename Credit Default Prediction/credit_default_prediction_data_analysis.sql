-- =================================================================================================================================================================
-- =================================================================================================================================================================
-- Find out the count of Males and Females applying for loan before and after marriage

SELECT Gender, 
		SUM(CASE 
				WHEN Marital_Status_at_the_time_of_application='Married' 
				THEN 1 
				ELSE 0 
			END) AS Married_Count,

		SUM(CASE 
				WHEN Marital_Status_at_the_time_of_application='Single' 
				THEN 1 
				ELSE 0 
			END) AS Unmarried_Count
FROM [dbo].[demographic data]
GROUP BY Gender

-- 14301 Married Females taking loan and 2534 Single Females Taking Loan
-- 46427 Married Males taking loan and 8025 Single Males Taking Loan

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Lets impute the null values of gender column by Male as more number of males taking loan than female when
-- they are married

-- Lets create backup table as we will update the column value
SELECT * 
INTO demographic_data_backup1
FROM [dbo].[demographic data]

-- 4. Update the null values in Gender column as 'M'
UPDATE [dbo].[demographic data]
SET Gender = (CASE
				 WHEN Gender IS NULL 
				 THEN 'M' 
				 ELSE Gender
			  END)

/*-- Below query is to revert the changes in updated column with the help of backup table
UPDATE table_updated
SET table_updated.Gender = backup_table.Gender
FROM [dbo].[demographic data] table_updated
JOIN demographic_data_backup1 backup_table ON table_updated.Application_ID = backup_table.Application_ID
*/
-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Lets Create the Column for Age Group and then analyze the data for certain age groups

-- Add column to the table for age group
 ALTER TABLE [dbo].[demographic data]
 ADD Age_Group VARCHAR(10)

-- Update the Age group column with the text like '0-5' which shows the range of the age
 UPDATE [dbo].[demographic data]
 SET Age_Group = (CASE
		   WHEN Age>=0 AND Age<20 THEN '0-20'
		   WHEN Age>=20 AND Age<25 THEN '20-25'
		   WHEN Age>=25 AND Age<30 THEN '25-30'
		   WHEN Age>=30 AND Age<35 THEN '30-35'
		   WHEN Age>=35 AND Age<40 THEN '35-40'
		   WHEN Age>=40 AND Age<45 THEN '40-45'
		   WHEN Age>=45 AND Age<50 THEN '45-50'
		   WHEN Age>=50 AND Age<55 THEN '50-55'
		   WHEN Age>=55 AND Age<60 THEN '55-60'
		   WHEN Age>=60 AND Age<65 THEN '60-65'
		   WHEN Age>=65 AND Age<70 THEN '65-70'
		   WHEN Age>=70 AND Age<75 THEN '70-75'
		   WHEN Age>=75 AND Age<80 THEN '75-80'
		   WHEN Age>=80 AND Age<85 THEN '80-85'
		   WHEN Age>=85 AND Age<90 THEN '85-90'
		   WHEN Age>=90 AND Age<95 THEN '90-95'
		   WHEN Age>=95 AND Age<100 THEN '95-100'
		   ELSE 'NA'
		 END)

-- Add column to the table for age group
 ALTER TABLE [dbo].[demographic data]
 ADD Age_Group_10 VARCHAR(10)

-- Update the Age group 10 column with the text like '0-10' which shows the range of the age
UPDATE [dbo].[demographic data]
SET Age_Group_10 = (CASE
				WHEN Age>=0 AND Age<10 THEN '0-10'
				WHEN Age>=10 AND Age<20 THEN '10-20'
				WHEN Age>=20 AND Age<30 THEN '20-30'
				WHEN Age>=30 AND Age<40 THEN '30-40'
				WHEN Age>=40 AND Age<50 THEN '40-50'
				WHEN Age>=50 AND Age<60 THEN '50-60'
				WHEN Age>=60 AND Age<70 THEN '60-70'
				WHEN Age>=60 AND Age<70 THEN '70-70'
				WHEN Age>=60 AND Age<70 THEN '80-70'
				WHEN Age>=60 AND Age<70 THEN '90-100'
				ELSE 'NA'
			END)

-- Lets find out which age group earns more income for females and males
SELECT Gender, Age_Group, Age_Group_10, AVG(Income) AS Avg_Income, MAX(Income) AS Max_Income, MIN(Income) AS Min_Income
FROM [dbo].[demographic data] 
GROUP BY Gender, Age_Group_10, Age_Group
HAVING Age_Group <> 'NA'  AND Gender='M'
ORDER BY Avg_Income DESC 

-- Lets find out which age group earns more income for females and males
SELECT Gender, Age_Group, Age_Group_10, AVG(Income) AS Avg_Income, MAX(Income) AS Max_Income, MIN(Income) AS Min_Income
FROM [dbo].[demographic data] 
GROUP BY Gender, Age_Group_10, Age_Group
HAVING Age_Group <> 'NA'  AND Gender='F'
ORDER BY Avg_Income DESC 

-- Income is comparatively higher for age groups of 40-45 and declining after 45 
-- Income for 55 to 60 and afterwards is declining however it is still higher than that of age groups of 30 to 40
-- Income for Age groups of 0 to 25 is much higher than that of 30 to 40

-- Results are almost similar for Females and Males, however only exception is that females with age less than 
-- 20 earns much more than any other group age

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Explore the Education wise and count of genders i.e. count of males and females for each education qualification

SELECT Education,
	   Gender,
	   Count_Gender,
	   count(Count_Gender) OVER(PARTITION BY Gender ORDER BY Education, Gender)
FROM
(SELECT Education,
	   Gender,
	   COUNT(Application_ID) As Count_Gender
FROM [dbo].[demographic data]
GROUP BY Education, Gender) AS t

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out Max, Min, Average value of income for every Education category to show comparison of 
-- income based on education qualification 

SELECT Education, 
	   AVG(Income) AS Avg_Income,
	   MAX(Income) AS Max_Income,
	   MIN(Income) AS Min_Income 
	   
FROM dbo.[demographic data]
GROUP BY Education
HAVING Education IS NOT NULL

-- As per the output, we can see there is no much difference or trend based on education qualification in income

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out on an average how many years of work one has to work to own a house

SELECT Type_of_residence, 
		Age_Group, 
		COUNT(Application_ID) AS Applicants
FROM dbo.[demographic data]
GROUP BY Type_of_residence, Age_Group
ORDER BY Type_of_residence, Applicants DESC

-- As we can see there is no clear trend in type of residence and age groups

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out the relation between Oustanding balance and Performance tag

-- Find out the unique values of the performance tage and if null values are present lets delete the records
SELECT DISTINCT Performance_Tag FROM dbo.[credit bureau data]

-- As the Null values are not allowing the grouping of the data, we will delete the records where performance tag is given as null values
DELETE FROM dbo.[credit bureau data]
WHERE Performance_Tag IS NULL

-- As "Arithmetic overflow error converting expression to data type int" error is thrown while aggregating the column we will set the datatype to BIGINT
ALTER TABLE dbo.[credit bureau data]
ALTER COLUMN Performance_Tag BIGINT

ALTER TABLE dbo.[credit bureau data]
ALTER COLUMN Outstanding_Balance BIGINT;

-- Lets check the count of each instance of performance tag column
SELECT Performance_Tag, COUNT(Performance_Tag) AS count_of_instances FROM dbo.[credit bureau data]
GROUP BY Performance_Tag

-- Lets check the average of outstanding balance for each performance tag
SELECT Performance_Tag, AVG(Outstanding_Balance) Average_Outstanding_Balance
FROM 
(SELECT * 
 FROM dbo.[credit bureau data]
 WHERE Outstanding_Balance IS NOT NULL) AS subq
 GROUP BY Performance_Tag

-- Average outstanding balance for performance tag 1 is 1260412 and for 0 is 1253025
-- There is no clear trend in the relationship of the variables

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Lets change the datatype for the Presence_of_open_home_loan column to BIGINT from bit to allow processing
ALTER TABLE dbo.[credit bureau data]
ALTER COLUMN Presence_of_open_home_loan BIGINT

-- Lets delete the null rows from Presence_of_open_home_loan
DELETE FROM dbo.[credit bureau data]
WHERE Presence_of_open_home_loan IS NULL


 -- Findout the relationship between home loan and outstanding_balance
SELECT Presence_of_open_home_loan, 
	AVG(Outstanding_Balance) AS Average_Outstanding_balance
FROM dbo.[credit bureau data]
GROUP BY Presence_of_open_home_loan

-- As per the analysis output it is clearly seen that whenever there is home loan is present, average outstanding 
-- balance is 32,84,385 and when homeloan is not available then average outstanding balance is 5,41,030


 -- Findout the relationship between auto loan and outstanding_balance
SELECT Presence_of_open_auto_loan, 
	AVG(Outstanding_Balance) AS Average_Outstanding_balance
FROM dbo.[credit bureau data]
GROUP BY Presence_of_open_auto_loan

-- As per the analysis output it is clearly seen that whenever there is home loan is present, average outstanding 
-- balance is 14,76,981 and when home loan is not available then average outstanding balance is 12,32,507

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out the relation between age groups and home loan takers

SELECT Age_Group, 
       SUM(CAST(Home_Loan AS INT)) AS home_loan
FROM
	(SELECT demo.Application_ID,
			demo.Age_Group AS Age_Group,
			cred.Presence_of_open_home_loan AS Home_Loan
	 FROM [dbo].[demographic data] demo
	 INNER JOIN [dbo].[credit bureau data] cred
	 ON demo.Application_ID = cred.Application_ID) AS subquery

GROUP BY Age_Group
ORDER BY home_loan DESC

-- Age groups of 40-45, 50-55 and 45-50 have maximum home loans
-- Age groups of 0-20, 20-25 and 65-70 have minimum home loans which is very obvious

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out the relation between age groups and car loan takers

SELECT Age_Group, 
       SUM(CAST(Car_Loan AS INT)) AS car_loan
FROM
	(SELECT demo.Application_ID,
			demo.Age_Group AS Age_Group,
			cred.Presence_of_open_auto_loan AS Car_Loan
	 FROM [dbo].[demographic data] demo
	 INNER JOIN [dbo].[credit bureau data] cred
	 ON demo.Application_ID = cred.Application_ID) AS subquery

GROUP BY Age_Group
ORDER BY car_loan DESC

-- Similar to home loans car loan owners also have age groups of 40-45, 45-50 and 50-55 as maximum loan takers
-- Age groups of 0-20, 20-25 and 65-70 have minimum car loans which is very obvious

-- =================================================================================================================================================================
-- =================================================================================================================================================================

-- Find out how many people having homeloan lives in self owned houses

 SELECT Type_of_residence, 
		SUM(Presence_of_open_home_loan) AS Home_Loan_Present
FROM [dbo].[demographic data] demo
INNER JOIN [dbo].[credit bureau data] cred
ON demo.Application_ID = cred.Application_ID 
GROUP BY Type_of_residence
HAVING Type_of_residence IS NOT NULL
ORDER BY Home_Loan_Present DESC

-- 13,525 people having homeloan are living in rented house, 3600 people having homeloan lives in owned home, 470 people living with parents have homeloan
-- 422 people lives in company provided residence while having home loans

-- =================================================================================================================================================================
-- =================================================================================================================================================================