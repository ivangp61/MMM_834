
SELECT  pcp.MemberPcpId, pcp.MemberBenefitPlanId, pcp.DIHMemberRecId, pcp.EntityIdentCd, pcp.EntityTypeQualifier, pcp.Firstname, pcp.Middlename, pcp.Lastname, pcp.IdentCdQualifier, pcp.IdentCd, pcp.EffectiveDate, pcp.MaintReasonCd 
FROM    tgt.MemberPcp pcp 
WHERE 1=1 
;

