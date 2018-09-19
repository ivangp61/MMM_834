USE EnterpriseManagement;

	DELETE
	FROM DBO.ExecutionAuditHdr
	WHERE ExecutionLogID IN (
				SELECT DISTINCT EL.ExecutionLogID
				FROM DBO.ExecutionLog EL
				WHERE EL.JobId = 100507
					AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
		  )
	;

	DELETE
	FROM DBO.ExecutionDetail
	WHERE ExecutionLogID IN (
				SELECT DISTINCT EL.ExecutionLogID
				FROM DBO.ExecutionLog EL
				WHERE EL.JobId = 100507
					AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
		  )
	;


	DELETE
	FROM DBO.ExecutionLog
	WHERE JobId = 100507
		AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, '2017-03-06')
	;



	--MMMHC_MEM_QNXT_EHub_CreateFile.MMM

	--100505: 'MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM'

	DELETE
	FROM DBO.ExecutionAuditHdr
	WHERE ExecutionLogID IN (
				SELECT DISTINCT EL.ExecutionLogID
				FROM DBO.ExecutionLog EL
				WHERE EL.JobId = 100505
					AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
		  )
	;

	DELETE
	FROM DBO.ExecutionDetail
	WHERE ExecutionLogID IN (
				SELECT DISTINCT EL.ExecutionLogID
				FROM DBO.ExecutionLog EL
				WHERE EL.JobId = 100505
					AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2017-03-06')
		  )
	;


	DELETE
	FROM DBO.ExecutionLog
	WHERE JobId = 100505
		AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, '2017-03-06')
	;

SELECT DISTINCT ExecutionStatus
FROM dbo.ExecutionLog
;

--UPDATE dbo.ExecutionLog
SET ExecutionStatus = 'COMPLETE'
WHERE
   ExecutionStatus = 'EXECUTING'
;

