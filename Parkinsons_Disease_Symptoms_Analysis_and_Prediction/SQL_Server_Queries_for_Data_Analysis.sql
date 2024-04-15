-- ===========================================================================================================================================================================
-- Select all the records from the dataset
SELECT COUNT(*) AS TotalRecords FROM parkinsons_disease_data;

-- Total we have 195 records
-- ===========================================================================================================================================================================

-- Lets find out the average, max and min values for following variables
-- MDVP:Fo(Hz) - Average vocal fundamental frequency
-- MDVP:Fhi(Hz) - Maximum vocal fundamental frequency
-- MDVP:Flo(Hz) - Minimum vocal fundamental frequency

SELECT 
    MIN(MDVP_Fo_Hz) AS MinFo,
    MAX(MDVP_Fo_Hz) AS MaxFo,
    AVG(MDVP_Fo_Hz) AS AvgFo,
    MIN(MDVP_Fhi_Hz) AS MinFhi,
    MAX(MDVP_Fhi_Hz) AS MaxFhi,
    AVG(MDVP_Fhi_Hz) AS AvgFhi,
    MIN(MDVP_Flo_Hz) AS MinFlo,
    MAX(MDVP_Flo_Hz) AS MaxFlo,
    AVG(MDVP_Flo_Hz) AS AvgFlo
FROM parkinsons_disease_data;

-- ===========================================================================================================================================================================
-- MinFo               MaxFo               AvgFo				MinFhi				MaxFhi				AvgFhi			MinFlo				MaxFlo				AvgFlo				
-- 88.3330001831055	260.105010986328	154.228641373072	102.144996643066	592.030029296875	197.10491794684	65.4759979248047	239.169998168945	116.324630502554

-- ===========================================================================================================================================================================

-- Find out the count of patients for each category of status i.e. how many patients are positive for perkinson's disease and how many are negative
SELECT 
    status, 
    COUNT(*) AS PatientCount,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM parkinsons_disease_data) AS Percentage
FROM parkinsons_disease_data 
GROUP BY status;

-- There are 48 i.e. 24.6% patients out of 195 i.e. 75.38% who are not having disease while 147 are reported positive for the disease
-- hence data is imbalanced

-- ===========================================================================================================================================================================

-- Findout the top 5 patients with highest shimmer and jitter 
SELECT TOP 5
    *,
    (MDVP_Shimmer + MDVP_Jitter) AS TotalShimmerJitter
FROM dbo.parkinsons_disease_data
ORDER BY TotalShimmerJitter DESC

-- Following are the patients with highest average shimmer and jitter
--  'phon_R01_S35_6',  =>  0.150149999186397
--  'phon_R01_S24_4',  =>  0.124940000474453
--  'phon_R01_S24_6',  =>  0.124300001189113
--  'phon_R01_S35_7',  =>  0.113979997113347
--  'phon_R01_S35_1'  =>  0.0971100032329559

-- ===========================================================================================================================================================================

-- The maximum, minimum and range values for each column of the dataset
-- Query to get the maximum values for each column
SELECT 
    'Max' AS Statistic,
    MAX(MDVP_Fo_Hz) AS MDVP_Fo_Hz,
    MAX(MDVP_Fhi_Hz) AS MDVP_Fhi_Hz,
    MAX(MDVP_Flo_Hz) AS MDVP_Flo_Hz,
    MAX(MDVP_Jitter) AS MDVP_Jitter,
    MAX(MDVP_Jitter_Abs) AS MDVP_Jitter_Abs,
    MAX(MDVP_RAP) AS MDVP_RAP,
    MAX(MDVP_PPQ) AS MDVP_PPQ,
    MAX(Jitter_DDP) AS Jitter_DDP,
    MAX(MDVP_Shimmer) AS MDVP_Shimmer,
    MAX(MDVP_Shimmer_dB) AS MDVP_Shimmer_dB,
    MAX(Shimmer_APQ3) AS Shimmer_APQ3,
    MAX(Shimmer_APQ5) AS Shimmer_APQ5,
    MAX(MDVP_APQ) AS MDVP_APQ,
    MAX(Shimmer_DDA) AS Shimmer_DDA,
    MAX(NHR) AS NHR,
    MAX(HNR) AS HNR,
    MAX(RPDE) AS RPDE,
    MAX(DFA) AS DFA,
    MAX(spread1) AS spread1,
    MAX(spread2) AS spread2,
    MAX(D2) AS D2,
    MAX(PPE) AS PPE
