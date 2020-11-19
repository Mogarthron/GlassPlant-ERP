
--create table Brygada(
--	id int primary key identity(1,1) not null,
--	id_JednostkaOrganizacyjna int foreign key references JednostkaOrganizacyjna(id) not null,
--	nazwa nvarchar(50)
--);

--create table TypyUmowy();

--create table Stonowisko();

--create table Etaty();

--create table PremiaUznaniowa();

-- create table TypyNieobecnosci(
-- 	id int primary key identity(1,1) not null,
-- 	nazwa nvarchar(50) not null,
-- 	skrot nvarchar(5),
-- 	wliczaSieDoPremi bit,
-- 	anulujePremie bit,
-- 	opis nvarchar(150)
-- );

--create table NieobecnosciPracownikow(
--	id int primary key identity(1,1) not null,
--	id_TypNieobecnosci int foreign key references TypyNieobecnosci(id) not null,
--	nieobecnoscOd DATETIME2,
--	nieonecnosciDo DATETIME2,
--	doODrobienia bit
--);

--create table NaleznyUrlop();

--create table OrganizacjaCzasuPracy(
--	id int primary key identity(1,1) not null,
--	przebiegZmian nvarchar(31),
--	opis nvarchar(50)
--);

--create table HarmonogramPracyBrygada(
--	id int primary key identity(1,1) not null,
--	dataHarmonogramu date not null,
--	id_Brygada int foreign key references Brygada(id) not null,
--	niedziele tinyint,
--	OCP int foreign key references OrganizacjaCzasuPracy(id),
--	poczatkowaZmiana tinyint
--);

--create table HarmonogramPracyPracownika(
--	id int primary key identity(1,1) not null,
--	dataHarmonogramu date not null,
--	niedziele tinyint,
--	OCP int foreign key references OrganizacjaCzasuPracy(id),
--	poczatkowaZmiana tinyint,
--	idywidualnyHarmonogram nvarchar(31) --rrrrrwwpppwrrrrrrww
--);

--HarmonogramPracyUZ