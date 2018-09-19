set nocount on;

declare @xml xml
declare @tranid uniqueidentifier

set @tranid = '55B82F5D-3778-4625-87ED-28CBAFD948F3';
--B1CA01E1-E1A7-4578-A3EA-FC2B7D1CB850:MMM
--55B82F5D-3778-4625-87ED-28CBAFD948F3:PMC
--print @tranid

SELECT  @xml = replace(XmlData,'<?xml version="1.0" encoding="ISO-8859-1"?>', '')
FROM    trn.TransactionFileLog l
WHERE 1=1 and TransactionFileLogId = @tranid
SELECT @xml 'xml'


SELECT top 1 @tranid = TransactionFileLogId
FROM    trn.TransactionFileLog
WHERE 1=1 
	and X12Created = 1
order by X12CreatedDate desc


--update trn.TransactionFileLog
set 
('2034F27F-BD76-44EC-AD79-B3EEAD617FAB',
'0E50130B-EB69-4198-AC4E-C1AF1E4A844B')

/*

UPDATE tra
SET    X12Created = 1,
X12CreatedDate = GETDATE()
FROM   trn.TransactionFileLog tra
WHERE 1=1 and tra.TransactionFileLogId = '2B03333E-F057-4634-BBE8-F1DFFAC69FEF'

*/


SELECT top 10 *
FROM    trn.TransactionFileLog
WHERE 1=1 
	and X12Created = 0
--AND XmlFilename LIKE '%2018030%'
order by XmlFilename DESC
--X12CreatedDate desc


--update trn.TransactionFileLog
set X12Created = 1,
	X12CreatedDate = NULL,
	X12Filename = NULL
WHERE TransactionFileLogid not IN('831C55F1-23F4-41D6-B884-58B8FF1AE844')
;




--update trn.TransactionFileLog
set X12Created = 1,
	X12CreatedDate = getdate()
WHERE 1 = 1
	--AND TransactionFileLogid not IN('5D60A587-ACCD-465C-B1F7-5284158778FC','3FEBB997-8196-40CD-952D-21B1869BA4FB')
	AND X12CreatedDate IS NULL
	AND X12Created = 0
;


--update trn.TransactionFileLog
set X12Created = 0,
	X12CreatedDate = NULL,
	X12Filename = NULL
WHERE X12Created = 0;

