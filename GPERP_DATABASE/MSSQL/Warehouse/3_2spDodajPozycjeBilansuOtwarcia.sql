CREATE PROCEDURE spDodajPozycjeBilansuOtwarcia
    @id_BilansOtwarcia INT,
    @id_Towar INT,
    @ilosc DECIMAL(9,4),
	@Cena MONEY = 0,
    @id_Waluta INT = NULL
AS
BEGIN
	
    INSERT INTO dbo.BilansOtwarciaPozycje(id_BilansOtwarcia, id_Towary, ilosc, cenaZaJednostke, id_Waluty)
    values(@id_BilansOtwarcia, @id_Towar, @ilosc, @Cena, @id_Waluta)


END