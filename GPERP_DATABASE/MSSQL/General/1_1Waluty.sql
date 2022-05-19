IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Waulty'
)  
CREATE TABLE Waluty
(
    id int primary key identity(1,1) not null,
    nazwaWaluty nvarchar(30),
    symbol nvarchar(4)
);
