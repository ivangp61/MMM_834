select distinct 
      MemberID = ek.carriermemid, 
      EnrollID = ek.enrollid,
      Package = bp.description,
      CoverageID = ec.coveragecodeid,
      EffDt = convert(varchar,ek.effdate,101),
      TermDt = CONVERT(varchar,ek.termdate,101),
      Enroll_Type = ek.segtype, 
      Enroll_Status = es.primarystatus,
      CreateID = ek.createid, 
      CreateDt = CONVERT(varchar,ek.createdate,101),
      UpdateID = ek.updateid,
      Last_Update = CONVERT(Varchar,ek.lastupdate,101)
	  ,ek.lastupdate as t
from enrollkeys ek (nolock) 
      join benefitplan bp (nolock) on bp.planid = ek.planid
      join enrollstatus es (nolock) on es.enrollid = ek.enrollid
      join enrollcoverage ec (nolock) on ec.enrollid = ek.enrollid
where ek.segtype = 'int'
      and es.primarystatus in ('p','s')
      and ek.effdate = ek.termdate
      and ek.updateid = 'TPMMMT5010'
      and ec.coveragecodeid = '001'
	  --and ek.carriermemid in ('010013318')--('010008551','010000300')
order by ek.carriermemid, EffDt desc

select distinct 
      MemberID = ek.carriermemid--, 
      --EnrollID = ek.enrollid,
      --Package = bp.description,
      --CoverageID = ec.coveragecodeid,
      --EffDt = convert(varchar,ek.effdate,101),
      --TermDt = CONVERT(varchar,ek.termdate,101),
      --Enroll_Type = ek.segtype, 
      --Enroll_Status = es.primarystatus,
      --CreateID = ek.createid, 
      --CreateDt = CONVERT(varchar,ek.createdate,101),
      --UpdateID = ek.updateid,
      --Last_Update = CONVERT(Varchar,ek.lastupdate,101)
from enrollkeys ek (nolock) 
      join benefitplan bp (nolock) on bp.planid = ek.planid
      join enrollstatus es (nolock) on es.enrollid = ek.enrollid
      join enrollcoverage ec (nolock) on ec.enrollid = ek.enrollid
where ek.segtype = 'int'
      and es.primarystatus in ('p','s')
      and ek.effdate = ek.termdate
      and ek.updateid = 'TPMMMT5010'
      and ec.coveragecodeid = '001'
	  --and ek.carriermemid in ('010013318')
	  --and ek.carriermemid in ('010008551','010000300')
order by ek.carriermemid


--010010680:glitch

--010008416
--010010715