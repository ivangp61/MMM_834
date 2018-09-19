USE QNXTHub;
GO
-- select * from trn.TransactionException
--select * from stg.MemberWorkingList

DECLARE @memrecid INT= 142800;
SELECT 'StgHead' 'tbl',
       h.CarrierCode,
       h.SponsorCode,
       h.Firstname,
       h.Initial,
       h.Lastname,
       h.Gender,
       h.BirthDate,
       h.DeathDate,
       h.SocialSecurity,
       h.SubscriberId,
       h.HicNumber,
       h.HicNumberPrevious,
       h.Program,
       h.EnrollDate,
       h.DisenrollDate,
       h.MemId,
       h.SecondaryId
FROM stg.MemberHeader h
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid;
SELECT 'StgAddr' 'tbl',
       a.Addr1,
       a.Addr2,
       a.City,
       a.State,
       a.ZipCode
FROM stg.MemberAddress a
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid;
SELECT 'StgComm' 'tbl',
       c.HomePhone
FROM stg.MemberComm c
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid;
SELECT 'StgMedi' 'tbl',
       m.EffDate,
       m.TermDate
FROM stg.MemberMedicaid m
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid;
SELECT 'StgPlan' 'tbl',
       CONVERT( VARCHAR(10), EffDate, 101) 'EffDate',
       CONVERT( VARCHAR(10), TermDate, 101) 'TermDate',
       BenefitPlan,
       @memrecid 'memrecid',
       h.SubscriberId,
       --,sourcecode
       h.SecondaryId,
       h.MemId
FROM stg.MemberBenefitPlan p
     JOIN stg.MemberHeader h ON h.DIHMemberRecId = p.DIHMemberRecId
WHERE 1 = 1
      AND p.DIHMemberRecId = @memrecid;
SELECT 'StgHosp' 'tbl',
       CONVERT( VARCHAR(12), h.EffDate, 101) 'EffDate',
       CONVERT( VARCHAR(12), h.TermDate, 101) 'TermDate'
-- , h.EffDate, h.TermDate
--, DIHMemberRecId
FROM stg.MemberHospice h
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid
ORDER BY h.EffDate;
SELECT 'StgPcp' 'tbl',
       CONVERT( VARCHAR(10), pcp.EffDate, 101) 'effdate',
       CONVERT( VARCHAR(10), pcp.TermDate, 101) 'termdate',
       pcp.MemberPcpFirstname,
       pcp.MemberPcpInitial,
       pcp.MemberPcpLastname,
       pcp.RenderingNPI,
       pcp.BillingNPI
FROM stg.MemberPcp pcp
WHERE 1 = 1
      AND DIHMemberRecId = @memrecid;