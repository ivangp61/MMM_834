SELECT *
FROM dbo.STG_HCFA_DATE HD WITH(NOLOCK)
WHERE --hd.NAME_ID = 'N00036613292'
CONVERT(DATE,hd.UPDATE_DATE) >= CONVERT(DATE,'2016-11-01')
;

SELECT TOP 100 *
FROM dbo.STG_NAME_NOTES NN WITH(NOLOCK)
WHERE CONVERT(DATE,NN.ENTER_DATE_TIME) >= CONVERT(DATE,'2016-11-01')
;


SELECT COUNT(*)
FROM qnxt.MemberHeader MH
;

SELECT *
FROM qnxt.MemberEnrollKeys
;

SELECT pkg.CarrierCode, pkg.SponsorCode, pkg.OrgPolicy, pkg.OrgPolicyEffDate, pkg.OrgPolicyTermDate, pkg.BenefitPlan, pkg.CoverageCode, pkg.CoverageDescription, pkg.RateCode, pkg.PolicyPlanEffDate, pkg.PolicyPlanTermDate, pkg.SourceCode, pkg.TargetCode 
FROM qnxt.MemberBenefitPlanRate pkg 
WHERE pkg.CarrierCode = 'MMM' And pkg.SponsorCode = 'MMM'
;

SELECT  DIHMemberRecId, SubscriberId 
FROM stg.MemberHeader
;

SELECT  top 100 *
FROM stg.MemberWorkingList L
WHERE L.DIHRecId IN(279697, 483359, 187255, 92933, 254990)
;

SELECT  top 100 *
FROM stg.MemberWorkingList L
WHERE L.DIHRecId IN(279697, 483359, 187255, 92933, 254990)
;


SELECT  *
FROM tgt.MemberPcp
;

SELECT  *
FROM tgt.MemberBenefitPlan BP
WHERE BP.DIHMemberRecId = 254990
;

SELECT  *
FROM tgt.MemberHeader MH
WHERE MH.DIHMemberRecId = 254990
;




