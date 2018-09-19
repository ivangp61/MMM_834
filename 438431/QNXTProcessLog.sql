USE planintegration;
GO
-- SELECT  * FROM    dbo.processlogtype 
-- 834 - CNCT5010-834I
-- 837 - CNCT5010-837I
SET NOCOUNT ON;
DECLARE @processLogId IDENT, @Process VARCHAR(20)= 'CNCT5010-837I';

SELECT top 5 * --@processLogId = h.processlogid
FROM dbo.processlogheader h WITH (nolock)
WHERE 1 = 1
      AND LTRIM(RTRIM(processlogtypeid)) = @Process
ORDER BY createdate DESC;

--QDXPRC94359759 

-- set @processLogId = 'QDXPRC94359745'

SELECT TOP 10 h.processlogid,
		   processstageid,
             startdate,
             stopdate             ,
             --,customerrmsg
             batchcount,
             batchcount - failurecount 'successcount',
             failurecount,
             h.processlogid,
             h.customerrmsg
FROM dbo.processlogheader h WITH (nolock)
WHERE 1 = 1
    AND h.processlogid = @processLogId
    --AND LTRIM(RTRIM(processlogtypeid)) = @Process
ORDER BY createdate DESC;


SELECT processstageid,
       COUNT(*) 'Total'
FROM dbo.processlogdetail det WITH (nolock)
WHERE 1 = 1
      AND det.processlogid = @processLogId
GROUP BY processstageid;

SELECT 
--top 10 
processstageid             ,
--,det.processlogid
--,startdate
--,stopdate
totalcount,
failurecount,
customerrmsg
FROM dbo.processlogdetail det WITH (nolock)
WHERE 1 = 1
      AND det.processlogid = @processLogId
--      AND det.processstageid IN( 'ERROR', 'STARTED')
      -- AND det.processstageid IN( 'COMPLETED')
      AND det.processstageid IN( 'PARTCOMP')
ORDER BY createdate;

-- SELECT MAX(createdate) FROM    dbo.processstep with(nolock)
-- SELECT  MAX(createdate) FROM dbo.processstate with(nolock)
-- SELECT * FROM dbo.processstage
-- SELECT * FROM dbo.processlogtype
-- SELECT  * FROM    dbo.process

/*
select h.processstageid, count(*) 'Total', max(lastupdate)
from dbo.processlogheader h
where 1=1 
 and h.processlogtypeid = 'CNCT5010-834I'
 group by h.processstageid

 select top 10 
 from dbo.processlogheader h
where 1=1 
 and h.processlogtypeid = 'CNCT5010-834I'
 and rtrim(ltrim(h.processstageid)) =  'started'
 order by lastupdate desc

 select processlogtypeid
 from dbo.processlogheader
 group by processlogtypeid
 order by processlogtypeid*/