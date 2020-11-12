--Dodaj dostawê piasku z RTD


declare @id_Kontrachent int, @Piasek int, @Paleta int, @Bigbag int, @Fraht int, @id_PZ int, @cenaTonyPiasku money, @ZS int, @ZO int, @vat decimal(4,2), @ilePiasku decimal(9,4)
set @id_Kontrachent = 1;
set @Piasek = 1;
set @Bigbag = 29;
set @Paleta = 28;
set @Fraht = 30;

set @ZS = 1;
set @ZO = 2;
set @vat = 23.0;


--insert into dbo.PrzyjecieZewnetrzne(dataDostawy, id_Kontrachent, nrWZ, informacjeDodatkowe, id_Waluty)
--values 
--('2020.11.05', @id_Kontrachent, '2140170417', 'Transport Jang', 1)


--select * from dbo.Waluty




set @id_PZ = dbo.OstanieIDPrzyjeciaZewnetrznego();
set @cenaTonyPiasku = 174;
set @ilePiasku = 23.66;

select * from dbo.PrzyjecieZewnetrzne where id = @id_PZ

--insert into dbo.PrzyjecieZewnetrznePozycje(id_PrzyjecieZewnetrzne, id_Towary, ilosc, cenaZaJednostke, vat, cenaNetto, nazwaPozycji, id_Magazyny)
--values
--(@id_PZ,	@Piasek,	@ilePiasku, @cenaTonyPiasku,	@vat,	1,	'OS 03/15 suchy',				@ZS)
--,(@id_PZ,	@Paleta,	24,			0,					null,	1,	'Paleta Osiecznica',			@ZO)
--,(@id_PZ,	@Bigbag,	24,			0,					null,	1,	'Big-Bag 1m3 Osiecznica',		@ZO)
--,(@id_PZ,	@Fraht,		1,			2200,				@vat,	1,	null,							null)

select
	z.dataDostawy
	,p.nazwaPozycji
	,p.ilosc
	,j.skrot	
	,p.cenaZaJednostke
from dbo.PrzyjecieZewnetrznePozycje p
inner join dbo.Towary t on t.id = p.id_Towary
inner join dbo.Jednostki j on j.id = t.id_Jednostka
inner join dbo.PrzyjecieZewnetrzne z on z.id = p.id_PrzyjecieZewnetrzne
where id_Kontrachent = 1
and id_Magazyny = 1 
and Year(z.dataDostawy) = 2020 
and Month(z.dataDostawy) >= 10
order by z.dataDostawy