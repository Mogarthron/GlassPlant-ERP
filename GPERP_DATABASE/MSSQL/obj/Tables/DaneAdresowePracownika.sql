IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'DaneAdresowePracownika'
)  
CREATE TABLE DaneAdresowePracownika
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    id_Pracownicy INT FOREIGN KEY REFERENCES Pracownicy(id),
    ulica NVARCHAR(50),
    nrBudynku NVARCHAR(10),
    nrLokalu NVARCHAR(10),
    kodPocztowy NVARCHAR(10),
    miasto NVARCHAR(50),
    kraj NVARCHAR(50)
);
GO