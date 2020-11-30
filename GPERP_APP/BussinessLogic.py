from GlassPullRate import PullRateModel
from datetime import date
import pandas as pd


class BussinessLogic:

    def Controll(self):
        li1 = '1: Wprowadź wydobycie (wszytkie zmiany pracujące)'
        li2 = '2: Wprowadź wydobycie (Dowolne wpisywanie wartosci)'

        choiceList = [li1, li2]

        for li in choiceList:
            print(li)

        choise = input('Wybierz opcje: ')

        if (choise == '1'):
            print('bla bla bla')

    def DayliPullRateAllShiftsWorked(self):

        d = input('Podaj date yyyy.mm.dd: ')
        d = d.split(sep='.')
        _date = date(int(d[0]), int(d[1]), int(d[2]))

        we1 = self.AddWEBatches('1')
        we2 = self.AddWEBatches('2')
        we3 = self.AddWEBatches('3')
        sumOfWGBatches = int(input('Ilość baniaków WG: '))

        spr = PullRateModel(_date)

        spr.AddShiftPullRateViaBatches(we1, we2, we3, sumOfWGBatches, 471, 420)

        print('')
        print(spr.date, spr.WE1, spr.WE2, spr.WE3, spr.WG1, spr.WG2, spr.WG3)

    def AddWEBatches(self, shiftNo):

        print('\n#### Zmiana {} ####\n'.format(shiftNo))
        shiftBatches = list()

        while(True):

            batch = list()
            a = input('czas zbiornika na zmianie: ')
            b = input('ile schodził zbiornik: ')
            print('')
            batch.append(int(a))
            batch.append(int(b))
            shiftBatches.append(batch)

            q = input('dodać następny zbiornik T/N: ')
            if (q == 'N' or q == 'n'):
                break

        print('\nZbiorniki na zmianie: ', shiftBatches)
        return shiftBatches

    def AddRowToPullRateTable(self, date, ListOfWEBatches, SumOfWGBatches):

        spr = PullRateModel(date)

        spr.AddShiftPullRateViaBatches(
            ListOfWEBatches[0], ListOfWEBatches[1], ListOfWEBatches[2], SumOfWGBatches, 471, 420)

        print(spr.date, spr.WE1, spr.WE2, spr.WE3, spr.WG1, spr.WG2, spr.WG3)
