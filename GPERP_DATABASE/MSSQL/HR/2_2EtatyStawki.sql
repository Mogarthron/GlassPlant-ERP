


IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'EtatyStawki'
) 
CREATE TABLE EtatyStawki
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Etaty INT FOREIGN KEY REFERENCES Etaty(id),
    stawka DECIMAL(7,2),
    godzinowa bit,
    dataAktualizacji date,
    aktualna bit
);