FROM [dbo].[parkinsons_disease_data]

UNION ALL

-- Query to get the minimum values for each column
SELECT 
    'Min' AS Statistic,
    MIN(MDVP_Fo_Hz) AS MDVP_Fo_Hz,
    MIN(MDVP_Fhi_Hz) AS MDVP_Fhi_Hz,
    MIN(MDVP_Flo_Hz) AS MDVP_Flo_Hz,
    MIN(MDVP_Jitter) AS MDVP_Jitter,
    MIN(MDVP_Jitter_Abs) AS MDVP_Jitter_Abs,
    MIN(MDVP_RAP) AS MDVP_RAP,
    MIN(MDVP_PPQ) AS MDVP_PPQ,
    MIN(Jitter_DDP) AS Jitter_DDP,
    MIN(MDVP_Shimmer) AS MDVP_Shimmer,
    MIN(MDVP_Shimmer_dB) AS MDVP_Shimmer_dB,
    MIN(Shimmer_APQ3) AS Shimmer_APQ3,
    MIN(Shimmer_APQ5) AS Shimmer_APQ5,
    MIN(MDVP_APQ) AS MDVP_APQ,
    MIN(Shimmer_DDA) AS Shimmer_DDA,
    MIN(NHR) AS NHR,
    MIN(HNR) AS HNR,
    MIN(RPDE) AS RPDE,
    MIN(DFA) AS DFA,
    MIN(spread1) AS spread1,
    MIN(spread2) AS spread2,
    MIN(D2) AS D2,
    MIN(PPE) AS PPE
FROM [dbo].[parkinsons_disease_data]

UNION ALL

-- Query to calculate the range for each column
SELECT 
    'Range' AS Statistic,
    MAX(MDVP_Fo_Hz) - MIN(MDVP_Fo_Hz) AS MDVP_Fo_Hz,
    MAX(MDVP_Fhi_Hz) - MIN(MDVP_Fhi_Hz) AS MDVP_Fhi_Hz,
    MAX(MDVP_Flo_Hz) - MIN(MDVP_Flo_Hz) AS MDVP_Flo_Hz,
    MAX(MDVP_Jitter) - MIN(MDVP_Jitter) AS MDVP_Jitter,
    MAX(MDVP_Jitter_Abs) - MIN(MDVP_Jitter_Abs) AS MDVP_Jitter_Abs,
    MAX(MDVP_RAP) - MIN(MDVP_RAP) AS MDVP_RAP,
    MAX(MDVP_PPQ) - MIN(MDVP_PPQ) AS MDVP_PPQ,
    MAX(Jitter_DDP) - MIN(Jitter_DDP) AS Jitter_DDP,
    MAX(MDVP_Shimmer) - MIN(MDVP_Shimmer) AS MDVP_Shimmer,
    MAX(MDVP_Shimmer_dB) - MIN(MDVP_Shimmer_dB) AS MDVP_Shimmer_dB,
    MAX(Shimmer_APQ3) - MIN(Shimmer_APQ3) AS Shimmer_APQ3,
    MAX(Shimmer_APQ5) - MIN(Shimmer_APQ5) AS Shimmer_APQ5,
    MAX(MDVP_APQ) - MIN(MDVP_APQ) AS MDVP_APQ,
    MAX(Shimmer_DDA) - MIN(Shimmer_DDA) AS Shimmer_DDA,
    MAX(NHR) - MIN(NHR) AS NHR,
    MAX(HNR) - MIN(HNR) AS HNR,
    MAX(RPDE) - MIN(RPDE) AS RPDE,
    MAX(DFA) - MIN(DFA) AS DFA,
    MAX(spread1) - MIN(spread1) AS spread1,
    MAX(spread2) - MIN(spread2) AS spread2,
    MAX(D2) - MIN(D2) AS D2,
    MAX(PPE) - MIN(PPE) AS PPE
FROM [dbo].[parkinsons_disease_data];

-- ===========================================================================================================================================================================

-- Average value of MDVP_Fo_Hz for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Fo_Hz'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Fhi_Hz for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Fhi_Hz'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Flo_Hz for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Flo_Hz'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Jitter for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Jitter'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Jitter_Abs for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Jitter_Abs'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_RAP for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_RAP'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_PPQ for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_PPQ'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of Jitter_DDP for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'Jitter_DDP'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Shimmer for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Shimmer'
FROM dbo.parkinsons_disease_data
GROUP BY status

