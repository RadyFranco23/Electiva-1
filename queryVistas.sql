DECLARE @GeneralVista NVARCHAR(255);
DECLARE @ConsultaVistas NVARCHAR(MAX);

DECLARE Vista_Cursor CURSOR FOR
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'dbo'; 

OPEN Vista_Cursor;

FETCH NEXT FROM Vista_Cursor INTO @GeneralVista;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @ConsultaVistas = 'SELECT * FROM [' + @GeneralVista + '];';
    
    PRINT 'Resultados de la vista: ' + @GeneralVista;
    EXEC sp_executesql @ConsultaVistas; 
    
    FETCH NEXT FROM Vista_Cursor INTO @GeneralVista;
END;

CLOSE Vista_Cursor;
DEALLOCATE Vista_Cursor;

