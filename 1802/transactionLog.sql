USE QNXTHub;

SELECT DISTINCT Trn.ErrorDateTime
FROM [trn].[TransactionException] Trn
WHERE 1 = 1
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171031'
ORDER BY Trn.ErrorDateTime DESC
;

SELECT DISTINCT CONVERT(VARCHAR,Trn.ErrorDateTime,112) + REPLACE(CONVERT(VARCHAR,Trn.ErrorDateTime,108), ':','') as w
,Trn.ErrorDateTime
FROM [trn].[TransactionException] Trn
WHERE 1 = 1
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171031'
ORDER BY Trn.ErrorDateTime DESC
;

SELECT *
FROM [trn].[TransactionException] Trn
WHERE 1 = 1
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171115'
ORDER BY Trn.ErrorDateTime DESC
;


SELECT *
FROM [trn].[TransactionException] Trn
WHERE 1 = 1
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) + REPLACE(CONVERT(VARCHAR,Trn.ErrorDateTime,108), ':','') < '20171031181830'
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171031'
ORDER BY Trn.ErrorDateTime DESC
;

SELECT DISTINCT trn.Identifier
FROM [trn].[TransactionException] Trn
WHERE 1 = 1	
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171031'
	AND ErrorDescription = 'Member enrollment program not valid for claims'
;


--3343:20171031
--405:20171031181830
--2938:DELETE


SELECT DISTINCT *
FROM [trn].[TransactionException] Trn
WHERE 1 = 1
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) + REPLACE(CONVERT(VARCHAR,Trn.ErrorDateTime,108), ':','') < '20171031181830'
	AND CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20171031'
ORDER BY Trn.ErrorDateTime DESC
;

--DELETE [trn].[TransactionException]
WHERE 1 = 1
	--AND CONVERT(VARCHAR,ErrorDateTime,112) + REPLACE(CONVERT(VARCHAR,ErrorDateTime,108), ':','') < '20171031181830'
	AND CONVERT(VARCHAR,ErrorDateTime,112) = '20171115'
;


SELECT SUBSTRING(CONVERT(VARCHAR,GETDATE(),108),1,2)
;

SELECT CONVERT(VARCHAR,GETDATE(),112) + REPLACE(CONVERT(VARCHAR,GETDATE(),108), ':','')
;