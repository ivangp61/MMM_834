SELECT *
FROM [MRef].[BenefitPackage]


SELECT *
FROM xref.[BenefitPackage] BP
WHERE BP.CompanyContract = 'H4004'
	AND BP.BenefitPkgContractId = '061'
--BP.ExternalValue = ''
;



SELECT *
FROM dbo.MemberBenefitPackage BP
WHERE BP.CompanyContract = 'H4004'
	AND BP.BenefitPkgContractId = '061'
--BP.ExternalValue = ''
;



SELECT CompanyMRefId, DisplayCode 
FROM EnterpriseHub.[MRef].[Company]
;
SELECT
CompanyMRefId
,ExternalValue
,MemberRecId
FROM ENTERPRISEHUB.[XRef].[Member]
Where ExternalTypeMRefId = 1

SELECT
IndMRefId
,Code
FROM
ENTERPRISEHUB.[MRef].[CMSCoverageIndicator]

SELECT CompanyMRefId, DisplayCode 
FROM ENTERPRISEHUB.[MRef].[Company]
;

SELECT 
DATE_ID
,NAME_ID
,INDICATOR
,PREFERRED
,UPDATE_STAFF
,CREATE_STAFF
,VALUE
,SOURCE_SYSTEM
,START_DATE
,END_DATE
,UPDATE_DATE
,CREATE_DATE
FROM ADWODSSTG.dbo.STG_HCFA_DATE
;

SELECT *
FROM ADWODSSTG.dbo.STG_NAME
;
