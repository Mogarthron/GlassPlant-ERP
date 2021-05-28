from .DBConnection.Connection import DBConnection


class APP:
    config = {
        "Connection_String": "",
        "Human_Resources": False,
        "GlassProp": False,
    }

    def Create_APP(self):

        db = DBConnection(self.config["Connection_String"])

        if self.config["Human_Resources"] == True:

            from .HumanResources.HumanResources import WorkCard

            Nazwa_Dzialu = "Dział Technologiczny"
            Rok = input("Rok rozliczenia: ")
            Mc = input("Miesiąc rozliczenia: ")

            wk = WorkCard(
                db,
                Nazwa_Dzialu,
                int(Rok),
                int(Mc),
            )

            wk.PrintWorkCardToExcell()

    def Test(self):
        from .HumanResources.CreateWorkCardTemplate import Temp

        temp = Temp()
        temp.CreateTemp()