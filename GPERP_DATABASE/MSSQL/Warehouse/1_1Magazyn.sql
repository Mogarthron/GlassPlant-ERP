IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Magazyny'
)  
CREATE TABLE Magazyny(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nazwaMagazynu NVARCHAR(60) NOT NULL,
	skrotNazwy NVARCHAR(10) NOT NULL,
	opis NVARCHAR(200)
);