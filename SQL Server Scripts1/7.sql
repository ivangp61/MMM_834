SELECT  memc.*
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
	--and memc.JobLoadDate >= '20160601'
	and comp.DisplayCode = 'MMM'
	AND memc.MemberRecId = 178648
 ;

 


SELECT  comm.*
FROM    dbo.MemberCommunication comm
JOIN MRef.Company comp on comp.CompanyMRefId = comm.CompanyMRefId
WHERE 1=1
 and comm.CommTypeMRefId = 7
 and comm.JobLoadDate >= ''
 and comp.DisplayCode = 'MMM'
 AND comm.MemberRecId = 178648
 ;

 SELECT *
 FROM dbo.MemberIndicator mi
 where mi.MemberRecId =  114355
	and mi.JobLoadDate = '2016-04-01 00:00:00.000'
 ;

 SELECT *
 FROM dbo.MemberPCP PCP
 where PCP.MemberRecId IN (114355,
163195,
277747,
467500,
617653,
629411,
639197,
651676,
652239,
668893,
669371,
669623)
	and PCP.JobLoadDate = '2016-04-01 00:00:00.000'
 ;



 SELECT  keys.MemId, keys.Carriermemid, keys.SegType, keys.EffDate, keys.TermDate, keys.PrimaryStatus, keys.RateCode, keys.CoverageCodeId, keys.OrgPolicy 
 FROM qnxt.MemberEnrollKeys keys WHERE keys.Carriermemid = @SubscriberId ORDER BY EffDate
