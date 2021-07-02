create procedure  dbo.spDniWolneOdPracyISwieta
    @year int,
    @month int

as
begin
    set nocount on;

    select *
    from dbo.DniWolneOdPracyISwieta
    where YEAR(data) = @year and MONTH(data) = @month

end