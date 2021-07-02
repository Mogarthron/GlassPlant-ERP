

IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'RodzajUmowy'
) 
CREATE TABLE RodzajUmowy
(
    id INT PRIMARY KEY IDENTITY(1,1),
    nazwa NVARCHAR(50),
    skrot NVARCHAR(10)

);