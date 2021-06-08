
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'DniWolneWynikajaceZHarmonogramu'
)  
CREATE TABLE DniWolneWynikajaceZHarmonogramu
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Pracownicy INT FOREIGN KEY REFERENCES Pracownicy(id),
    id_Brygada INT FOREIGN KEY REFERENCES Brygada(id),
    id_TypyNieobecnosci INT FOREIGN KEY REFERENCES TypyNieobecnosci(id),
    data DATE
);
GO