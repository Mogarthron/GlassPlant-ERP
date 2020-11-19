
--create table InternetoweKontoKlienta(
--	id int primary key identity(1,1) not null,
--	id_Kontrachent int foreign key references Kontrachent(id) not null,
--	dataDodania datetime2 default GetDate(),
--	nazwaKlienta nvarchar(50) not null,
--	haslo nvarchar(20) not null,
--	czyMozeSledzicRealizacje bit default 0,
--	jednoliteNazwyTowarow bit default 0
--);

--create table InternetowyFormularzZapytaniaOfertowego(
--	id int primary key identity(1,1) not null,
--	dataDodania datetime2 default GetDate(),
--	IKK int foreign key references InternetoweKontoKlienta(id) null,
--	nazwaKlienta nvarchar(50) null,
--	tresc nvarchar(300) not null,
--	osobaKontaktowa nvarchar(50) not null,
--	tel nvarchar(15),
--	email nvarchar(50)
--);

--create table InternetowyFormularzZamowienia(
--	id int primary key identity(1,1) not null,	
--	IKK int foreign key references InternetoweKontoKlienta(id) not null,
--	FZO int foreign key references InternetowyFormularzZapytaniaOfertowego(id),
--	dataZlozeniaZamowienia datetime2 not null default GetDate(),
--	osobaKontaktowa nvarchar(50),
--	tel nvarchar(15),
--	email nvarchar(50),
--	oczekiwanaDataZamknieciaZamowienia date not null,
--	transport nvarchar(200) not null, 
--	uwagiDoZamowienia nvarchar(300),
--	nrZamowieniaUKlienta nvarchar(50)
--);

--create table InternetowyFormularzZamowieniaPozycje(
--	id int primary key identity(1,1) not null,
--	IFZ int foreign key references InternetowyFormularzZamowienia(id),
--	typNazwyTowaru tinyint not null, --1 nazwa towaru, 2 nazwa towaru u klienta, 3 kod tawaru, 4 nazwa w³asna klienta
--	towar nvarchar(100),
--	ilosc smallint not null,
--	jednostka nvarchar(6),
--	dodatkoweUwagiDoPozycji nvarchar(100)
--);

--create table ZamowienieKlienta(
--	NR_DOKUMENTU nvarchar(20) unique, --ZM_EXP_RRMM_XXX np. ZM_2010_012
--	formaZlozeniaZamowienia nvarchar(20) not null,
--	formularzKlienta bit default 0,
--	sciezkaDostepuDoPliku nvarchar(30), --.\dir_1\dir_2\...NR_DOKUMENTU
--	id_Kontrachent int foreign key references Kontrachent(id),
--	dataWplywuZamowienia date,	--Data nades³ania zamówienia
--	IFZ int foreign key references InternetowyFormularzZamowienia(id),	
--	dataPrzyjeciaZamowienia datetime2 default GetDate(),	--data wprpwadzenia Zamówienia klienta do bazy
--	oczekiwanaDataZamknieciaZamowienia date,
--	informacjNaTematPlatnosci nvarchar(50),
--	daneNaTematTransportu nvarchar(200),
--	uwagiDodatkowe nvarchar(200),
--	informacjeNaTematRealizacji nvarchar(30), --nie przyjête, przyjête, w trakcie realizacji, zamkniête, Transport do kilenta 
--	zamówienieZamkniete datetime2,
--	zamowienieOdrzucone bit,
--	powodOdrzucenia nvarchar(150),
--	nrZamowieniaUKlienta nvarchar(50),
--	opiekunZamowienia int foreign key references Pracownicy(id)
--);

--create table ZamowienieSprzedarzy(
--	id int primary key identity(1,1) not null,
--	zamowienieKlienta nvarchar(20),
--	dataUtworzeniaPozycji datetime2 default GetDate(),
--	uwagiSprzedarzy nvarchar(200),
--	pobracPozycjeZPFI bit default 0,
--	priorytetZamowienia tinyint,
--	oczekiwanaDataZakonczeniaZamowienia date,
--	statusZamowienia nvarchar(20)
--);


--create table ZamowienieSprzedarzyPozycje(
--	id int primary key identity(1,1) not null,
--	id_ZamowienieSprzedarzy int foreign key references ZamowienieSprzedarzy(id),
--	PFI int foreign key references InternetowyFormularzZamowieniaPozycje(id),
--	id_Towary int foreign key references Towary(id),
--	ilosc smallint,
--	rabaty decimal(4,2) default 0.0,
--	zdobieniaDodatkowe nvarchar(100),
--	uwagiDoPozycji nvarchar(100)
--);