-- 0	Negative	180.51353143186
-- 1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_Shimmer_dB for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_Shimmer_dB'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of Shimmer_APQ3 for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'Shimmer_APQ3'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of Shimmer_APQ5 for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'Shimmer_APQ5'
FROM dbo.parkinsons_disease_data
GROUP BY status

-- 0	Negative	180.51353143186
-- 1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of MDVP_APQ for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'MDVP_APQ'
FROM dbo.parkinsons_disease_data
GROUP BY status

-- 0	Negative	180.51353143186
-- 1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of Shimmer_DDA for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'Shimmer_DDA'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of NHR for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'NHR'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of HNR for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'HNR'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of RPDE for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'RPDE'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of DFA for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'DFA'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of spread1 for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'spread1'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of spread2 for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'spread2'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of D2 for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'D2'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365
-- ===========================================================================================================================================================================

-- Average value of PPE for positive and negative status

SELECT status AS Status, 
	CASE 
        WHEN status = 1 THEN 'Positive'
        WHEN status = 0 THEN 'Negative'
	END AS Status_Numeric,
	AVG(MDVP_Fo_Hz) AS 'PPE'
FROM dbo.parkinsons_disease_data
GROUP BY status

--0	Negative	180.51353143186
--1	Positive	145.474650866365



-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Fo_Hz

SELECT TOP 10 name,
		MDVP_Fo_Hz
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Fo_Hz DESC

--phon_R01_S42_3 =>260.105010986328
--phon_R01_S10_6 =>252.455001831055
--phon_R01_S10_5 =>245.509994506836
--phon_R01_S42_6 =>244.990005493164
--phon_R01_S10_3 =>243.438995361328
--phon_R01_S10_4 =>242.852005004883
--phon_R01_S10_2 =>241.404006958008
--phon_R01_S42_5 =>240.300994873047
--phon_R01_S42_2 =>237.322998046875
--phon_R01_S10_1 =>237.225997924805
-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Fhi_Hz

SELECT TOP 10 name,
		MDVP_Fhi_Hz
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Fhi_Hz DESC

--phon_R01_S49_4 =>592.030029296875
--phon_R01_S19_2 =>588.518005371094
--phon_R01_S24_6 =>586.567016601563
--phon_R01_S49_5 =>581.289001464844
--phon_R01_S35_4 =>565.739990234375
--phon_R01_S27_1 =>492.891998291016
--phon_R01_S27_6 =>479.696990966797
--phon_R01_S27_3 =>450.247009277344
--phon_R01_S27_4 =>442.824005126953
--phon_R01_S27_2 =>442.557006835938
-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Flo_Hz

SELECT TOP 10 name,
		MDVP_Flo_Hz
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Flo_Hz DESC

--phon_R01_S42_6 =>239.169998168945
--phon_R01_S42_3 =>237.302993774414
--phon_R01_S10_2 =>232.483001708984
--phon_R01_S10_3 =>232.434997558594
--phon_R01_S10_5 =>231.848007202148
--phon_R01_S42_2 =>229.255996704102
--phon_R01_S10_4 =>227.910995483398
--phon_R01_S10_1 =>225.227005004883
--phon_R01_S17_4 =>223.634002685547
--phon_R01_S17_5 =>221.156005859375
-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Jitter

SELECT TOP 10 name,
		MDVP_Jitter
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Jitter DESC

--phon_R01_S24_4 =>0.033160001039505
--phon_R01_S35_6 =>0.0310699995607138
--phon_R01_S24_6 =>0.0301099997013807
--phon_R01_S35_7 =>0.0271400008350611
--phon_R01_S24_3 =>0.0193600002676249
--phon_R01_S35_5 =>0.0187199991196394
--phon_R01_S37_5 =>0.018130000680685
--phon_R01_S35_3 =>0.0171900000423193
--phon_R01_S35_4 =>0.016270000487566
--phon_R01_S35_1 =>0.0156800001859665

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Jitter_Abs

SELECT TOP 10 name,
		MDVP_Jitter_Abs
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Jitter_Abs DESC

