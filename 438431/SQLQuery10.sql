SELECT TOP 10 *
FROM XRef.EnrollmentStatus xStat
;

SELECT *
FROM MRef.EnrollmentStatus stat
WHERE stat.StatusMRefId = 24
;




SELECT Memb.MemberRecId
      ,Memb.FirstName
      ,Memb.MiddleName
      ,Memb.LastName
      ,Memb.BirthDate
      ,Memb.DeathDate
      ,Comp.DisplayCode 'CarrierCode'
      ,Comp.DisplayCode 'SponsorCode'
      ,Gen.Code         'Gender'
      ,xStat.ExternalValue 'Program'
	  ,Memb.StatusMRefId
  FROM
       dbo.MemberCompany Memb
       JOIN MRef.Company Comp
            ON Comp.CompanyMRefId = Memb.CompanyMRefId
       LEFT JOIN MRef.Gender Gen
            ON Gen.GenderMRefId = Memb.GenderMRefId
       LEFT JOIN XRef.EnrollmentStatus xStat
            ON xStat.StatusMRefId = Memb.StatusMRefId
           AND xStat.CompanyMRefId = Memb.CompanyMRefId
       LEFT JOIN MRef.EnrollmentStatus stat
            ON stat.StatusMRefId = Memb.StatusMRefId
		  And stat.Code = 'Program'
  WHERE 1 = 1
	AND xStat.ExternalValue  = 'M30'
	AND Memb.MemberRecId IN(

								SELECT DISTINCT M.MemberRecId
								FROM MemberCompany M
									INNER JOIN Xref.Member XM
									ON M.MemberRecId = XM.MemberRecId AND M.CompanyMRefId = XM.CompanyMRefId
									INNER JOIN mref.ExternalType ET
									ON XM.ExternalTypeMRefId = ET.ExternalTypeMRefId AND ET.Code = 'AVETA'--ET.Code = 'MP'--
								WHERE 1 = 1
									AND xm.ExternalValue IN('010356043',
								'010402852',
								'010615959',
								'010503986',
								'010106627',
								'010806939',
								'010807734',
								'010807431',
								'010807921',
								'010781520',
								'010807380',
								'010184732',
								'010807841',
								'010032499',
								'010788179',
								'010654797',
								'010298843',
								'010803047',
								'010545919',
								'010439408')
);

