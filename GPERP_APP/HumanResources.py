import datetime
from datetime import date
from openpyxl import Workbook, load_workbook
from openpyxl.styles import Font, Color, PatternFill
import calendar
import pandas as pd
from pandas import DataFrame, Series
from DBConnection import DBConnection
import os.path


class ScheduleModel():

    def __init__(self):

        self.MonthNames = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec',
                           'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień']

        self.weekDay = ['poniedziałek', 'wtorek', 'środa',
                        'czwartek', 'piątek', 'sobota', 'niedziela']

        self.r = ['Ranek', 'R']
        self.p = ['Popołudnie', 'P']
        self.n = ['Nocka', 'N']
        self.w = ['Wolne', 'W']
        self.r7 = ['Ranek od 7:00', '7']
        self.r8 = ['Ranek od 8:00', '8']
        self.wn = ['Wolna niedziela', 'wn']
        self.dt = ['Dzień wolny wynikający z grafiku', 'dt']
        self.h = ['Święta i dni wolne od pracy', 'h']
        self.l4 = ['Zwolnienie lekarskie', 'L4']
        self.uw = ['Urlop wypoczynkowy', 'uw']
        self.uo = ['Urlop okolicznościowy', 'uo']
        self.ub = ['Urlop bezpłatny', 'ub']
        self.nn = ['Nieobecność nieusprawiedliwiona', 'nn']
        self.nu = ['Nieobecność usprawiedliwiona', 'nu']

    def SchedulePatern(self, patern):
        '''patern is string like RRRRWPPPPWNNNNWW '''

        _schedulePatern = list()

        for i in patern:
            if(i == 'R'):
                _schedulePatern.append(self.r)
            elif (i == 'P'):
                _schedulePatern.append(self.p)
            elif (i == 'N'):
                _schedulePatern.append(self.n)
            elif (i == 'W'):
                _schedulePatern.append(self.w)
            elif (i == '7'):
                _schedulePatern.append(self.r7)
            elif (i == '8'):
                _schedulePatern.append(self.r7)

        return _schedulePatern

    def WeekDay(self, data):
        r = list()
        r.append(data)
        r.append(self.weekDay[data.weekday()])
        return r

    def MonthDay(self, year, month):

        data = date(year, month, 1)

        monthDay = list()

        if (data.month == 12):
            while (data.year < year + 1):
                monthDay.append(self.WeekDay(data))
                data = data + datetime.timedelta(days=1)
        else:
            while (data.month < month + 1):
                monthDay.append(self.WeekDay(data))
                data = data + datetime.timedelta(days=1)

        return monthDay

    def SetShiftsDiuringMonth(self, year, month, schedulePatern, startShift):

        shift = list()

        for __d in self.MonthDay(year, month):

            shift.append(schedulePatern[startShift])

            startShift = startShift + 1
            if (len(schedulePatern) - 1 < startShift):
                startShift = 0

        # return [x[1] for x in shift]
        return shift


class WorkSchedule():

    def __init__(self, department, year, month):
        '''year and month mast by int type'''

        self.__sm = ScheduleModel()

        self.Department = department
        self.year = year
        self.month = month

        # self.MonthNames = self.__sm.MonthNames
        # self.weekDay = self.__sm.weekDay

        self.__departmentName = 'Wydział: '

    def __SetListOfEmployes(self):

        parms = [self.year, self.month]
        query = 'exec [GPERP].[dbo].[spPokazHarmonogram_HarmonogramPracyPracownika] ? , ?'
        dbcon = DBConnection()
        listOfEmployes = dbcon.ShowQuerry(query, parms)

        return listOfEmployes

    def SetShiftsDiuringMonth(self, schedulePatern, startShift):

        shift = list()

        for __d in self.__sm.MonthDay(self.year, self.month):

            shift.append(schedulePatern[startShift])

            startShift = startShift + 1
            if (len(schedulePatern) - 1 < startShift):
                startShift = 0

        return [x[1] for x in shift]

    def CreateSchedule(self):

        sh = DataFrame()

        sh['Dzień mc'] = [x[0]
                          for x in self.__sm.MonthDay(self.year, self.month)]
        sh['Dzień tyg'] = [x[1]
                           for x in self.__sm.MonthDay(self.year, self.month)]

        __e = self.__SetListOfEmployes()

        for i in __e.index:
            sh[__e['Pracownik'][i]] = self.SetShiftsDiuringMonth(
                self.__sm.SchedulePatern(__e['przebiegZmian'][i]), __e['poczatkowaZmiana'][i])

        sh.to_excel('Harmonogram_Template.xlsx', index=False)
        print(sh.to_string(index=False))

    def ReadShedule(self):

        df = pd.read_excel('Harmonogram_Template.xlsx', engine='openpyxl')

        sheduleName = self.Department + '_' + \
            str(self.year) + '_' + str(self.month) + '.xlsx'

        return df
        # print(df)
        # df.to_excel(sheduleName)

        # if os.path.isfile('Harmonogram_Template.xlsx'):
        #     os.remove('Harmonogram_Template.xlsx')


