--IKK
--select * from dbo.Kontrachent



--insert into dbo.InternetoweKontoKlienta(id_Kontrachent, dataDodania, nazwaKlienta, haslo, czyMozeSledzicRealizacje, jednoliteNazwyTowarow)
--values (15, '2020.09.09 11:12:32', 'FOSCARINI SPA', 'KL30sin', 0, 1)


--select * from dbo.InternetoweKontoKlienta

----InternetowyFormularzZamowienia

declare @IKK int, @Kontakt nvarchar(50), @Tel nvarchar(12), @Mail nvarchar(50), @ZamkniecieZamowienia date, @Transport nvarchar(200), @Uwagi nvarchar(300)

set @IKK = 1
set @Kontakt = 'Paolo Calcone'
set @Tel = '1112223334'
set @ZamkniecieZamowienia = '2020.12.24'
set @Transport = 'Coœ nt transportu po w³osku'
set @Uwagi = 'W³oski be³kot o asortymencie'


--insert into dbo.InternetowyFormularzZamowienia(IKK,osobaKontaktowa,tel,oczekiwanaDataZamknieciaZamowienia,transport,uwagiDoZamowienia)
--values
--(@IKK, @Kontakt, @Tel, @ZamkniecieZamowienia, @Transport, @Uwagi) 

--select * from dbo.InternetowyFormularzZamowienia

----InternetowyFormularzZamowieniaPozycje

--select * from Towary

--insert InternetowyFormularzZamowieniaPozycje(IFZ, typNazwyTowaru, towar, ilosc, jednostka, dodatkoweUwagiDoPozycji)
--values 
--(1, 1, 'F67590 ml kx1                          *WS19', 80, 'psc',  null)


select * from dbo.InternetowyFormularzZamowieniaPozycje