
IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'TypyNieobecnosci'
)  
CREATE TABLE TypyNieobecnosci
(
    --urlopy i zwonienia lekrskie
    id int primary key identity(1,1) not null,
    nazwa nvarchar(50) not null,
    skrot nvarchar(5),
    opis nvarchar(150),
    anulujePremie bit,
    wliczaSieDoLimituUrlopowego bit
);