class WorkCard():

    def __init__(self, department, year, month):

        self.Department = department
        self.year = year
        self.month = month

        self.sm = ScheduleModel()
        self.__departmentName = 'Wydział: '

    # def WorkCardTemplate(self):

    def SetWorkSchedule(self, schedulePatern, stratShift, noneWorkingDays):

        sp = self.sm.SchedulePatern(schedulePatern)

        return self.sm.SetShiftsDiuringMonth(
            self.year, self.month, sp, stratShift)

    def PrintWorkCardToExcell(self, Employ, workSchedule, Holidays):

        wb = load_workbook(filename='./Resources/Templates/Karta_pracy.xlsx')
        sheet = wb.active

        sheet['A3'] = self.__departmentName + self.Department
        sheet['G1'] = self.sm.MonthNames[self.month-1]
        sheet['G2'] = self.year
        sheet['M1'] = Employ[0]
        sheet['AC1'] = Employ[2]
        sheet['AI1'] = Employ[1]

        colNum = 4

        workTime = 0
        nightWork = 0
        vacationLeave = 0  # Urlop wypoczynkowy

        for d in range(calendar.monthrange(self.year, self.month)[1]):

            for i in Holidays:
                if (date(self.year, self.month, d+1) == i):
                    CellFontColor = Font(
                        color='00FFFFFF', name='Calibri', size=11)
                    CellFillColor = PatternFill("solid", fgColor='00808080')
                    c = sheet.cell(row=5, column=colNum, value=d + 1)
                    c.font = CellFontColor
                    c.fill = CellFillColor
                else:
                    sheet.cell(row=5, column=colNum, value=d + 1)

            if (date(self.year, self.month, d+1).weekday() == 6):
                CellFontColor = Font(color='00FFFFFF', name='Calibri', size=11)
                CellFillColor = PatternFill("solid", fgColor='00808080')
                c = sheet.cell(row=5, column=colNum, value=d + 1)
                c.font = CellFontColor
                c.fill = CellFillColor
            else:
                sheet.cell(row=5, column=colNum, value=d + 1)

            # Ranki
            if (workSchedule[d] == self.sm.r):
                sheet.cell(row=6, column=colNum, value=6)
                sheet.cell(row=7, column=colNum, value=14)
                sheet.cell(row=8, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                workTime = workTime + 8
            # Popołudnia
            elif (workSchedule[d] == self.sm.p):
                sheet.cell(row=6, column=colNum, value=14)
                sheet.cell(row=7, column=colNum, value=22)
                sheet.cell(row=8, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                workTime = workTime + 8
            # Nocki
            elif (workSchedule[d] == self.sm.n):
                sheet.cell(row=6, column=colNum, value=22)
                sheet.cell(row=7, column=colNum, value=6)
                sheet.cell(row=8, column=colNum, value=8)
                sheet.cell(row=12, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                workTime = workTime + 8
                nightWork = nightWork + 8
            # Ranki Od 7:00
            elif (workSchedule[d] == self.sm.r7):
                sheet.cell(row=6, column=colNum, value=7)
                sheet.cell(row=7, column=colNum, value=15)
                sheet.cell(row=8, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                workTime = workTime + 8
            # Ranki Od 8:00
            elif (workSchedule[d] == self.sm.r8):
                sheet.cell(row=6, column=colNum, value=8)
                sheet.cell(row=7, column=colNum, value=16)
                sheet.cell(row=8, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                workTime = workTime + 8
            # Wolne i wolne wynikające z grafiku
            elif (workSchedule[d] == self.sm.w or workSchedule[d] == self.sm.dt):
                sheet.cell(row=6, column=colNum, value='')
            # Urlop wypoczynkowy
            elif (workSchedule[d] == self.sm.uw):
                sheet.cell(row=13, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
                vacationLeave = vacationLeave + 8
            # Urlop okolicznościowy
            elif (workSchedule[d] == self.sm.uo):
                sheet.cell(row=17, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)
            # Zwolnienie Lekarskie
            elif (workSchedule[d] == self.sm.l4):
                sheet.cell(row=18, column=colNum, value=8)
                sheet.cell(row=23, column=colNum, value=8)

            colNum = colNum + 1

        #######################################################################

        # print('Pracownik:', Employ[0])
        # print('Czas pracy:', workTime)
        # print('Czas pracy w godzinach nocnych:', nightWork)
        # print('Urlop wypoczynkowy:', vacationLeave)

        if (Employ[1] == 'Topiarz'):
            sheet['A8'] = 'Topienie szkła'
            sheet['A9'] = 'Wylewanie szkła opalowego'
        else:
            sheet['A8'] = 'Czas przepracowany'

        sheet['AI8'] = workTime

        if (nightWork != 0):
            sheet['AI12'] = nightWork

        if (vacationLeave != 0):
            sheet['AI13'] = vacationLeave

        sheet['AI23'] = workTime + vacationLeave

        #########################################################################

        wk_name = './Resources/Output/' + Employ[0] + '.xlsx'

        if os.path.isfile(wk_name):
            os.remove(wk_name)

        print('Printing...')
        wb.save(wk_name)
        print('Work card printed')


##########################################################################################################
##########################################################################################################
