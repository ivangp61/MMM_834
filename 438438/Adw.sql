SELECT B.MEMBER_ID
FROM dbo.STG_NAME B
WHERE 1=1
 and B.MEMBER_ID IS NOT NULL 
And B.member_id In('030242331','030226697','030228227','030235565','030226697','010012458','010050535','010808723','030236637','010000610','010001325')
;


SELECT A.NAME_ID MP_mNameID,
       CAST(A.SOURCE_SYSTEM AS VARCHAR(3)) SOURCE_SYSTEM,
       A.Member_ID MP_mAvetaNumber,
       CAST(REPLACE(B.SOC_SEC, '-', '') AS VARCHAR(9)) MP_mSSN,
       A.[plan] MP_mBenefitPkgID,
       B.Program_ID MP_mStatus,
       CONVERT(varchar(10),A.Enroll_Date,102) as MP_mEnrollDate,
       CONVERT(varchar(10),A.Disenroll_Date,102) as MP_mDisenrollDate,
       CONVERT(varchar(10),A.DEATH_DATE,102) as MP_mDiceaseDate,
	  A.MEMBER_ID
FROM dbo.STG_HCFA_NAME_ORG A
     INNER JOIN dbo.STG_NAME B ON A.MEMBER_ID = B.MEMBER_ID
                                               AND A.SOURCE_SYSTEM = B.SOURCE_SYSTEM
WHERE 1=1
 and A.MEMBER_ID IS NOT NULL 
 --and (B.Program_ID LIKE 'M%'
 --     OR B.Program_ID = 'XXX'
 --     OR B.Program_ID = 'XXD')
And A.member_id In('030242331','030226697','030228227','030235565','030226697','010012458','010050535','010808723','030236637','010000610','010001325')


--==============================HCFA_DATE--MemberIndicator==================
Select *
From STG_HCFA_DATE H
Where 1 = 1
	and H.MEMBER_ID In('030220484')--,'030047445','030245070')
	and H.INDICATOR = 'plan'
Order By H.MEMBER_ID, H.[START_DATE] Desc
;

SELECT a.DATE_ID,
       a.NAME_ID,
       a.INDICATOR,
       a.PREFERRED,
       a.UPDATE_STAFF,
       a.CREATE_STAFF,
       a.VALUE,
       a.SOURCE_SYSTEM,
       a.START_DATE,
       a.END_DATE,
       a.UPDATE_DATE,
       a.CREATE_DATE,
       o.MEMBER_ID
FROM dbo.STG_HCFA_DATE a
     JOIN dbo.STG_HCFA_NAME_ORG o ON o.MEMBER_ID = a.MEMBER_ID
                                     AND o.SOURCE_SYSTEM = a.SOURCE_SYSTEM
     JOIN dbo.STG_NAME B ON B.MEMBER_ID = o.MEMBER_ID
                            AND B.SOURCE_SYSTEM = o.SOURCE_SYSTEM
WHERE 1 = 1
      AND (B.Program_ID LIKE 'M%'
           OR B.Program_ID = 'XXX'
           OR B.Program_ID = 'XXD')
		AND o.MEMBER_ID = '030245070'
		and a.VALUE = 'P00138497118'
		--and DATE_ID = 'D00141165483'
;


select Top 100 c.DisplayCode, c.CompanyMRefId, b.ExternalValue
from EnterpriseHub.Mref.Company c 
join EnterpriseHub.XRef.BenefitPackage b on b.CompanyMRefId = c.CompanyMRefId
where 1=1
 and b.ExternalTypeMRefId = 1
 and c.DisplayCode = 'PMC'
 AND b.ExternalValue = 'P00138497118'
order by b.ExternalValue
;

SELECT
IndMRefId
,Code
FROM
ENTERPRISEHUB.[MRef].[CMSCoverageIndicator]
Where Code = 'plan'

SELECT
CompanyMRefId
,ExternalValue
,MemberRecId
FROM ENTERPRISEHUB.[XRef].[Member]
Where ExternalTypeMRefId = 5
	and MemberRecId = 258285


Select *
From STG_PACKAGE_LIBRARY PL
Where PL.PACKAGE_ID = 'P00138497118'
;



Select Top 20 *
From STG_ADW_MemberIndicator MI
Where 1 = 1
	and MI.MemberRecId = 258285
	and MI.IndMRefId = 24
Order By MI.MemberRecId, MI.IndEffectiveDate Desc
;
--==============================HCFA_DATE--MemberIndicator==================


--==============================NAME_PROVIDER--MemberPcp==================
Select *
From STG_NAME N
Where N.MEMBER_ID = '030129390'
;


Select *
From STG_NAME N
Where N.NAME_ID = 'N00064266009'
;

Select *
From STG_ADW_MemberPCP P
Where P.MemberRecId = 380044

--==============================NAME_PROVIDER--MemberPcp==================