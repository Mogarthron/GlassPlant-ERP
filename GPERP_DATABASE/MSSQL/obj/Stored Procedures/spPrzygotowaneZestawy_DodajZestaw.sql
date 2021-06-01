create procedure dbo.spPrzygotowaneZestawy_DodajZestaw

    @DataPrzygotowania date,
    @id_Receptury int,
    @ZrobioneZestawy tinyint

as
begin
    set nocount on;

	insert into dbo.PrzygotowaneZestawy(dataPrzygotowania, id_Receptury, ilosc)
	values 
	(@DataPrzygotowania, @id_Receptury, @ZrobioneZestawy)

end