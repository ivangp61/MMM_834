

SELECT *
FROM stg.MemberWorkingList;

SELECT *
FROM stg.MemberHeader;

SELECT *
FROM stg.MemberAddress;

SELECT *
FROM stg.MemberComm;

SELECT *
FROM stg.MemberBenefitPlan BP
WHERE BP.DIHMemberRecId = 20359;


--UPDATE stg.MemberBenefitPlan
SET TermDate = '2018-01-01 00:00:00.000'
WHERE MemberBenefitPlanId = '7C60462E-CDD9-4FD9-854E-E00D5C8F0663'
;

SELECT *
FROM stg.MemberHospice;

SELECT *
FROM stg.MemberMedicaid;

SELECT *
FROM stg.MemberPcp;


SELECT *
FROM qnxt.MemberBenefitPlanRate
WHERE SourceCode = 'P00138497118 '
;

