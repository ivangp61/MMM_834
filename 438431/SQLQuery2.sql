SELECT Keys.memid
      ,Keys.carriermemid
      ,Keys.segtype
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
  WHERE 1 = 1
	AND carriermemid = '010006575'
  GROUP BY Keys.memid
          ,Keys.carriermemid
          ,Keys.segtype
          ,Keys.effdate
          ,Keys.termdate
          ,stat.primarystatus
          ,cov.coveragecodeid
          ,cov.ratecode
          ,op.policynum
;

