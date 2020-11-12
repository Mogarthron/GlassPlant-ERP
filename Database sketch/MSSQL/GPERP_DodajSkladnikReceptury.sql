select * from dbo.Receptury

--select * from dbo.Towary where id_TypTowaru = 2


declare @idr int
set @idr = 5

--insert into dbo.RecepturySklady(id_Receptury, id_Towary, ilosc)
--values 
--(@idr, 1, 0.1195)
--,(@idr, 2, 0.04)
--,(@idr, 3, 0.0055)
--,(@idr, 4, 0.05)
--,(@idr, 5, 0.0066)
--,(@idr, 10, 0.5)
--,(@idr, 9, 23)
--,(@idr, 7, 1.5)
--,(@idr, 11, 0.5)
--,(@idr, 26, 5)


select * from dbo.RecepturySklady 