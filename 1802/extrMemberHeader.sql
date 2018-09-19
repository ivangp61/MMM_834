SELECT
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
;


SELECT Memb.MemberRecId
      ,Memb.FirstName
      ,Memb.MiddleName
      ,Memb.LastName
      ,Memb.BirthDate
      ,Memb.DeathDate
      ,Comp.DisplayCode 'CarrierCode'
      ,Comp.DisplayCode 'SponsorCode'
      ,Gen.Code         'Gender'
      ,xStat.ExternalValue 'Program'
  FROM
       dbo.MemberCompany Memb
       JOIN MRef.Company Comp
            ON Comp.CompanyMRefId = Memb.CompanyMRefId
       LEFT JOIN MRef.Gender Gen
            ON Gen.GenderMRefId = Memb.GenderMRefId
       LEFT JOIN XRef.EnrollmentStatus xStat
            ON xStat.StatusMRefId = Memb.StatusMRefId
           AND xStat.CompanyMRefId = Memb.CompanyMRefId
       LEFT JOIN MRef.EnrollmentStatus stat
            ON stat.StatusMRefId = Memb.StatusMRefId
		  And stat.Code = 'Program'
  WHERE 1 = 1