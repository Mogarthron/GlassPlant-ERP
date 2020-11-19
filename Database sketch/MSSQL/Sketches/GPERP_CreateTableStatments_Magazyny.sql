
--create table Magazyny(
--	id int primary key identity(1,1) not null,
--	nazwaMagazynu nvarchar(60) not null,
--	skrotNazwy nvarchar(10) not null,
--	opis nvarchar(200)
--);

--create table BilansOtwarcia(
--	id int primary key identity(1,1) not null,
--	id_Magazyny int foreign key references Magazyny(id) not null,
--	dataUtworzenia date not null
--);

--create table BilansOtwarciaPozycje(
--	id int primary key identity(1,1) not null,
--	id_BilansOtwarcia int foreign key references BilansOtwarcia(id) not null,
--	id_Towary int foreign key references Towary(id) not null,
--	ilosc smallint not null,
--	cenaZaJednostke money,
--	id_Waluty int foreign key references Waluty(id) not null,
--);

--create table PrzyjecieZewnetrzne(
--	id int primary key identity(1,1) not null,
--	id_Kontrachent int foreign key references Kontrachent(id) not null,
--	nrWZ nvarchar(50),
--	dataDostawy date not null,
--	informacjeDodatkowe nvarchar(150),
--	id_Waluty int foreign key references Waluty(id),
--	pozycjaZatwierdzona bit
--);

--create table PrzyjecieZewnetrznePozycje(
--	id int primary key identity(1,1) not null,
--	id_PrzyjecieZewnetrzne int foreign key references PrzyjecieZewnetrzne(id) not null,
--	id_Towary int foreign key references Towary(id) not null,
--	ilosc decimal(9,4) not null,
--	cenaZaJednostke money,
--	nazwaPozycji nvarchar(50),
--	id_Magazyny int foreign key references Magazyny(id),
--	cenaNetto bit, 
--	vat decimal(4,2),
--	nrBDO nvarchar(50)
--);

--PrzyjecieWewnetrzne

--PrzesuniecieWewnetrzne

--RozrachunekWewnetrzny

--ZwrotWewnetrzny

--WydanieZewnetrzne

--RezerwacjaWewnetrzna

--DepozytZewnetzny
