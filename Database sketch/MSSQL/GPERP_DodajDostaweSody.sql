--dodaj dostawê sody ciêzkiej z RDT

--select * from dbo.Kontrachent

declare @ChemGlas int, @Ciech int, @Brenntag int, @Standard int, @Soda int, @CenaZaJedn money, @nazwaPozycji nvarchar(50)

set @ChemGlas = 2
set @Brenntag = 3
set @Standard = 4
set @Ciech = 5;
set @Soda = 2

declare  @Paleta int, @Bigbag int, @Fraht int, @id_PZ int, @cenaTonySody money, @ZS int, @ZO int, @vat decimal(4,2), @ileSody decimal(9,4)

set @Bigbag = 29;
set @Paleta = 28;
set @Fraht = 30;

set @ZS = 1;
set @ZO = 2;
set @vat = 23.0;


--insert into dbo.PrzyjecieZewnetrzne(dataDostawy, id_Kontrachent, nrWZ, informacjeDodatkowe, id_Waluty)
--values 
--('2019.01.02', @Ciech, null, 'Transport dostawcy', 1)
--,('2018.07.31', @Ciech, null, 'Transport dostawcy', 1)
--,('2018.04.26', @Ciech, null, 'Transport dostawcy', 1)





select * from dbo.PrzyjecieZewnetrzne where id_Kontrachent = @Ciech

set @id_PZ = 56;
set @ileSody = 24;
set @cenaTonySody = 960;
set @nazwaPozycji = 'Soda Ciech'

--insert into dbo.PrzyjecieZewnetrznePozycje(id_PrzyjecieZewnetrzne, id_Towary, ilosc, cenaZaJednostke, vat, cenaNetto, nazwaPozycji, id_Magazyny)
--values
--(@id_PZ, @Soda, @ileSody,@cenaTonySody, 23, 1, @nazwaPozycji, @ZS)
--,(@id_PZ, @Bigbag, 24, 0, null, null, null, @ZO)
--,(@id_PZ, @Paleta, 24, 0, null, null, null, @ZO)


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
where id_Kontrachent = @Ciech

--and id_Magazyny = 1 
--and Year(z.dataDostawy) = 2020 
--and Month(z.dataDostawy) >= 10;
--order by z.dataDostawy
