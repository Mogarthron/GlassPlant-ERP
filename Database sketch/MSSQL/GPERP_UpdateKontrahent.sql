
declare @id int

set @id = 2;

update dbo.Kontrachent set nazwaPelna = 'CHEM-GLAS Sp. z o.o. Spó³ka komandytowa' where id = @id
update dbo.Kontrachent set ulica = 'Skiereszewo' where id = @id
update dbo.Kontrachent set nrBudynku = '19a' where id = @id
update dbo.Kontrachent set nrLokalu = null where id = @id
update dbo.Kontrachent set miasto = 'Gniezno' where id = @id
update dbo.Kontrachent set kodPocztowy = '62-200' where id = @id
update dbo.Kontrachent set kraj = 'Polska' where id = @id
update dbo.Kontrachent set nip = '7842494710' where id = @id

select * from dbo.Kontrachent