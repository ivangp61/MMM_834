BEGIN
--===================================WorkingList======================================================
--===================================MemberCompany
USE EnterpriseHub;

SELECT DISTINCT --memc.MemberRecId
memc.*
FROM    dbo.MemberCompany memc
	INNER JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
	--AND (memc.CreationDate >= '2017-03-01' OR memc.ModificationDate >= '2017-03-01')
	AND CONVERT(DATE, memc.JobLoadDate) >= CONVERT(DATE, '2017-10-04')
	--AND comp.DisplayCode = 'MMM'
	--AND MEMC.MemberRecId IN(338902)
;
--===================================MemberCompany

--===================================MemberCommunication
SELECT  comm.*
FROM    dbo.MemberCommunication comm
	JOIN MRef.Company comp on comp.CompanyMRefId = comm.CompanyMRefId
WHERE 1=1
	and comm.CommTypeMRefId = 7
	--and comm.JobLoadDate >= '2016-11-08'
	and (comm.ModificationDate >= '2017-02-01' or comm.CreationDate >= '2017-02-01')
	and comp.DisplayCode IN('MMM')
	AND comm.MemberRecId IN(279697)
;
--===================================MemberCommunication

--===================================MemberMedicaid
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
	JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 14
	and (Pkg.ModificationDate >= '2017-02-01' or Pkg.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(279697)
;
--===================================MemberMedicaid

--===================================MemberHospice
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 11
	--and (Pkg.ModificationDate >= '2017-02-01' or Pkg.CreationDate >= '2017-02-01')
	AND Pkg.JobLoadDate >= '2017-03-08'  
	--and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(338902)
--===================================MemberHospice


--===================================MemberPlan
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 24
	--and (Pkg.ModificationDate >= '2017-02-01' or Pkg.CreationDate >= '2017-02-01')
	and Pkg.JobLoadDate >= '2017-03-27'
	--and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(338902)
	--AND IndicatorRecId = 333503365;
--===================================MemberPlan

--===================================MemberPCP
SELECT  Pcp.MemberRecId
FROM    dbo.MemberPCP Pcp
JOIN MRef.Company comp on comp.CompanyMRefId = Pcp.CompanyMRefId
WHERE 1=1 
	and (Pcp.ModificationDate >= '2017-02-01' or Pcp.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pcp.MemberRecId IN(279697);
--===================================MemberPCP


--===================================MemberIdentifiers
SELECT  MemberRecId
FROM    XRef.Member Ident
JOIN MRef.Company Comp on Comp.CompanyMRefId = Ident.CompanyMRefId
WHERE 1=1
	And Ident.ExternalTypeMRefId IN (5, 9, 11)
	and (Ident.ModificationDate >= '2017-02-01' or Ident.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	--and comp.DisplayCode IN('MMM')
	--AND Ident.MemberRecId IN(279697);
--===================================MemberIdentifiers

--===================================MemberBenefitPackage
SELECT  MemberRecId
FROM    dbo.MemberBenefitPackage Pkg
JOIN MRef.Company Comp on Comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1
	and (Pkg.ModificationDate >= '2017-02-01' or Pkg.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(279697);

--===================================MemberBenefitPackage

--===================================MemberEnrollmentStatus
SELECT  MemberRecId
FROM    dbo.MemberEnrollmentStatus Stat
JOIN MRef.Company Comp on Comp.CompanyMRefId = Stat.CompanyMRefId
WHERE 1=1
	and (Stat.ModificationDate >= '2017-02-01' or Stat.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Stat.MemberRecId IN(279697);
--===================================MemberEnrollmentStatus

--===================================MemberAddress
SELECT  addr.MemberRecId
FROM    dbo.MemberAddress addr
JOIN MRef.Company comp on comp.CompanyMRefId = addr.CompanyMRefId
WHERE 1=1
	and addr.AddrTypeMRefId = 4
	and (addr.ModificationDate >= '2017-02-01' or addr.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND addr.MemberRecId IN(279697);
--===================================MemberAddress

END--===================================WorkingList