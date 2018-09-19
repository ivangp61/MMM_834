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
    AND IndMRefId IN(24,11)
    AND MemberRecId = 542873 
	--AND Comp.DisplayCode = 'PMC'



SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
  FROM dbo.MemberIndicator Ind
JOIN MRef.Company Comp on Comp.CompanyMRefId = Ind.CompanyMRefId
  WHERE 1 = 1
    --AND IndMRefId = 11
	--AND MemberRecId = 542873 
	and IndicatorRecId = 369586981
    --AND Comp.DisplayCode = ?

--update dbo.MemberIndicator set IndEndDate = '2017-08-07 00:00:00.000'  
  WHERE 1 = 1
	and IndicatorRecId = 369586981
    --AND Comp.DisplayCode = ?
