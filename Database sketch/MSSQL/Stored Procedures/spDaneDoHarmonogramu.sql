create procedure  dbo.spDaneDoHarmonogramu

    @year int,
    @month int
as
begin
    set nocount on;

            select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "pracownik", n.nazwaStanowiska, s.stawka, s.godzinowa , h.niedziele, o.przebiegZmian, h.poczatkowaZmiana
        from dbo.HarmonogramPracyPracownika h
            join dbo.Pracownicy p on p.id = h.id_Pracownika
            join dbo.OrganizacjaCzasuPracy o on o.id = h.OCP
            join dbo.Etaty e on e.id_Pracownicy = p.id
            join dbo.EtatyStawki s on s.id_Etaty = e.id
            join dbo.Stanowisko n on n.id = e.id_Stanowisko
        where YEAR(h.dataHarmonogramu) = @year
            and MONTH(h.dataHarmonogramu) = @month
            and s.aktualna = 1

    union

        select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "pracownik", n.nazwaStanowiska, s.stawka, s.godzinowa , h.niedziele, h.idywidualnyHarmonogram, h.poczatkowaZmiana
        from dbo.HarmonogramPracyPracownika h
            join dbo.Pracownicy p on p.id = h.id_Pracownika
            join dbo.Etaty e on e.id_Pracownicy = p.id
            join dbo.EtatyStawki s on s.id_Etaty = e.id
            join dbo.Stanowisko n on n.id = e.id_Stanowisko
        where YEAR(h.dataHarmonogramu) = @year
            and MONTH(h.dataHarmonogramu) = @month
            and h.idywidualnyHarmonogram is not null
            and s.aktualna = 1

end