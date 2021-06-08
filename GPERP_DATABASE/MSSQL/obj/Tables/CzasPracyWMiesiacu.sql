

IF NOT EXISTS
(    
    SELECT [name]
FROM sys.tables
WHERE [name] = 'CzasPracyWMiesiacu'
) 
CREATE TABLE CzasPracyWMiesiacu
(
    data DATE UNIQUE,
    czasPracyjacy TINYINT
);
GO