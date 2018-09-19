SELECT CompanyMRefId, IsNull(MemberRecId,0) MemberRecId, IsNull(IndEffectiveDate,0) IndEffectiveDate, IsNull(IndMRefId,0) IndMRefId, IndEndDate, IndValue, IsPreferred, IsNull(SORId,0) SORId, CreationDate, CreationUserId, ModificationDate, ModificationUserId 
FROM  [ADWODSSTG].[dbo].[STG_ADW_MemberIndicator] S with(NOLOCK) 
WHERE 1 = 1
	AND MemberRecId = 382769
	AND CONVERT(VARCHAR,S.ModificationDate,112) >= '2017-03-08'
;

SELECT *
FROM stg.MemberBenefitPlan
ORDER BY EffDate
;

SELECT *
FROM stg.MemberHospice
ORDER BY EffDate
;


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
        AND p.DIHMemberRecId = 37585
ORDER BY p.EnrollDateBegin DESC
;
SELECT head.DIHMemberRecId, head.CarrierCode, head.SponsorCode, head.Firstname, head.Initial, head.Lastname, head.Gender, head.BirthDate, head.DeathDate, head.SocialSecurity, head.SubscriberId, head.HicNumber, head.HicNumberPrevious, head.Program, head.EnrollDate, head.DisenrollDate, head.MemId, head.SecondaryId 
FROM  stg.MemberHeader head 
WHERE head.DIHMemberRecId = 37585
;

