USE EnterpriseHub;
GO

DECLARE
   @memberrecid int;

SELECT @memberrecid = MemberRecId
  FROM XRef.Member
  WHERE 1 = 1
    AND ExternalValue = '010001203';
 --SELECT @memberrecid = 10188;

SELECT 'Header'                                        'Tbl'
      ,comp.MemberRecId
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
  -- AND xstat.ExternalValue = 'M30'
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
    /*
SELECT 'Pkg'                                           'Tbl'
      ,CONVERT( varchar( 10 ) ,Pkg.EnrollDate ,101 )   'EnrollDate'
      ,CONVERT( varchar( 10 ) ,Pkg.DisenrollDate ,101 )'DisenrollDate'
      ,CONVERT( varchar( 10 ) ,Pkg.JobLoadDate ,101 )  'JobLoadDate'
  FROM dbo.MemberBenefitPackage Pkg
  WHERE 1 = 1
    AND Pkg.MemberRecId = @memberrecid;*/
/*
SELECT TOP 4 'Enr'                                                                  'Tbl'
            ,xStat.ExternalValue                                                    'Program'
            ,CONVERT( varchar( 10 ) ,Stat.StatusEffectiveDate ,101 )                'EffDate'
            ,CONVERT( varchar( 10 ) ,ISNULL( Stat.StatusEndDate ,'20781231' ) ,101 )'TermDate'
            ,CONVERT( varchar( 10 ) ,ISNULL( Stat.JobLoadDate ,'20781231' ) ,101 )  'JobLoadDate'
  FROM
       dbo.MemberEnrollmentStatus Stat
       JOIN XRef.EnrollmentStatus xStat
            ON xStat.StatusMRefId = Stat.StatusMRefId
           AND xStat.CompanyMRefId = Stat.CompanyMRefId
       JOIN MRef.EnrollmentStatus mStat
            ON mStat.StatusMRefId = xStat.StatusMRefId
  WHERE 1 = 1
    AND Stat.MemberRecId = @memberrecid
    AND mStat.Code = 'Program'
  ORDER BY Stat.StatusEffectiveDate DESC;
  */
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
  ORDER BY ind.IndEffectiveDate;
  /*
SELECT 'Medicaid'                                         'Ind'
      ,CONVERT( varchar( 10 ) ,ind.IndEffectiveDate ,101 )'IndEffectiveDate'
      ,CONVERT( varchar( 10 ) ,ind.IndEndDate ,101 )      'IndEndDate'
      ,CONVERT( varchar( 10 ) ,ind.JobLoadDate ,101 )     'JobLoadDate'
  FROM dbo.MemberIndicator ind WITH ( nolock )
  --JOIN XRef.BenefitPackage sor WITH ( nolock )             ON sor.ExternalValue = ind.IndValue
  --JOIN MRef.BenefitPackage pkg WITH ( nolock )             ON pkg.BenefitPkgMRefId = sor.BenefitPkgMRefId
  WHERE 1 = 1
    AND ind.MemberRecId = @memberrecid
    AND ind.IndMRefId = 14
  ORDER BY ind.IndEffectiveDate;
*/
-- SELECT  * FROM    MRef.CMSCoverageIndicator

SELECT 'Hosp'                                             'Ind'
      ,CONVERT( varchar( 10 ) ,ind.IndEffectiveDate ,101 )'IndEffectiveDate'
      ,CONVERT( varchar( 10 ) ,ind.IndEndDate ,101 )      'IndEndDate'
      ,CONVERT( varchar( 10 ) ,ind.JobLoadDate ,101 )     'JobLoadDate'
--,pkg.[Desc]
  FROM dbo.MemberIndicator ind WITH ( nolock )
  --JOIN XRef.BenefitPackage sor WITH ( nolock )             ON sor.ExternalValue = ind.IndValue
  --JOIN MRef.BenefitPackage pkg WITH ( nolock )             ON pkg.BenefitPkgMRefId = sor.BenefitPkgMRefId
  WHERE 1 = 1
    AND ind.MemberRecId = @memberrecid
    AND ind.IndMRefId = 11
  ORDER BY ind.IndEffectiveDate;
/*
SELECT AddrLine1
      ,AddrLine2
      ,AddrCity
      ,AddrState
      ,AddrZipCode
      ,CONVERT( varchar( 10 ) ,addr.JobLoadDate ,101 )'JobLoadDate'
  FROM
       dbo.MemberAddress addr WITH ( nolock )
       JOIN MRef.AddressType addrtype WITH ( nolock )
            ON addrtype.AddrTypeMRefId = addr.AddrTypeM RefId
  WHERE 1 = 1
    AND addr.MemberRecId = @memberrecid
    AND addrtype.[Desc] = 'Home';

SELECT det.CommValue
      ,CONVERT( varchar( 10 ) ,comm.JobLoadDate ,101 )'JobLoadDate'
  FROM
       dbo.MemberCommunication comm WITH ( nolock )
       JOIN dbo.MemberCommunicationDetail det WITH ( nolock )
            ON det.CommDetailRecId = comm.CommDetailRecId
       JOIN MRef.CommunicationType commtype WITH ( nolock )
            ON commtype.CommTypeMRefId = comm.CommTypeMRefId
  WHERE 1 = 1
    AND comm.MemberRecId = @memberrecid
    AND commtype.Type = 'Phone'
    AND commtype.SubType = 'home';
*/
SELECT CONVERT( varchar( 10 ) ,pcp.PCPEffectiveDate ,101 )                'PCPEffectiveDate'
      ,CONVERT( varchar( 10 ) ,ISNULL( pcp.PCPEndDate ,'20781231' ) ,101 )'PCPEndDate'
      ,prov.DisplayName                                                   'RendProv'
      ,rend.ExternalValue                                                 'RendNPI'
      ,bprov.DisplayName                                                  'BillingProv'
      ,bill.ExternalValue                                                 'BillingNPI'
      ,CONVERT( varchar( 10 ) ,pcp.JobLoadDate ,101 )                     'JobLoadDate'
-- ,aff.EffectiveDate
-- ,aff.EndDate
  FROM
       dbo.MemberPCP pcp WITH ( nolock )
       JOIN dbo.Provider prov WITH ( nolock )
            ON prov.ProviderRecId = pcp.ProviderRecId
       JOIN XRef.Provider rend WITH ( nolock )
            ON rend.ProviderRecId = prov.ProviderRecId
           AND rend.ExternalTypeMRefId = 13
       JOIN dbo.ProviderAffiliation aff WITH ( nolock )
            ON aff.ProviderAffiliationRecId = pcp.ProviderAffiliationRecId
       JOIN dbo.Provider bprov WITH ( nolock )
            ON bprov.ProviderRecId = aff.ProviderAffiliationAffiliatedId
       JOIN XRef.Provider bill WITH ( nolock )
            ON bill.ProviderRecId = bprov.ProviderRecId
           AND bill.ExternalTypeMRefId = 13
  WHERE 1 = 1
    AND MemberRecId = @memberrecid
  ORDER BY PCP.PCPEffectiveDate;