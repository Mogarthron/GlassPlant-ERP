
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'PrzyjecieZewnetrzne'
)

create table PrzyjecieZewnetrzne(
	id int primary key identity(1,1) not null,    
	id_Kontrachent int foreign key references Kontrachent(id) not null,
	nrWZ nvarchar(50),
	dataPrzyjecia date not null,
	informacjeDostawa nvarchar(150),
	informacjeTransport nvarchar(150),	
	informacjeDodatkowe nvarchar(150),	
	pozycjaZatwierdzona bit DEFAULT 0,
	pozycjaPrzyjeta bit DEFAULT 0
);