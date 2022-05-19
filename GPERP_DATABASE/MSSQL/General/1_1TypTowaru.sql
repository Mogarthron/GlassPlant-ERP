IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'TypTowaru'
)  

create table TypTowaru
(
    id int primary key identity(1,1) not null,
    nazwa nvarchar(25) not null,
    opis nvarchar(250)
);
