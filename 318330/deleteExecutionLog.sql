--'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember'
--'MMMHC_MEM_QNXT_EHub_CreateFile.MMM'
--'MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM'

USE EnterpriseManagement;
DECLARE @excDate DATE = '2018-01-01';
DECLARE @excLogid INT;
DECLARE @jobId INT;

SET @jobId = (SELECT JD.JobId	FROM DBO.JobDefinition JD WHERE JD.JobName = 'MMMHC_MEM_QNXT_EHub_ExtrQnxtMember');
--(SELECT JD.*	FROM DBO.JobDefinition JD WHERE JD.JobName like '%MMMHC_MEM_QNXT_EHub_CreateFile%');
SET @excLogid = (SELECT TOP 1 EL.ExecutionLogId FROM DBO.ExecutionLog EL	WHERE JobId = @jobId AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, @excDate));


PRINT CONVERT(VARCHAR,@jobId);
PRINT CONVERT(VARCHAR,@excDate,112);
PRINT CONVERT(VARCHAR,@excLogid);

DELETE
FROM DBO.ExecutionAuditHdr
WHERE ExecutionLogID IN (SELECT EL.ExecutionLogId FROM DBO.ExecutionLog EL	WHERE JobId = @jobId AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, @excDate));

DELETE
FROM DBO.ExecutionDetail
WHERE ExecutionLogID IN (SELECT EL.ExecutionLogId FROM DBO.ExecutionLog EL	WHERE JobId = @jobId AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, @excDate));


DELETE
FROM DBO.ExecutionLog
WHERE ExecutionLogID IN (SELECT EL.ExecutionLogId FROM DBO.ExecutionLog EL	WHERE JobId = @jobId AND CONVERT(DATE, ProcessStart) >= CONVERT(DATE, @excDate));

