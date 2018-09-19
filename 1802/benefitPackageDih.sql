USE EnterpriseHub;

SELECT [Desc] 'SECONDARY'
      ,xPkg.ExternalValue 'PACKAGE_ID'
FROM
       MRef.BenefitPackage Pkg
       JOIN XRef.BenefitPackage xPkg
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId
WHERE 1 = 1
    AND ExternalTypeMRefId = 1;



SELECT *
FROM
       MRef.BenefitPackage Pkg
       JOIN XRef.BenefitPackage xPkg
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId
WHERE 1 = 1
	--AND xPKG.CompanyContract = 'H4004'
	--AND xPKG.BenefitPkgContractId = '061'
    AND ExternalTypeMRefId = 1
	AND SORID IN('P00138883738',
'P00138883737',
'P00346099200',
'P00138883739');
	--P00138497118


USE EnterpriseHub;
SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
	  ,ind.CompanyMRefId
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
	--AND MemberRecId = 207188
    --AND (IndEffectiveDate >= ?
	   --or (IndEffectiveDate < ? and IndEndDate is null)
    --               or (IndEffectiveDate < ? and IndEndDate > ?))
	--AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738',
'P00138883737',
'P00346099200',
'P00138883739')
;



SELECT *
FROM dbo.MemberIndicator ind
WHERE 1=1
	AND IND.MemberRecId = 207188
	AND IND.IndValue = 'P00138497118'
;
373789407


