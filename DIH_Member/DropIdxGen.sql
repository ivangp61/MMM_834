USE EnterpriseHub;
GO
DECLARE @SchemaName VARCHAR(256);
DECLARE @TableName VARCHAR(256);
DECLARE @IndexName VARCHAR(256);
DECLARE @TSQLDropIndex VARCHAR(MAX);
DECLARE CursorIndexes CURSOR
FOR SELECT SCHEMA_NAME(t.schema_id), 
           t.name,
           i.name
    FROM sys.indexes i
         INNER JOIN sys.tables t ON t.object_id = i.object_id
         INNER JOIN sys.filegroups ds ON i.data_space_id = ds.data_space_id
	    join sys.schemas s on s.schema_id = t.schema_id
    WHERE i.type > 0
          AND t.is_ms_shipped = 0
          AND t.name <> 'sysdiagrams'
          AND is_primary_key = 0
               and is_unique = 0
			and s.name = 'dbo'
			and t.name like 'member%'			
          AND ds.name in ('EnterpriseIndexes', 'member');
OPEN CursorIndexes;
FETCH NEXT FROM CursorIndexes INTO @SchemaName, @TableName, @IndexName;
WHILE @@fetch_status = 0
    BEGIN
        SET @TSQLDropIndex = 'DROP INDEX '+QUOTENAME(@SchemaName)+'.'+QUOTENAME(@TableName)+'.'+QUOTENAME(@IndexName);
        PRINT @TSQLDropIndex;
        FETCH NEXT FROM CursorIndexes INTO @SchemaName, @TableName, @IndexName;
    END;
CLOSE CursorIndexes;
DEALLOCATE CursorIndexes; 

-- dbo.ClaimServiceLineHospital
-- ClaimProviders
-- dbo.claim