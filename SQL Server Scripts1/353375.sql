--SE HIZO PUSH DE LOS CASOS EL 13 DE FEBRERO DE 2017


BEGIN--=================MEMBER_KEYS==========
SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc], m.CreationDate, m.ModificationDate
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	--and xm.ExternalValue IN('010026567')
	and M.MemberRecId = 55429
;

SELECT DISTINCT M.MEMBERRECID,xm.ExternalValue
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	and xm.ExternalValue IN('010753639','010204424','010619495','010616301','010039326','010004164','010759434')	
;
SELECT DISTINCT M.MEMBERRECID,xm.ExternalValue
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'AVETA'--ET.Code = 'MP'--
WHERE 1 = 1
	and code = 'MP'
	and M.MEMBERRECID IN(19338,56274,92933,594178,597735,597735,672463)	
;


END--=================MEMBER_KEYS==========


BEGIN--=================MEMBERSYNC==============
UPDATE dbo. JobConfiguration SET
   ConfigValue = '20170227'
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
--	AND (memc.CreationDate >= '2016-11-21' OR memc.ModificationDate >= '2016-11-21')
	--AND CONVERT(DATE, memc.JobLoadDate) >= CONVERT(DATE, '2016-29-11')
	AND comp.DisplayCode = 'MMM'
	AND MEMC.MemberRecId IN(279697)
;
--===================================MemberCompany

--===================================MemberCommunication
SELECT  comm.*
FROM    dbo.MemberCommunication comm
	JOIN MRef.Company comp on comp.CompanyMRefId = comm.CompanyMRefId
WHERE 1=1
	and comm.CommTypeMRefId = 7
	--and comm.JobLoadDate >= '2016-11-08'
	and (comm.ModificationDate >= '2016-11-21' or comm.CreationDate >= '2016-11-21')
	and comp.DisplayCode IN('MMM')
	AND comm.MemberRecId IN(66455)
;
--===================================MemberCommunication

--===================================MemberMedicaid
SELECT  Pkg.*
FROM    dbo.MemberIndicator Pkg
	JOIN MRef.Company comp on comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and Pkg.IndMRefId = 14
	and (Pkg.ModificationDate >= '2016-11-21' or Pkg.CreationDate >= '2016-11-21')
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
	--and (Pkg.ModificationDate >= '2016-11-21' or Pkg.CreationDate >= '2016-11-21')
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
	--and (Pkg.ModificationDate >= '2016-11-21' or Pkg.CreationDate >= '2016-11-21')
	--and Pkg.JobLoadDate >= '2017-01-01'  
	--and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(597735)
	--AND IndicatorRecId = 333503365;
--===================================MemberPlan

--===================================MemberPCP
SELECT  Pcp.MemberRecId
FROM    dbo.MemberPCP Pcp
JOIN MRef.Company comp on comp.CompanyMRefId = Pcp.CompanyMRefId
WHERE 1=1 
	and (Pcp.ModificationDate >= '2016-11-21' or Pcp.CreationDate >= '2016-11-21')
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
	and (Ident.ModificationDate >= '2016-11-21' or Ident.CreationDate >= '2016-11-21')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Ident.MemberRecId IN(279697);
--===================================MemberIdentifiers

--===================================MemberBenefitPackage
SELECT  MemberRecId
FROM    dbo.MemberBenefitPackage Pkg
JOIN MRef.Company Comp on Comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1
	and (Pkg.ModificationDate >= '2016-11-21' or Pkg.CreationDate >= '2016-11-21')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND Pkg.MemberRecId IN(279697);

--===================================MemberBenefitPackage

--===================================MemberEnrollmentStatus
SELECT  MemberRecId
FROM    dbo.MemberEnrollmentStatus Stat
JOIN MRef.Company Comp on Comp.CompanyMRefId = Stat.CompanyMRefId
WHERE 1=1
	and (Stat.ModificationDate >= '2016-11-21' or Stat.CreationDate >= '2016-11-21')
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
	and (addr.ModificationDate >= '2016-11-21' or addr.CreationDate >= '2016-11-21')
	--and Pkg.JobLoadDate >= ?  
	and comp.DisplayCode IN('MMM')
	AND addr.MemberRecId IN(279697);
--===================================MemberAddress

END--===================================WorkingList

BEGIN--========================WorkingListUpdate


USE EnterpriseHub;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
	  AND MemberRecId IN(597735)
