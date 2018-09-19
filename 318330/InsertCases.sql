USE QNXTHub;

TRUNCATE TABLE stg.MemberWorkingList;
TRUNCATE TABLE stg.MemberHeader;
TRUNCATE TABLE stg.MemberAddress;
TRUNCATE TABLE stg.MemberComm;
TRUNCATE TABLE stg.MemberBenefitPlan;
TRUNCATE TABLE stg.MemberHospice;
TRUNCATE TABLE stg.MemberMedicaid;
TRUNCATE TABLE stg.MemberPcp;


INSERT INTO stg.MemberWorkingList values(newid(), 178648);
INSERT INTO stg.MemberWorkingList values(newid(), 37585);
INSERT INTO stg.MemberWorkingList values(newid(), 371056);
INSERT INTO stg.MemberWorkingList values(newid(), 518347);
INSERT INTO stg.MemberWorkingList values(newid(), 142800);


--=====PMC=====
--INSERT INTO stg.MemberWorkingList values(newid(), 271768);
--INSERT INTO stg.MemberWorkingList values(newid(), 542873);
--=====PMC=====



--=====MMM=====
--178648
--37585
--371056
--518347
--142800
--=====MMM=====

--=====PMC=====
--542873
--271768
--=====PMC=====
