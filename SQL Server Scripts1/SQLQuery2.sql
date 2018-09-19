SELECT TOP 5 *
FROM [trn].[TransactionException]
WHERE ErrorDateTime >= '2016-11-30'
;

SELECT pkg.CarrierCode, pkg.SponsorCode, pkg.OrgPolicy, pkg.OrgPolicyEffDate, pkg.OrgPolicyTermDate, pkg.BenefitPlan, pkg.CoverageCode, pkg.CoverageDescription, pkg.RateCode, pkg.PolicyPlanEffDate, pkg.PolicyPlanTermDate, pkg.SourceCode, pkg.TargetCode 
FROM qnxt.MemberBenefitPlanRate pkg 
WHERE pkg.CarrierCode = 'MMM'--@CarrierCode 
	And pkg.SponsorCode = 'MMM'--@SponsorCode
	AND SourceCode = 'P00346099270'
;

