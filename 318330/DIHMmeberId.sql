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
									AND xm.ExternalValue IN('030251022', '030111320')
							)
;
--=================MEMBER_KEYS==========
--030017186
--010202120


SELECT *
FROM Xref.Member XM
WHERE XM.MemberRecId = 28078


SELECT M.MemberRecId
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	AND xm.ExternalValue IN('010810478', '010810479', '030246531', '010031419', '030086086', '010005428', '010008528', '010810485', '0100810486', '010810492', '010810487')


--=================MEMBER_KEYS==========





SELECT
CompanyMRefId
,ExternalValue
,AddrTypeMRefId
FROM ENTERPRISEHUB.[XRef].[AddressType]
Where ExternalTypeMRefId = 1
;



SELECT *
FROM dbo.MemberAddress
where MemberRecId = 707263
;



SELECT *
FROM XREF.Provider P
WHERE P.ProviderRecId = 148066
;



SELECT *
FROM XREF.Provider P
WHERE P.ExternalValue = '1871696799'
;




SELECT M.MemberRecId
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	AND xm.ExternalValue IN('010013318')




SELECT TOP 10 memc.JobLoadDate
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
 and memc.JobLoadDate >= 
 and comp.DisplayCode = 'MMM'
 --2018-01-11 09:40:06.337


SELECT  memc.MemberRecId,memc.JobLoadDate
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1  
 and comp.DisplayCode = 'MMM'
 AND memc.MemberRecId IN( 470670, 473610, 592974, 707983, 717246, 722852, 616871, 537471)
 ;


--UPDATE dbo.MemberCompany 
SET JobLoadDate = '2018-01-11 00:01:58.000'
WHERE 1=1
 AND MemberRecId IN( 470670, 473610, 592974, 707983, 717246, 722852, 616871, 537471)
 ;





