----Zamówinie Szprzedarzy bez PFI
--select NR_DOKUMENTU from dbo.ZamowienieKlienta

declare @NRDOKUMENTU nvarchar(20), @UwagiSprzedarzy nvarchar(200), @TypZamowienia nvarchar(30), @SatatusZamowienia nvarchar(30)


--insert into dbo.ZamowienieSprzedarzy(zamowienieKlienta, uwagiSprzedarzy, typZamowienia, statusZamowienia)
--values(null, null, 'Zamówienie na zapas', 'Oczekuj¹ce')

select * from dbo.ZamowienieSprzedarzy
--select * from dbo.Towary

--insert into dbo.ZamowienieSprzedarzyPozycje(id_ZamowienieSprzedarzy, id_Towary,ilosc,rabaty)
--values
--(4, 5, 150, 0.0)


select * from dbo.ZamowienieSprzedarzyPozycje