SELECT TOP 100 T.name AS TableName, S.name AS SchemaName
FROM SYS.tables T
	INNER JOIN SYS.schemas S
	ON T.schema_id = S.schema_id
WHERE T.name LIKE '%company%'--'%INDICATOR%'--'%STATUS%'--'%MemberBenefitPackage%'
	AND S.name LIKE '%mref%'
ORDER BY T.name
;

SELECT *
FROM Mref.Company

SELECT TOP 100 *
FROM Mref.CMSCoverageIndicator MI
;

SELECT TOP 100 *
FROM dbo.MemberIndicator MI
;

SELECT TOP 100 *
FROM Mref.BenefitPackage BP
;

SELECT *
FROM Mref.EnrollmentStatus E
WHERE E.StatusMRefId = 24
;


--112334
--440765
--=================MEMBER_ELIGIBILITY==========
SELECT DISTINCT TOP 100  MC.MemberRecId,
						 MC.FirstName,						 
						 C.DisplayCode,
						 MI.IndValue AS PackageId,				 
						 MI.IndEffectiveDate AS EnrollDate,
						 MI.IndEndDate AS DisenrollDate,
						 E.[Desc] AS EnrollmentStatus,
						 MC.JobLoadDate
FROM dbo.MemberCompany MC
	INNER JOIN dbo.MemberIndicator MI
	ON MC.CompanyMRefId = MI.CompanyMRefId AND MC.MemberRecId = MI.MemberRecId
	INNER JOIN Mref.EnrollmentStatus E
	ON MC.StatusMRefId = E.StatusMRefId
	INNER JOIN Mref.Company C
	ON MC.CompanyMRefId = C.CompanyMRefId
WHERE MI.IndMRefId = 24
	AND MC.MemberRecId IN(112334)--, 583588, 577565, 569605, 510493, 354851, 326206, 312240, 215316, 210007, 23622, 21019, 18456, 15757, 10452, 10394, 10085)
	AND C.DisplayCode = 'MMM'
	AND MI.IndValue IN('P00310749643','P00310749499')
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========

--=================MEMBER_ADDRESS==========
SELECT TOP 100 *
FROM MemberCompany M
	LEFT JOIN MemberAddress MA
	ON M.CompanyMRefId = MA.CompanyMRefId AND M.MemberRecId = MA.MemberRecId
WHERE M.MemberRecId = 483359
;
--=================MEMBER_ADDRESS==========

--=================MEMBER_KEYS==========
SELECT *
FROM mref.ExternalType ET
;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc]
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'MP' 
WHERE M.MemberRecId IN(670646,
						583588,
						577565,
						569605,
						510493,
						354851,
						326206,
						312240,
						215316,
						210007,
						23622,
						21019,
						18456,
						15757,
						10452,
						10394,
						10085)
;
--=================MEMBER_KEYS==========


SELECT TOP 100 *
FROM dbo.MemberBenefitPackage BP
WHERE BP.MemberRecId = 483359
;


SELECT TOP 100 *
FROM Xref.BenefitPackage BP		
WHERE 
;


SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc]
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'MP' 
	--ON M.CompanyMRefId = MA.CompanyMRefId AND M.MemberRecId = MA.MemberRecId
WHERE M.MemberRecId IN(670646,
						583588,
						577565,
						569605,
						510493,
						354851,
						326206,
						312240,
						215316,
						210007,
						23622,
						21019,
						18456,
						15757,
						10452,
						10394,
						10085)
;

SELECT  TOP 100 memc.*
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1
 and memc.JobLoadDate >= '2016-11-21 11:03:22.000' 
-- and comp.DisplayCode = ?
 ORDER BY memc.JobLoadDate DESC
 ;

