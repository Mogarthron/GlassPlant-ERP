
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Kontrachent'
) 

create table Kontrachent
(
    id int primary key identity(1,1) not null,
    id_TypKontrachenta int foreign key references TypKontrachenta(id),
    nazwaPelna nvarchar(250),
    nazwaKrotka nvarchar(30) not null,
    akronim nvarchar(6),
    aktywny bit,
    nip nvarchar(15),
    bdo nvarchar(20)
);