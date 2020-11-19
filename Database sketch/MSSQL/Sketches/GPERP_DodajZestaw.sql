declare @dataDodania date, @WG int, @WE0 int, @ileWG tinyint, @ileWE0 tinyint

--select * from dbo.Receptury

set @WG = 1
set @WE0 = 5

set @dataDodania = '2020.11.16'
set @ileWG = 5
set @ileWE0 = 8


exec dbo.spPrzygotowaneZestawy_DodajZestaw @dataDodania, @WG, @ileWG;
--insert into dbo.PrzygotowaneZestawy(dataPrzygotowania, id_Receptury, ilosc)
--values 
--(@dataDodania, @WG, @ileWG)
--,(@dataDodania, @WE0, @ileWE0)

--update dbo.PrzygotowaneZestawy set dataPrzygotowania = '2020.10.19' where id in(120,121)

--delete from dbo.PrzygotowaneZestawy where id in(110,111)

--lista przygotowanych zestawów
select 
	p.id
	,r.nazwaReceptury
	,p.ilosc 
from dbo.PrzygotowaneZestawy p
inner join dbo.Receptury r on r.id = p.id_Receptury
where dataPrzygotowania = @dataDodania
order by p.dataPrzygotowania

--suma przygotowanych zestawów
select 
	r.nazwaReceptury
	,sum(p.ilosc) as "Suma Zwestawów" 
from dbo.PrzygotowaneZestawy p
inner join dbo.Receptury r on r.id = p.id_Receptury
where Month(dataPrzygotowania) = 11
group by r.nazwaReceptury
