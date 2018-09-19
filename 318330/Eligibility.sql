--=================MEMBER_ELIGIBILITY==========
USE EnterpriseHub;

SELECT DISTINCT MC.MemberRecId,						 
						 MC.FirstName,						 
						 C.DisplayCode,
						 CASE 
							WHEN MI.IndMRefId  = 24 THEN 'Medical Coverage' 
							WHEN MI.IndMRefId  = 11 THEN 'Hospice'
						 END AS CoverageType,
						 MI.IndValue AS PackageId,				 
						 BP.[Desc] AS PackageName,
						 MI.IndEffectiveDate AS EnrollDate,
						 MI.IndEndDate AS DisenrollDate,
						 Mi.JobLoadDate
FROM dbo.MemberCompany MC
	INNER JOIN dbo.MemberIndicator MI
	ON MC.CompanyMRefId = MI.CompanyMRefId AND MC.MemberRecId = MI.MemberRecId
	INNER JOIN Mref.Company C
	ON MC.CompanyMRefId = C.CompanyMRefId	
	LEFT JOIN Xref.BenefitPackage XBP
	ON MI.IndValue = XBP.ExternalValue
	LEFT JOIN MRef.BenefitPackage BP
	ON XBP.BenefitPkgMRefId = BP.BenefitPkgMRefId
WHERE 1 = 1
	AND MI.IndMRefId IN(24,11)
	AND MC.MemberRecId IN(486206)--(346198, 486206, 338902, 243953, 382769)--(346198, 486206, 338902, 243953, 382769)
	--AND (MI.JobLoadDate >= '2017-03-08')
	--(187255, 187045, 381831, 178648, 102440)
	--AND C.DisplayCode = 'MMM'
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========



--======================QNXTHUB========================
USE EnterpriseHub;

SELECT  MBP.TargetCode, MBP.SourceCode, keys.MemId, keys.Carriermemid, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy,MBP.CoverageDescription
FROM QNXTHub.qnxt.MemberEnrollKeys keys
	INNER JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON keys.RateCode = MBP.RateCode AND keys.CoverageCodeId = MBP.CoverageCode AND keys.OrgPolicy = MBP.OrgPolicy
WHERE keys.Carriermemid in('030170699'
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
--======================QNXTHUB========================

