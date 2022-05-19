
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Towary'
)  

create table Towary
(
    id int primary key identity(1,1) not null,
    nazwa nvarchar(100) not null,
    id_Jednostka int foreign key references Jednostki(id),
    id_TypTowaru int foreign key references TypTowaru(id),
    nazwaUKlienta nvarchar(100)
);