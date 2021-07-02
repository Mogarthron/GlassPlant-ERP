
IF NOT EXISTS
(    
    SELECT [name]
    FROM sys.tables
    WHERE [name] = 'HarmonogramPracyPracownika'
)  
create table HarmonogramPracyPracownika(
	id int primary key identity(1,1) not null,
    id_Pracownika int foreign key references Pracownicy(id) not null,
	dataHarmonogramu date not null,
	niedziele tinyint,
	OCP int foreign key references OrganizacjaCzasuPracy(id),
	poczatkowaZmiana tinyint,
	idywidualnyHarmonogram nvarchar(31), --rrrrrwwpppwrrrrrrww
    dniNadmiaroweZZeszlegoMiesiaca tinyint
);