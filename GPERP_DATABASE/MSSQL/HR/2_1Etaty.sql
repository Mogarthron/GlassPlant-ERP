


IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Etaty'
) 
create table Etaty
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Stanowisko INT FOREIGN KEY REFERENCES Stanowisko(id),
    id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id),
    dataObjeciaEtatu date,
    id_RodzajUmowy INT FOREIGN KEY REFERENCES RodzajUmowy(id),
    aktualne bit
);