;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
	AND MemberRecId NOT IN(597735)
;

UPDATE dbo. MemberCommunication
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
;


UPDATE dbo.MemberCommunication
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
	AND	MemberRecId NOT IN(597735)
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
	  --AND IndicatorRecId = 333503365
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
	AND MemberRecId NOT IN(597735)
	--AND IndicatorRecId <> 333503365
;

UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-02-02'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-01-31'
WHERE AddrTypeMRefId = 4
    AND (JobLoadDate >= '2017-02-01')
	AND MemberRecId NOT IN(597735)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
     AND MemberRecId NOT IN(597735)
;

UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
;


UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
	AND MemberRecId NOT IN(597735)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-02-02'
WHERE ExternalTypeMRefId IN(5 , 9, 11)
    AND (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
	AND MemberRecId IN(597735)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-01-31'
WHERE ExternalTypeMRefId IN (5 , 9, 11)
      AND (JobLoadDate >= '2017-02-01')
      AND MemberRecId NOT IN(597735)
;


UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-02-02'
WHERE (CreationDate >= '2017-02-01' OR ModificationDate >= '2017-02-01')
      AND MemberRecId IN(597735)
;

UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-01-31'
WHERE (JobLoadDate >= '2017-02-01')
      AND MemberRecId NOT IN(597735)
;


END--========================WorkingListUpdate


SELECT * 
FROM QNXTHUB.qnxt.MemberBenefitPlanRate 
WHERE CarrierCode = 'MMM' 
	AND SOURCECODE IN('P00310752464','P00250310167')
	--TargetCode ='QLXBP0148' 
;

BEGIN--===========================MEMBER_TARGET================================================
SELECT distinct 'TgtPlan'                                                           'tbl'
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
        AND p.DIHMemberRecId = 597735
ORDER BY p.EnrollDateBegin DESC
;
END--===========================MEMBER_TARGET================================================




BEGIN--=================MEMBER_ELIGIBILITY==========
SELECT DISTINCT TOP 100	MI.SORId,			
						 MC.MemberRecId,						 
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
	AND MC.MemberRecId IN(55429)
	AND Mi.JobLoadDate >= '2017-02-25'
	--AND C.DisplayCode = 'MMM'
ORDER BY Mi.JobLoadDate DESC,MC.MemberRecId, MI.IndEffectiveDate DESC
;
END--=================MEMBER_ELIGIBILITY==========

BEGIN--=================MEMBER_ENROLLKEYS==========
SELECT  MBP.TargetCode
		, MBP.SourceCode
		,keys.MemId
		, keys.Carriermemid
		, keys.EffDate
		, keys.TermDate
		, keys.PrimaryStatus
		, keys.RateCode
		, keys.CoverageCodeId
		, keys.OrgPolicy
		, MBP.CoverageDescription
FROM QNXTHub.qnxt.MemberEnrollKeys keys
	INNER JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON keys.RateCode = MBP.RateCode AND keys.CoverageCodeId = MBP.CoverageCode AND keys.OrgPolicy = MBP.OrgPolicy
WHERE keys.Carriermemid = '010619495'
	--AND PrimaryStatus = 'P'
ORDER BY EffDate DESC
;
END--=================MEMBER_ENROLLKEYS==========

--==================================QNXTHub==================================
USE QNXTHub;

SELECT *
FROM stg.MemberBenefitPlan MBP
ORDER BY EffDate
;

SELECT  keys.MemId
		, keys.Carriermemid
		, keys.SegType
		, keys.EffDate
		, keys.TermDate
		, keys.PrimaryStatus
		, keys.RateCode
		, keys.CoverageCodeId
		, keys.OrgPolicy 
FROM qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '010619495'
ORDER BY EffDate
;

SELECT MBP.DIHMemberRecId
		, MBP.EffDate
		, MBP.TermDate
		, MBP.MemberBenefitPlanId
		, MBP.SourceCode
FROM stg.MemberBenefitPlan MBP
ORDER BY EffDate DESC
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
	AND pcp.DIHMemberRecId = 597735
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
--==================================QNXTHub==================================


SELECT TOP 1 *, T.TransactionFileLogId
FROM trn.TransactionFileLog T
ORDER BY T.X12CreatedDate DESC
;

--UPDATE trn.TransactionFileLog
SET X12Created = 0
WHERE TransactionFileLogId = '36E3A82C-8F82-4094-9AEB-AE3D74A1388C'
;


