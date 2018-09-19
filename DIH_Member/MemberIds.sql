--=================MEMBER_ELIGIBILITY==========
SELECT DISTINCT TOP 100  MC.MemberRecId,					 
						 C.DisplayCode,						 
						 MC.JobLoadDate
FROM dbo.MemberCompany MC
	INNER JOIN dbo.MemberIndicator MI
	ON MC.CompanyMRefId = MI.CompanyMRefId AND MC.MemberRecId = MI.MemberRecId
	INNER JOIN Mref.EnrollmentStatus E
	ON MC.StatusMRefId = E.StatusMRefId
	INNER JOIN Mref.Company C
	ON MC.CompanyMRefId = C.CompanyMRefId
WHERE MI.IndMRefId = 24
	AND MC.MemberRecId  IN(187255,279697,92933,254990,483359,210007,215316,326206,510493,583588)
	AND C.DisplayCode = 'MMM'
;
--=================MEMBER_ELIGIBILITY==========



--=================MEMBER_KEYS==========
SELECT *
FROM mref.ExternalType ET
;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc]
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'MP' 	
WHERE M.MemberRecId IN(10085)
;
--=================MEMBER_KEYS==========

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], M.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'
WHERE xm.ExternalValue IN('010000300',
'010000301',
'010000402',
'010001203',
'010001236',
'010002525',
'010002636',
'010002700',
'010003517',
'010003702',
'010004404',
'010005757',
'010006248',
'010006404')--('030117034')--
;



SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE xm.ExternalValue = '010176510'
;


--M.MemberRecId = 92933
IN(187255,279697,92933,254990,483359,210007,215316,326206,510493,583588)


xm.ExternalValue IN('010176510',
'010418028',
'010145685',
'010204424',
'010278323',
'030090566',
'030003277',
'030203474',
'030175748',
'030009587')
;


