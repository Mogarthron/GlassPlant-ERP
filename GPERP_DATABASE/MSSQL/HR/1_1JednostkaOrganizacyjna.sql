

IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'JednostkaOrganizacyjna'
)  
CREATE TABLE JednostkaOrganizacyjna
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nazwa NVARCHAR(100),
    opis NVARCHAR(100)
);