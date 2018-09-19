--USE plandata_rpt;
--GO


DECLARE
   @memid ident = 'QLXM00000045483' 
   -- @carriermemid ident = '010047808';
-- select memid from dbo.member where secondaryid = 'MEML00000267849'
-- SELECT @memid = memid   FROM dbo.enrollkeys  WHERE 1 = 1     AND secondaryid = 'MEML00000009614' carriermemid = @carriermemid;

SELECT TOP 1 mem.memid
            ,mem.secondaryid
            ,mem.status
            ,mem.sex
            ,mem.fullname
            ,mem.headofhouse
            ,mem.ssn
            ,CONVERT( varchar( 10 ) ,mem.dob ,101 )       'dob'
            ,CONVERT( varchar( 10 ) ,mem.deathdate ,101 ) 'dd'
            ,mem.issubscriber
            ,CONVERT( varchar( 25 ) ,mem.lastupdate ,100 )'lupd'
             --,ent.lastname
             --,ent.firstname
             --,ent.middlename
             --,ent.enttype
            ,ent.addr1
            ,ent.addr2
            ,ent.city
             --,ent.attn
            ,ent.state
            ,ent.zip
             --,ent.county
             --,ent.phyaddr1
             --,ent.phyaddr2
             --,ent.phycity
             --,ent.phystate
             --,ent.phyzip
             --,ent.phycounty
            ,ent.phone
            ,CONVERT( varchar( 25 ) ,ent.lastupd ,100 )   'lastupdate'
  FROM
       dbo.member mem WITH ( nolock )
       JOIN dbo.entity ent WITH ( nolock )
            ON ent.entid = mem.entityid
  WHERE 1 = 1
    AND mem.memid = @memid;
/*
SELECT Hic
      ,CONVERT( varchar( 10 ) ,EffDate ,101 )   'effdate'
      ,CONVERT( varchar( 10 ) ,TermDate ,101 )  'termdate'
      ,CONVERT( varchar( 25 ) ,LastUpdate ,100 )'lupd'
  FROM dbo.MemberCmsHic
  WHERE 1 = 1
    AND MemId = @memid
  ORDER BY lastupdate, effdate;

  select * 
  from dbo.memberattribute a
  where 1=1
    and a.attributeid = 'CMSMED0001'
    and a.memid = @memid;
*/
--SELECT benefit.description
--      ,org.fullname
--      ,keys.carriermemid
--      ,keys.effdate
--      ,keys.termdate
--      ,keys.segtype
--      ,keys.plantype
--      ,keys.ratecode
--      ,orgpol.policynum
--      ,keys.updateid
--      ,keys.lastupdate

SELECT enrl.enrollid
      ,pkg.description
      ,pkg.plantype
	  ,pkg.description    'BenefitPlan'
      ,CONVERT( varchar( 10 ) ,enrl.effdate ,101 )       'effdate'
      ,CONVERT( varchar( 10 ) ,enrl.termdate ,101 )      'termdate'
      ,enrl.segtype
      ,enrl.enrolltype
      ,enrl.plantype
      ,enrl.ratecode
      ,enrl.covtype
      ,rate.description
      ,enrl.primarystatus
      ,CONVERT( varchar( 10 ) ,enrl.statuseffdate ,101 ) 'statuseff'
      ,CONVERT( varchar( 10 ) ,enrl.statustermdate ,101 )'statusend'
      ,CONVERT( varchar( 25 ) ,enrl.createdate ,100 )    'cdat'
	 ,CONVERT( varchar( 25 ) ,enrl.lastupdate ,100 )    'lupd'
	 , enrl.updateid
  FROM
       dbo.enrollment enrl
       JOIN dbo.benefitplan pkg
            ON pkg.planid = enrl.planid
       LEFT JOIN dbo.ratesuffix rate WITH ( nolock )
            ON rate.rateid = enrl.rateid
           AND rate.ratecode = enrl.ratecode
  --dbo.enrollkeys keys
  --JOIN dbo.eligibilityorg org
  --     ON org.eligibleorgid = keys.eligibleorgid
  --JOIN dbo.benefitplan benefit
  --     ON benefit.planid = keys.planid --JOIN dbo.ratesuffix rate
  ----     ON rate.ratecode = keys.ratecode
  ----    AND rate.orgpolicyid = keys.orgpolicyid
  --JOIN dbo.orgpolicy orgpol
  --     ON orgpol.orgpolicyid = keys.orgpolicyid
  WHERE 1 = 1
    AND memid = @memid
  AND primarystatus = 'P'  
  -- and rate.description = 'Medical'
  --and enrl.segtype <> 'DEL'
  ORDER BY enrl.effdate DESC;

--SELECT enrolltype, COUNT(*) 'Total' FROM    dbo.enrollkeys Group by enrolltype

SELECT keys.enrollid
      ,prov.npi                                     'RendNPI'
      ,prov.fullname                                'Rend'
      ,bill.npi                                     'BillNPI'
      ,bill.fullname                                'Bill'
      ,CONVERT( varchar( 10 ) ,pcp.effdate ,101 )   'effdate'
      ,CONVERT( varchar( 10 ) ,pcp.termdate ,101 )  'termdate'
      ,pcp.updateid
      ,CONVERT( varchar( 25 ) ,pcp.lastupdate ,100 )'lupd'
  FROM
       dbo.memberpcp pcp
       JOIN dbo.affiliation aff
            ON aff.affiliationid = pcp.affiliationid
       JOIN dbo.provider prov
            ON prov.provid = aff.provid
       JOIN dbo.provider bill
            ON bill.provid = aff.affiliateid
       JOIN dbo.enrollkeys keys
            ON keys.enrollid = pcp.enrollid
  WHERE 1 = 1
    AND keys.memid = @memid     
  ORDER BY pcp.lastupdate;
  
  
    