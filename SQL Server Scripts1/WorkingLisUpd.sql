USE EnterpriseManagement
GO

SELECT *
FROM dbo.ExecutionLog
WHERE
   ExecutionLogId in(4927786,
4927789,
4927807,
4927818,
4927832,
4927834,
4927846)
;
GO

--P00279140874

SELECT *
FROM dbo.ExecutionLog EL
WHERE EL.JobId IN(
100503,
100504,
100505,
100507,
100506,
100508,
100509)
      --AND EL.ExecutionStatus = 'COMPLETE'
ORDER BY EL.ProcessStart DESC
;

----------------------------------------------------------------------------------- Update Last Run Date 834
-- AP_DIHINTER_QNXTMEMBRSYNCv2
-- MMMHC_MEM_QNXT_EHub_ExtrQnxtMember
-- MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM
-- MMMHC_MEM_QNXT_EHub_ExtrEHubMember.PMC
-- MMMHC_MEM_QNXT_EHub_CreateFile.MMM
-- MMMHC_MEM_QNXT_EHub_CreateFile.PMC
-- MMM_Membership_QNXT_EHub_834_Process

UPDATE dbo.ExecutionLog
SET
   ProcessStart = '2016-08-07 00:00:00'
   ,ProcessEnd = '2016-08-07 00:01:00'
   ,ExecutionStatus = 'COMPLETE'
WHERE
   ExecutionLogId in(4937627,
4937626,
4937625,
4937624)
;
GO

--AP_DIHINTER_QNXTMEMBRSYNCV2
--010_QNXT_Plandata_Extract,020_MMM_DIH_EHub_Extract,025_MMM_QNXTHub_XML_Create,030_PMC_DIH_EHub_Extract,035_PMC_QNXTHub_XML_Create,040_MMMHC_Membership_834_Invoke

--\\1linden11.dev.pr.mmmhc.com\DataExchange\PRDS\TRIZETTO\Outbound


USE EnterpriseHub;
GO

UPDATE dbo.MemberCompany
SET JobLoadDate = '2016-05-06'
--OUTPUT INSERTED.*
WHERE 
(CreationDate >= '2016-05-31'
      OR ModificationDate >= '2016-05-31')      AND 
MemberRecId 
IN
(652438)
;

UPDATE dbo.MemberCompany
SET JobLoadDate = '2016-04-01'
--OUTPUT INSERTED.*
WHERE (CreationDate >= '2016-08-05'     OR ModificationDate >= '2016-08-05' OR JobLoadDate >= '2016-08-05')      AND 
MemberRecId NOT
IN
(652438)
;

UPDATE dbo.MemberCommunication
SET JobLoadDate = '2016-05-06'
WHERE 
(CreationDate >= '2016-05-31'
      OR ModificationDate >= '2016-05-31')
      AND MemberRecId IN
(652438)
;



UPDATE dbo.MemberCommunication
SET JobLoadDate = '2016-04-01'
WHERE 
(CreationDate >= '2016-08-05'
    OR ModificationDate >= '2016-08-05'
    OR JobLoadDate >= '2016-08-05')    
 AND 
MemberRecId 
NOT IN
(652438)
;

UPDATE dbo.MemberIndicator
SET JobLoadDate = '2016-05-06'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05')
      AND MemberRecId IN 
                              (652438)
;


UPDATE dbo.MemberIndicator
SET JobLoadDate = '2016-04-01'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' OR JobLoadDate >= '2016-08-05')     AND 
MemberRecId NOT IN (652438)
                              ;

UPDATE dbo.MemberAddress
SET JobLoadDate = '2016-05-06'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2016-05-31' OR ModificationDate >= '2016-05-31')
      AND MemberRecId IN
                              (652438)
;


UPDATE dbo.MemberAddress
SET JobLoadDate = '2016-04-01'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' OR JobLoadDate = '2016-08-25')   
AND MemberRecId NOT IN
                              (652438)
;

UPDATE dbo.MemberEnrollmentStatus
SET JobLoadDate = '2016-05-06'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-31' or JobLoadDate = '2016-08-05')
      AND MemberRecId IN
                              (652438)
;



UPDATE dbo.MemberEnrollmentStatus
SET JobLoadDate = '2016-04-01'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' OR JobLoadDate >= '2016-08-05')     AND 
MemberRecId NOT IN
                              (652438)
;

UPDATE dbo.MemberBenefitPackage
SET JobLoadDate = '2016-05-06'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' or JobLoadDate >= '2016-08-05')
      AND MemberRecId IN
                              (652438)
;


UPDATE dbo.MemberBenefitPackage
SET JobLoadDate = '2016-04-01'
WHERE (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' or JobLoadDate >= '2016-08-05')     AND 
MemberRecId NOT IN
                              (652438)
;


UPDATE XRef.Member
SET JobLoadDate = '2016-05-06'
WHERE ExternalTypeMRefId IN (5, 9, 11)
--    AND (CreationDate >= '2016-04-05' OR ModificationDate >= '2016-04-05')  
AND 
MemberRecId IN
                              (652438)
;


UPDATE XRef.Member
SET JobLoadDate = '2016-04-01'
WHERE ExternalTypeMRefId IN (5, 9, 11)
      AND (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' or JobLoadDate >= '2016-08-05')
      AND MemberRecId NOT IN
                              (652438)
;


UPDATE dbo.MemberPCP
SET JobLoadDate = '2016-05-06'
WHERE 1=1 
      AND (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' or JobLoadDate >= '2016-08-05')
      AND MemberRecId IN
                              (652438)
;

UPDATE dbo.MemberPCP
SET JobLoadDate = '2016-04-01'
WHERE 1=1 
      AND (CreationDate >= '2016-08-05' OR ModificationDate >= '2016-08-05' or JobLoadDate >= '2016-08-05')
      AND MemberRecId NOT IN
                              (652438)
;