--phon_R01_S24_4 =>0.000260000000707805
--phon_R01_S24_6 =>0.00022000000171829
--phon_R01_S35_6 =>0.00015999999595806
--phon_R01_S24_3 =>0.000150000007124618
--phon_R01_S37_5 =>0.000150000007124618
--phon_R01_S35_7 =>0.00014000000373926
--phon_R01_S24_5 =>0.000119999996968545
--phon_R01_S01_5 =>0.000110000000859145
--phon_R01_S24_2 =>0.000110000000859145
--phon_R01_S20_2 =>9.99999974737875E-05

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_RAP

SELECT TOP 10 name,
		MDVP_RAP
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_RAP DESC

--phon_R01_S24_4 =>0.0214399993419647
--phon_R01_S24_6 =>0.0185400005429983
--phon_R01_S35_6 =>0.0179999992251396
--phon_R01_S35_7 =>0.0156800001859665
--phon_R01_S24_3 =>0.0115900002419949
--phon_R01_S37_5 =>0.0111699998378754
--phon_R01_S35_5 =>0.0107500003650784
--phon_R01_S35_3 =>0.00996000040322542
--phon_R01_S35_4 =>0.00918999966233969
--phon_R01_S24_5 =>0.00905000045895576

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_PPQ

SELECT TOP 10 name,
		MDVP_PPQ
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_PPQ DESC

--phon_R01_S02_2 =>12
--phon_R01_S35_6 =>0.0195799991488457
--phon_R01_S35_7 =>0.0169900003820658
--phon_R01_S24_6 =>0.0162799991667271
--phon_R01_S24_4 =>0.0152200004085898
--phon_R01_S35_5 =>0.0115400003269315
--phon_R01_S35_3 =>0.0102700004354119
--phon_R01_S24_3 =>0.00989999994635582
--phon_R01_S35_4 =>0.00963000021874905
--phon_R01_S35_1 =>0.00946000032126904

-- ===========================================================================================================================================================================

-- Top Names having highest value of Jitter_DDP

SELECT TOP 10 name,
		Jitter_DDP
FROM dbo.parkinsons_disease_data
ORDER BY Jitter_DDP DESC

--phon_R01_S24_4 =>0.0643299967050552
--phon_R01_S24_6 =>0.0556299984455109
--phon_R01_S35_6 =>0.0540100000798702
--phon_R01_S35_7 =>0.0470499992370605
--phon_R01_S24_3 =>0.0347599983215332
--phon_R01_S37_5 =>0.0335099995136261
--phon_R01_S35_5 =>0.0322499983012676
--phon_R01_S35_3 =>0.0298699997365475
--phon_R01_S35_4 =>0.0275599993765354
--phon_R01_S24_5 =>0.0271600000560284

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Shimmer

SELECT TOP 10 name,
		MDVP_Shimmer
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Shimmer DESC

--phon_R01_S35_6 =>0.119079999625683
--phon_R01_S24_6 =>0.0941900014877319
--phon_R01_S24_4 =>0.091779999434948
--phon_R01_S35_7 =>0.086839996278286
--phon_R01_S35_1 =>0.0814300030469894
--phon_R01_S22_1 =>0.0795900002121925
--phon_R01_S35_4 =>0.0716999992728233
--phon_R01_S35_3 =>0.0711800009012222
--phon_R01_S24_3 =>0.0673400014638901
--phon_R01_S21_5 =>0.067270003259182

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_Shimmer_dB

SELECT TOP 10 name,
		MDVP_Shimmer_dB
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_Shimmer_dB DESC

--phon_R01_S35_6 =>1.30200004577637
--phon_R01_S35_7 =>1.01800000667572
--phon_R01_S25_5 =>1
--phon_R01_S24_6 =>0.930000007152557
--phon_R01_S24_4 =>0.890999972820282
--phon_R01_S35_4 =>0.833000004291534
--phon_R01_S35_1 =>0.820999979972839
--phon_R01_S35_5 =>0.783999979496002
--phon_R01_S22_1 =>0.772000014781952
--phon_R01_S35_3 =>0.722000002861023

-- ===========================================================================================================================================================================

-- Top Names having highest value of Shimmer_APQ3

SELECT TOP 10 name,
		Shimmer_APQ3
FROM dbo.parkinsons_disease_data
ORDER BY Shimmer_APQ3 DESC

--phon_R01_S35_6 =>0.0564699992537498
--phon_R01_S24_6 =>0.0555099993944168
--phon_R01_S24_4 =>0.0535800009965897
--phon_R01_S22_1 =>0.0442100018262863
--phon_R01_S35_7 =>0.0428400002419949
--phon_R01_S34_2 =>0.0401600003242493
--phon_R01_S35_1 =>0.0380400009453297
--phon_R01_S21_5 =>0.0378799997270107
--phon_R01_S21_4 =>0.0367100015282631
--phon_R01_S21_7 =>0.0364999994635582

