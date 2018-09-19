Select *
From [dbo].[MemberAddress] MA
Where MA.MemberRecId = 187047
;

Select *
From [dbo].MemberCompany MA
Where MA.MemberRecId = 187047
;

Select *
From dbo.MemberCommunication MC
Where MC.MemberRecId = 187047
;


Select Top 50 MC.CompanyMRefId, MC.MemberRecId, MC.CommTypeMRefId, MC.JobLoadDate
From dbo.MemberCommunication MC
Where MC.MemberRecId IN(187047)--, 463431, 709733, 343675)
;

Select Top 100 MC.CompanyMRefId, C.DisplayCode, MC.MemberRecId, MC.CommTypeMRefId, CT.[Type], CT.SubType ,MC.JobLoadDate As commJobLoadDate
	, MCDTL.CommValue, MCDTL.JobLoadDate As detailJobLoadDate
From dbo.MemberCommunication MC
	Left Join MRef.Company C
	On MC.CompanyMRefId = C.CompanyMRefId
	Left Join Mref.CommunicationType CT
	On MC.CommTypeMRefId = CT.CommTypeMRefId
	Left Join dbo.MemberCommunicationDetail MCDTL
	On MC.CommDetailRecId = MCDTL.CommDetailRecId
Where 1 = 1
	And MC.MemberRecId IN(187047, 463431, 709733, 343675)
	And Convert(Varchar, MCDTL.JobLoadDate,112) = '20180417'
;

Select *
From Mref.CommunicationType
;

Select Top 100 *
From dbo.MemberCommunicationDetail dtl1
Where dtl1.CommDetailRecId = 20002
;

SELECT comm2.MemberRecId
      ,comm2.CommTypeMRefId
      ,comm2.CommDetailRecId
      ,dtl1.CommValue
FROM
    ( 
        SELECT comm.MemberRecId
            ,MAX( comm.CommDetailRecId )'CommDetailRecId'
        FROM
            dbo.MemberCommunication comm
            JOIN dbo.MemberCommunicationDetail dtl
                    ON dtl.CommDetailRecId = comm.CommDetailRecId
        WHERE 1 = 1
            AND comm.CommTypeMRefId = 7
        GROUP BY comm.MemberRecId 
	) comm1
    JOIN dbo.MemberCommunication comm2
        ON comm2.MemberRecId = comm1.MemberRecId
        AND comm2.CommDetailRecId = comm1.CommDetailRecId
    JOIN dbo.MemberCommunicationDetail dtl1
        ON dtl1.CommDetailRecId = comm1.CommDetailRecId
WHERE 1 = 1
	AND comm2.CommTypeMRefId = 7
	And comm2.MemberRecId = 463431
;

SELECT
CompanyMRefId
,ScndryExternalValue as PHONE_TYPE
,CommTypeMRefId
FROM ENTERPRISEHUB.[XRef].[CommunicationType] 
Where ExternalTypeMRefId = 1
and PrmryExternalValue = 'PHONE'