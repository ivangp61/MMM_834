------------------------------------------------------------------------------- DIHMemberSync
/*
Set the StartDate in ExecutionLog
*/
-------------------------------------------------------------------------------
USE EnterpriseManagement
GO
------------------------------------------------------------------------------- List Last Exec Date
SELECT
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
-------------------------------------------------------------------------------Modify Last Exec Date
/**/
UPDATE dbo. JobConfiguration SET
   ConfigValue = '20180417'
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
WHERE   ExecutionLogId = 26130
;


----------------------------------------------------------------------------------- Update Last Run Date
-- DIHMemberSync
--UPDATE dbo.ExecutionLog
SET
   ProcessStart = '2016-04-04'
   ,ProcessEnd = '2016-04-04'
   ,ExecutionStatus = 'COMPLETE'
WHERE
   ExecutionLogId = 26130
;
GO



SELECT *
FROM
   dbo.JobDefinition              job
WHERE 1= 1
   AND job .JobId = 100122
;
