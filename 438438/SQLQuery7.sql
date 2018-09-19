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
	and Pkg.MemberRecId in(712970, 713138)
 ;

Select *
From dbo.MemberCompany M
Where 1 = 1
	and M.MemberRecId in(712970, 713138);

Select Pkg.MemberRecId
From dbo.MemberBenefitPackage Pkg
  WHERE 1 = 1
	and Pkg.MemberRecId in(712970, 713138)
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
	and Pkg.MemberRecId in(712970, 713138)
 ;


 Select *
 From QNXTHub.trn.TransactionException Trn
 Where Trn.Domain = 'MEMBER'
	and Trn.Entity = 'BenefitPlan'
	and trn.ErrorStep = 'ExtrMemberHeader'
	and Convert(varchar, errorDateTime,112) = '20180423'
;

