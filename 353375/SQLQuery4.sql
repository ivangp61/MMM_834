SELECT *
FROM stg.MemberHeader

SELECT *
FROM tgt.MemberPcp;
SELECT *
FROM tgt.MemberBenefitPlan;
SELECT *
FROM tgt.MemberHeader;


SELECT *
FROM trn.TransactionException
WHERE CONVERT(VARCHAR,ERRORDATETIME,112) >= '20170627'
;

SELECT *
FROM    trn.TransactionFileLog
WHERE 1=1 
	and X12Created = 0
order by X12CreatedDate desc
;

