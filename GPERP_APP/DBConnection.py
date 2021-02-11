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
