SELECT TOP 5 Memb.memid,CONVERT(VARCHAR, memb.[lastupdate],112) DA
	,Memb.secondaryid
	,Memb.ssn
	,Memb.sex
	,Memb.dob     
	,ent.firstname
	,ent.middlename
	,ent.lastname
	, memb.[lastupdate]
	, memb.[createdate]
FROM
	dbo.member Memb WITH ( NOLOCK )     
	JOIN dbo.entity ent WITH ( NOLOCK )
		ON ent.entid = Memb.entityid
WHERE 1 = 1
	AND (CONVERT(VARCHAR, memb.[lastupdate],112) >= '20161001' OR CONVERT(VARCHAR,memb.[createdate],112) >= '20161001')
;




SELECT TOP 5 Memb.memid,CONVERT(VARCHAR, memb.[lastupdate],112) DA
      ,Memb.secondaryid
      ,Memb.ssn
      ,Memb.sex
      ,Memb.dob     
	  , memb.[lastupdate]
  FROM
       dbo.member Memb WITH ( NOLOCK )
  WHERE 1 = 1
		AND (CONVERT(VARCHAR, memb.[lastupdate],112) >= '20161001' OR CONVERT(VARCHAR,memb.[createdate],112) >= '20161001')


SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy 
FROM qnxt.MemberEnrollKeys keys 
WHERE keys.Carriermemid = '010418028' 
--	AND SegType <> 'DEL'
ORDER BY EffDate

--010176510: 282236
--010418028
--010145685
--010204424
--010278323
--030090566
--030003277
--030203474
--030175748
--030009587



