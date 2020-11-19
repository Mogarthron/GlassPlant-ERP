

--create table Receptury(
--	id int primary key identity(1,1) not null,
--	nazwaReceptury nvarchar(25) not null,
--	dataWprowadzenia date not null,
--	Aktywna bit not null,
--	Opis nvarchar(250)
--);

--create table RecepturySklady(
--	id int primary key identity(1,1) not null,
--	id_Receptury int foreign key references Receptury(id) not null,
--	id_Towary int foreign key references Towary(id) not null,
--	ilosc decimal(9,4)
--);

--create table PrzygotowaneZestawy(
--	id int primary key identity(1,1) not null,
--	id_Receptury int foreign key references Receptury(id) not null,
--	dataPrzygotowania date not null,
--	ilosc tinyint not null
--);

--create table Tlenki(
--	id int primary key identity(1,1) not null,
--	nazwa nvarchar(50),
--	symbol nvarchar(10) not null,
--	masaMolowa decimal(6,3),
--	gestosc decimal(6,3),
--	grupaTlenkowa nvarchar(5)
--);

--create table KontrolaJakosciSurowcow(
--	id int primary key identity(1,1) not null,
--	PZP int foreign key references PrzyjecieZewnetrznePozycje(id) not null,
--	kontrolaZakladowa bit,
--	nrDokumentu nvarchar(50),
--	opis nvarchar(100)	
--);

--create table AnalizaTlenkowa(
--	id int primary key identity(1,1) not null,
--	id_KontrolaJakosciSurowcow int foreign key references KontrolaJakosciSurowcow(id) not null,
--	id_Tlenki int foreign key references Tlenki(id),
--	zawartoscProcentowa decimal(6,4)
--);

--create table AnalizaGranulometryczna(
--	id int primary key identity(1,1) not null,
--	id_KontrolaJakosciSurowcow int foreign key references KontrolaJakosciSurowcow(id) not null,
--	sito nvarchar(30),
--	wartoscProcentowa decimal(6,4)
--);

CREATE TABLE Wytop2017
(
    DataWpisu DATE UNIQUE NOT NULL,
    wytop SMALLINT DEFAULT 0
);

CREATE TABLE WydobycieZmianowe
(
    DataWpisu DATE UNIQUE NOT NULL,
    wg1 DECIMAL(5,1),
    wg2 DECIMAL(5,1),
    wg3 DECIMAL(5,1),
    we1 DECIMAL(5,1),
    we2 DECIMAL(5,1),
    we3 DECIMAL(5,1)
);

CREATE TABLE RaportTopiarza
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    dataGodzina DATETIME2 NOT NULL,
    zasypWE NVARCHAR(4),
    poziomWE NVARCHAR(4),
    moc NVARCHAR(4),
    baniakWE bit,
    zasypWG NVARCHAR(4),
    poziomWG NVARCHAR(4),
    gaz NVARCHAR(4),
    baniakWG bit
);

CREATE TABLE TypPrzestoju
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nazwa NVARCHAR(25) NOT NULL,
    opis NVARCHAR(50),
    stawka MONEY,
    bruttoNetto bit,
    dzienGodzina bit
);

CREATE TABLE PrzestojeProdukcji
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    id_TypPrzestoju INT FOREIGN KEY REFERENCES TypPrzestoju(id),
    przestojOd DATETIME2,
    przestojDo DATETIME2
);

CREATE TABLE WizualizacjaWE
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    dataGodzina DATETIME2 NOT NULL,
    t1A DECIMAL(4,1),
    t1V DECIMAL(4,1),
    t1kW DECIMAL(3,1),
    t2A DECIMAL(4,1),
    t2V DECIMAL(4,1),
    t2kW DECIMAL(3,1),
    t3A DECIMAL(4,1),
    t3V DECIMAL(4,1),
    t3kW DECIMAL(3,1),
    t4A DECIMAL(4,1),
    t4V DECIMAL(4,1),
    t4kW DECIMAL(3,1),
    t5A DECIMAL(4,1),
    t5V DECIMAL(4,1),
    t5kW DECIMAL(3,1),
    temperaturaNadSzklem DECIMAL(5,1),
    temperaturaWMasie DECIMAL(5,1),
    temperaturaWGazie DECIMAL(5,1)
);

CREATE TABLE WizualizacjaWG
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    dataGodzina DATETIME2 NOT NULL,
    tempWCzesciTopliwnej SMALLINT,
    tempWCzesciWyrobowej SMALLINT,
    tempLewaKomoraDol SMALLINT,
    tempLewaKomoraGora SMALLINT,
    tempPrawaKOmoraDol SMALLINT,
    tempPrawaKomoraGora SMALLINT,
    przeplywGazu TINYINT
);

--Nowy raport topiarza
--CREATE TABLE