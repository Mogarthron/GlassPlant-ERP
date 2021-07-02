
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'HarmonogramPracyBrygada'
)  
create table HarmonogramPracyBrygada(
	id int primary key identity(1,1) not null,
	dataHarmonogramu date not null,
	id_Brygada int foreign key references Brygada(id) not null,
	niedziele tinyint,
	OCP int foreign key references OrganizacjaCzasuPracy(id),
	poczatkowaZmiana tinyint,
 niestandardowyHarmonogram nvarchar(31),
 dniNadmiaroweZZeszlegoMiesiaca tinyint

);