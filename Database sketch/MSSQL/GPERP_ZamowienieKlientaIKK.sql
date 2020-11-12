--Zamówienie klienta IKK


select * from dbo.InternetowyFormularzZamowienia
select NR_DOKUMENTU from dbo.ZamowienieKlienta
--select NR_DOKUMENTU from dbo.ZmowienieKlienta

declare @NR_DOKUMENTU nvarchar(20),  		
		@IFZ int,
		@InfNTPlatnosci nvarchar(50),
		@InfNTTransportu nvarchar(200),
		@UwagiDodatkowe nvarchar(200)
		

set @IFZ = 1
set @NR_DOKUMENTU ='ZM_EXP_2010_002' -- ZM_EXP_RRMM_XXX
set @InfNTPlatnosci = '60 dni po dostarczeniu zamówienia'




--insert into dbo.ZamowienieKlienta(NR_DOKUMENTU, formaZlozeniaZamowienia, formularzKlienta,  IFZ, informacjNaTematPlatnosci, informacjeNaTematRealizacji)
--values
--(@NR_DOKUMENTU, 'IKK', 1, @IFZ, @InfNTPlatnosci, 'Oczekuj¹ce')



 
select NR_DOKUMENTU, f.dataZlozeniaZamowienia, dataPrzyjeciaZamowienia, f.oczekiwanaDataZamknieciaZamowienia,  k.id_Kontrachent, informacjNaTematPlatnosci, f.transport, f.uwagiDoZamowienia, informacjeNaTematRealizacji from dbo.ZamowienieKlienta z
join dbo.InternetowyFormularzZamowienia f on f.id = z.IFZ
join dbo.InternetoweKontoKlienta k on k.id = f.IKK

