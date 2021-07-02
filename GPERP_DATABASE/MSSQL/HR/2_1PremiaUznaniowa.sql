


IF NOT EXISTS
(    
    SELECT [name]
    FROM sys.tables
    WHERE [name] = 'PremiaUznaniowa'
) 
create table PremiaUznaniowa
(
    id INT PRIMARY KEY IDENTITY(1,1),
    id_Pracownicy int FOREIGN KEY REFERENCES Pracownicy(id),
    rok SMALLINT,
    miesiac TINYINT,
    opis NVARCHAR(150),
    kwota SMALLINT
);
