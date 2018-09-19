--'010791719',
--'010423573',
--'010010633',
--'010115244'
--=================MEMBER_KEYS==========
USE EnterpriseHub;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	AND xm.ExternalValue IN('010791719',
'010423573',
'010010633',
'010115244')
	--AND M.MemberRecId = 338902
;

--=================MEMBER_KEYS==========

SELECT *
FROM MemberPCP MP
WHERE 1 = 1
	--AND ProviderRecId = 100666
	--AND ProviderAffiliationRecId is null
	AND MP.MemberRecId IN(28378,147903,486144,697057)--195550
	--AND (PCPEndDate is null OR PCPEndDate >= GETDATE()) 
;


