
create table DaneFormy
(
	id int primary key identity(1,1) not null,
	id_Towary int foreign key references Towary(id) not null,
	wycenaPzygotowaniaFormy money,
	kosztyMagazynowania money,
	zaOkres nvarchar(10),
	kosztyDodatkowe money,
	id_Waluta int foreign key references Waluty(id),
	rysunekFormy nvarchar(50),
	dataAktyalizacji datetime2 default GetDate()
);

create table Asortyment
(
	id int primary key identity(1,1) not null,
	id_Towary int foreign key references Towary(id) not null,
	id_DaneFormy int foreign key references DaneFormy(id) not null,
	grupaAsortymentu nvarchar(2) not null,
	numerAsortymentu nvarchar(10) not null,
	wykonanie nvarchar(10) not null,
	duplexTriplex bit,
	dekor nvarchar(10),
	obrobka nvarchar(10),
	pakowanie nvarchar(10),
	rysunek nvarchar(50),
	uwagi nvarchar(200),
	dataAktualizacji datetime2 default GetDate()
);

create table DziennyPlanProdukcji
(
	dataPlanu date unique not null,
	osobaOdpowiedzialna int foreign key references Pracownicy(id) not null,
	zatwierdzeniePlanu nvarchar(50),
	-- np mail z 29.10.2020
	uwagiDoPalnu nvarchar(200)
);

create table PlanProdukcjiPozycje
(
	id int primary key identity(1,1) not null,
	id_ZamowienieSprzedarzyPozycje int foreign key references ZamowienieSprzedarzyPozycje(id) not null,
	DDP int foreign key references DziennyPlanProdukcji(id) not null,
	zmianaProdukcyjna nvarchar(30) not null,
	wanna nvarchar(50),
	akortd bit,
	wzory bit,
	sztukDoWykonania smallint,
	uwagi nvarchar(200),
	datawprowadzenia datetime2 default GetDate(),
	czyPozycjaWeszlaDoPalnu bit default 1
);

--PRODUKCJA
create table ZmianaProdukcyjna
(
	id int primary key identity(1,1) not null,
	dataZmiany date not null,
	kierownikZmiany int foreign key references Pracownicy(id),
	symbolZmiany nvarchar(30) not null,
	uwagiDoPracyHutnikow nvarchar(300),
	uwagiPozostale nvarchar(300)
);

create table ZespolFormujacy
(
	id int primary key identity(1,1) not null,
	ZP int foreign key references ZmianaProdukcyjna(id),
	PPP int foreign key references PlanProdukcjiPozycje(id) not null,
	SymbolWarszatuRoboczego nvarchar(10),
	-- np. WG_1, WG_6, WW_1
	wprowadzeniePozycji datetime2 default GetDate(),
	--może posłużyc do utworzenia nr karty formowania
	poczatekProdukcji datetime2,
	koniecProdukcji datetime2,
	przestojTechniczny smallint
	-- minuty	
);

create table SkladZespoluFormujacego
(
	id int primary key identity(1,1) not null,
	id_ZespolFormujacy int foreign key references ZespolFormujacy(id) not null,
	id_Pracownik int foreign key references Pracownicy(id) not null,
	funkcjaWZespole nvarchar(30) not null,
	udzialProcentowy decimal(4,2),
	wyrownanieDniowki bit default 0,
	kwota money default 0,
	zmianaDodatkowa bit default 0,
	kowotaProcent bit default 0,
	dodatek decimal(5,2),
	czasPrzestoju smallint,
	-- minuty
);

create table PraceZastepcze
(
	id int primary key identity(1,1) not null,
	ZP int foreign key references ZmianaProdukcyjna(id),
	id_Pracownik int foreign key references Pracownicy(id) not null,
	czasPracy smallint,
	-- minuty
	opisPracy nvarchar(200)
);

create table KontrolaPrzywarsztatowa
(
	id int primary key identity(1,1) not null,
	id_ZespolFormujacy int foreign key references ZespolFormujacy(id) not null,
	sztukaUformowana smallint default 0,
	brakHutnika smallint default 0,
	brakBankarza smallint default 0,
	brakOpalowego smallint default 0,
	sredniaWagaBankiOpalowej smallint,
	sredniaWagaBankiBezbarwnej smallint
);

create table GrupaWadSzkla
(
	id int primary key identity(1,1) not null,
	nazwa NVARCHAR(50),
	opis NVARCHAR(150)
);

CREATE TABLE WadaSzkla
(
	id INT PRIMARY KEY IDENTITY(1,1) not null,
	id_GrupaWadSzkla INT FOREIGN KEY REFERENCES GrupaWadSzkla(id) not null,
	nazwa NVARCHAR(50) NOT NULL,
	opis NVARCHAR(150) NOT NULL,
	zdjecie NVARCHAR(50)
);
