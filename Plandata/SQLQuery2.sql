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
from enrollkeys ek (nolock) 
      join benefitplan bp (nolock) on bp.planid = ek.planid
      join enrollstatus es (nolock) on es.enrollid = ek.enrollid
      join enrollcoverage ec (nolock) on ec.enrollid = ek.enrollid
where ek.segtype = 'int'
      and es.primarystatus in ('p','s')
    --  and ek.effdate = ek.termdate
  --    and ek.updateid = 'TPMMMT5010'
--      and ec.coveragecodeid = '001'
      and ek.carriermemid in ('030005966')--('010008551','010000300')
order by ek.carriermemid, EffDt desc

Select Top 10 *
From [dbo].[memberpcp]


Select *
From benefitplan
;

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
from enrollkeys ek (nolock) 
      join benefitplan bp (nolock) on bp.planid = ek.planid
      join enrollstatus es (nolock) on es.enrollid = ek.enrollid
      join enrollcoverage ec (nolock) on ec.enrollid = ek.enrollid
where ek.segtype = 'int'
      --and es.primarystatus in ('p','s')
      --and ek.effdate = ek.termdate
      --and ek.updateid = 'TPMMMT5010'
      --and ec.coveragecodeid = '001'
       and ek.carriermemid in ('030005966')
       --and ek.carriermemid in ('010008551','010000300')
order by ek.carriermemid

Select Top 10 *
From [dbo].[memberpcp] M
Where M.enrollid = 'EL01568420     '

Select Top 10*
From [dbo].[provider] P

  --DB: planintegration


SELECT TOp 10*
FROM dbo.processlogheader h WITH (nolock)
WHERE 1 = 1
     --AND h.externalid Like '%QnxtEHubSyncMember834EDIMMMA20180315004833%'
      --AND LTRIM(RTRIM(processlogtypeid)) = @Process
--	  and processlogid = 'QLXPRC87921810'
	  and convert(varchar,createdate,112) = '20180503'
ORDER BY createdate DESC;

SELECT *
FROM dbo.processlogdetail det WITH (nolock)
WHERE 1 = 1
     --AND customerrmsg Like '%RUIZ%'
--AND det.processlogid = 'QLXPRC87921808'
and convert(varchar,createdate,112) = '20180503'
and processstageid = 'COMPLETED'
ORDER BY createdate;
