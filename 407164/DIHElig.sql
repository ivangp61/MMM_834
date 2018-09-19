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
	AND MC.MemberRecId IN(142800)--(346198, 486206, 338902, 243953, 382769)--(346198, 486206, 338902, 243953, 382769)
	--AND (MI.JobLoadDate >= '2017-03-08')
	--(187255, 187045, 381831, 178648, 102440)
	--AND C.DisplayCode = 'MMM'
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========





--=================MEMBER_ELIGIBILITY==========
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
						 MI.IndEndDate AS DisenrollDate,MI.IndMRefId
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
	AND MC.MemberRecId IN(142800)--(346198, 486206, 338902, 243953, 382769)--(346198, 486206, 338902, 243953, 382769)
	--AND CONVERT(VARCHAR,MI.ModificationDate,112) >= '20170306'
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========


