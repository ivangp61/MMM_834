SELECT  memc.*
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
 AND CONVERT(VARCHAR,memc.JobLoadDate,112) >= '20160706' 
 AND comp.DisplayCode = 'MMM'
 AND MemberRecId = 652438
;

SELECT  Pcp.*
FROM    dbo.MemberPCP Pcp
JOIN MRef.Company comp on comp.CompanyMRefId = Pcp.CompanyMRefId
WHERE 1=1 
AND CONVERT(VARCHAR,comp.JobLoadDate,112) >= '20160706' 
AND comp.DisplayCode = 'MMM'
 AND MemberRecId = 652438
 ;

SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
 and Pkg.IndMRefId = 24
 AND CONVERT(VARCHAR,comp.JobLoadDate,112) >= '20160706' 
AND comp.DisplayCode = 'MMM'
 AND MemberRecId = 652438
;


