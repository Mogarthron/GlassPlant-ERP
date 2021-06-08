

CREATE PROCEDURE spSumaPrzygotowanychZestawow
    @dataDodania DATE

AS
BEGIN

    SET NOCOUNT ON;
    SELECT
        r.nazwaReceptury
        , sum(p.ilosc) AS "Suma Zestawów"
    FROM dbo.PrzygotowaneZestawy p
        INNER JOIN dbo.Receptury r ON r.id = p.id_Receptury
    WHERE Year(dataPrzygotowania) = YEAR(@dataDodania)
        AND Month(dataPrzygotowania) = month(@dataDodania)
    GROUP BY r.nazwaReceptury
END
GO




