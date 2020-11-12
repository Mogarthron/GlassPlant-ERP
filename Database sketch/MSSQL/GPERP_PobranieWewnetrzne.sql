
--insert into dbo.PobranieWewnetrzne(id_PZPozycje, ilosc, id_Magazynu_pierwotnego, id_Magazynu_docelowego, dataPrzekazania)
--values
--(24, 1, 1, 3, '2020.9.30')

select * from dbo.Magazyny

select a.dataPrzekazania, p.nazwaPozycji, a.ilosc, m.nazwaMagazynu from dbo.PobranieWewnetrzne a
inner join dbo.Magazyny m on m.id = a.id_Magazynu_pierwotnego
inner join dbo.PrzyjecieZewnetrznePozycje p on p.id = a.id_PZPozycje
