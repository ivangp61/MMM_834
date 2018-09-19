
--AP_DIHINTER_QNXTMEMBRSYNCV2
--010_QNXT_Plandata_Extract,020_MMM_DIH_EHub_Extract,025_MMM_QNXTHub_XML_Create,030_PMC_DIH_EHub_Extract,035_PMC_QNXTHub_XML_Create,040_MMMHC_Membership_834_Invoke

--\\1linden11.dev.pr.mmmhc.com\DataExchange\PRDS\TRIZETTO\Outbound


USE EnterpriseHub;
GO

UPDATE dbo. MemberCompany
SET JobLoadDate = '2016-11-21'
--OUTPUT INSERTED.*
WHERE
(CreationDate >= '2016-11-11'
      OR ModificationDate >= '2016-11-11'
	  OR JobLoadDate >= '2016-11-11') 
	  AND MemberRecId IN(279697)
;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2016-10-31'
--OUTPUT INSERTED.*
WHERE (CreationDate >= '2016-11-11'     OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')      AND
MemberRecId NOT
IN(279697)
;

UPDATE dbo. MemberCommunication
SET JobLoadDate = '2016-11-21'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
      AND MemberRecId IN(279697)
;


UPDATE dbo.MemberCommunication
SET JobLoadDate = '2016-10-31'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11') 
	AND	MemberRecId NOT IN(279697)
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2016-11-21'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
      AND MemberRecId IN(279697)
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2016-10-31'
WHERE (JobLoadDate >= '2016-11-21')     
	AND MemberRecId NOT IN(279697)
;

UPDATE dbo. MemberAddress
SET JobLoadDate = '2016-11-21'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
      AND MemberRecId IN(279697)
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2016-10-31'
WHERE AddrTypeMRefId = 4
    AND (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')  
	AND MemberRecId NOT IN(279697)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2016-11-21'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
      AND MemberRecId IN(279697)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2016-10-31'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
     AND MemberRecId NOT IN(279697)
;

UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2016-11-21'
WHERE (CreationDate >= '2016-11-11' OR ModificationDate >= '2016-11-11' OR JobLoadDate >= '2016-11-11')
      AND MemberRecId IN(279697)
;


UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2016-10-31'
WHERE (CreationDate >= '2016-11-21' OR ModificationDate >= '2016-11-21' OR JobLoadDate >= '2016-11-21')
	AND MemberRecId NOT IN(279697)
;


UPDATE XRef. Member
SET JobLoadDate = '2016-11-21'
WHERE ExternalTypeMRefId IN(5 , 9, 11)
    AND (CreationDate >= '2016-11-21' OR ModificationDate >= '2016-11-21' OR JobLoadDate >= '2016-11-21')
	AND MemberRecId IN(279697)
;


UPDATE XRef. Member
SET JobLoadDate = '2016-10-31'
WHERE ExternalTypeMRefId IN (5 , 9, 11)
      AND ( CreationDate >= '2016-11-21' OR ModificationDate >= '2016-11-21' OR JobLoadDate >= '2016-11-21')
      AND MemberRecId NOT IN(279697)
;


UPDATE dbo. MemberPCP
SET JobLoadDate = '2016-11-21'
WHERE 1= 1
      AND ( CreationDate >= '2016-11-21' OR ModificationDate >= '2016-11-21' OR JobLoadDate >= '2016-11-21')
      AND MemberRecId IN(279697)
;

UPDATE dbo. MemberPCP
SET JobLoadDate = '2016-10-31'
WHERE 1= 1
      AND ( CreationDate >= '2016-11-21' OR ModificationDate >= '2016-11-21' OR JobLoadDate >= '2016-11-21')
      AND MemberRecId NOT IN(279697)
;




