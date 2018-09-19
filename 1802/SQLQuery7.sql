SELECT TOP 11 * 
FROM dbo.stg_exceptions 
WHERE 1 = 1 
--        --AND DOMAIN = 'MEMBER' 
--        AND ProcessName = 'Extract' 
       and (Keyname LIKE '%N00319874503%')
	   or (KeyValue LIKE '%N00319874503%' )
;

