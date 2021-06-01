
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Stanowisko'
)  
CREATE TABLE Stanowisko
(
    id INT PRIMARY KEY IDENTITY(1,1),
    nazwaStanowiska NVARCHAR(150),
    typStanowiska NVARCHAR(100),
    uszeregowanieStanowiska NVARCHAR(100)

);
GO