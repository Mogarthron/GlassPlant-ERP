----Zamówi3nie Sprzedarzy z PFI



--select NR_DOKUMENTU from dbo.ZamowienieKlienta

declare @NRDOKUMENTU nvarchar(20), @UwagiSprzedarzy nvarchar(200), @TypZamowienia nvarchar(30), @SatatusZamowienia nvarchar(30), @PobarcPFI bit

set @NRDOKUMENTU = 'ZM_EXP_2010_002'
set @UwagiSprzedarzy = 'Zrobiæ minimum 60 sztuk'
set @TypZamowienia = 'Zamówienie Produkcyjne'
set @PobarcPFI = 1

--insert into dbo.ZamowienieSprzedarzy(zamowienieKlienta, uwagiSprzedarzy, pobracPozycjeZPFI, typZamowienia, statusZamowienia)
--values(@NRDOKUMENTU, @UwagiSprzedarzy, @PobarcPFI, @TypZamowienia, 'Oczekuj¹ce')

--select * from dbo.ZamowienieSprzedarzy

--select * from dbo.InternetowyFormularzZamowieniaPozycje

declare @ZamSprzedarzy int, @PFI int

--insert into dbo.ZamowienieSprzedarzyPozycje(id_ZamowienieSprzedarzy, PFI , rabaty)
--values
--(3, 1, 4.44)


select s.id_ZamowienieSprzedarzy, i.towar, i.ilosc, s.rabaty, s.zdobieniaDodatkowe, s.uwagiDoPozycji from dbo.ZamowienieSprzedarzyPozycje s
join dbo.InternetowyFormularzZamowieniaPozycje i on i.id = s.PFI