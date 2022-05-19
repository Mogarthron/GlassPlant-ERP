
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'PrzyjecieZewnetrznePozycje'
)

create table PrzyjecieZewnetrznePozycje(
	id int primary key identity(1,1) not null,
	id_PrzyjecieZewnetrzne int foreign key references PrzyjecieZewnetrzne(id) not null,
	id_Magazyn int foreign key references Magazyny(id) not null,
	id_Towary int foreign key references Towary(id) not null,
	ilosc decimal(9,4) not null,
    nazwaPozycji nvarchar(150),
	cenaZaJednostke money,	
	cenaNetto bit, 
	vat decimal(4,2)
);
