
--=================MEMBER_KEYS==========
USE EnterpriseHub;

SELECT DISTINCT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate,m.EthnicityMRefId
,M.CompanyMRefId,ET.Code
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'QNXT'--AND ET.Code = 'MP'--AND ET.Code = 'AVETA'--
WHERE 1 = 1
	--AND xm.ExternalValue IN('030023446')
	--,'030029978','030037136','030006760','030037897')
	--AND xm.ExternalValue IN('N00166637058')--'QLXM00000330372')--
	AND M.MemberRecId in(716951)
	--AND M.CompanyMRefId = 2
;
--=================MEMBER_KEYS==========

SELECT
CompanyMRefId
,ExternalValue
,AddrTypeMRefId
FROM ENTERPRISEHUB.[XRef].[AddressType]
Where ExternalTypeMRefId = 1
;

SELECT  memc.*
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
 --and memc.JobLoadDate >= ? 
 --and comp.DisplayCode = 'MMM'
 AND memc.MemberRecId = 227918

SELECT *
FROM dbo.MemberAddress
where MemberRecId = 707263