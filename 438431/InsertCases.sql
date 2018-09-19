USE QNXTHub;

TRUNCATE TABLE stg.MemberWorkingList;
TRUNCATE TABLE stg.MemberHeader;
TRUNCATE TABLE stg.MemberAddress;
TRUNCATE TABLE stg.MemberComm;
TRUNCATE TABLE stg.MemberBenefitPlan;
TRUNCATE TABLE stg.MemberHospice;
TRUNCATE TABLE stg.MemberMedicaid;
TRUNCATE TABLE stg.MemberPcp;

insert into stg.MemberWorkingList values(newid(), 470670);
insert into stg.MemberWorkingList values(newid(), 473610);
insert into stg.MemberWorkingList values(newid(), 592974);
insert into stg.MemberWorkingList values(newid(), 736479);
insert into stg.MemberWorkingList values(newid(), 717246);
insert into stg.MemberWorkingList values(newid(), 722852);
insert into stg.MemberWorkingList values(newid(), 616871);
insert into stg.MemberWorkingList values(newid(), 537471);

--010000426:13412
--010001236:14247
--010002239:25019
--010002379:11626
--010004386:19368
