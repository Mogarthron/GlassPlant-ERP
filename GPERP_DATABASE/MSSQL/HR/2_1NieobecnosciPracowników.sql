

IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'NieobecnosciPracownikow'
) 
CREATE TABLE NieobecnosciPracownikow
(
    id int primary key identity(1,1) not null,
    id_Pracownicy int foreign key references Pracownicy(id) not null,
    id_TypNieobecnosci int foreign key references TypyNieobecnosci(id) not null,
    nieobecnoscZaplanowano DATE,
    nieobecnoscOd DATETIME2,
    nieonecnosciDo DATETIME2,
    czasNieprzeracowany smallint,
    doODrobienia bit,
    zatwierdzono bit
);