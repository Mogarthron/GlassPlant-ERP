
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'TypKontrachenta'
)  

create table TypKontrachenta
(
    id int primary key identity(1,1) not null,
    nazwa nvarchar(50),
    opis nvarchar(300)
);