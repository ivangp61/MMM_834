BEGIN--=================MEMBERSYNC==============
USE EnterpriseManagement;

UPDATE dbo. JobConfiguration SET
   ConfigValue = '20180501'
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
END--=================MEMBERSYNC==============


