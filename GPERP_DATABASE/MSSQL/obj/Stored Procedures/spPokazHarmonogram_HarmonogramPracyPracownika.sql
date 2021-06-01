
create procedure  dbo.spPokazHarmonogram_HarmonogramPracyPracownika

    @year int,
    @month int
as
begin
    set nocount on;

            select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "Pracownik", h.niedziele, o.przebiegZmian, h.poczatkowaZmiana
        from dbo.HarmonogramPracyPracownika h
            join dbo.Pracownicy p on p.id = h.id_Pracownika
            join dbo.OrganizacjaCzasuPracy o on o.id = h.OCP
        where YEAR(h.dataHarmonogramu) = @year
            and MONTH(h.dataHarmonogramu) = @month

    union

        select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "Pracownik", h.niedziele, h.idywidualnyHarmonogram, h.poczatkowaZmiana
        from dbo.HarmonogramPracyPracownika h
            join dbo.Pracownicy p on p.id = h.id_Pracownika

        where YEAR(h.dataHarmonogramu) = @year
            and MONTH(h.dataHarmonogramu) = @month
            and h.idywidualnyHarmonogram is not null
end