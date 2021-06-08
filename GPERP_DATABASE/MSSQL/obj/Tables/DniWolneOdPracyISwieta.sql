
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'DniWolneOdPracyISwieta'
)  
CREATE TABLE DniWolneOdPracyISwieta
(
    data DATE UNIQUE,
    opis NVARCHAR(100)
);
GO