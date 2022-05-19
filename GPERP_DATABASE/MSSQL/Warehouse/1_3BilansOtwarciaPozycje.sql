IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'BilansOtwarciaPozycje'
)  
CREATE TABLE BilansOtwarciaPozycje(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_BilansOtwarcia INT FOREIGN KEY REFERENCES BilansOtwarcia(id) NOT NULL,
	id_Towary INT FOREIGN KEY REFERENCES Towary(id) NOT NULL,
	ilosc DECIMAL(9,4) NOT NULL,
	cenaZaJednostke MONEY NULL,
	id_Waluty INT FOREIGN KEY REFERENCES Waluty(id) NULL
);