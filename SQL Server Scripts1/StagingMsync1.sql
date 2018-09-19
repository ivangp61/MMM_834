USE ADWODSSTG;
--=========================================
----NAME - STG_HCFA_NAME_ORG: MemberCompany
--=========================================
SELECT  IsNull(CompanyMRefId,0) CompanyMRefId, 
cast(OriginalEnrolledDate as varchar(10)) OriginalEnrolledDate, 
NamePrefix, IsNull(FirstName,0) FirstName, SUBSTRING(MiddleName,1,1) AS MiddleName, 
ISNull(LastName,0) LastName, NameSuffix, BirthDate, Age, GenderMRefId, 
EthnicityMRefId, MaritalStatusMRefId, LanguageMRefId, IsWorking, 
cast(DeathDate as varchar(10)) DeathDate, CreationDate, CreationUserId,
ModificationDate, ModificationUserId, StatusMRefId, MemberRecId, IsInstitutionalized
FROM [ADWODSSTG].[dbo].[STG_ADW_MemberCompany]
WHERE MemberRecId = 652438
;

SELECT MemberCompanyRecId, CompanyMRefId, MemberRecId, OriginalEnrolledDate, NamePrefix, FirstName, MiddleName, LastName, NameSuffix, BirthDate, Age, GenderMRefId, EthnicityMRefId, MaritalStatusMRefId, LanguageMRefId, IsWorking, DeathDate, CreationDate, CreationUserId, ModificationDate, ModificationUserId, JobId, JobLoadDate, StatusMRefId, JobActionType, IsInstitutionalized
FROM EnterpriseHub.dbo.MemberCompany C
WHERE MemberRecId = 652438
AND CONVERT(VARCHAR,JobLoadDate,112) >= '20130706'
;


--===================================
--HCFA_DATE: MemberIndicator
--===================================
SELECT CompanyMRefId, IsNull(MemberRecId,0) MemberRecId, IsNull(IndEffectiveDate,0) IndEffectiveDate, IsNull(IndMRefId,0) IndMRefId, IndEndDate, IndValue, IsPreferred, IsNull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId 
FROM  [ADWODSSTG].[dbo].[STG_ADW_MemberIndicator] with(NOLOCK)
WHERE MemberRecId = 652438
AND CONVERT(VARCHAR,JobLoadDate,112) >= '20130706'
;

SELECT IndicatorRecId, CompanyMRefId, MemberRecId, IndEffectiveDate, IndMRefId, IndEndDate, IndValue, SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, JobId, JobActionType, JobLoadDate, IsPreferred
FROM [EnterpriseHub].[dbo].[MemberIndicator] M
WHERE MemberRecId = 652438
AND CONVERT(VARCHAR,JobLoadDate,112) >= '20130706'
;
--===================================
--NAME_PROVIDER: 
--===================================
SELECT isnull(CompanyMRefId,0) as CompanyMRefId,  isnull(MemberRecId,0) as MemberRecId, isnull(ProviderRecId,0) as ProviderRecId, isnull(PCPEffectiveDate,0) as PCPEffectiveDate,  PCPEndDate, PCPEndReason, ProviderAffiliationRecId, isnull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, ProgramXRefId FROM #$STGSSODSSchema#STG_ADW_MemberPCP
ORDER BY MemberRecId, CompanyMRefId, ProviderRecId, PCPEffectiveDate, ProviderAffiliationRecId, SORId

SELECT PCPRecId, CompanyMRefId, MemberRecId, ProviderRecId, PCPEffectiveDate, PCPEndDate, PCPEndReason, ProviderAffiliationRecId, SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId, JobId, JobActionType, JobLoadDate, ProgramXRefId
FROM [EnterpriseHub].[dbo].MemberPCP
WHERE MemberRecId = 652438
	AND CONVERT(VARCHAR,JobLoadDate,112) >= '20130706'
;

