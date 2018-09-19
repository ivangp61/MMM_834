--USE QNXTHub;
USE EnterpriseHub;
TRUNCATE TABLE QNXTHub.stg.MemberWorkingList;
TRUNCATE TABLE QNXTHub.stg.MemberHeader;
TRUNCATE TABLE QNXTHub.stg.MemberAddress;
TRUNCATE TABLE QNXTHub.stg.MemberComm;
TRUNCATE TABLE QNXTHub.stg.MemberBenefitPlan;
TRUNCATE TABLE QNXTHub.stg.MemberHospice;
TRUNCATE TABLE QNXTHub.stg.MemberMedicaid;
TRUNCATE TABLE QNXTHub.stg.MemberPcp;


------=====================PMC================================
--insert into stg.MemberWorkingList values(newid(), 68769);
--insert into stg.MemberWorkingList values(newid(), 209578);
--insert into stg.MemberWorkingList values(newid(), 227918);
--insert into stg.MemberWorkingList values(newid(), 236829);
--insert into stg.MemberWorkingList values(newid(), 241576);
------=====================PMC================================

--=====================MMM================================
--insert into stg.MemberWorkingList values(newid(), 706949);
--insert into stg.MemberWorkingList values(newid(), 706962);
--insert into stg.MemberWorkingList values(newid(), 707601);
--insert into stg.MemberWorkingList values(newid(), 706948);
--insert into stg.MemberWorkingList values(newid(), 706946);
--=====================MMM================================

insert into QNXTHub.stg.MemberWorkingList([MemberWorkingListId], [DIHRecId])
SELECT  distinct MemberRecId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
			ON Comp.CompanyMRefId = ind.CompanyMRefId
WHERE 1 = 1
    AND IndMRefId =24
    AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738','P00138883737','P00138497118','P00138883739')
	AND CONVERT(VARCHAR,ind.JobLoadDate,112) >=  '20171108'
	group by MemberRecId
;

SELECT DISTINCT *
  FROM xref.BenefitPackage pkg            
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
  WHERE 1 = 1
	AND CompanyContract = 'H4004'
	AND BenefitPkgContractId IN('061','817')
	--AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738','P00138883737','P00346099200','P00138883739')
	--AND ind.CompanyMRefId = 1
;


SELECT IndicatorRecId
,ind.JobLoadDate
      ,MemberRecId
      ,IndMRefId
      ,IndEffectiveDate
      ,IndEndDate
      ,mpkg.[Desc] 'BenefitPlan'
      ,pkg.SORId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
			ON Comp.CompanyMRefId = ind.CompanyMRefId
WHERE 1 = 1
    AND IndMRefId =24
    --AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738','P00138883737','P00138497118','P00138883739')
	AND CONVERT(VARCHAR,ind.JobLoadDate,112) >=  '20171028'
ORDER BY ind.JobLoadDate DESC
;

SELECT  *--MemberRecId,Pkg.JobLoadDate
FROM    dbo.MemberBenefitPackage Pkg
JOIN MRef.Company Comp on Comp.CompanyMRefId = Pkg.CompanyMRefId
WHERE 1=1 
	and CONVERT(VARCHAR,Pkg.JobLoadDate,112) >=  '20171027'
 and Comp.DisplayCode = 'MMM'
--GROUP BY MemberRecId

SELECT DISTINCT count(newid())
      ,MemberRecId
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
 ON Comp.CompanyMRefId = ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId =24
	--AND MemberRecId = 207188
    --AND (IndEffectiveDate >= ?
	   --or (IndEffectiveDate < ? and IndEndDate is null)
    --               or (IndEffectiveDate < ? and IndEndDate > ?))
	AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738','P00138883737','P00346099200','P00138883739')
	--AND ind.CompanyMRefId = 1
GROUP BY MemberRecId
HAVING count(newid()) > 1
;



SELECT DISTINCT *
  FROM
       dbo.MemberIndicator ind
       JOIN xref.BenefitPackage pkg
            ON pkg.SORId = ind.IndValue
           AND pkg.CompanyMRefId = ind.CompanyMRefId
       JOIN mref.BenefitPackage mpkg
            ON mpkg.BenefitPkgMRefId = pkg.BenefitPkgMRefId
       JOIN mref.Company Comp 
 ON Comp.CompanyMRefId = ind.CompanyMRefId
  WHERE 1 = 1
    AND IndMRefId =24
	AND MemberRecId = 590887
	--AND MemberRecId = 207188
    --AND (IndEffectiveDate >= ?
	   --or (IndEffectiveDate < ? and IndEndDate is null)
    --               or (IndEffectiveDate < ? and IndEndDate > ?))
	AND Comp.DisplayCode = 'MMM'
	AND pkg.SORId IN('P00138883738','P00138883737','P00346099200','P00138883739')
	--AND ind.CompanyMRefId = 1

;

SELECT TOP 100 *
FROM dbo.MemberIndicator
WHERE 1 = 1
    AND IndMRefId =24
	AND MemberRecId = 590887
;
