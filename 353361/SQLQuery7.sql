USE QNXTHub;

TRUNCATE TABLE stg.MemberWorkingList;
TRUNCATE TABLE stg.MemberHeader;
TRUNCATE TABLE stg.MemberAddress;
TRUNCATE TABLE stg.MemberComm;
TRUNCATE TABLE stg.MemberBenefitPlan;
TRUNCATE TABLE stg.MemberHospice;
TRUNCATE TABLE stg.MemberMedicaid;
TRUNCATE TABLE stg.MemberPcp;

--=====MMM=====
INSERT INTO stg.MemberWorkingList values(newid(), 490892);
--=====MMM=====




