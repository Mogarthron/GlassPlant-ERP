
declare @NrMiesiaca int

set @NrMiesiaca = 10

select
	t.nazwa
    ,sum(z.ilosc * s.ilosc) as "Suma Sur"
from dbo.PrzygotowaneZestawy z
inner join dbo.Receptury r on r.id = z.id_Receptury
inner join dbo.RecepturySklady s on r.id = s.id_Receptury
inner join dbo.Towary t on t.id = s.id_Towary
inner join dbo.Jednostki j on j.id = t.id_Jednostka
where Month(dataPrzygotowania) = @NrMiesiaca
group by t.nazwa

--select x.nazwa, x.[Suma Sur], j.skrot from 
--(select
--	t.nazwa
--    ,sum(z.ilosc * s.ilosc) as "Suma Sur"
--from dbo.PrzygotowaneZestawy z
--inner join dbo.Receptury r on r.id = z.id_Receptury
--inner join dbo.RecepturySklady s on r.id = s.id_Receptury
--inner join dbo.Towary t on t.id = s.id_Towary
--inner join dbo.Jednostki j on j.id = t.id_Jednostka
--where Month(dataPrzygotowania) = @NrMiesiaca
--group by t.nazwa) x
--inner join (dbo.Towary t inner join ( dbo.Jednostki j on j.id = t.id_Jednostka))









