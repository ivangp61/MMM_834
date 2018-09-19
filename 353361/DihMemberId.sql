--=================MEMBER_KEYS==========
USE EnterpriseHub;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, XM.ExternalTypeMRefId,ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	AND M.MemberRecId  IN(
								SELECT M.MemberRecId
								FROM MemberCompany M
									INNER JOIN Xref.Member XM
									ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
									INNER JOIN mref.ExternalType ET
									ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
								WHERE 1 = 1
									AND xm.ExternalValue IN('030157501')
							)
;
--=================MEMBER_KEYS==========

