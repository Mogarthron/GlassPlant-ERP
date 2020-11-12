

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
