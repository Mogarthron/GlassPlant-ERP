--Zamówienie Klienta Nie przez IKK

--select * from dbo.Kontrachent
--select * from dbo.ZamowienieKlienta


declare @NR_DOKUMENTU nvarchar(20), 
		@FormaZlozeniaZam nvarchar(20), 
		@formulazKlienta bit, 
		@SciezkaDostepu nvarchar(30), 
		@Kontarchent int,
		@DataWplywuZam date,
		@DataPrzyjeciaZam datetime2, 
		@OczekiwanaDataZamknieciaZam date,
		@InfNTPlatnosci nvarchar(50),
		@InfNTTransportu nvarchar(200),
		@UwagiDodatkowe nvarchar(200),
		@InfNTRealizacji nvarchar(20),
		@OpiekunZamowienia int,
		@Akronim nvarchar(6),
		@NrZamowieniaKlientaWDanymRoku int


set @Kontarchent = 9
set @NrZamowieniaKlientaWDanymRoku = (select COUNT(id_Kontrachent) from dbo.ZamowienieKlienta where id_Kontrachent = @Kontarchent and YEAR(dataPrzyjeciaZamowienia) = 2020) + 1
set @Akronim = (select akronim from dbo.Kontrachent where id = @Kontarchent)
set @NR_DOKUMENTU ='ZK/' + @Akronim + '/' + CONVERT(nvarchar(4),YEAR(GetDate())) + '/' + CONVERT(nvarchar(5),(@NrZamowieniaKlientaWDanymRoku))  --ZK - zam. Klienta, @Akronim - akronim klienta, 2020 - YYYY, nr - nr zam od klienta w danym roku
set @FormaZlozeniaZam = 'mail'
set @formulazKlienta = 1
set @SciezkaDostepu = '.\Zam\' + @Akronim + '\'
set @DataWplywuZam = '2020.10.23'
set @OczekiwanaDataZamknieciaZam = '2020.11.16'
set @InfNTPlatnosci = '21 dni po Dostarczeniu zamówienia'
set @InfNTTransportu = 'Transport po stronie Biaglass'
set @InfNTRealizacji = 'Oczekuj¹ce'
set @OpiekunZamowienia = 4

--select @NR_DOKUMENTU

--insert into dbo.ZamowienieKlienta(NR_DOKUMENTU, formaZlozeniaZamowienia, formularzKlienta, sciezkaDostepuDoPliku, id_Kontrachent, dataWplywuZamowienia, oczekiwanaDataZamknieciaZamowienia, informacjNaTematPlatnosci, daneNaTematTransportu, informacjeNaTematRealizacji)
--values
--(@NR_DOKUMENTU, @FormaZlozeniaZam, @formulazKlienta, @SciezkaDostepu, @Kontarchent, @DataWplywuZam, @OczekiwanaDataZamknieciaZam, @InfNTPlatnosci, @InfNTTransportu, @InfNTRealizacji)


select 
	NR_DOKUMENTU, 
	formaZlozeniaZamowienia, 
	formularzKlienta, 
	sciezkaDostepuDoPliku, 
	id_Kontrachent, 
	dataPrzyjeciaZamowienia,
	oczekiwanaDataZamknieciaZamowienia,
	informacjNaTematPlatnosci,
	daneNaTematTransportu,
	uwagiDodatkowe,
	informacjeNaTematRealizacji
from dbo.ZamowienieKlienta

