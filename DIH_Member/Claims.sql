--=================MEMBER_KEYS==========
SELECT *
FROM mref.ExternalType ET
;

SELECT TOP 100 M.MemberRecId, M.FirstName, M.JobLoadDate, xm.ExternalValue, ET.Code, ET.[Desc]
FROM MemberCompany M
	INNER JOIN Xref.Member XM
	ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
	INNER JOIN mref.ExternalType ET
	ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId --AND ET.Code = 'MP' 	
WHERE --XM.ExternalValue = '030075420'
M.MemberRecId IN(301559)
;
--=================MEMBER_KEYS==========

--=================ELIGIBILITY_CLAIMS==========
SELECT  PKG.MemberRecId
, PKG.IndValue
, Pkg.IndEffectiveDate
, PKG.IndEndDate
, C.ClaimRefID
, C.ServiceDateFrom
, C.ServiceDateTo
FROM EnterpriseHub.dbo.MemberIndicator Pkg
	INNER JOIN EnterpriseHub.MRef.Company comp 
	ON comp.CompanyMRefId = Pkg.CompanyMRefId
	INNER JOIN ENTERPRISEHUB.DBO.CLAIM C
	ON PKG.MemberRecId = C.SUBSCRIBERMEMBERMREFID
WHERE 1=1 
	AND Pkg.IndMRefId = 24	
	AND Pkg.MemberRecId IN(573689)
	AND C.ClaimRefID = 73739834
	AND CONVERT(DATE,C.ServiceDateFrom) BETWEEN CONVERT(DATE,Pkg.IndEffectiveDate) AND ISNULL(CONVERT(DATE,PKG.IndEndDate),CONVERT(DATE,C.ServiceDateFrom))
;
--=================ELIGIBILITY_CLAIMS==========

SELECT TOP 100 CODE.DIAGNOSISCODE,C.*
FROM ENTERPRISEHUB.DBO.CLAIM AS C
	    INNER JOIN ENTERPRISEHUB.DBO.CLAIMDIAGNOSIS AS CD
        ON CD.CLAIMREFID = C.CLAIMREFID
        INNER JOIN ENTERPRISEHUB.MREF.DIAGNOSISCODE AS CODE
        ON CODE.DIAGNOSISCODEMREFID = CD.DIAGNOSISCODEMREFID
WHERE C.SubscriberMemberMRefID = 301559
 --C.ClaimRefID IN(
	--					31564901,
	--					33303774,
	--					30605175,
	--					29612409,
	--					30009064,
	--					29051138
	--				 )
	AND C.CLAIMSTATUSCODEMREFID NOT IN (5, 13) --HEADER STATUS NOT VOID
;

SELECT TOP 100 C.ClaimRefID,C.ServiceDateFrom, C.ServiceDateTo
FROM ENTERPRISEHUB.DBO.CLAIM AS C
	    INNER JOIN ENTERPRISEHUB.DBO.CLAIMDIAGNOSIS AS CD
        ON CD.CLAIMREFID = C.CLAIMREFID
        INNER JOIN ENTERPRISEHUB.MREF.DIAGNOSISCODE AS CODE
        ON CODE.DIAGNOSISCODEMREFID = CD.DIAGNOSISCODEMREFID
WHERE C.SubscriberMemberMRefID = 301559
 --C.ClaimRefID IN(
	--					31564901,
	--					33303774,
	--					30605175,
	--					29612409,
	--					30009064,
	--					29051138
	--				 )
	AND C.CLAIMSTATUSCODEMREFID NOT IN (5, 13) --HEADER STATUS NOT VOID
;


SELECT TOP 100 C.ClaimRefID,C.ServiceDateFrom, C.ServiceDateTo
FROM ENTERPRISEHUB.DBO.CLAIM AS C
	    INNER JOIN ENTERPRISEHUB.DBO.CLAIMDIAGNOSIS AS CD
        ON CD.CLAIMREFID = C.CLAIMREFID
        INNER JOIN ENTERPRISEHUB.MREF.DIAGNOSISCODE AS CODE
        ON CODE.DIAGNOSISCODEMREFID = CD.DIAGNOSISCODEMREFID
WHERE C.SubscriberMemberMRefID = 301559
 --C.ClaimRefID IN(
	--					31564901,
	--					33303774,
	--					30605175,
	--					29612409,
	--					30009064,
	--					29051138
	--				 )
	AND C.CLAIMSTATUSCODEMREFID NOT IN (5, 13) --HEADER STATUS NOT VOID
;