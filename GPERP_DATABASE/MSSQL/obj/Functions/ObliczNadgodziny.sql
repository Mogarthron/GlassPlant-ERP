Create FUNCTION ObliczNadgodziny (
	@id_prac int,
	@godziny smallint,
	@wysokoscPremii tinyint)
Returns money as
Begin
    declare @stawka money, @premia money;
    set @stawka = (select s.stawka
    from EtatyStawki s
        join Etaty e on e.id = s.id_Etaty
    where s.aktualna = 1 and e.id_Pracownicy = @id_Prac);
    set @premia = @stawka * @godziny * (100 + @wysokoscPremii)/100
    return @premia;
End
