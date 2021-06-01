create procedure  dbo.spDniWolneOdPracyWynikajaceZHarmonogramu
    @year int,
    @month int,
    @pracownik NVARCHAR(50)

as
begin
    set NOCOUNT ON;

            select
            n.skrot,
            data
        from dbo.DniWolneWynikajaceZHarmonogramu d
            join dbo.Pracownicy p on p.id = d.id_Pracownicy
            join dbo.TypyNieobecnosci n on n.id = d.id_TypyNieobecnosci
        where 
	YEAR(d.data) = @year and
            MONTH(d.data) = @month and
            CONCAT(p.nazwisko, ' ', p.pierwszeImie) = @pracownik


    union

        select
            n.skrot,
            data
        from dbo.DniWolneWynikajaceZHarmonogramu d
            join dbo.TypyNieobecnosci n on n.id = d.id_TypyNieobecnosci
            join dbo.Brygada b on b.id = d.id_Brygada
            join dbo.BrygadaSklad s on b.id = s.id_Brygada
            join dbo.Pracownicy p on p.id = s.id_Pracownicy
        where 
	YEAR(d.data) = @year and
            MONTH(d.data) = @month and
            CONCAT(p.nazwisko, ' ', p.pierwszeImie) = @pracownik;

-- select n.skrot, data
-- from dbo.DniWolneWynikajaceZHarmonogramu d
--     join dbo.Pracownicy p on p.id = d.id_Pracownicy
--     join dbo.TypyNieobecnosci n on n.id = d.id_TypyNieobecnosci
-- where YEAR(d.data) = @year and MONTH(d.data) = @month and CONCAT(p.nazwisko, ' ', p.pierwszeImie) = @pracownik;
end