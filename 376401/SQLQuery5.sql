USE EnterpriseHub;

SELECT DISTINCT TOP 100 
       M.MemberRecId, 
       M.FirstName, 
       xm.ExternalValue AS MemberID, 
       ET.[Desc], 
       HIC_MBI.ExternalValue AS HIC_MBI, HIC_MBI.JobLoadDate,
       HICNUM.ExternalValue AS HIC_NUM,
       MBI.ExternalValue AS MBI
FROM MemberCompany M
     INNER JOIN Xref.Member XM
     ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
     INNER JOIN mref.ExternalType ET
     ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
       LEFT OUTER JOIN (
                                              SELECT DISTINCT M.MemberRecId, ET.Code,ET.ExternalTypeMRefId, XM.ExternalValue, XM.JobLoadDate
                                              FROM MemberCompany M
                                                    INNER JOIN Xref.Member XM
                                                    ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
                                                    INNER JOIN mref.ExternalType ET
                                                    ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId
                                              WHERE 1 = 1
                                                    AND ET.ExternalTypeMRefId = 11   
        ) AS HIC_MBI
       ON M.MemberRecId =  HIC_MBI.MemberRecId
       LEFT OUTER JOIN (
                                              SELECT DISTINCT M.MemberRecId, ET.Code,ET.ExternalTypeMRefId, XM.ExternalValue, XM.JobLoadDate
                                              FROM MemberCompany M
                                                    INNER JOIN Xref.Member XM
                                                    ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
                                                    INNER JOIN mref.ExternalType ET
                                                    ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId
                                              WHERE 1 = 1
                                                    AND ET.ExternalTypeMRefId = 12
       ) AS HICNUM
       ON M.MemberRecId =  HICNUM.MemberRecId
       LEFT OUTER JOIN (
                                              SELECT DISTINCT M.MemberRecId, ET.Code,ET.ExternalTypeMRefId, XM.ExternalValue, XM.JobLoadDate
                                              FROM MemberCompany M
                                                    INNER JOIN Xref.Member XM
                                                    ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
                                                    INNER JOIN mref.ExternalType ET
                                                    ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId
                                              WHERE 1 = 1
                                                    AND ET.ExternalTypeMRefId = 35
       ) AS MBI
       ON M.MemberRecId =  MBI.MemberRecId
WHERE 1 = 1
       AND M.MemberRecId IN(361202, 761940)
;

