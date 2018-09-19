USE QNXTHub;
GO
DECLARE @subid VARCHAR(10)= '010590450', @id INT= 447561, @memid CHAR(15)= 'QLXM00000045483';
SELECT h.MemId,
       h.SecondaryId,
       h.SocialSecurity,
       h.Firstname,
       h.Initial,
       h.Lastname,
       h.Gender,
       h.BirthDate
FROM qnxt.MemberHeader h
WHERE 1 = 1
      AND h.MemId = @memid;/*
SELECT 'QnxtHic' 'tbl',
       HicNumber,
       CONVERT( VARCHAR(10), effdate, 101) 'effdate',
       CONVERT( VARCHAR(10), termdate, 101) 'termdate'
FROM qnxt.MemberHic h
WHERE 1 = 1
      AND MemId = @memid;*/
SELECT 'QnxtKeys' 'tbl',
       -- k.SegType
       CONVERT( VARCHAR(10), k.EffDate, 101) 'effdate',
       CONVERT( VARCHAR(10), k.TermDate, 101) 'termdate',
       k.PrimaryStatus 's',
       k.CoverageCodeId 'Ins',
       k.RateCode 'Rate',
       k.orgpolicy 'Pol'
FROM qnxt.MemberEnrollKeys k
WHERE 1 = 1
      -- AND Carriermemid = @subid
      AND k.MemId = @memid
-- and k.PrimaryStatus = 'P'
ORDER BY k.effdate;