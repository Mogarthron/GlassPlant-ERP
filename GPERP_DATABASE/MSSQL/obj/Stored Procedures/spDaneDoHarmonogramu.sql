create procedure  dbo.spDaneDoHarmonogramu

    @jednostkaorg nvarchar(100),
    @year int,
    @month int
as
begin
    set nocount on;
            select
            CONCAT(p.nazwisko, ' ', p.pierwszeImie) as pracownik,
            p.id as idPracownika,
            t.nazwaStanowiska,
            x.stawka,
            x.godzinowa,
            h.niedziele,
            o.przebiegZmian,
            h.poczatkowaZmiana
        from dbo.HarmonogramPracyBrygada h
            join dbo.Brygada b on b.id = h.id_Brygada
            join dbo.JednostkaOrganizacyjna j on j.id = b.id_JednostkaOrganizacyjna
            join dbo.BrygadaSklad s on s.id_Brygada = b.id
            join dbo.Pracownicy p on p.id = s.id_Pracownicy
            join dbo.Etaty e on e.id_Pracownicy = p.id
            join dbo.Stanowisko t on t.id = e.id_Stanowisko
            join dbo.EtatyStawki x on x.id_etaty = e.id
            join dbo.OrganizacjaCzasuPracy o on o.id = h.OCP
        where 
	h.OCP is not null and
            Year(h.dataHarmonogramu) = @year and
            MONTH(h.dataHarmonogramu) = @month and
            YEAR(s.naBrygdazieDo) >= @year and
            Month(s.naBrygdazieDo) >= @month and
            x.aktualna = 1 and
            j.nazwa = @jednostkaorg and
            b.nazwa <> 'Kadra'

    union

        select
            CONCAT(p.nazwisko, ' ', p.pierwszeImie) as pracownik,
            p.id as idPracownika,
            t.nazwaStanowiska,
            x.stawka,
            x.godzinowa,
            h.niedziele,
            h.niestandardowyHarmonogram,
            h.poczatkowaZmiana
        from dbo.HarmonogramPracyBrygada h
            join dbo.Brygada b on b.id = h.id_Brygada
            join dbo.JednostkaOrganizacyjna j on j.id = b.id_JednostkaOrganizacyjna
            join dbo.BrygadaSklad s on s.id_Brygada = b.id
            join dbo.Pracownicy p on p.id = s.id_Pracownicy
            join dbo.Etaty e on e.id_Pracownicy = p.id
            join dbo.Stanowisko t on t.id = e.id_Stanowisko
            join dbo.EtatyStawki x on x.id_etaty = e.id
        where 
	h.niestandardowyHarmonogram is not null and
            Year(h.dataHarmonogramu) = @year and
            MONTH(h.dataHarmonogramu) = @month and
            x.aktualna = 1 and
            j.nazwa = @jednostkaorg
--         select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "pracownik", n.nazwaStanowiska, s.stawka, s.godzinowa , h.niedziele, o.przebiegZmian, h.poczatkowaZmiana
--     from dbo.HarmonogramPracyPracownika h
--         join dbo.Pracownicy p on p.id = h.id_Pracownika
--         join dbo.OrganizacjaCzasuPracy o on o.id = h.OCP
--         join dbo.Etaty e on e.id_Pracownicy = p.id
--         join dbo.EtatyStawki s on s.id_Etaty = e.id
--         join dbo.Stanowisko n on n.id = e.id_Stanowisko
--     where YEAR(h.dataHarmonogramu) = @year
--         and MONTH(h.dataHarmonogramu) = @month
--         and s.aktualna = 1

-- union

--     select CONCAT(p.nazwisko, ' ', p.pierwszeImie) as "pracownik", n.nazwaStanowiska, s.stawka, s.godzinowa , h.niedziele, h.idywidualnyHarmonogram, h.poczatkowaZmiana
--     from dbo.HarmonogramPracyPracownika h
--         join dbo.Pracownicy p on p.id = h.id_Pracownika
--         join dbo.Etaty e on e.id_Pracownicy = p.id
--         join dbo.EtatyStawki s on s.id_Etaty = e.id
--         join dbo.Stanowisko n on n.id = e.id_Stanowisko
--     where YEAR(h.dataHarmonogramu) = @year
--         and MONTH(h.dataHarmonogramu) = @month
--         and h.idywidualnyHarmonogram is not null
--         and s.aktualna = 1

end