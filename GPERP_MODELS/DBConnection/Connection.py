import pyodbc
from pandas import read_sql


class DBConnection:

    # querys = [
    #     "exec [GPERP].[dbo].[spDaneDoHarmonogramu] ?, ?, ?",
    #     "exec [GPERP].[dbo].[spDniWolneOdPracyWynikajaceZHarmonogramu] ?, ?, ?",
    #     "exec [GPERP].[dbo].[spNieobecnosciPracownika] ?, ?, ?",
    #     "exec [GPERP].[dbo].[spDniWolneOdPracyISwieta] ?, ?",
    #     "select p.przestojOd, p.przestojDo from dbo.PrzestojeProdukcji p join dbo.TypPrzestojuProdukcji t on t.id = p.id_TypPrzestoju where YEAR(przestojOd) = ? and Month(przestojOd) = ? and p.id_TypPrzestoju = 1 order by przestojOd",
    # ]

    def __init__(self, constr):
        self.conn = pyodbc.connect(constr)
        

    def ShowQuerry(self, query, params):

        df = read_sql(query, self.conn, params=params)

        return df

    def InsertInTo(self, query, parms=None):
        pass
