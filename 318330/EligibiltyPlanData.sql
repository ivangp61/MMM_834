USE PlanData_dev1;
GO


DECLARE @carrierMemid AS CHAR(25), @primaryStatus AS CHAR(1);

SET @carrierMemid = '010099219';
SET @primaryStatus = 'P';

SELECT TOP 10 Keys.memid
      ,Keys.carriermemid
      ,Keys.segtype
	  , RS.description
      ,Keys.effdate
      ,Keys.termdate
      ,stat.primarystatus
      ,cov.ratecode
      ,cov.coveragecodeid
      ,op.policynum
FROM
    dbo.enrollkeys Keys WITH ( NOLOCK )	
    JOIN dbo.enrollstatus stat WITH ( NOLOCK )
        ON stat.enrollid = Keys.enrollid
    JOIN dbo.enrollcoverage cov WITH ( NOLOCK )
        ON cov.enrollid = Keys.enrollid
    JOIN dbo.policyplans pp WITH ( NOLOCK )
        ON pp.planid = Keys.planid
    JOIN dbo.orgpolicy op WITH ( NOLOCK )
        ON op.polid = pp.polid
	JOIN dbo.ratesuffix RS
		ON COV.ratecode = RS.ratecode
WHERE 1 = 1
	AND Keys.carriermemid = @carrierMemid
	AND stat.primarystatus IN(@primaryStatus)
ORDER BY Keys.effdate ASC
;



