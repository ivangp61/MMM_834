SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT DISTINCT
    m.MemberRecId
    ,mid.ExternalValue                              AS MemberId
    ,qpid.ExternalValue                             AS QnxtPrimaryId
    ,qsid.ExternalValue                             AS QnxtSecondaryId
--     ,qpid.MemberXRefId                              AS MemberXRefIdPrimaryId
--     ,qsid.MemberXRefId                              AS MemberXRefIdSecondaryId
    ,meco.LastName + ', ' + meco.FirstName          AS MemberFullName
--     ,gend.Code                                      AS Gender
    ,ssc.ExternalValue                              AS SocialSecurity
    ,hic.ExternalValue                              AS HicNumber
--     ,CONVERT(VARCHAR(10), meco.BirthDate, 101)      AS BirthDate
    ,meco.LastName
   ,meco.FirstName
    ,c.DisplayCode                                  AS CompanyCode
--      ,mi.IndValue                                   AS PackageId
--     ,CONVERT(VARCHAR(10), mi.IndEffectiveDate, 101) AS PackageEffectiveDate
--     ,CONVERT(VARCHAR(10), mi.IndEndDate, 101)       AS PackageTermDate
--     ,mbpk.[Desc]                                    AS PackageName
--     ,qpid.CreationDate
--     ,lang.Code                                      AS Language
--     ,cmsc.[Desc]
--     ,grp.Name                             AS GroupName
--     ,pgrp.Name                            AS ParentGroupName
--     ,cc.ContractName
--     ,cc.ContractValue
-- ,rp.ProviderRecId                       AS ProviderRenderingRecId
--     ,xrp.ExternalValue                      AS PcpRenderingNpi
--     ,xbp.ExternalValue                      AS PcpBillingNpi
--     ,rp.FirstName                          AS PcpFirstName
--     ,rp.LastName                           AS PcpLastName
--     ,mpcp.PCPEffectiveDate                   AS PcpEffectiveDate
--     ,mpcp.PCPEndDate                        AS PcpTermDate
FROM
   MRef.Member                                  m
    LEFT JOIN dbo.MemberCompany                      meco
      ON meco.MemberRecId = m.MemberRecId
    LEFT JOIN XRef.Member                            mid
        ON mid.MemberRecId = m.MemberRecId
        AND mid.ExternalTypeMRefId = 5
        AND mid.CompanyMRefId = meco.CompanyMRefId
    LEFT JOIN XRef.Member                            qpid
        ON qpid.MemberRecId = m.MemberRecId
        AND qpid.ExternalTypeMRefId = 2
    LEFT JOIN XRef.Member                            qsid
        ON qsid.MemberRecId = m.MemberRecId
        AND qsid.ExternalTypeMRefId = 24
    LEFT JOIN XRef.Member                            ssc
        ON ssc.MemberRecId = m.MemberRecId
        AND ssc.ExternalTypeMRefId = 9
    LEFT JOIN XRef.Member                            hic
        ON hic.MemberRecId = m.MemberRecId
        AND hic.ExternalTypeMRefId = 11
   LEFT JOIN MRef.Company                           c
        ON c.CompanyMRefId = meco.CompanyMRefId
    LEFT JOIN dbo.MemberIndicator                    mi
      ON mi.MemberRecId = m.MemberRecId
      AND mi.IndMRefId = 24
   LEFT JOIN XRef.BenefitPackage                 xbpk
      ON xbpk.ExternalValue = mi.IndValue
      AND xbpk.ExternalTypeMRefId = 1
      AND xbpk.CompanyMRefId = mi.CompanyMRefId
   LEFT JOIN MRef.BenefitPackage                 mbpk
      ON mbpk.BenefitPkgMRefId = xbpk.BenefitPkgMRefId
    LEFT JOIN MRef.Gender                            gend
        ON gend.GenderMRefId = meco.GenderMRefId
    LEFT JOIN MRef.Language                          lang
        ON lang.LanguageMRefId = meco.LanguageMRefId
    LEFT JOIN MRef.CMSCoverageIndicator                cmsc
      ON cmsc.IndMRefId = mi.IndMRefId
   LEFT JOIN MRef.[Group]                      grp
      ON grp.GroupId = mbpk.GroupId
   LEFT JOIN MRef.[Group]                      pgrp
      ON pgrp.GroupId = grp.ParentGroupId
   LEFT JOIN MRef.CompanyContract                cc
      ON cc.CompanyContractMRefId = mbpk.CompanyContractMRefId
   LEFT JOIN dbo.MemberPCP             mpcp
      ON mpcp.MemberRecId = m.MemberRecId
      AND mpcp.CompanyMRefId = mi.CompanyMRefId
--        AND GETDATE() BETWEEN mpcp.PCPEffectiveDate AND COALESCE(mpcp.PCPEndDate, GETDATE())
   LEFT JOIN EnterpriseHub.dbo.Provider            rp
      ON rp.ProviderRecId = mpcp.ProviderRecId
   LEFT JOIN EnterpriseHub.XRef.Provider           xrp
      ON xrp.ProviderRecId = rp.ProviderRecId
      AND xrp.ExternalTypeMRefId = 13
   LEFT JOIN EnterpriseHub.dbo.ProviderAffiliation       aff
      ON aff.ProviderAffiliationRecId = mpcp.ProviderAffiliationRecId
   LEFT JOIN EnterpriseHub.dbo.Provider            bp
      ON bp.ProviderRecId = aff.ProviderAffiliationAffiliatedId
   LEFT JOIN EnterpriseHub.XRef.Provider           xbp
      ON xbp.ProviderRecId = bp.ProviderRecId
      AND xbp.ExternalTypeMRefId = 13
WHERE 1=1
--     AND mid.ExternalValue IS NOT NULL
   AND mid.ExternalValue IN('010717386'
   ),
'010648391',
'010716688')
--     AND GETDATE() BETWEEN mpcp.PCPEffectiveDate AND COALESCE(mpcp.PCPEndDate, GETDATE())
--     AND GETDATE() BETWEEN mi.IndEffectiveDate AND COALESCE(mi.IndEndDate, GETDATE())
--     AND cc.ContractValue = 'H4011'
--     AND m.MemberRecId IN(10198, 99703, 10072, 638198, 648217, 10005)
--     )
ORDER BY
   mid.ExternalValue ASC
--     ,mi.IndEffectiveDate ASC
--     ,mi.IndEndDate ASC;
GO
010072291

USE QNXTHub;

--UPDATE qnxt.MemberBenefitPlanRate
SET SourceCode = 'P00279140874'
WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0074'
;

SELECT TOP 100 *
FROM qnxt.MemberBenefitPlanRate R
WHERE --R.SOURCECODE = 'P00279140874' 
TargetCode ='QLXBP0148'
;
--QLXBP0149 


SELECT *
--[Desc] 'SECONDARY'
  --    ,xPkg.ExternalValue 'PACKAGE_ID'
  FROM
       MRef.BenefitPackage Pkg
       JOIN XRef.BenefitPackage xPkg
            ON xPkg.BenefitPkgMRefId = Pkg.BenefitPkgMRefId
  WHERE 1 = 1
	AND xPkg.ExternalValue = 'P00279140874'
    AND ExternalTypeMRefId = 1;

SELECT *
FROM qnxt.MemberBenefitPlanRate

WHERE CarrierCode = 'MMM' AND TargetCode ='QLXBP0074'
;



