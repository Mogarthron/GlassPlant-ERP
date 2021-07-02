import pyodbc
from pandas import read_sql


class HRQuerys:
    ConStr = None
    __conn = None
    __cur = None

    # hr_querys =

    def __connect(self):
        if self.ConStr == None:
            print("ConStr nie zdefiniowany!")
        else:
            self.__conn = pyodbc.connect(self.ConStr)
            self.__cur = self.__conn.cursor()

    def __disconnect(self):
        self.__cur.close()
        self.__conn.close()
        self.__cur = None
        self.__conn = None

    def AddEmployee(self, surName, name, secondName=None, birdthDate=None):
        """
        birdrh: datetime object
        """
        self.__connect()
        try:
            self.__cur.execute(
                "exec [GPERP].[dbo].[spDodajNowegoPracownika] ?,?,?,?",
                [surName, name, secondName, birdthDate],
            )
            self.__cur.commit()
        except pyodbc.Error:
            print(f"Error: {pyodbc.Error}")

        self.__disconnect()

    def ShowListOfEmpolyees(self):

        self.__connect()
        try:
            df = read_sql(
                "select * from [GPERP].[dbo].[Pracownicy] where zatrudiony = 1",
                self.__conn,
            )

            return df
        except pyodbc.Error:
            print(f"Error: {pyodbc.Error.args[0]}")
        self.__disconnect()


class Employee(HRQuerys):
    # def __init__(self, conStr):
    #     self.ConStr = conStr
    pass