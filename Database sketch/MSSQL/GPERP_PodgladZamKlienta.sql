
select * from dbo.ZamowienieKlienta

--bez ikk
select 
	z.NR_DOKUMENTU, 
	formaZlozeniaZamowienia, 
	k.nazwaKrotka, 
	dataWplywuZamowienia, 
	dataPrzyjeciaZamowienia, 
	oczekiwanaDataZamknieciaZamowienia, 
	informacjNaTematPlatnosci, 
	daneNaTematTransportu, 
	uwagiDodatkowe, 
	informacjeNaTematRealizacji 
from dbo.ZamowienieKlienta z
inner join dbo.Kontrachent k on k.id = z.id_Kontrachent
union
--ikk
select 
	NR_DOKUMENTU, 
	formaZlozeniaZamowienia, 
	a.nazwaKrotka, 
	f.dataZlozeniaZamowienia, 
	dataPrzyjeciaZamowienia, 
	f.oczekiwanaDataZamknieciaZamowienia, 
	informacjNaTematPlatnosci, 
	f.transport, 
	f.uwagiDoZamowienia, 
	informacjeNaTematRealizacji 
from dbo.ZamowienieKlienta z
join dbo.InternetowyFormularzZamowienia f on f.id = z.IFZ
join dbo.InternetoweKontoKlienta k on k.id = f.IKK
join dbo.Kontrachent a on a.id = k.id_Kontrachent
order by oczekiwanaDataZamknieciaZamowienia 