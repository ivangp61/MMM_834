USE QNXTHub;
DELETE tgt.MemberPcp;
DELETE tgt.MemberBenefitPlan;
DELETE tgt.MemberHeader;


SELECT *
FROM tgt.MemberPcp;

SELECT *
FROM STG.MemberBenefitPlan T
WHERE T.DIHMemberRecId = 590887;


SELECT *
FROM tgt.MemberBenefitPlan T
WHERE T.DIHMemberRecId = 632516;

SELECT *
FROM tgt.MemberHeader;

SELECT DISTINCT m.DIHMemberRecId
FROM tgt.MemberHeader m;


SELECT *
FROM tgt.MemberPcp;

SELECT *
FROM tgt.MemberBenefitPlan P
WHERE P.TransactionGroupCd = 'A';

SELECT *
FROM tgt.MemberHeader
;

--UPDATE tgt.MemberBenefitPlan
SET PlanCoverageDesc = 400,
	PolicyGroupIdent = '003'
WHERE TransactionGroupCd = 'A'
;

                enrollment.PlanCoverageDesc = planRate.RateCode;
                enrollment.PolicyGroupIdent = planRate.OrgPolicy;

