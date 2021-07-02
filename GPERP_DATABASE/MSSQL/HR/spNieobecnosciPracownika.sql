CREATE PROCEDURE dbo.spNieobecnosciPracownika
    @year int,
    @month int,
    @pracownik NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    select
        t.skrot,
        CONVERT(date, n.nieobecnoscOd) as "nieobecnoscOd",
        CONVERT(date, n.nieobecnoscDo) as "nieobecniscDo",
        n.czasNieprzeracowany
    from dbo.NieobecnosciPracownikow n
        join dbo.TypyNieobecnosci t on t.id = n.id_TypNieobecnosci
        join dbo.Pracownicy p on p.id = n.id_Pracownicy
    where YEAR(nieobecnoscOd) = @year and MONTH(nieobecnoscOd) = @month
        and zatwierdzono = 1 and Concat(p.nazwisko, ' ',	p.pierwszeImie) = @pracownik
    order by n.nieobecnoscOd

END