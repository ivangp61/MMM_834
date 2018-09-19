SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
	  ,ind.JobLoadDate
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
  AND Comp.DisplayCode = 'MMM'
  AND MemberRecId = 652438
  ;


SELECT IND.*
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
  AND Comp.DisplayCode = 'MMM'
  AND MemberRecId = 178648
  ;


--UPDATE dbo.MemberIndicator
SET jobloaddate = '2016-06-01'
  WHERE indicatorrecid = 312727929
  ;

