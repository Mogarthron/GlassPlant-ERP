CREATE PROCEDURE spDodajMagazyny
	@nazwaMagazynu NVARCHAR(60), 
	@skrotNazwy NVARCHAR(10), 
	@opis NVARCHAR(100) 
	
AS
BEGIN
	

	insert into Magazyny(nazwaMagazynu, skrotNazwy, opis)
	values(@nazwaMagazynu, @skrotNazwy, @opis)
	

	insert into BilansOtwarcia(id_Magazyny)
	values((select id from dbo.Magazyny where nazwaMagazynu = @nazwaMagazynu))

end