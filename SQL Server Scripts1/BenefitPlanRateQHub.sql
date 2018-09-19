SELECT bp.planid 'PlanId'
      ,bp.description    'BenefitPlan'
      ,carr.description  'CarrierCode'
      ,pp.effdate        'PolicyPlanEffDate'
      ,pp.termdate       'PolicyPlanTermDate'
      ,rs.ratecode       'RateCode'
      ,eo.fullname       'SponsorCode'
      ,op.effdate        'OrgPolicyEffDate'
      ,op.termdate       'OrgPolicyTermDate'
      ,op.policynum      'OrgPolicyCode'
      ,cc.coveragecodeid 'CoverageCode'
      ,cc.description    'CoverageDescription'
  FROM
       dbo.benefitplan bp( NOLOCK )
       INNER JOIN dbo.program prg WITH ( NOLOCK )
            ON prg.programid = bp.programid
       INNER JOIN dbo.carrier carr WITH ( NOLOCK )
            ON carr.carrierid = prg.carrierid
       INNER JOIN dbo.policyplans pp( NOLOCK )
            ON pp.planid = bp.planid
       INNER JOIN dbo.ratesuffix rs( NOLOCK )
            ON rs.rateid = pp.rateid
       INNER JOIN dbo.orgpolicy op( NOLOCK )
            ON op.polid = pp.polid
       INNER JOIN dbo.eligibilityorg eo( NOLOCK )
            ON eo.eligibleorgid = op.eligibleorgid
       INNER JOIN dbo.coveragecode cc( NOLOCK )
            ON cc.coveragecodeid = rs.coveragecodeid
  WHERE --bp.planid <> ''
bp.planid ='QLXBP0074'
    AND cc.Coveragecodeid <> '';
