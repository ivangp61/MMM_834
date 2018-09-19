SELECT DISTINCT Keys.memid
      ,Keys.carriermemid
      ,Keys.segtype
      ,Keys.effdate
      ,Keys.termdate
      --,stat.primarystatus
      --,cov.ratecode
      --,cov.coveragecodeid
      --,op.policynum
  FROM
       dbo.enrollkeys Keys WITH ( NOLOCK )
       --JOIN dbo.enrollstatus stat WITH ( NOLOCK )
       --     ON stat.enrollid = Keys.enrollid
       --JOIN dbo.enrollcoverage cov WITH ( NOLOCK )
       --     ON cov.enrollid = Keys.enrollid
       --JOIN dbo.policyplans pp WITH ( NOLOCK )
       --     ON pp.planid = Keys.planid
       --JOIN dbo.orgpolicy op WITH ( NOLOCK )
       --     ON op.polid = pp.polid
  WHERE 1 = 1
	AND Keys.carriermemid = '010135074'
  --GROUP BY Keys.memid
  --        ,Keys.carriermemid
  --        ,Keys.segtype
  --        ,Keys.effdate
  --        ,Keys.termdate
  --        ,stat.primarystatus
  --        ,cov.coveragecodeid
  --        ,cov.ratecode
  --        ,op.policynum




  select ek.carriermemid, ek.segtype, ek.enrollid, bp.description, 
effdate = CONVERT(varchar,ek.effdate,101), 
termdate = CONVERT(varchar,ek.termdate,101), 
ek.createid, createdate = CONVERT(varchar,ek.createdate,101), 
ek.updateid, lastupdate = CONVERT(varchar,ek.lastupdate,101) 
from enrollkeys ek (nolock) 
join benefitplan bp (nolock) on bp.planid = ek.planid 
where ek.carriermemid = '010135074'
