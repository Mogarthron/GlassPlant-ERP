--z³o¿one zamówienia
select NR_DOKUMENTU, dataWplywuZamowienia, dataPrzyjeciaZamowienia, oczekiwanaDataZamknieciaZamowienia, informacjeNaTematRealizacji from dbo.ZamowienieKlienta

--zamkniête zamówienia
select NR_DOKUMENTU, dataWplywuZamowienia, dataPrzyjeciaZamowienia, zamówienieZamkniete, informacjeNaTematRealizacji, daneNaTematTransportu from dbo.ZamowienieKlienta

--odrzucone zamówieia
select NR_DOKUMENTU, dataWplywuZamowienia, powodOdrzucenia from dbo.ZamowienieKlienta