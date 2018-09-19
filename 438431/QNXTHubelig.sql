USE QNXTHUB;

SELECT  DISTINCT keys.MemberEnrollKeysId, MBP.TargetCode, MBP.SourceCode, keys.MemId, keys.Carriermemid, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, KEYS.seGtype, keys.CoverageCodeId, keys.OrgPolicy,MBP.CoverageDescription
FROM QNXTHub.qnxt.MemberEnrollKeys keys
	INNER JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON keys.RateCode = MBP.RateCode AND keys.CoverageCodeId = MBP.CoverageCode AND keys.OrgPolicy = MBP.OrgPolicy
WHERE keys.Carriermemid in('010624589')
	--AND PrimaryStatus = 'P'
	--AND MemberEnrollKeysId = 'F3FF3698-1C65-4F73-9AB2-A3D9A1D6B0E1'
ORDER BY EffDate DESC
;

SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy FROM qnxt.MemberEnrollKeys keys WHERE keys.Carriermemid = '010006575' ORDER BY EffDate

--UPDATE QNXTHub.qnxt.MemberEnrollKeys
SET PrimaryStatus = 'P'--PrimaryStatus = 'V'--
,seGtype = 'INT'--,seGtype = 'DEL'--
WHERE MemberEnrollKeysId = 'AE1F84B3-DDEF-4644-AE93-6D4276184B8A'
;

SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy 
FROM qnxt.MemberEnrollKeys keys
WHERE keys.Carriermemid = '010788179'
ORDER BY EffDate
;



SELECT  keys.*
FROM qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '010788179'
ORDER BY EffDate
;

--DELETE FROM qnxt.MemberEnrollKeys
WHERE MemberEnrollKeysId = '4435FE64-B773-4E21-A57B-D1B0F49ACAE3'
;
