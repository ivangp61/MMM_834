set nocount on ;

declare @xml xml
declare @tranid uniqueidentifier

SELECT top 1 @tranid = TransactionFileLogId
FROM    trn.TransactionFileLog
WHERE 1=1 
	and X12Created = 1
order by X12CreatedDate desc

--set @tranid = 'C9763671-1BFB-4BAC-97DD-3621DC36CDB9';

print @tranid

SELECT  @xml = replace(XmlData,'<?xml version="1.0" encoding="ISO-8859-1"?>', '')
FROM    trn.TransactionFileLog l
WHERE 1=1 and TransactionFileLogId = @tranid
SELECT @xml 'xml'

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
AND XmlFilename LIKE '%2017030%'
order by XmlFilename DESC
--X12CreatedDate desc


--update trn.TransactionFileLog
set X12Created = 0,
	X12CreatedDate = NULL,
	X12Filename = NULL
WHERE TransactionFileLogid not IN('5D60A587-ACCD-465C-B1F7-5284158778FC','3FEBB997-8196-40CD-952D-21B1869BA4FB')
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