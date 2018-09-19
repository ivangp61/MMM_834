SELECT IndicatorRecId
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
  FROM dbo.MemberIndicator Ind
JOIN MRef.Company Comp on Comp.CompanyMRefId = Ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId = 11
	AND MemberRecId = 142800
    AND Comp.DisplayCode = 'MMM'
ORDER BY IndEffectiveDate ASC
;