-- ===========================================================================================================================================================================

-- Top Names having highest value of Shimmer_APQ5

SELECT TOP 10 name,
		Shimmer_APQ5
FROM dbo.parkinsons_disease_data
ORDER BY Shimmer_APQ5 DESC

--phon_R01_S35_6 =>0.0794000029563904
--phon_R01_S35_7 =>0.0555600002408028
--phon_R01_S35_1 =>0.0542600005865097
--phon_R01_S24_6 =>0.050050001591444
--phon_R01_S22_1 =>0.0496199987828732
--phon_R01_S01_5 =>0.048250000923872
--phon_R01_S24_4 =>0.047910001128912
--phon_R01_S35_3 =>0.0458000004291534
--phon_R01_S01_2 =>0.0451800003647804
--phon_R01_S21_7 =>0.0428199991583824

-- ===========================================================================================================================================================================

-- Top Names having highest value of MDVP_APQ

SELECT TOP 10 name,
		MDVP_APQ
FROM dbo.parkinsons_disease_data
ORDER BY MDVP_APQ DESC

--phon_R01_S35_6 =>0.137779995799065
--phon_R01_S35_1 =>0.088079996407032
--phon_R01_S35_7 =>0.0831800028681755
--phon_R01_S35_3 =>0.0682400017976761
--phon_R01_S35_4 =>0.0645999982953072
--phon_R01_S35_2 =>0.0635899975895882
--phon_R01_S35_5 =>0.0625900030136108
--phon_R01_S24_4 =>0.0619600005447865
--phon_R01_S24_6 =>0.0602300018072128
--phon_R01_S24_3 =>0.0578299984335899

-- ===========================================================================================================================================================================

-- Top Names having highest value of Shimmer_DDA

SELECT TOP 10 name,
		Shimmer_DDA
FROM dbo.parkinsons_disease_data
ORDER BY Shimmer_DDA DESC

--phon_R01_S35_6 =>0.169420003890991
--phon_R01_S24_6 =>0.166539996862411
--phon_R01_S24_4 =>0.160740002989769
--phon_R01_S22_1 =>0.132620006799698
--phon_R01_S35_7 =>0.128509998321533
--phon_R01_S34_2 =>0.120470002293587
--phon_R01_S35_1 =>0.114110000431538
--phon_R01_S21_5 =>0.113629996776581
--phon_R01_S21_4 =>0.110119998455048
--phon_R01_S21_7 =>0.109489999711514

-- ===========================================================================================================================================================================

-- Top Names having highest value of NHR

SELECT TOP 10 name,
		NHR
FROM dbo.parkinsons_disease_data
ORDER BY NHR DESC

--phon_R01_S24_4 =>0.314819991588593
--phon_R01_S24_6 =>0.259299993515015
--phon_R01_S35_6 =>0.21713000535965
--phon_R01_S24_3 =>0.167439997196198
--phon_R01_S35_7 =>0.162650004029274
--phon_R01_S24_5 =>0.118430003523827
--phon_R01_S35_5 =>0.109520003199577
--phon_R01_S37_5 =>0.107479996979237
--phon_R01_S50_4 =>0.107150003314018
--phon_R01_S24_2 =>0.103229999542236

-- ===========================================================================================================================================================================

-- Top Names having highest value of HNR

SELECT TOP 10 name,
		HNR
FROM dbo.parkinsons_disease_data
ORDER BY HNR DESC

--phon_R01_S07_5 =>33.0470008850098
--phon_R01_S07_4 =>32.6839981079102
--phon_R01_S07_6 =>31.7320003509521
--phon_R01_S07_2 =>30.9400005340576
--phon_R01_S07_3 =>30.7749996185303
--phon_R01_S25_4 =>29.746000289917
--phon_R01_S25_2 =>28.4090003967285
--phon_R01_S25_3 =>27.4209995269775
--phon_R01_S27_7 =>27.1660003662109
--phon_R01_S02_2 =>26.8920001983643

-- ===========================================================================================================================================================================

-- Top Names having highest value of RPDE

SELECT TOP 10 name,
		RPDE
FROM dbo.parkinsons_disease_data
ORDER BY RPDE DESC

