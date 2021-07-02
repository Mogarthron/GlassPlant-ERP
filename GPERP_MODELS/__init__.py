from .DBConnection.Connection import DBConnection
from .HumanResources.Employee import HRQuerys
from .HumanResources.HumanResources import WorkCard
from datetime import datetime


class Models:
    config = {
        "Connection_String": None,
        "Human_Resources": False,
        "GlassProp": False,
    }

    def Employees(self):

        if self.config["Human_Resources"] == True:

            HRQuerys.ConStr = self.config["Connection_String"]
            Emp = HRQuerys()
            print(Emp.ShowListOfEmpolyees())

    def PrintWorkCards(self):
        if self.config["Human_Resources"] == True:
            Nazwa_Dzialu = "Dział Technologiczny"
            Rok = input("Rok rozliczenia: ")
            Mc = input("Miesiąc rozliczenia: ")

            wk = WorkCard(
                DBConnection(self.config["Connection_String"]),
                Nazwa_Dzialu,
                int(Rok),
                int(Mc),
            )

            wk.PrintWorkCardToExcell()

    def Create_BackEnd(self):

        self.Employees()

    def Test(self):
        from .HumanResources.CreateWorkCardTemplate import Temp

        temp = Temp()
        temp.CreateTemp()