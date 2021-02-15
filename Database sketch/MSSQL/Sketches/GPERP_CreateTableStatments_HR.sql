
--create table Brygada(
--	id int primary key identity(1,1) not null,
--	id_JednostkaOrganizacyjna int foreign key references JednostkaOrganizacyjna(id) not null,
--	nazwa nvarchar(50)
--);

-- CREATE TABLE BrygadaSklad
-- (
--     id int primary key identity(1,1) not null,
--     id_Brygada int foreign key references Brygada(id) not null,
--     id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id) NOT NULL,
--     naBrygadzieOd Date not null,
--     naBrygadzieDo Date
-- );

create table Stanowisko
(
    id INT PRIMARY KEY IDENTITY(1,1),
    nazwaStanowiska NVARCHAR(150),
    typStanowiska NVARCHAR(100),
    uszeregowanieStanowiska NVARCHAR(100)
);

CREATE TABLE RodzajUmowy
(
    id INT PRIMARY KEY IDENTITY(1,1),
    nazwa NVARCHAR(50),
    skrot NVARCHAR(10)

);

create table Etaty
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Stanowisko INT FOREIGN KEY REFERENCES Stanowisko(id),
    id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id),
    dataObjeciaEtatu date,
    id_RodzajUmowy INT FOREIGN KEY REFERENCES RodzajUmowy(id),
    aktualne bit
);

CREATE TABLE EtatyStawki
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Etaty INT FOREIGN KEY REFERENCES Etaty(id),
    stawka DECIMAL(7,2),
    godzinowa bit,
    dataAktualizacji date,
    aktualna bit
);

create table PremiaUznaniowa
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id),
    rok SMALLINT,
    miesiac TINYINT,
    opis NVARCHAR(150),
    kwota SMALLINT
);

CREATE TABLE CzasPracyWMiesiacu
(
    data DATE UNIQUE,
    czasPracyjacy TINYINT
);

CREATE TABLE DniWolneOdPracyISwieta
(
    data DATE UNIQUE,
    opis NVARCHAR(100)
);

CREATE TABLE DniWolneWynikajaceZHarmonogramu
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id),
    id_Brygada int foreign key references Brygada(id),
    id_TypyNieobecnosci int foreign key references TypyNieobecnosci(id),
    data DATE
);


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
--  niestandardowyHarmonogram nvarchar(31),
--  dniNadmiaroweZZeszlegoMiesiaca tinyint

--);

--create table HarmonogramPracyPracownika(
--	id int primary key identity(1,1) not null,
--  id_Pracownika int foreign key references Pracownicy(id) not null,
--	dataHarmonogramu date not null,
--	niedziele tinyint,
--	OCP int foreign key references OrganizacjaCzasuPracy(id),
--	poczatkowaZmiana tinyint,
--	idywidualnyHarmonogram nvarchar(31), --rrrrrwwpppwrrrrrrww
--  dniNadmiaroweZZeszlegoMiesiaca tinyint
--);

-- Create a new table called 'PracownicyOutsourcing' in schema 'GPERP'
-- Drop the table if it already exists
IF OBJECT_ID('GPERP.PracownicyOutsourcing', 'U') IS NOT NULL
DROP TABLE GPERP.PracownicyOutsourcing
GO
-- Create the table in the specified schema
CREATE TABLE GPERP.PracownicyOutsourcing
(
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

    nazwisko NVARCHAR(50) NOT NULL,
    pierwszeImie NVARCHAR(50) NOT NULL,
    premiaRegulaminowa BIT,
    premiaUznaniowa BIT
    -- specify more columns here

);
GO

-- Create a new table called 'PracownicyOutsourcinEtaty' in schema 'GPERP'
-- Drop the table if it already exists
IF OBJECT_ID('GPERP.PracownicyOutsourcinEtaty', 'U') IS NOT NULL
DROP TABLE GPERP.PracownicyOutsourcinEtaty
GO
-- Create the table in the specified schema
CREATE TABLE GPERP.PracownicyOutsourcinEtaty
(
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

    dataZatrudnienia DATE NOT NULL,
    dataZakonczeniaUmowy DATE,
    stanowisko NVARCHAR(50),
    stawkaBrutto DECIMAL(7,2),
    godzinowa BIT

    -- specify more columns here
);
GO

--HarmonogramPracyUZ