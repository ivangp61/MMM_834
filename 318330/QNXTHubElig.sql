USE QNXTHUB;

SELECT  DISTINCT MBP.TargetCode, MBP.SourceCode, keys.MemId, keys.Carriermemid, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy,MBP.CoverageDescription
FROM QNXTHub.qnxt.MemberEnrollKeys keys
	INNER JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON keys.RateCode = MBP.RateCode AND keys.CoverageCodeId = MBP.CoverageCode AND keys.OrgPolicy = MBP.OrgPolicy
WHERE keys.Carriermemid in('010099219'
--'010145685', 
--'010149477',
--'010258196',
--'010135074',
--'010117206'
)
--= '010145685'
	AND PrimaryStatus = 'P'
ORDER BY EffDate DESC
;


SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy 
FROM qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '030185708'
ORDER BY EffDate
;



SELECT  keys.*
FROM qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '010099219'
ORDER BY EffDate
;

--DELETE FROM qnxt.MemberEnrollKeys
WHERE MemberEnrollKeysId = '66579266-FA0F-4730-92D0-6D292D0BEB7C'
;

