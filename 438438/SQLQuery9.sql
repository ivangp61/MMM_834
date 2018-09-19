SELECT mStat.IsValidForClaims ,
	  xStat.ExternalValue 'Program'
	 ,Comp.DisplayCode    'Carrier'
  FROM
	  XRef.EnrollmentStatus xStat
	  JOIN MRef.EnrollmentStatus mStat
		  ON mStat.StatusMRefId = xStat.StatusMRefId
	  JOIN MRef.Company Comp
		  ON Comp.CompanyMRefId = xStat.CompanyMRefId
  WHERE 1 = 1    
    AND mStat.Code = 'Program'
    AND mStat.IsValidForClaims = 1


SELECT pcp.PCPRecId,
      ,pcp.MemberRecId
      ,PCPEffectiveDate
      ,pcp.PCPEndDate
      ,rend.FirstName
      ,rend.MiddleName
      ,rend.LastName
      ,rNPI.ExternalValue 'RenderingNPI'
      ,bNPI.ExternalValue 'BillingNPI'
  FROM
       dbo.MemberPCP pcp
       JOIN dbo.Provider rend            ON rend.ProviderRecId = pcp.ProviderRecId
       JOIN XRef.Provider rNPI            ON rNPI.ProviderRecId = rend.ProviderRecId 
          AND rNPI.ExternalTypeMRefId = 13
       JOIN dbo.ProviderAffiliation aff            ON aff.ProviderRecId = rend.ProviderRecId 
          and aff.ProviderAffiliationRecId = pcp.ProviderAffiliationRecId
       JOIN dbo.Provider bill            ON bill.ProviderRecId = aff.ProviderAffiliationAffiliatedId
       JOIN XRef.Provider bNPI            ON bNPI.ProviderRecId = bill.ProviderRecId 
          AND bNPI.ExternalTypeMRefId = 13
       JOIN MRef.Company Comp            ON Comp.CompanyMRefId = pcp.CompanyMRefId
  WHERE 1 = 1    
    --AND (pcp.PCPEffectiveDate >= '2010-11-24'
	   --OR (pcp.PCPEffectiveDate < '2010-11-24'
		  --AND (ISNULL(pcp.PCPEndDate,GETDATE()) = GETDATE() 
			 --or pcp.PCPEndDate > '2010-11-24'))) 
    --AND Comp.DisplayCode = 'PMC'
	and pcp.MemberRecId in(748871, 736371, 738337)--(712970, 713138);
;




SELECT pcp.PCPRecId
      ,pcp.MemberRecId
      ,PCPEffectiveDate
      ,pcp.PCPEndDate
      ,rend.FirstName
      ,rend.MiddleName
      ,rend.LastName
      --,rNPI.ExternalValue 'RenderingNPI'
      --,bNPI.ExternalValue 'BillingNPI'
  FROM dbo.MemberPCP pcp
       JOIN dbo.Provider rend            
	   ON rend.ProviderRecId = pcp.ProviderRecId
	   JOIN MRef.Company Comp            ON Comp.CompanyMRefId = pcp.CompanyMRefId
  WHERE 1 = 1
	and pcp.MemberRecId in(748871, 736371, 738337)--(712970, 713138);
	AND Comp.DisplayCode = 'PMC'
;