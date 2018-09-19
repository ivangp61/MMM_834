--SE HIZO PUSH DE LOS CASOS EL 29 DE NOVIEMBRE DE 2016

--=================MEMBER_KEYS==========

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE xm.ExternalValue IN('010692578','010713115','010713129','010735215','010766491','010678472')
;
--=================MEMBER_KEYS==========

BEGIN--=================MEMBERSYNC==============
UPDATE dbo. JobConfiguration SET
   ConfigValue = '20170213'
OUTPUT INSERTED.*
WHERE
   JobConfigId IN(
      SELECT
         conf .JobConfigId
      FROM
         dbo .JobDefinition              job        (NOLOCK )
         LEFT JOIN dbo.JobDefinition          stg        (NOLOCK )
            ON stg. ParentJobId = job .JobId
         LEFT JOIN dbo.JobConfiguration    conf    (NOLOCK )
            ON conf. JobId = stg .JobId
      WHERE 1= 1
         AND job. JobName = 'DIHMemberSync'
         AND stg. JobName LIKE 'Extr%'
         AND SUBSTRING (conf. ConfigName,1 ,4) IN('MMML' , 'PMCL' ))
;
END--=================MEMBERSYNC==============

BEGIN
--===================================WorkingList======================================================
--===================================MemberCompany
SELECT  memc.*
FROM    dbo.MemberCompany memc
	INNER JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
	AND (memc.CreationDate >= '2016-11-29' OR memc.ModificationDate >= '2016-11-29')
	--AND CONVERT(DATE, memc.JobLoadDate) >= CONVERT(DATE, '2016-29-11')
	AND comp.DisplayCode = 'MMM'
	AND MEMC.MemberRecId IN(644422)
	--639703,644422,650552,651239,665324,675078)
;
--===================================MemberCompany

--===================================MemberCommunication
SELECT  comm.*
FROM    dbo.MemberCommunication comm
	JOIN MRef.Company comp on comp.CompanyMRefId = comm.CompanyMRefId
WHERE 1=1
	and comm.CommTypeMRefId = 7
	--and comm.JobLoadDate >= '2016-11-08'
	and (comm.ModificationDate >= '2016-11-29' or comm.CreationDate >= '2016-11-29')
	and comp.DisplayCode IN('MMM')
	AND comm.MemberRecId IN(639703,644422,650552,651239,665324,675078)
;
--===================================MemberCommunication

