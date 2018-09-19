Select Top 10 *
From EnterpriseManagement.dbo.JobDefinition JD
Where 1 = 1
	and JD.JobName = 'MMM_Membership_QNXT_EHub_834_Process'
	--Like '%AP_DIHINTER_QNXTMEMBRSYNCv2%'
;


-- AP_DIHINTER_QNXTMEMBRSYNCv2: No U
-- MMMHC_MEM_QNXT_EHub_ExtrQnxtMember:
-- MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM:
-- MMMHC_MEM_QNXT_EHub_ExtrEHubMember.PMC:
-- MMMHC_MEM_QNXT_EHub_CreateFile.MMM:
-- MMMHC_MEM_QNXT_EHub_CreateFile.PMC:
-- MMM_Membership_QNXT_EHub_834_Process:

Select Top 10 JD.JobId, JD.JobName, Max(EL.ExecutionLogId), Max(EL.ProcessStart)
From EnterpriseManagement.dbo.JobDefinition JD
	Inner Join EnterpriseManagement.dbo.ExecutionLog EL
	On JD.JobId = EL.JobId
Where 1 = 1
	and JD.JobName in( 'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM','MMMHC_MEM_QNXT_EHub_ExtrEHubMember.PMC','MMMHC_MEM_QNXT_EHub_CreateFile.MMM','MMMHC_MEM_QNXT_EHub_CreateFile.PMC','MMM_Membership_QNXT_EHub_834_Process')
	and ExecutionStatus = 'COMPLETE'
Group By JD.JobId, JD.JobName
;

Select MaxLog.*
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
;

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


Select Top 10 JD.JobId, JD.JobName, Max(EL.ProcessStart)
From EnterpriseManagement.dbo.JobDefinition JD
	Inner Join EnterpriseManagement.dbo.ExecutionLog EL
	On JD.JobId = EL.JobId
Where 1 = 1
	and JD.JobName = 'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember'
	and ExecutionStatus = 'COMPLETE'
Group By JD.JobId, JD.JobName
;


Select Top 10 EL.*
From EnterpriseManagement.dbo.ExecutionLog EL
Where 1 = 1
	and EL.JobId = 100504
	and ExecutionStatus = 'COMPLETE'
Order By EL.ProcessStart Desc
;
