--z�o�one zam�wienia
select NR_DOKUMENTU, dataWplywuZamowienia, dataPrzyjeciaZamowienia, oczekiwanaDataZamknieciaZamowienia, informacjeNaTematRealizacji from dbo.ZamowienieKlienta

--zamkni�te zam�wienia
select NR_DOKUMENTU, dataWplywuZamowienia, dataPrzyjeciaZamowienia, zam�wienieZamkniete, informacjeNaTematRealizacji, daneNaTematTransportu from dbo.ZamowienieKlienta

--odrzucone zam�wieia
select NR_DOKUMENTU, dataWplywuZamowienia, powodOdrzucenia from dbo.ZamowienieKlienta