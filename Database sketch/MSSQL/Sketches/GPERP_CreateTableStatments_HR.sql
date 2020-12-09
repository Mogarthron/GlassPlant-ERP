
--create table Brygada(
--	id int primary key identity(1,1) not null,
--	id_JednostkaOrganizacyjna int foreign key references JednostkaOrganizacyjna(id) not null,
--	nazwa nvarchar(50)
--);

-- CREATE TABLE BrygadaSklad
-- (
--     id int primary key identity(1,1) not null,
--     id_Brygada int foreign key references Brygada(id) not null,
--     id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id) NOT NULL
-- );

--create table TypyUmowy();

--create table Stonowisko();

--create table Etaty();

--create table PremiaUznaniowa();

-- CREATE TABLE DniWolneOdPracyTypy
-- (
--     --Dni wolne w grafiku
--     id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--     nawza NVARCHAR(50) NOT NULL,
--     skrot NVARCHAR(5),
--     opis NVARCHAR(150)
-- );

-- CREATE TABLE DniWolneWHarmonogramie
-- (
--     id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--     id_DniWolneOdPracy INT FOREIGN KEY REFERENCES DniWolneOdPracyTypy(id) NOT NULL,
--     id_Brygady INT FOREIGN KEY REFERENCES Brygada(id),
--     id_Pracownicy INT FOREIGN KEY REFERENCES Pracownicy(id),
--     data DATE NOT NULL
-- );

-- CREATE TABLE TypyNieobecnosci
-- (
--     --urlopy i zwonienia lekrskie
--     id int primary key identity(1,1) not null,
--     nazwa nvarchar(50) not null,
--     skrot nvarchar(5),
--     opis nvarchar(150),
--     anulujePremie bit,
--     wliczaSieDoLimituUrlopowego bit
-- );

-- create table NieobecnosciPracownikow
-- (
--     id int primary key identity(1,1) not null,
--     id_Pracownicy int foreign key references Pracownicy(id) not null,
--     id_TypNieobecnosci int foreign key references TypyNieobecnosci(id) not null,
--     nieobecnoscZaplanowano DATE,
--     nieobecnoscOd DATETIME2,
--     nieonecnosciDo DATETIME2,
--     czasNieprzeracowany smallint,
--     doODrobienia bit,
--     zatwierdzono bit
-- );

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
--	poczatkowaZmiana tinyint,
--  niestandardowyHarmonogram nvarchar(31)
--);

--create table HarmonogramPracyPracownika(
--	id int primary key identity(1,1) not null,
--  id_Pracownika int foreign key references Pracownicy(id) not null,
--	dataHarmonogramu date not null,
--	niedziele tinyint,
--	OCP int foreign key references OrganizacjaCzasuPracy(id),
--	poczatkowaZmiana tinyint,
--	idywidualnyHarmonogram nvarchar(31) --rrrrrwwpppwrrrrrrww

--);

--HarmonogramPracyUZ