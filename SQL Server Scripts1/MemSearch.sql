DECLARE @MemberId Varchar(MAX)
DECLARE @MemberRecId int

SET @MemberId = '0104	18028'

SELECT @MemberRecId = MemberRecId FROM EnterpriseHub.XRef.Member WHERE ExternalValue = @MemberId

SELECT 'MemberCompany', a.MemberCompanyRecId,a.CompanyMRefId,a.MemberRecId,a.OriginalEnrolledDate,a.StatusMRefId,b.[desc],
				    a.NamePrefix,a.FirstName,a.MiddleName,a.LastName,a.NameSuffix,a.BirthDate,a.Age,a.GenderMRefId,
				    a.EthnicityMRefId,a.MaritalStatusMRefId,a.LanguageMRefId,a.IsWorking,a.DeathDate, --a.IsInstitutionalized,
				    a.CreationDate,a.CreationUserId,a.ModificationDate,a.ModificationUserId,a.JobId,a.JobActionType,a.JobLoadDate 
FROM EnterpriseHub..MemberCompany a
INNER JOIN EnterpriseHub.MRef.EnrollmentStatus b ON a.StatusMRefId = b.StatusMRefId
WHERE MemberRecId = @MemberRecId

SELECT 'MemberPCP', * FROM EnterpriseHub..MemberPCP WHERE MemberRecId = @MemberRecId ORDER BY PCPEffectiveDate DESC

SELECT 'MemberBenefitPackage', 
    a.BenefitPkgRecId,    a.CompanyMRefId,    a.MemberRecId,    a.BenefitPkgMRefId,    b.[desc],    a.GroupNum,
    a.AgeGroup,    a.ElectionPeriod,    a.EnterDate,    a.SignatureDate,    a.CompletionDate,    a.EnrollDate,    a.EnrollmentSource,
    a.DisenrollDate,    a.DisenrollReason,    a.PartAPayment,    a.PartBPayment,    a.WithholdMRefId,    a.MedicaidEffectiveDate,
    a.MedicaidEndDate,    a.RiskFactor,    a.LastPaymentAmount,    a.LastPaymentDate,    a.SORId,    a.CreationDate,    a.CreationUserId,
    a.ModificationDate,    a.ModificationUserId,    a.JobId,    a.JobActionType,    a.JobLoadDate,    a.AsesStatus,    a.RxGroup,
    a.RxBin,    a.RxPcn,    a.RiskFactorDecimal,    a.MA10EffectiveDate,    a.MA10EndDate
    FROM EnterpriseHub..MemberBenefitPackage a 
    INNER JOIN EnterpriseHub.MRef.BenefitPackage b
    ON a.BenefitPkgMRefId = b.BenefitPkgMRefId
    WHERE MemberRecId = @MemberRecId
    
SELECT     'EnrollmentStatus', a.MemberStatusRecId,a.CompanyMRefId,a.MemberRecId,a.StatusEffectiveDate,
	   a.StatusMRefId,b.[Desc], a.StatusEndDate,a.SORId,a.CreationDate,a.CreationUserId,
	   a.ModificationDate,a.ModificationUserId,a.JobId,a.JobActionType,a.JobLoadDate
FROM EnterpriseHub.dbo.MemberEnrollmentStatus a
INNER JOIN EnterpriseHub.MRef.EnrollmentStatus b ON a.StatusMRefId = b.StatusMRefId
WHERE MemberRecId = @MemberRecId 
ORDER BY a.StatusEffectiveDate DESC


--Addresses
SELECT 'Address', 	A.[Desc], ma.AddrLine1, ma.AddrLine2, ma.AddrState, ma.AddrCity, 
				ma.AddrZipCode, ma.AddrZip4Code, ma.AddrCountry, ma.AddrCounty
FROM EnterpriseHub..MemberCompany mc
 INNER JOIN EnterpriseHub.dbo.MemberAddress    MA   ON MA.MemberRecId = mc.MemberRecId         
 INNER JOIN          EnterpriseHub.MRef.AddressType A ON MA.AddrTypeMRefId = A.AddrTypeMRefId
WHERE Mc.MemberRecId = @MemberRecId

--Phones
SELECT 'Phones', C.[Desc], Comm.CommTypeMRefId, CD.CommValue
FROM EnterpriseHub..MemberCompany mc
 INNER JOIN  EnterpriseHub.dbo.MemberCommunication   Comm ON Comm.MemberRecId = mc.MemberRecId            
INNER JOIN              EnterpriseHub.MRef.CommunicationType C ON Comm.CommTypeMRefId = C.CommTypeMRefId
 INNER JOIN EnterpriseHub.dbo.MemberCommunicationDetail CD  ON CD.CommDetailRecId = Comm.CommDetailRecId    
WHERE Mc.MemberRecId = @MemberRecId

--Indicators
SELECT 'Indicators', a.IndicatorRecId, a.CompanyMRefId, m.[Desc], a.IndEffectiveDate, a.IndMRefId, a.IndEndDate,
a.IndValue, a.IsPreferred, a.SORId, a.CreationDate, a.CreationUserId, a.ModificationDate, a.ModificationUserId 
FROM EnterpriseHub..MemberIndicator a 
INNER JOIN EnterpriseHub.MRef.CMSCoverageIndicator m
ON m.IndMRefId = a.IndMRefId
WHERE MemberRecId= @MemberRecId
AND IndEndDate = (SELECT MAX(IndEndDate) FROM EnterpriseHub..MemberIndicator b WHERE b.MemberRecId = a.MemberRecId)
AND a.IndEffectiveDate < ISNULL(a.IndEndDate,'2078-01-01')


select *
from mref.Member M
	INNER JOIN mref.ExternalType ET
	ON M.MemberRecId = ET.