--phon_R01_S39_4 =>0.685150980949402
--phon_R01_S34_1 =>0.677130997180939
--phon_R01_S24_4 =>0.671298980712891
--phon_R01_S05_1 =>0.665318012237549
--phon_R01_S49_2 =>0.663842022418976
--phon_R01_S05_3 =>0.660125017166138
--phon_R01_S39_1 =>0.654945015907288
--phon_R01_S33_2 =>0.653427004814148
--phon_R01_S21_7 =>0.653410017490387
--phon_R01_S39_2 =>0.653138995170593

-- ===========================================================================================================================================================================

-- Top Names having highest value of DFA

SELECT TOP 10 name,
		DFA
FROM dbo.parkinsons_disease_data
ORDER BY DFA DESC

--phon_R01_S01_3 =>0.825287997722626
--phon_R01_S01_6 =>0.825069010257721
--phon_R01_S01_5 =>0.823484003543854
--phon_R01_S16_3 =>0.821363985538483
--phon_R01_S01_2 =>0.819521009922028
--phon_R01_S01_4 =>0.819235026836395
--phon_R01_S16_1 =>0.81903201341629
--phon_R01_S16_4 =>0.817755997180939
--phon_R01_S16_6 =>0.817395985126495
--phon_R01_S19_6 =>0.816340029239655

-- ===========================================================================================================================================================================

-- Top Names having highest value of spread1

SELECT TOP 10 name,
		spread1
FROM dbo.parkinsons_disease_data
ORDER BY spread1 DESC

--phon_R01_S35_6 =>-2.43403100967407
--phon_R01_S35_7 =>-2.83975601196289
--phon_R01_S04_6 =>-2.93107008934021
--phon_R01_S24_6 =>-3.26948690414429
--phon_R01_S35_1 =>-3.29766798019409
--phon_R01_S35_3 =>-3.3773250579834
--phon_R01_S37_5 =>-3.44447803497314
--phon_R01_S37_3 =>-3.58372211456299
--phon_R01_S24_4 =>-3.70054411888123
--phon_R01_S01_5 =>-3.74778699874878

-- ===========================================================================================================================================================================

-- Top Names having highest value of spread2

SELECT TOP 10 name,
		spread2
FROM dbo.parkinsons_disease_data
ORDER BY spread2 DESC

--phon_R01_S35_6 =>0.450493007898331
--phon_R01_S04_6 =>0.434325993061066
--phon_R01_S35_1 =>0.414757996797562
--phon_R01_S34_1 =>0.397749006748199
--phon_R01_S27_4 =>0.393056005239487
--phon_R01_S02_5 =>0.391001999378204
--phon_R01_S27_5 =>0.389295011758804
--phon_R01_S21_7 =>0.389232009649277
--phon_R01_S21_6 =>0.375530987977982
--phon_R01_S27_3 =>0.37211400270462

-- ===========================================================================================================================================================================

-- Top Names having highest value of D2

SELECT TOP 10 name,
		D2
FROM dbo.parkinsons_disease_data
ORDER BY D2 DESC

--phon_R01_S21_6 =>3.67115497589111
--phon_R01_S35_1 =>3.41364908218384
--phon_R01_S21_7 =>3.31758594512939
--phon_R01_S35_3 =>3.27486491203308
--phon_R01_S35_7 =>3.18402695655823
--phon_R01_S35_2 =>3.14236402511597
--phon_R01_S21_4 =>3.136549949646
--phon_R01_S05_1 =>3.1090099811554
--phon_R01_S21_1 =>3.09930109977722
--phon_R01_S21_2 =>3.09825611114502

-- ===========================================================================================================================================================================

-- Top Names having highest value of PPE

SELECT TOP 10 name,
		PPE
FROM dbo.parkinsons_disease_data
ORDER BY PPE DESC

--phon_R01_S35_6 =>0.527366995811462
--phon_R01_S35_1 =>0.457533001899719
--phon_R01_S35_7 =>0.454721003770828
--phon_R01_S24_6 =>0.444774001836777
--phon_R01_S04_6 =>0.43078801035881
--phon_R01_S35_3 =>0.41864600777626
--phon_R01_S01_5 =>0.410335004329681
--phon_R01_S24_3 =>0.37848299741745
--phon_R01_S05_1 =>0.377429008483887
--phon_R01_S24_4 =>0.370961010456085

===========================================================================================================================================================================
