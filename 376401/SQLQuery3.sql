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

