

create procedure dbo.spZurzycieSurowcowZaOkres
    @Poczatek date,
    @Koniec date
as
begin
    set nocount on;
    select
        z.dataPrzygotowania
		, t.nazwa
		, sum(z.ilosc * s.ilosc) as "Suma Sur"
    from dbo.PrzygotowaneZestawy z
        inner join dbo.Receptury r on r.id = z.id_Receptury
        inner join dbo.RecepturySklady s on r.id = s.id_Receptury
        inner join dbo.Towary t on t.id = s.id_Towary
    where z.dataPrzygotowania between @Poczatek and @Koniec
    group by z.dataPrzygotowania, t.nazwa
    order by z.dataPrzygotowania;
end
