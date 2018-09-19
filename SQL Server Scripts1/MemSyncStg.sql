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
	AND A.NAME_ID = 'N00036475042'
AND A.PROVIDER_ID IN('N00004634153' , 'N00001528152')
ORDER BY
A.NAME_ID
,A.SOURCE_SYSTEM
;


SELECT isnull(CompanyMRefId,0) as CompanyMRefId,  isnull(MemberRecId,0) as MemberRecId, isnull(ProviderRecId,0) as ProviderRecId, isnull(PCPEffectiveDate,0) as PCPEffectiveDate,  PCPEndDate, PCPEndReason, ProviderAffiliationRecId, isnull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, ProgramXRefId 
FROM STG_ADW_MemberPCP
WHERE MemberRecId = 652239
ORDER BY MemberRecId, CompanyMRefId, ProviderRecId, PCPEffectiveDate, ProviderAffiliationRecId, SORId
;


SELECT PCPRecId, CompanyMRefId, MemberRecId, ProviderRecId, PCPEffectiveDate, PCPEndDate, PCPEndReason, ProviderAffiliationRecId, SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, JobId, JobActionType, JobLoadDate, ProgramXRefId
FROM MemberPCP PCP
WHERE PCP.MemberRecId = 277747
	AND PCPRecId IN(113060,105734)
;

SELECT MemberRecId, ProviderRecId, PCPEffectiveDate, PCPEndDate, PCPEndReason, CreationDate, ModificationDate, JobId, JobActionType, JobLoadDate
FROM MemberPCP PCP
WHERE PCP.MemberRecId = 629411
	AND PCPRecId IN(113060,106061)
;
