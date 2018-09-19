USE QNXTHub;

SELECT  SourceCode
FROM    qnxt.MemberBenefitPlanRate
WHERE SourceCode IS NOT NULL
GROUP BY SourceCode


SELECT  TOP 100 *
FROM    qnxt.MemberBenefitPlanRate PL
WHERE 1 = 1
	AND PL.TargetCode IN('QLXBP0180','QLXBP0150','QLXBP0137','QLXBP0189')
--	AND PL.SourceCode = 'P00138497118'
;


SELECT  memc.MemberRecId
FROM    dbo.MemberCompany memc
JOIN MRef.Company comp on comp.CompanyMRefId = memc.CompanyMRefId
WHERE 1=1 
 --and memc.JobLoadDate >= ? 
 and comp.DisplayCode = 'MMM'



SELECT  *
FROM trn.TransactionException
WHERE Identifier = 
;

