--create table SrodkiTrwale(
--	id int primary key identity(1,1) not null,
--	nazwaSrodkaTrwalego nvarchar(150) not null,
--	opis nvarchar(250)
--);

--create table TypTowaru(
--	id int primary key identity(1,1) not null,
--	nazwa nvarchar(25) not null,
--	opis nvarchar(250)
--);

--create table Jednostki(
--	id int primary key identity(1,1) not null,
--	pelnaNazwa nvarchar(15) not null,
--	skrot nvarchar(4) not null
--);

--create table Towary(
--	id int primary key identity(1,1) not null,
--	nazwa nvarchar(100) not null,
--	id_Jednostka int foreign key references Jednostki(id),
--	id_TypTowaru int foreign key references TypTowaru(id),
--	nazwaUKlienta nvarchar(100)
--);

--create table KodyTowarowe(
--	id int primary key identity(1,1) not null,
--	id_Towary int foreign key references Towary(id) not null,
--	KodZakladowy nvarchar(100), --kod towaru istniej�cy i dzia�aj�cy w zak�azie
--	SystematycznyWykazWyrobow nvarchar(8), --xxxx-xxx
--	KodTowarowoMaterialowy nvarchar(25), -- mo�e wyst�powa� samodzielnie lub z SSW
--	PolskaKwalifikacjaWyrobowIUslug nvarchar(10)
--);

--create table Waluty(
--	id int primary key identity(1,1) not null,
--	nazwaWaluty nvarchar(30),
--	symbol nvarchar(4)
--);

--create table TypKontrachenta(
--	id int primary key identity(1,1) not null,
--	nazwa nvarchar(50),
--	opis nvarchar(300)
--);

--create table Kontrachent(
--	id int primary key identity(1,1) not null,
--	id_TypKontrachenta int foreign key references TypKontrachenta(id),
--	nazwaPelna nvarchar(250),
--	nazwaKrotka nvarchar(30) not null,
--	akronim nvarchar(6),		
--	aktywny bit,
--	nip nvarchar(15),
--  bdo nvarchar(20)
--);

----create table DaneAdresoweKontrachent(
--	id int primary key identity(1,1) not null,
--	id_Kontrachent int foreign key references Kontrachent(id),
--	ulica nvarchar(50), 
--	nrBudynku nvarchar(10), 
--	nrLokalu nvarchar(10), 
--	kodPocztowy nvarchar(10), 
--	miasto nvarchar(50), 
--	kraj nvarchar(50), 
--	dataAktualizacji datetime2 default GetDate()
--);

--create table DaneKontaktoweKontrahent(
--	id int primary key identity(1,1) not null,
--	osobaKontaktowa nvarchar(50) not null,
--	tel_1 nvarchar(15),
--	tel_2 nvarchar(15),
--	fax nvarchar(15),
--	email nvarchar(50),
--	id_Kontrachent int foreign key references Kontrachent(id) not null
--);

--create table Pracownicy(
--	id int primary key identity(1,1) not null,
--	nazwisko nvarchar(50) not null,
--	pierwszeImie nvarchar(50) not null,
--	drugieImie nvarchar(50),
--	zatrudniony bit
--);

--create table DaneAdresowePracownika(
--	id int primary key identity(1,1) not null,
--	id_Pracownicy int foreign key references Pracownicy(id),
--	ulica nvarchar(50), 
--	nrBudynku nvarchar(10), 
--	nrLokalu nvarchar(10), 
--	kodPocztowy nvarchar(10), 
--	miasto nvarchar(50), 
--	kraj nvarchar(50)
--);

--create table DaneKontaktowePracowanika(
--	id int primary key identity(1,1) not null,
--	id_Pracownicy int foreign key references Pracownicy(id),
--	telPrywatny_1 nvarchar(15),
--	telPrywatny_2 nvarchar(15),
--	emailPrywany_1 nvarchar(50),
--	telSluzbowy nvarchar(15),
--	emailSluzbowy nvarchar(50)
--);

--create table DanePoufnePracownika(
--	id int primary key identity(1,1) not null,
--	id_Pracownicy int foreign key references Pracownicy(id),
--	nrPesel nvarchar(11),
--	seriaDowoduOsobostego nvarchar(3),
--	numerDowoduOsobistego nvarchar(6),
--	innyDokumnet nvarchar(50),
--	nrDokumentu nvarchar(50)
--);

--create table JednostkaOrganizacyjna(
--	id int primary key identity(1,1) not null,
--	nazwa nvarchar(100),
--	opis nvarchar(100)	
--);

