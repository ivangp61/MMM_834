DELETE tgt.MemberPcp;
DELETE tgt.MemberBenefitPlan;
DELETE tgt.MemberHeader;


SELECT *
FROM tgt.MemberPcp;

SELECT *
FROM tgt.MemberBenefitPlan
--WHERE DIHMemberRecId = 16406
ORDER BY EnrollDateBegin ASC
;


SELECT *
FROM tgt.MemberHeader;
;


