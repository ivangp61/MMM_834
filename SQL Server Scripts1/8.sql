SELECT  Head.DIHMemberRecId
FROM    stg.MemberHeader Head

P00250466448
SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
 ON Comp.CompanyMRefId = ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId =24
    AND (IndEffectiveDate >= '2010-11-20' 
	   or (IndEffectiveDate < '2010-11-20' and IndEndDate is null)
                   or (IndEffectiveDate < '2010-11-20' and IndEndDate > '2010-11-20')
)  AND Comp.DisplayCode = 'MMM'
	AND MemberRecId = 279697

SELECT *
FROM QNXTHub.stg.MemberBenefitPlan

SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
 ON Comp.CompanyMRefId = ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId =24
    AND (IndEffectiveDate >= ?
	   or (IndEffectiveDate < ? and IndEndDate is null)
                   or (IndEffectiveDate < ? and IndEndDate > ?)
)  AND Comp.DisplayCode = ?


SELECT  DIHRecId
FROM    stg.MemberWorkingList WL
WHERE WL.DIHRecId IN(277747,
629411,
652239)
;

SELECT *
FROM tgt.MemberPcp PCP
WHERE PCP.DIHMemberRecId IN(277747)
;

SELECT *
FROM tgt.MemberBenefitPlan
;

SELECT *
FROM tgt.MemberHeader
;


277747
629411
652239


SELECT *
FROM dbo.MemberPCP PCP
WHERE PCP.MemberRecId = 277747
;

SELECT *
FROM ADWODSSTG.dbo.STG_NAME_PROVIDER NP
WHERE NP.PROVIDER_ID = 'N00004634153' 
	AND NP.NAME_ID = 'N00036475042'


SELECT *
FROM ADWODSSTG.dbo.STG_ADW_MemberPCP PCP
WHERE PCP.MemberRecId = 
;


SELECT TOP 5 *
FROM ENTERPRISEHUB.XRef.Provider A

SELECT 
A.NAME_ID as MP_mNameID
,A.PROVIDER_ID as MP_pNameID
,A.CREATE_STAFF
,A.UPDATE_STAFF
,cast(A.TERM_REASON as varchar(50))TERM_REASON
,cast(A.SOURCE_SYSTEM as varchar(3))SOURCE_SYSTEM
,isnull(cast(A.SERVICE_TYPE as varchar(50)),0) AS SERVICE_TYPE
,A.EFF_DATE
,A.TERM_DATE
,A.CREATE_DATE
,A.UPDATE_DATE
,cast(Replace(B.SOC_SEC,'-','')  as varchar(9)) as MP_pSSN
,UPPER(LEFT(LTRIM(RTRIM(isnull(cast(B.COMPANY as varchar(50)),0))),10))  AS MP_NPI
,C.CompanyMRefId
,ltrim(rtrim(B.Program_ID)) as MP_pStatus
,UPPER(RIGHT(LTRIM(RTRIM(isnull(cast(B.COMPANY as varchar(50)),0))),10))  AS MP_BILL_NPI
FROM STG_NAME_PROVIDER A
INNER JOIN STG_NAME B
ON A.PROVIDER_ID = B.NAME_ID
AND A.SOURCE_SYSTEM = B.SOURCE_SYSTEM
INNER JOIN ENTERPRISEHUB.[MRef].[Company] C
ON A.SOURCE_SYSTEM = C.DisplayCode
WHERE A.SERVICE_TYPE = 'PCP'
	AND A.PROVIDER_ID = 'N00004634153' AND A.NAME_ID = 'N00036475042'
ORDER BY
A.NAME_ID
,A.SOURCE_SYSTEM



SELECT 
	A.ProviderRecId ProviderRecId
	,UPPER(cast(Replace(A.ExternalValue,'-','') as varchar(50)))ExternalValue
	,A.CompanyMRefId CompanyMRefId
	,(Case When D.ProviderStatusMRefId = 1 Then 1 Else 0 End) IsActive
	,CASE WHEN ISNULL(dup.IsDuplicated,0) = 1 AND D.ProviderStatusMRefId = 1 THEN 0 ELSE ISNULL(dup.IsDuplicated,0) END as IsDuplicated
	,ISNULL(ToUse.ProviderRecId,0) ToAssign