--===================================MemberMedicaid
SELECT  Pkg.MemberRecId
FROM    dbo.MemberIndicator Pkg
	JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 14
	and (Pkg.ModificationDate >= '2016-11-29' or Pkg.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(639703,644422,650552,651239,665324,675078)
;
--===================================MemberMedicaid

--===================================MemberHospice
SELECT  Pkg.MemberRecId
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
 and Pkg.IndMRefId = 11
	and (Pkg.ModificationDate >= '2016-11-29' or Pkg.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(639703,644422,650552,651239,665324,675078)
--===================================MemberHospice


--===================================MemberPlan
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 24
	and (Pkg.ModificationDate >= '2016-11-29' or Pkg.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(644422)--639703,644422,650552,651239,665324,675078); 
--===================================MemberPlan

--===================================MemberPCP
SELECT  Pcp.MemberRecId
FROM    dbo.MemberPCP Pcp
JOIN MRef.Company comp on comp.CompanyMRefId = Pcp.CompanyMRefId
WHERE 1=1 
	and (Pcp.ModificationDate >= '2016-11-29' or Pcp.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pcp.MemberRecId IN(639703,644422,650552,651239,665324,675078);
--===================================MemberPCP


--===================================MemberIdentifiers
SELECT  MemberRecId
FROM    XRef.Member Ident
JOIN MRef.Company Comp on Comp.CompanyMRefId = Ident.CompanyMRefId
WHERE 1=1
	And Ident.ExternalTypeMRefId IN (5, 9, 11)
	and (Ident.ModificationDate >= '2016-11-29' or Ident.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Ident.MemberRecId IN(639703,644422,650552,651239,665324,675078);
--===================================MemberIdentifiers

--===================================MemberBenefitPackage
SELECT  MemberRecId
FROM    dbo.MemberBenefitPackage Pkg
JOIN MRef.Company Comp on Comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1
	and (Pkg.ModificationDate >= '2016-11-29' or Pkg.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(639703,644422,650552,651239,665324,675078);

--===================================MemberBenefitPackage

--===================================MemberEnrollmentStatus
SELECT  MemberRecId
FROM    dbo.MemberEnrollmentStatus Stat
JOIN MRef.Company Comp on Comp.CompanyMRefId = Stat.CompanyMRefId
WHERE 1=1
	and (Stat.ModificationDate >= '2016-11-29' or Stat.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Stat.MemberRecId IN(639703,644422,650552,651239,665324,675078);
--===================================MemberEnrollmentStatus

--===================================MemberAddress
SELECT  addr.MemberRecId
FROM    dbo.MemberAddress addr
JOIN MRef.Company comp on comp.CompanyMRefId = addr.CompanyMRefId
WHERE 1=1
 and addr.AddrTypeMRefId = 4
	and (addr.ModificationDate >= '2016-11-29' or addr.CreationDate >= '2016-11-29')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND addr.MemberRecId IN(639703,644422,650552,651239,665324,675078);
--===================================MemberAddress

END--===================================WorkingList



BEGIN--========================WorkingListUpdate


USE EnterpriseHub;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2016-11-29'
WHERE (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
	  AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-01')
	AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberCommunication
SET JobLoadDate = '2016-11-29'
WHERE (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE dbo.MemberCommunication
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-01')
	AND	MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2016-11-29'
WHERE (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-01')
	AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2016-11-29'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2016-10-31'
WHERE AddrTypeMRefId = 4
    AND (JobLoadDate >= '2016-11-01')
	AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2016-11-29'
WHERE (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-01')
     AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2016-11-29'
WHERE (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-01')
	AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE XRef. Member
SET JobLoadDate = '2016-11-29'
WHERE ExternalTypeMRefId IN(5 , 9, 11)
    AND (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
	AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE XRef. Member
SET JobLoadDate = '2016-10-31'
WHERE ExternalTypeMRefId IN (5 , 9, 11)
      AND (JobLoadDate >= '2016-11-01')
      AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;


UPDATE dbo. MemberPCP
SET JobLoadDate = '2016-11-29'
WHERE 1= 1
      AND (CreationDate >= '2016-11-29' OR ModificationDate >= '2016-11-29')
      AND MemberRecId IN(639703,644422,650552,651239,665324,675078)--(644422)--
;

UPDATE dbo. MemberPCP
SET JobLoadDate = '2016-10-31'
WHERE 1= 1
      AND (JobLoadDate >= '2016-11-01')
      AND MemberRecId NOT IN(639703,644422,650552,651239,665324,675078)--(644422)--
;
END--========================WorkingListUpdate

SELECT *
FROM QNXTHub.stg.MemberWorkingList WL
WHERE WL.DIHRecId IN(644422,650552,651239,665324,639703,675078)
;



SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy 
FROM QNXTHub.qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '010692578'
	AND EffDate <> TermDate AND PrimaryStatus <> 'V'
ORDER BY EffDate


SELECT 'TgtPlan'  AS 'tbl'
,h.memid                                                          
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateBegin AS datetime ) ,101 )'effdate'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateEnd AS datetime ) ,101 )  'termdate'
       --,p.TransactionGroupCd                                                'Tg'
      ,p.MaintIdentCd                                                      'M'
      ,p.InsuranceLineCd                                                   'Ins'
      ,p.PlanCoverageDesc                                                  'Rate'
      ,p.PolicyGroupIdent                                                  'Pol'
	  ,P.TransactionGroupCd
  FROM
       QNXTHub.tgt.MemberBenefitPlan p
       JOIN QNXTHub.stg.MemberHeader h
            ON h.DIHMemberRecId = p.DIHMemberRecId
  WHERE 1 = 1
         AND H.DIHMemberRecId = 675078 
  ORDER BY p.EnrollDateBegin;
--  639703
--644422
--650552
--651239
--665324
--675078

SELECT *
FROM QNXTHub.stg.MemberHeader h
where h.DIHMemberRecId =675078

--QLXM00000429675
--MEML00000429675


SELECT *
FROM QNXTHub.qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
AND TargetCode ='QLXBP0148' 
--	AND MemberBenefitPlanRateMRefId IN('9BC0CE6C-EE9A-4937-B542-BAFB609E10A8','C05426E5-44EC-4F04-9E56-43423DF061BB')
;
SELECT  MemberHeaderId FROM tgt.MemberHeader

select *
from QNXTHub.tgt.MemberBenefitPlan

select *
from QNXTHub.tgt.MemberHeader
--update QNXTHub.stg.MemberHeader
set memid = 'QLXM00000429675'
,SecondaryId = 'MEML00000429675'
where memberheaderid = '426358DD-DD07-47F3-86ED-6B902E4FF0EB'
;


--update QNXTHub.stg.MemberHeader
set memid = null
,SecondaryId = null
where memberheaderid = '426358DD-DD07-47F3-86ED-6B902E4FF0EB'
;


SELECT  head.MemId, head.SecondaryId, head.SocialSecurity, head.Firstname, head.Initial, head.Lastname, head.Gender, head.BirthDate 
FROM   QNXTHub.qnxt.MemberHeader head 
	JOIN QNXTHub.qnxt.MemberEnrollKeys keys on keys.MemId = head.MemId 
WHERE keys.Carriermemid = '010766491'
GROUP BY head.MemId, head.SecondaryId, head.SocialSecurity, head.Firstname, head.Initial, head.Lastname, head.Gender, head.BirthDate


select *
from QNXTHub.qnxt.MemberHeader h
WHERE H.MemberHeaderId = '8E0D8269-1178-4C66-BC13-D7CBB5B62354'
--INSERT INTO 
VALUES('426358DD-DD07-47F3-86ED-6B902E4FF0EB',)

SELECT *
FROM QNXTHub.qnxt.MemberEnrollKeys KEYS
WHERE keys.Carriermemid = '010766491'
