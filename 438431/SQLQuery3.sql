SELECT Keys.memid
      ,Keys.carriermemid
      ,Keys.segtype
      ,Keys.effdate
      ,Keys.termdate
      ,stat.primarystatus
      ,cov.ratecode
      ,cov.coveragecodeid
      ,op.policynum
	  , PP.planid
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
	--AND Keys.effdate = Keys.termdate
	--AND stat.primarystatus = 'P'
	AND Keys.carriermemid = '010008116'
	--AND PP.planid = 'QLXBP0195'
;



SELECT TOP 10 *
FROM dbo.enrollkeys Keys
WHERE 1 = 1
	--AND Keys.effdate = Keys.termdate
	--AND stat.primarystatus = 'P'
	AND carriermemid = '010001816'
ORDER BY Keys.effdate DESC


SELECT *
FROM [PlanData_dev1].[dbo].[processlog]
where createdate > '2017-12-27'
;


