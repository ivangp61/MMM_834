SELECT * 
FROM qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0148' 
; 


SELECT PKG.* 
--[Desc] 'SECONDARY' 
  --    ,xPkg.ExternalValue 'PACKAGE_ID' 
  FROM 
       MRef.BenefitPackage Pkg 
       JOIN XRef.BenefitPackage xPkg 
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId 
  WHERE 1 = 1 
        AND xPkg.ExternalValue = 'P00279140874' 
    AND ExternalTypeMRefId = 1; 

SELECT * 
FROM qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0148' 
;





SELECT *
FROM qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
AND TargetCode ='QLXBP0148' 
--	AND MemberBenefitPlanRateMRefId IN('9BC0CE6C-EE9A-4937-B542-BAFB609E10A8','C05426E5-44EC-4F04-9E56-43423DF061BB')
;

P00312500043
174
175
--=====================================================================
--UPDATE qnxt.MemberBenefitPlanRate 
SET PolicyPlanTermDate = '2016-12-31 00:00:00.000'--'2078-12-31 00:00:00.000'--
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0148' AND SourceCode = 'P00312500043' AND rateCode in(174,175)	
;--2078-12-31 00:00:00.000
--OrgPolicyTermDate = '2016-12-31 00:00:00.000'
--=====================================================================

--B0A5FAE3-3A53-4903-9B0E-1ECEF42F788E
--54912C0B-3852-4D80-BF0A-BA81F9B0939A


--UPDATE MRef.BenefitPackage
SET 
[DESC] = 'ELA Excel – Rubi'
  FROM MRef.BenefitPackage 
       JOIN XRef.BenefitPackage xPkg 
            ON xPkg.BenefitPkgMRefId = BenefitPackage.BenefitPkgMRefId 
  WHERE 1 = 1 
        AND xPkg.ExternalValue = 'P00279140874' 
    AND ExternalTypeMRefId = 1
;

--=====================================================================
--UPDATE qnxt.MemberBenefitPlanRate 
SET PolicyPlanEffDate = '2017-01-01 00:00:00.000',
rateCode = 213
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0148' AND SourceCode = 'P00345634395' AND rateCode in(174)	
;

--UPDATE qnxt.MemberBenefitPlanRate 
SET PolicyPlanEffDate = '2017-01-01 00:00:00.000',
rateCode = 214
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0148' AND SourceCode = 'P00345634395' AND rateCode in(175)	
--=====================================================================