-- IF NOT EXISTS
-- (    
--     SELECT [name]
-- FROM sys.procedures
-- WHERE [name] = 'spDodajNowegoPracownika'
-- )
CREATE PROCEDURE dbo.spDodajNowegoPracownika

    @nazwisko NVARCHAR(50),
    @pierwszeImie NVARCHAR(50),
    @drugieImie NVARCHAR(50),
    @dataUrodzenia DATE

AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.Pracownicy
        (nazwisko, pierwszeImie, drugieImie, dataUrodzenia)
    VALUES
        (@nazwisko, @pierwszeImie, @drugieImie, @dataUrodzenia);

END