FROM ENTERPRISEHUB.XRef.Provider A
	INNER JOIN ENTERPRISEHUB.MRef.ExternalType B
		ON A.ExternalTypeMRefId = B.ExternalTypeMRefId
	INNER JOIN ENTERPRISEHUB.DBO.Provider D
		ON		(D.PROVIDERRECID=A.PROVIDERRECID 
			AND D.IsPractitioner=1)
	LEFT OUTER JOIN (SELECT cast(Replace(A.ExternalValue,'-','') as varchar(50)) as	NPI,
							A.CompanyMRefId as	CompanyMRefId ,
							1 as IsDuplicated
						FROM ENTERPRISEHUB.XRef.Provider A
							INNER JOIN ENTERPRISEHUB.MRef.ExternalType B 
								ON A.ExternalTypeMRefId = B.ExternalTypeMRefId
							INNER JOIN ENTERPRISEHUB.DBO.Provider D 
								ON		D.PROVIDERRECID=A.PROVIDERRECID 
									AND D.IsPractitioner=1
							WHERE B.Code = 'NPI' 
						GROUP BY cast(Replace(A.ExternalValue,'-','') as varchar(50)),
								 A.CompanyMRefId
						HAVING COUNT(*) > 1) Dup 
		ON		Replace(rtrim(ltrim(A.ExternalValue)),'-','') = dup.NPI 
			and A.CompanyMRefId = Dup.CompanyMRefId 
	LEFT OUTER JOIN (SELECT A.CompanyMRefId,
							Replace(rtrim(ltrim(A.ExternalValue)),'-','') AS NPI,
							MAX(A.ProviderRecId) as ProviderRecId 
						FROM ENTERPRISEHUB.XRef.Provider A
							INNER JOIN ENTERPRISEHUB.MRef.ExternalType B 
								ON A.ExternalTypeMRefId = B.ExternalTypeMRefId 
							INNER JOIN ENTERPRISEHUB.DBO.Provider D 
								ON D.PROVIDERRECID=A.PROVIDERRECID AND D.IsPractitioner=1
						WHERE B.Code = 'NPI' 
						GROUP BY	A.CompanyMRefId, 
									RTRIM(LTRIM(A.EXTERNALVALUE))) ToUse
		ON		Replace(rtrim(ltrim(A.ExternalValue)),'-','') = ToUse.NPI 
			AND A.CompanyMRefId = ToUse.CompanyMRefId  
WHERE B.Code = 'NPI' 
AND (	ISNULL(dup.IsDuplicated,0) = 0 
	OR (ISNULL(dup.IsDuplicated,0) = 1 AND D.ProviderStatusMRefId = 1)
	)
	AND A.ExternalValue = '1447206800'



SELECT isnull(CompanyMRefId,0) as CompanyMRefId,  isnull(MemberRecId,0) as MemberRecId, isnull(ProviderRecId,0) as ProviderRecId, isnull(PCPEffectiveDate,0) as PCPEffectiveDate,  PCPEndDate, PCPEndReason, ProviderAffiliationRecId, isnull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, ProgramXRefId 
FROM STG_ADW_MemberPCP
WHERE ProviderRecId = 113060
	AND MemberRecId = 277747
ORDER BY MemberRecId, CompanyMRefId, ProviderRecId, PCPEffectiveDate, ProviderAffiliationRecId, SORId




SELECT *
FROM dbo.MemberPCP PCP
WHERE PCP.MemberRecId = 277747
	AND ProviderRecId = 113060
;


SELECT isnull(CompanyMRefId,0) as CompanyMRefId,  isnull(MemberRecId,0) as MemberRecId, isnull(ProviderRecId,0) as ProviderRecId, isnull(PCPEffectiveDate,0) as PCPEffectiveDate,  PCPEndDate, PCPEndReason, ProviderAffiliationRecId, isnull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, ProgramXRefId 
FROM STG_ADW_MemberPCP
where MemberRecId = 277747
and ProviderRecId = 113060 
ORDER BY MemberRecId, CompanyMRefId, ProviderRecId, PCPEffectiveDate, ProviderAffiliationRecId, SORId