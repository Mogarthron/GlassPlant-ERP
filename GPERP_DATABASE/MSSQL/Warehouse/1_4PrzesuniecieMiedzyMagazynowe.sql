IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'PrzesuniecieMiedzyMagazynowe'
)  
CREATE TABLE PrzesuniecieMiedzyMagazynowe(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_BO_Pozycje INT FOREIGN KEY REFERENCES BilansOtwarciaPozycje(id) NULL,
    id_PZ_Pozycje INT FOREIGN KEY REFERENCES PrzyjecieZewnetrznePozycje(id) NULL,
	id_Magazyny_przeznaczenia INT FOREIGN KEY REFERENCES Magazyny(id) NOT NULL,
    ilosc DECIMAL(9,4) NOT NULL,
	dataPMM DATE DEFAULT GETDATE()
);