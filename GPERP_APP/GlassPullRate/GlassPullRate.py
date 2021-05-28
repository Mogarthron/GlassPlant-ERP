from datetime import date
from pandas import DataFrame, read_excel


class PullRateModel:
    '''Add pullrate of glass from gas and electric hitting furance'''

    def __init__(self, date):

        self.date = date
        self.WE1 = 0  # Pullrate from electric furance from first shift
        self.WE2 = 0  # Pullrate from electric furance from second shift
        self.WE3 = 0  # Pullrate from electric furance from third shift
        self.WG1 = 0  # Pullrate from gas furance from first shift
        self.WG2 = 0  # Pullrate from gas furance from second shift
        self.WG3 = 0  # Pullrate from gas furance from third shift

    def AddShiftPullRateViaWE(self, we1, we2, we3, wgSum):

        weSum = we1 + we2 + we3
        self.WE1 = we1
        self.WE2 = we2
        self.WE3 = we3
        self.WG1 = wgSum * (we1/weSum)
        self.WG2 = wgSum * (we2/weSum)
        self.WG3 = wgSum * (we3/weSum)

    def AddShiftPullRateViaWGBatch(self, we1, we2, we3, sumOfWGBatches, glassWeightFromOneWGBatch):

        wgSum = sumOfWGBatches * glassWeightFromOneWGBatch
        weSum = we1 + we2 + we3
        self.WE1 = we1
        self.WE2 = we2
        self.WE3 = we3
        self.WG1 = wgSum * (we1/weSum)
        self.WG2 = wgSum * (we2/weSum)
        self.WG3 = wgSum * (we3/weSum)

    def AddShiftPullRate(self, we1, we2, we3, wg1, wg2, wg3):
        self.WE1 = we1
        self.WE2 = we2
        self.WE3 = we3
        self.WG1 = wg1
        self.WG2 = wg2
        self.WG3 = wg2

    def AddShiftPullRateViaBatches(self, we1, we2, we3, wgSum, glassWeightFromOneWGBatch, glassWeightFromOneWEBatch):

        self.WE1 = self.__SumBatches(we1) * glassWeightFromOneWEBatch
        self.WE2 = self.__SumBatches(we2) * glassWeightFromOneWEBatch
        self.WE3 = self.__SumBatches(we3) * glassWeightFromOneWEBatch

        weSum = self.WE1 + self.WE2 + self.WE3

        self.WG1 = wgSum * (self.WE1 / weSum) * glassWeightFromOneWGBatch
        self.WG2 = wgSum * (self.WE2 / weSum) * glassWeightFromOneWGBatch
        self.WG3 = wgSum * (self.WE3 / weSum) * glassWeightFromOneWGBatch

    def __SumBatches(self, batches):
        b = 0
        for l in batches:
            b = b + (l[0] / l[1])

        return b


class ReadPullRateFromXlsx:

    def __init__(self, pathToFile):

        self.table = read_excel(pathToFile)

    def PullRate(self):

        columns = ['DATA', 'WG1', 'WG2', 'WG3', 'WE1', 'WE2', 'WE3']

        return self.table[columns]
