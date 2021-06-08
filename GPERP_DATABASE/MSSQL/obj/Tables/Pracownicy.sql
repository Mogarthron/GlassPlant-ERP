IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'Pracownicy'
)  
CREATE TABLE Pracownicy
(
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nazwisko NVARCHAR(50) NOT NULL,
    pierwszeImie NVARCHAR(50) NOT NULL,
    drugieImie NVARCHAR(50),
    zatrudniony BIT DEFAULT 1,
    dataUrodzenia DATE
);
GO