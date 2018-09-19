--SE HIZO PUSH DE LOS CASOS EL 21 DE NOVIEMBRE DE 2016

--=================MEMBER_KEYS==========

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE --xm.ExternalValue IN('030151646')
M.MemberRecId = 382769
;

--=================MEMBER_KEYS==========

BEGIN--=================MEMBERSYNC==============
USE EnterpriseManagement;

UPDATE dbo. JobConfiguration SET
   ConfigValue = '20170307'
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
USE EnterpriseHub;

SELECT  memc.*
FROM    dbo.MemberCompany memc
	INNER JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
	--AND (memc.CreationDate >= '2017-03-01' OR memc.ModificationDate >= '2017-03-01')
	AND CONVERT(DATE, memc.JobLoadDate) >= CONVERT(DATE, '2017-03-27')
	--AND comp.DisplayCode = 'MMM'
	AND MEMC.MemberRecId IN(338902)
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
--	and Pkg.JobLoadDate >= '2016-12-21'  
	--and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(254990)
--===================================MemberHospice


--===================================MemberPlan
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 24
	--and (Pkg.ModificationDate >= '2017-02-01' or Pkg.CreationDate >= '2017-02-01')
	--and Pkg.JobLoadDate >= '2017-01-01'  
	--and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(254990)
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

BEGIN--========================WorkingListUpdate


USE EnterpriseHub;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
	  AND MemberRecId IN(346198)
;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
	AND MemberRecId NOT IN(346198)
;

UPDATE dbo. MemberCommunication
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
;


UPDATE dbo.MemberCommunication
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
	AND	MemberRecId NOT IN(346198)
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
	  --AND IndicatorRecId = 333503365
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
	AND MemberRecId NOT IN(346198)
	--AND IndicatorRecId <> 333503365
;

UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-03-08'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-03-05'
WHERE AddrTypeMRefId = 4
    AND (JobLoadDate >= '2017-03-20')
	AND MemberRecId NOT IN(346198)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
     AND MemberRecId NOT IN(346198)
;

UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
;


UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
	AND MemberRecId NOT IN(346198)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-03-08'
WHERE ExternalTypeMRefId IN(5 , 9, 11)
    AND (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
	AND MemberRecId IN(346198)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-03-05'
WHERE ExternalTypeMRefId IN (5 , 9, 11)
      AND (JobLoadDate >= '2017-03-20')
      AND MemberRecId NOT IN(346198)
;


UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(346198)
;

UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-20')
      AND MemberRecId NOT IN(346198)
;

END--========================WorkingListUpdate


SELECT 'TgtPlan'                                                           'tbl'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateBegin AS datetime ) ,101 )'effdate'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateEnd AS datetime ) ,101 )  'termdate'
       --,p.TransactionGroupCd                                                'Tg'
      ,p.MaintIdentCd                                                      'M'
      ,p.InsuranceLineCd                                                   'Ins'
      ,p.PlanCoverageDesc                                                  'Rate'
       --,p.EnrollDateBeginIdentCd      
       --,p.EnrollDateEndIdentCd
       --,p.ClientRptCatIdentCd
       -- ,p.ClientRptCatident
       --,p.PolicyGroupIdentCd
      ,p.PolicyGroupIdent                                                  'Pol'
	  , p.TransactionGroupCd
	  ,p.MaintIdentCd
	  ,MBP.BenefitPlan
	  ,MBP.CoverageDescription
FROM QNXTHub.tgt.MemberBenefitPlan p
	JOIN QNXTHub.stg.MemberHeader h
    ON h.DIHMemberRecId = p.DIHMemberRecId
	JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON P.PolicyGroupIdent = MBP.OrgPolicy AND P.PlanCoverageDesc = MBP.RateCode
WHERE 1 = 1
        AND p.DIHMemberRecId = 187255
ORDER BY p.EnrollDateBegin DESC
;

SELECT * 
FROM QNXTHUB.qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
	AND SOURCECODE IN('P00310752464','P00250310167')
	--TargetCode ='QLXBP0148' 
;



SELECT --pcp.EntityIdentCd
       --,pcp.EntityTypeQualifier
       'tgtPcp' 'tbl'
      ,pcp.Firstname
      ,pcp.Middlename
      ,pcp.Lastname
      ,pcp.IdentCdQualifier
       --,pcp.IdentCd
      ,pcp.EffectiveDate
      ,pcp.MaintReasonCd
  FROM
       QNXTHub.tgt.MemberPcp pcp
       JOIN QNXTHub.stg.MemberHeader h
            ON h.DIHMemberRecId = pcp.DIHMemberRecId
  WHERE 1 = 1
    --AND h.memid = @memid;
	AND pcp.DIHMemberRecId = 187255;



