USE EnterpriseHub;

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
 and xPkg.SORId = 'P00138497118'
 ;

 SELECT pkg.[Desc] 'SECONDARY'
 ,Pkg.BenefitPkgMRefId
      ,xPkg.ExternalValue 'PACKAGE_ID'
  FROM
       MRef.BenefitPackage Pkg
       JOIN XRef.BenefitPackage xPkg
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId
  WHERE 1 = 1
	AND xPkg.ExternalValue = 'P00138497118'
--	AND Pkg.BenefitPkgMRefId = 245
    AND ExternalTypeMRefId = 1;




--update MRef.BenefitPackage
set [Desc] = 'MMM DIAMANTE EXCEL PLUS PLATINO'
where BenefitPkgMRefId = 245

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
	--and xPkg.ExternalTypeMRefId = 1
	and Pkg.MemberRecId = 241576--706946
;



