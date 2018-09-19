

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
WHERE BP.DIHMemberRecId = 142800;


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

SELECT TOP 100 *
FROM qnxt.MemberEnrollKeys
WHERE MemId = 'QLXM00000080740'
	AND SegType = 'INT'
	AND MemberEnrollKeysId = 'AB85F755-1E5C-4B14-954B-32A6D9B871CD'
;



--DELETE qnxt.MemberEnrollKeys
WHERE MemId = 'QLXM00000080740'
	AND SegType = 'INT'
	AND MemberEnrollKeysId = '375BFF0D-40E3-422F-A0B6-8AAE003833FE'
;
