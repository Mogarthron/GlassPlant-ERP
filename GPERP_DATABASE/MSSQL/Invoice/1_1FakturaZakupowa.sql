IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'FakturaZakupowa'
)
CREATE TABLE FakturaZakupowa(    
    nrDokmentu NVARCHAR(50) UNIQUE NOT NULL,
    nrFaktury NVARCHAR(50) NOT NULL,
    id_PrzyjecieZewnetrzne INT FOREIGN KEY REFERENCES PrzyjecieZewnetrzne(id) NOT NULL,
    dataWplywu DATE NOT NULL,
    dataWystawienia DATE NOT NULL DEFAULT GETDATE(),
    dataZakupu DATE NOT NULL,
    id_Waluty INT FOREIGN KEY REFERENCES Waluty(id) NOT NULL,
    kursWymianyPLN MONEY DEFAULT 1.0000,
    opis NVARCHAR(200),
    terminZaplaty TINYINT,
    oplacona BIT DEFAULT 0
);