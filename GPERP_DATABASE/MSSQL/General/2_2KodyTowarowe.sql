
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'KodyTowarowe'
)  

create table KodyTowarowe
(
    id int primary key identity(1,1) not null,
    id_Towary int foreign key references Towary(id) not null,
    --kod towaru istniej�cy i dzia�aj�cy w zak�azie
    KodZakladowy nvarchar(100),
    --xxxx-xxx
    SystematycznyWykazWyrobow nvarchar(8),   
    KodTowarowoMaterialowy nvarchar(25),  
    PolskaKwalifikacjaWyrobowIUslug nvarchar(10)
);