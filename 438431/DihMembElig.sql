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
	AND MC.MemberRecId IN(537471)
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
	AND MC.MemberRecId IN(66455)--(346198, 486206, 338902, 243953, 382769)--(346198, 486206, 338902, 243953, 382769)
	--AND CONVERT(VARCHAR,MI.ModificationDate,112) >= '20170306'
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========

--UPDATE dbo.MemberIndicator
SET IndEndDate = '2018-01-01 00:00:00.000'
WHERE IndicatorRecId = 383733474

SELECT *
FROM dbo.MemberIndicator
WHERE 1 = 1
	AND MemberRecId = 441466
	AND IndMRefId IN(24,11)
-- AND IndicatorRecId = 386923492

SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
 ON Comp.CompanyMRefId = ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId =24
	AND MemberRecId IN(441466)
    AND Comp.DisplayCode = 'MMM'
;


SELECT *
FROM xref.BenefitPackage pkg
WHERE pkg.SORId = 'P00310749431'
;

SELECT  xStat.ExternalValue 'Program'
, Comp.DisplayCode 'Carrier'
FROM    XRef.EnrollmentStatus xStat
JOIN MRef.EnrollmentStatus mStat     on mStat.StatusMRefId = xStat.StatusMRefId
JOIN MRef.Company Comp on Comp.CompanyMRefId = xStat.CompanyMRefId
WHERE 1=1
 and xStat .ExternalValue NOT IN ('XXX') 
and mStat.Code = 'Program'
 and mStat.IsValidForClaims = 1



SELECT  top 100 *
FROM    XRef.EnrollmentStatus xStat
WHERE 1=1
 and xStat .ExternalValue NOT IN ('XXX') 
 ;


SELECT Memb.MemberRecId
    ,Memb.FirstName
    ,Memb.MiddleName
    ,Memb.LastName
    ,Memb.BirthDate
    ,Memb.DeathDate
    ,Comp.DisplayCode 'CarrierCode'
    ,Comp.DisplayCode 'SponsorCode'
    ,Gen.Code         'Gender'
    ,xStat.ExternalValue 'Program'
FROM
    dbo.MemberCompany Memb
    JOIN MRef.Company Comp
        ON Comp.CompanyMRefId = Memb.CompanyMRefId
    LEFT JOIN MRef.Gender Gen
        ON Gen.GenderMRefId = Memb.GenderMRefId
    LEFT JOIN XRef.EnrollmentStatus xStat
        ON xStat.StatusMRefId = Memb.StatusMRefId
        AND xStat.CompanyMRefId = Memb.CompanyMRefId
    LEFT JOIN MRef.EnrollmentStatus stat
        ON stat.StatusMRefId = Memb.StatusMRefId
		And stat.Code = 'Program'
WHERE 1 = 1
	AND Memb.MemberRecId = 537471
;

