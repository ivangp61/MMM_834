Select MC.MemberRecId
From dbo. MemberCompany MC
Where MC.MemberRecId in(
							Select MemberRecId
							From XRef.Member XM
							Where 1 = 1
								and XM.ExternalTypeMRefId = 5
								and XM.ExternalValue in('010008528', '010374576')
						)
;

Select *
From dbo. MemberCompany MC
Where MC.MemberRecId in(
							Select MemberRecId
							From XRef.Member XM
							Where 1 = 1
								and XM.ExternalTypeMRefId = 5
								and XM.ExternalValue in('010008528', '010374576')
						)
;

Select *
From XRef.Member XM
Where 1 = 1
	and XM.ExternalTypeMRefId = 5
	and XM.ExternalValue in('010008528', '010374576')
;




--UPDATE dbo. MemberCompany
SET JobLoadDate = '2018-07-12'
--OUTPUT INSERTED.*
WHERE MemberRecId IN(
						Select Distinct MC.MemberRecId
						From dbo. MemberCompany MC
						Where MC.MemberRecId in(
													Select MemberRecId
													From XRef.Member XM
													Where 1 = 1
														and XM.ExternalTypeMRefId = 5
														and XM.ExternalValue in('010008528', '010374576')
												)
					)
;
