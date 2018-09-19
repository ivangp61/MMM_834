BEGIN--========================WorkingListUpdate


USE EnterpriseHub;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-03-08'
WHERE 1 = 1
	AND (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
	AND MemberRecId IN(338902)
;

UPDATE dbo. MemberCompany
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
	AND MemberRecId NOT IN(338902)
;

UPDATE dbo. MemberCommunication
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
;


UPDATE dbo.MemberCommunication
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
	AND	MemberRecId NOT IN(338902)
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
	  --AND IndicatorRecId = 333503365
;

UPDATE dbo. MemberIndicator
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
	AND MemberRecId NOT IN(338902)
	--AND IndicatorRecId <> 333503365
;

UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-03-08'
WHERE AddrTypeMRefId = 4
      AND (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
;


UPDATE dbo. MemberAddress
SET JobLoadDate = '2017-03-05'
WHERE AddrTypeMRefId = 4
    AND (JobLoadDate >= '2017-03-06')
	AND MemberRecId NOT IN(338902)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
;

UPDATE dbo. MemberEnrollmentStatus
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
     AND MemberRecId NOT IN(338902)
;

UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
;


UPDATE dbo. MemberBenefitPackage
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
	AND MemberRecId NOT IN(338902)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-03-08'
WHERE ExternalTypeMRefId IN(5 , 9, 11)
    AND (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
	AND MemberRecId IN(338902)
;


UPDATE XRef. Member
SET JobLoadDate = '2017-03-05'
WHERE ExternalTypeMRefId IN (5 , 9, 11)
      AND (JobLoadDate >= '2017-03-06')
      AND MemberRecId NOT IN(338902)
;


UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-03-08'
WHERE (CreationDate >= '2017-03-08' OR ModificationDate >= '2017-03-08')
      AND MemberRecId IN(338902)
;

UPDATE dbo. MemberPCP
SET JobLoadDate = '2017-03-05'
WHERE (JobLoadDate >= '2017-03-06')
      AND MemberRecId NOT IN(338902)
;

END--========================WorkingListUpdate