
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Brygada'
)   
CREATE TABLE Brygada
(
    id int primary key identity(1,1) not null,
    id_JednostkaOrganizacyjna int foreign key references JednostkaOrganizacyjna(id) not null,
    nazwa nvarchar(50)
);
GO