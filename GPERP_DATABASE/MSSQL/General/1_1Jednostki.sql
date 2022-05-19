IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Jednostki'
)  
create table Jednostki
(
    id int primary key identity(1,1) not null,
    pelnaNazwa nvarchar(15) not null,
    skrot nvarchar(4) not null
);