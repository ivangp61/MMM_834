BEGIN--=================MEMBERSYNC==============
USE EnterpriseManagement;

--UPDATE dbo. JobConfiguration SET
   ConfigValue = '20170306'
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
         AND job.JobName LIKE '%MMMHC_MEM_QNXT_EHub_ExtrEHubMember%')
;
END--=================MEMBERSYNC==============



BEGIN--=====================834===================

--MMMHC_MEM_QNXT_EHub_ExtrEHubMember
--MMMHC_MEM_QNXT_EHub_CreateFile

SELECT JD.*
FROM DBO.JobDefinition JD 
WHERE JD.JobName LIKE '%MMMHC_MEM_QNXT_EHub_ExtrQnxtMember%'
;


SELECT E.*
FROM DBO.ExecutionLog E
WHERE 1 = 1
	--AND E.ExecutionStatus = 'COMPLETE'
	AND E.JobId IN(100504)
;


--==========================================================================================
--This query identifies the latest execution log and it it used to get the execution log id
--to update the process start date.

SELECT E.JobId, E.ExecutionLogId,E.ProcessStart, MAX(E.ProcessStart)
FROM DBO.ExecutionLog E
WHERE 1 = 1
	AND E.ExecutionStatus = 'COMPLETE'
	AND E.JobId IN(100505,100506)
GROUP BY E.JobId,E.ExecutionLogId,E.ProcessStart
ORDER BY E.ProcessStart DESC
;
--==========================================================================================


USE EnterpriseManagement;

UPDATE DBO.ExecutionLog SET
   ProcessStart = '2017-10-03'
OUTPUT INSERTED.*
WHERE ExecutionLogId IN(6089203, 6089202)
;


END--=====================834===================


