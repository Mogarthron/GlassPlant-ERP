IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'BilansOtwarcia'
)  
CREATE TABLE BilansOtwarcia(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_Magazyny INT FOREIGN KEY REFERENCES Magazyny(id) NOT NULL,
	dataUtworzenia DATE DEFAULT GETDATE()
);