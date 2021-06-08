-- IF NOT EXISTS
-- (    
--     SELECT [name]
-- FROM sys.procedures
-- WHERE [name] = 'spListaPrzygotowanychZestawow'
-- )
CREATE PROCEDURE dbo.spListaPrzygotowanychZestawow

    @dataDodania date

AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        p.id
        , r.nazwaReceptury
        , p.ilosc
    FROM dbo.PrzygotowaneZestawy p
        INNER JOIN dbo.Receptury r ON r.id = p.id_Receptury
    WHERE dataPrzygotowania = @dataDodania
    ORDER BY p.dataPrzygotowania;
END

GO

