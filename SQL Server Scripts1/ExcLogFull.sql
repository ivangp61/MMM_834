------------------------------------------------------------------------------- DIHMemberSync
/*
Set the StartDate in ExecutionLog
*/
-------------------------------------------------------------------------------
USE EnterpriseManagement
GO
------------------------------------------------------------------------------- List Last Exec Date
SELECT
job.JobId,
   conf.JobConfigId
   ,conf .ConfigName
   ,conf .ConfigValue
   ,stg .JobName         AS StageName
   ,job .JobName
FROM
   dbo.JobDefinition              job        (NOLOCK )
   LEFT JOIN dbo. JobDefinition          stg        (NOLOCK )
      ON stg. ParentJobId = job .JobId
   LEFT JOIN dbo. JobConfiguration    conf   ( NOLOCK)
      ON conf. JobId = stg .JobId
WHERE 1= 1
   AND job .JobName = 'DIHMemberSync'
   AND stg .JobName LIKE 'Extr%'
   AND SUBSTRING(conf .ConfigName, 1,4 ) IN( 'MMML', 'PMCL')
;
GO

SELECT *
FROM dbo.JobConfiguration JC
WHERE JC.JobId = 100505
;

SELECT job.*
FROM dbo.JobDefinition job(NOLOCK)
WHERE 1= 1
   AND job.JobName = 'MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM'
;
GO


-------------------------------------------------------------------------------Modify Last Exec Date
/**/
UPDATE dbo. JobConfiguration SET
   ConfigValue = '20170726'
OUTPUT INSERTED.*
WHERE
   JobConfigId IN(
      SELECT
         conf .JobConfigId
      FROM
         dbo .JobDefinition              job        (NOLOCK )
         LEFT JOIN dbo.JobDefinition          stg        (NOLOCK )
            ON stg. ParentJobId = job .JobId
         LEFT JOIN dbo.JobConfiguration    conf    (NOLOCK )
            ON conf. JobId = stg .JobId
      WHERE 1= 1
         AND job. JobName = 'DIHMemberSync'
         AND stg. JobName LIKE 'Extr%'
         AND SUBSTRING (conf. ConfigName,1 ,4) IN('MMML' , 'PMCL' ))
;
GO
-------------------------------------------------------------------------------

SELECT *
FROM dbo. ExecutionLog
WHERE JobId = 100503--26130---
	AND ExecutionStatus = 'COMPLETE'
ORDER BY ProcessStart DESC
;

SELECT *
FROM dbo.JobDefinition JD
WHERE JD.JobName LIKE '%SYNCV%'
;

----------------------------------------------------------------------------------- Update Last Run Date
-- DIHMemberSync
--UPDATE dbo.ExecutionLog
SET
   ProcessStart = '2016-11-21'
   ,ProcessEnd = '2016-11-21'
   ,ExecutionStatus = 'COMPLETE'
WHERE
   ExecutionLogId = 6062414
;
GO

--100507: 'MMMHC_MEM_QNXT_EHub_CreateFile.MMM'

SELECT *
FROM
   dbo.JobDefinition              job
WHERE 1= 1
   --AND job .JobId = 100122
   AND JOB.JobName = 'MMMHC_MEM_QNXT_EHub_CreateFile.MMM'--'MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM'--
;
--MMMHC_MEM_QNXT_EHub_CreateFile.MMM
--MMMHC_MEM_QNXT_EHub_ExtrEHubMember.MMM

SELECT *
FROM DBO.ExecutionLog EL
WHERE EL.JobId = 100505
	AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2016-11-01')

SELECT *
FROM DBO.ExecutionAuditHdr H
WHERE H.ExecutionLogID IN (
			SELECT DISTINCT EL.ExecutionLogID
			FROM DBO.ExecutionLog EL
			WHERE EL.JobId = 100505
				AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2016-11-01')
	  )
;

SELECT *
FROM DBO.ExecutionDetail H
WHERE H.ExecutionLogID IN (
			SELECT DISTINCT EL.ExecutionLogID
			FROM DBO.ExecutionLog EL
			WHERE EL.JobId = 100507
				AND CONVERT(DATE, EL.ProcessStart) >= CONVERT(DATE, '2016-11-01')
	  )
;




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



