USE EnterpriseHub;
GO

DECLARE
   @memberrecid int;

SELECT @memberrecid = MemberRecId
  FROM XRef.Member M
  WHERE 1 = 1
    AND ExternalValue = '030006869'
	AND M.CompanyMRefId = 1;
--SELECT @memberrecid = 10188;

SELECT 'Header'                                        'Tbl'
      ,comp.MemberRecId
	  ,comp.CompanyMRefId
      ,aveta.ExternalValue                             'SubsId'
      ,FirstName
      ,LastName
      ,xstat.ExternalValue                             'Program'
      ,stat.[Desc]                                     'Stat'
      ,CONVERT( varchar( 10 ) ,BirthDate ,101 )        'Birth'
      ,CONVERT( varchar( 10 ) ,DeathDate ,101 )        'Death'
      ,gender.[Desc]                                   'Gender'
      ,ssn.ExternalValue                               'SSN'
      ,hic.ExternalValue                               'HIC'
      ,ohic.ExternalValue                              'oHIC'
      ,CONVERT( varchar( 10 ) ,comp.CreationDate ,101 )'Createdon'
      ,CONVERT( varchar( 10 ) ,comp.JobLoadDate ,101 ) 'JobLoadDate'
  FROM
       dbo.MemberCompany comp WITH ( nolock )
       LEFT JOIN MRef.EnrollmentStatus stat WITH ( nolock )
            ON stat.StatusMRefId = comp.StatusMRefId
       LEFT JOIN XRef.EnrollmentStatus xstat WITH ( nolock )
            ON xstat.StatusMRefId = stat.StatusMRefId
           AND xstat.CompanyMRefId = comp.CompanyMRefId
       LEFT JOIN XRef.Member aveta WITH ( nolock )
            ON aveta.MemberRecId = comp.MemberRecId
           AND aveta.ExternalTypeMRefId = 5
       LEFT JOIN XRef.Member ssn WITH ( nolock )
            ON ssn.MemberRecId = comp.MemberRecId
           AND ssn.ExternalTypeMRefId = 9
       LEFT JOIN XRef.Member hic WITH ( nolock )
            ON hic.MemberRecId = comp.MemberRecId
           AND hic.ExternalTypeMRefId = 11
       LEFT JOIN XRef.Member ohic WITH ( nolock )
            ON ohic.MemberRecId = comp.MemberRecId
           AND ohic.ExternalTypeMRefId = 12
       LEFT JOIN mref.Gender gender WITH ( nolock )
            ON gender.GenderMRefId = comp.GenderMRefId
  WHERE 1 = 1
    AND comp.MemberRecId = @memberrecid
    AND stat.Code = 'Program'
   AND xstat.ExternalValue = 'M30'
  ORDER BY comp.CreationDate;

SELECT t.Code
      ,Ident.ExternalValue                             'Ident'
      ,CONVERT( varchar( 10 ) ,Ident.JobLoadDate ,101 )'JobLoadDate'
  FROM
       XRef.Member Ident
       JOIN MRef.Company Comp
            ON Comp.CompanyMRefId = Ident.CompanyMRefId
       JOIN MRef.ExternalType t
            ON t.ExternalTypeMRefId = Ident.ExternalTypeMRefId
  WHERE 1 = 1
    AND Ident.MemberRecId = @memberrecid
    AND Ident.ExternalTypeMRefId IN(2, 5 ,9 ,11, 24 );

SELECT 'Plan'                                                             'Ind'
      ,CONVERT( varchar( 10 ) ,ind.IndEffectiveDate ,101 )                'IndEffectiveDate'
      ,CONVERT( varchar( 10 ) ,ISNULL( ind.IndEndDate ,'20781231' ) ,101 )'IndEndDate'
      ,pkg.[Desc]
      --,pdPkg.CoverageCode
      --,pdPkg.RateCode
      --,pdPkg.OrgPolicy
      ,CONVERT( varchar( 10 ) ,ind.JobLoadDate ,101 )                     'JobLoadDate'
  FROM
       dbo.MemberIndicator ind WITH ( nolock )
       JOIN XRef.BenefitPackage sor WITH ( nolock )
            ON sor.ExternalValue = ind.IndValue
       JOIN MRef.BenefitPackage pkg WITH ( nolock )
            ON pkg.BenefitPkgMRefId = sor.BenefitPkgMRefId
       --JOIN EnterpriseInterfaces.MSync.vwBenefitList pdPkg WITH ( nolock )
       --     ON pdPkg.BenefitPlan = pkg.[Desc]
       --    AND pdPkg.CoverageCodeName = 'Medical'
  WHERE 1 = 1
    AND ind.MemberRecId = @memberrecid
    AND ind.IndMRefId = 24
  ORDER BY ind.IndEffectiveDate DESC;






