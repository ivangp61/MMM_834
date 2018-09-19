USE EnterpriseHub;

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
    --AND ind.MemberRecId = 
    AND ind.IndMRefId = 24
  ORDER BY ind.IndEffectiveDate DESC;

