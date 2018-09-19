USE EnterpriseHub;

--- SCRIPT TO GENERATE THE DROP SCRIPT OF ALL FOREIGN KEY CONSTRAINTS
DECLARE @ForeignKeyName VARCHAR(4000);
DECLARE @ParentTableName VARCHAR(4000);
DECLARE @ParentTableSchema VARCHAR(4000);
DECLARE @TSQLDropFK VARCHAR(MAX);
DECLARE CursorFK CURSOR
FOR SELECT fk.name ForeignKeyName,
           SCHEMA_NAME(t.schema_id) ParentTableSchema,
           t.name ParentTableName
    FROM sys.foreign_keys fk
         INNER JOIN sys.tables t ON fk.parent_object_id = t.object_id;
OPEN CursorFK;
FETCH NEXT FROM CursorFK INTO @ForeignKeyName, @ParentTableSchema, @ParentTableName;
WHILE(@@FETCH_STATUS = 0)
    BEGIN
        SET @TSQLDropFK = 'ALTER TABLE '+QUOTENAME(@ParentTableSchema)+'.'+QUOTENAME(@ParentTableName)+' DROP CONSTRAINT '+QUOTENAME(@ForeignKeyName)+CHAR(13)+'';
        PRINT @TSQLDropFK;
        FETCH NEXT FROM CursorFK INTO @ForeignKeyName, @ParentTableSchema, @ParentTableName;
    END;
CLOSE CursorFK;
DEALLOCATE CursorFK;


