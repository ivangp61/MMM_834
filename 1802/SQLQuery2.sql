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
	AND Memb.MemberRecId IN(709163)
;

SELECT Pkg.MemberRecId
             ,xPkg.SORId
  FROM
       dbo.MemberBenefitPackage Pkg
       JOIN XRef.BenefitPackage xPkg
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId
           AND xPkg.CompanyMRefId = Pkg.CompanyMRefId
       JOIN MRef.BenefitPackage mPkg
            ON mPkg.BenefitPkgMRefId = xPkg.BenefitPkgMRefId
	   JOIN MRef.Company Comp on Comp.CompanyMRefId = Pkg.CompanyMRefId
  WHERE 1 = 1
 and xPkg.ExternalTypeMRefId = 1
 and Pkg.MemberRecId = 709163
 ;


