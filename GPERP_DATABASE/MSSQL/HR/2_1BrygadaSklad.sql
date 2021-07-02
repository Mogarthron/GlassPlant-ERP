
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'BrygadaSklad'
)  
CREATE TABLE BrygadaSklad
(
    id INT primary key identity(1,1) NOT NULL,
    id_Brygada INT foreign key references Brygada(id) NOT NULL,
    id_Pracownicy INT FOREIGN KEY REFERENCES Pracownicy(id) NOT NULL,
    naBrygadzieOd Date NOT NULL,
    naBrygadzieDo Date
);
