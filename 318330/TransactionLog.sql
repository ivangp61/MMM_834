USE QNXTHub;

SELECT *
FROM [trn].[TransactionException] Trn
WHERE CONVERT(VARCHAR,Trn.ErrorDateTime,112) = '20180308'
;

