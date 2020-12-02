import pyodbc
import pandas as pd


class DBConnection():
    def __MSConstring(self):

        path = './Resources/ConnectionStr/MSSQL_Connection.txt'

        file = open(path, 'r')
        constring = file.read()
        file.close()

        return constring

    def ShowQuerry(self, query,  parms):

        conn = pyodbc.connect(self.__MSConstring())

        df = pd.read_sql(query, conn, params=parms)

        return df


# parms = [2020, 11]
# query = 'exec [GPERP].[dbo].[spPokazHarmonogram_HarmonogramPracyPracownika] ? , ?'
# db = DBConnection()
# print(db.ShowQuerry(query, parms))
