SELECT 'TgtPlan'                                                           'tbl'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateBegin AS datetime ) ,101 )'effdate'
      ,CONVERT( varchar( 10 ) ,CAST( p.EnrollDateEnd AS datetime ) ,101 )  'termdate'
       --,p.TransactionGroupCd                                                'Tg'
      ,p.MaintIdentCd                                                      'M'
      ,p.InsuranceLineCd                                                   'Ins'
      ,p.PlanCoverageDesc                                                  'Rate'
       --,p.EnrollDateBeginIdentCd      
       --,p.EnrollDateEndIdentCd
       --,p.ClientRptCatIdentCd
       -- ,p.ClientRptCatident
       --,p.PolicyGroupIdentCd
      ,p.PolicyGroupIdent                                                  'Pol'
	  , p.TransactionGroupCd
	  ,p.MaintIdentCd
	  ,MBP.BenefitPlan
	  ,MBP.CoverageDescription
FROM QNXTHub.tgt.MemberBenefitPlan p
	JOIN QNXTHub.stg.MemberHeader h
    ON h.DIHMemberRecId = p.DIHMemberRecId
	JOIN QNXTHUB.qnxt.MemberBenefitPlanRate MBP
	ON P.PolicyGroupIdent = MBP.OrgPolicy AND P.PlanCoverageDesc = MBP.RateCode
WHERE 1 = 1
        AND p.DIHMemberRecId = 338902
ORDER BY p.EnrollDateBegin DESC
;
