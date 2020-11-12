select * from dbo.ZamowienieSprzedarzy
--select * from dbo.InternetowyFormularzZamowienia

select 
	z.id, 
	s.zamowienieKlienta, 
	t.nazwa, 
	z.ilosc, 
	z.rabaty, 
	z.zdobieniaDodatkowe, 
	z.uwagiDoPozycji, 
	k.oczekiwanaDataZamknieciaZamowienia, 
	s.statusZamowienia 
from dbo.ZamowienieSprzedarzyPozycje z
join dbo.Towary t on t.id = z.id_Towary
join dbo.ZamowienieSprzedarzy s on s.id = z.id_ZamowienieSprzedarzy
join dbo.ZamowienieKlienta k on k.NR_DOKUMENTU = s.zamowienieKlienta

union

select 
	z.id, 
	s.zamowienieKlienta, 
	i.towar, 
	i.ilosc, 
	z.rabaty, 
	z.zdobieniaDodatkowe, 
	z.uwagiDoPozycji, 
	a.oczekiwanaDataZamknieciaZamowienia, 
	s.statusZamowienia 
from dbo.ZamowienieSprzedarzyPozycje z
join dbo.InternetowyFormularzZamowieniaPozycje i on i.id = z.PFI
join dbo.ZamowienieSprzedarzy s on s.id = z.id_ZamowienieSprzedarzy
join dbo.InternetowyFormularzZamowienia a on a.id = i.IFZ

union


----Zamówienia rezerwowe
select 
	z.id, 
	s.zamowienieKlienta, 
	t.nazwa, 
	z.ilosc, 
	z.rabaty, 
	z.zdobieniaDodatkowe, 
	z.uwagiDoPozycji, 
	s.oczekiwanaDataZakonczeniaZamowienia,
	s.statusZamowienia 
from dbo.ZamowienieSprzedarzyPozycje z
join dbo.Towary t on t.id = z.id_Towary
join dbo.ZamowienieSprzedarzy s on s.id = z.id_ZamowienieSprzedarzy
where  s.priorytetZamowienia > 199
