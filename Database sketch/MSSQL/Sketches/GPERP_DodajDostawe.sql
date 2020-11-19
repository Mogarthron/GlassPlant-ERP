
--select * from Kontrachent;

--insert into dbo.PrzyjecieZewnetrzne(dataDostawy, id_Kontrachent, nrWZ, informacjeDodatkowe, id_Waluty)
--values ('2020.10.21', 1, '2140169308', 'Transport Jang', 1);

--update dbo.PrzyjecieZewnetrzne set informacjeDodatkowe = 'Transport Jang' where id = 7;

--select * from dbo.Towary

select * from dbo.PrzyjecieZewnetrzne

declare @id_PZ int, @ZS int, @ZO int;
set @id_PZ = 14
set @ZS = 1 -- Mag Sur
set @ZO = 2 -- Mag Ogólny

--insert into dbo.PrzyjecieZewnetrznePozycje(id_PrzyjecieZewnetrzne, id_Towary, ilosc, cenaZaJednostke, vat, cenaNetto, nazwaPozycji, id_Magazyny)
--values
--(@id_PZ,	1,	24, 174,	23.0,	1,		'OS 03/15', @ZS)
--,(@id_PZ,	28, 24, 0,		null,	null,	null,		@ZO)
--,(@id_PZ,	29, 24, 0,		null,	null,	null,		@ZO)
--,(@id_PZ,	30, 1,	2200,	23.0,	null,	null,		null)

--update dbo.PrzyjecieZewnetrznePozycje set ilosc = 2000 where id = 31;

--select * from dbo.Magazyny

select
	p.nazwaPozycji
	,z.dataDostawy
	,p.ilosc
	,j.skrot	
	,p.ilosc * p.cenaZaJednostke as "Wartoœæ Pozycji Netto"	
from dbo.PrzyjecieZewnetrznePozycje p
inner join dbo.Towary t on t.id = p.id_Towary
inner join dbo.Jednostki j on j.id = t.id_Jednostka
inner join dbo.PrzyjecieZewnetrzne z on z.id = p.id_PrzyjecieZewnetrzne
where 
	id_Magazyny = 1 
and Year(z.dataDostawy) = 2020 
--and t.nazwa = 'Kriolit'
and Month(z.dataDostawy) >= 10;
