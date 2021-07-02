
CREATE PROCEDURE dbo.spNieobecnosciPracownika_id

    @year int,
    @month int,
    @id_prac int
AS
BEGIN

    select
        t.skrot,
        CONVERT(date, n.nieobecnoscOd) as "nieobecnoscOd",
        CONVERT(date, n.nieobecnoscDo) as "nieobecniscDo",
        n.czasNieprzeracowany
    from dbo.NieobecnosciPracownikow n
        join dbo.TypyNieobecnosci t on t.id = n.id_TypNieobecnosci
    where 
	    n.zatwierdzono = 1 and
        YEAR(n.nieobecnoscDo) = @year and
        MONTH(n.nieobecnoscDo) = @month and
        id_Pracownicy = @id_prac
END