--Update EnterpriseManagement.dbo.ExecutionLog
Set ProcessStart = '2018-07-11 00:00:00'
Where ExecutionLogId in (

							Select MaxLog.ExecutionLogId
							From (
									Select Top 10 JD.JobId, JD.JobName, Max(EL.ExecutionLogId) as ExecutionLogId, Max(EL.ProcessStart) as ProcessStart
									From EnterpriseManagement.dbo.JobDefinition JD
										Inner Join EnterpriseManagement.dbo.ExecutionLog EL
										On JD.JobId = EL.JobId
									Where 1 = 1
										and JD.JobName in( 'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.PMC','MMMHC_MEM_QNXT_EHub_CreateFile.MMM','MMMHC_MEM_QNXT_EHub_CreateFile.PMC','MMM_Membership_QNXT_EHub_834_Process')
										and ExecutionStatus = 'COMPLETE'
									Group By JD.JobId, JD.JobName
								 ) MaxLog
						)
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


Select *
From dbo. MemberCompany
Where JobLoadDate = '2018-07-12'
;


Select Top 10 JD.JobId, JD.JobName, EL.*
From EnterpriseManagement.dbo.JobDefinition JD
	Inner Join EnterpriseManagement.dbo.ExecutionLog EL
	On JD.JobId = EL.JobId
Where 1 = 1
	and JD.JobName in( 'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.PMC','MMMHC_MEM_QNXT_EHub_CreateFile.MMM','MMMHC_MEM_QNXT_EHub_CreateFile.PMC','MMM_Membership_QNXT_EHub_834_Process')
	and ExecutionStatus = 'COMPLETE'
Group By JD.JobId, JD.JobName
;
