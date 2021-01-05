create procedure  dbo.spDniWolneOdPracyWynikajaceZHarmonogramu
    @year int,
    @month int,
    @pracownik NVARCHAR(50)

as
begin
    set NOCOUNT ON;

    select n.skrot, data
    from dbo.DniWolneWynikajaceZHarmonogramu d
        join dbo.Pracownicy p on p.id = d.id_Pracownicy
        join dbo.TypyNieobecnosci n on n.id = d.id_TypyNieobecnosci
    where YEAR(d.data) = @year and MONTH(d.data) = @month and CONCAT(p.nazwisko, ' ', p.pierwszeImie) = @pracownik;
end