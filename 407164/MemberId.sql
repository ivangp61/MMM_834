--=================MEMBER_KEYS==========
USE EnterpriseHub;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	AND xm.ExternalValue IN('010000402')
	AND M.MemberRecId = 142800
;

--=================MEMBER_KEYS==========