SELECT *
FROM ADWODSSTG.dbo.STG_HCFA_DATE HD
WHERE HD.NAME_ID = 'N00191818121'
	AND INDICATOR = 'hospice_ind'
;

SELECT  MBP.TargetCode, MBP.SourceCode, keys.MemId, keys.Carriermemid, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy,MBP.CoverageDescription
FROM QNXTHub.qnxt.MemberEnrollKeys keys
	INNER JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON keys.RateCode = MBP.RateCode AND keys.CoverageCodeId = MBP.CoverageCode AND keys.OrgPolicy = MBP.OrgPolicy
WHERE keys.Carriermemid in('030170699'
--'010145685', 
--'010149477',
--'010258196',
--'010135074',
--'010117206'
)
--= '010145685'
	AND PrimaryStatus = 'P'
ORDER BY EffDate DESC
;


SELECT * 
FROM QNXTHUB.qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
	AND SOURCECODE IN('P00310749431','P00075696224')
	--TargetCode ='QLXBP0148' 
;



SELECT * 
FROM QNXTHUB.qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
	AND SOURCECODE IN('P00310749431','P00075696224')
	--TargetCode ='QLXBP0148' 
;



SELECT pkg.MemberBenefitPlanId, pkg.BenefitPlan,pkg.EffDate,pkg.TermDate,pkg.SourceCode 
FROM QNXTHub.stg.MemberBenefitPlan pkg 
WHERE pkg.DIHMemberRecId = 187255
ORDER BY pkg.EffDate
;

SELECT pkg.*
FROM QNXTHub.stg.MemberHospice pkg 
WHERE pkg.DIHMemberRecId = 187255
ORDER BY pkg.EffDate
;



SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
FROM dbo.MemberIndicator Ind
JOIN mref.Company Comp on Comp.CompanyMRefId = Ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId = 24
    AND (IndEffectiveDate >= '2010-11-20'
	   or (IndEffectiveDate < '2010-11-20' and IndEndDate is null)
	   or (IndEffectiveDate < '2010-11-20' and IndEndDate > '2010-11-20')
)
    AND Comp.DisplayCode = 'MMM'
	AND MemberRecId = 279697

SELECT *
FROM QNXTHub.stg.MemberWorkingList WL
WHERE WL.DIHRecId IN(644422,650552,651239,665324,639703,675078)
;



--=================MEMBER_ELIGIBILITY==========
SELECT DISTINCT MC.MemberRecId,						 
						 MC.FirstName,						 
						 C.DisplayCode,
						 CASE 
							WHEN MI.IndMRefId  = 24 THEN 'Medical Coverage' 
							WHEN MI.IndMRefId  = 11 THEN 'Hospice'
						 END AS CoverageType,
						 MI.IndValue AS PackageId,				 
						 BP.[Desc] AS PackageName,
						 MI.IndEffectiveDate AS EnrollDate,
						 MI.IndEndDate AS DisenrollDate,
						 Mi.JobLoadDate
FROM dbo.MemberCompany MC
	INNER JOIN dbo.MemberIndicator MI
	ON MC.CompanyMRefId = MI.CompanyMRefId AND MC.MemberRecId = MI.MemberRecId
	INNER JOIN Mref.Company C
	ON MC.CompanyMRefId = C.CompanyMRefId	
	LEFT JOIN Xref.BenefitPackage XBP
	ON MI.IndValue = XBP.ExternalValue
	LEFT JOIN MRef.BenefitPackage BP
	ON XBP.BenefitPkgMRefId = BP.BenefitPkgMRefId
WHERE 1 = 1
	AND MI.IndMRefId IN(24,11)
	AND MC.MemberRecId IN(338902)--(346198, 486206, 338902, 243953, 382769)--(346198, 486206, 338902, 243953, 382769)
	AND (MI.JobLoadDate >= '2017-03-08')	
	--(187255, 187045, 381831, 178648, 102440)
	--AND C.DisplayCode = 'MMM'
ORDER BY MC.MemberRecId, MI.IndEffectiveDate DESC
;
--=================MEMBER_ELIGIBILITY==========



SELECT TOP 100 *
FROM Xref.BenefitPackage XBP
WHERE XBP.ExternalValue = 'P00342418603'
;


