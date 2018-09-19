USE QNXTHub;

SELECT *
FROM stg.MemberHeader MH
WHERE --MH.DIHMemberRecId = 652438
MH.MemId = '010717386'
;


SELECT *
FROM tgt.MemberPcp;
SELECT *
FROM tgt.MemberBenefitPlan;
SELECT *
FROM  tgt.MemberHeader;


--==============================
--MemberHeader Exception
--==============================
SELECT *
FROM trn.TransactionException TE
WHERE TE.Identifier = 10085
;


