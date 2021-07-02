from DBConnection import DBConnection
import numpy as np
import pandas as pd
from pandas import DataFrame


class DefaultProp():
    '''
    Default data for oxides and raw materials 
    '''

    def __init__(self):
        ##################################################################################
        # Dane do obliczenień składu skieł
        ####################################################################################

        self.raw_mat = ['Piasek szkl kl. 1',
                        'Soda cieżka',
                        'Azotan sodu', 'Kriolit',
                        'Węglan potasu',
                        'Tlenek cynku',
                        'Siarczan sodu',
                        'Boraks pięciowodny',
                        'Trójtlenek antymonu',
                        'Wodorotlenek glinu',
                        'Węglan litu',
                        'Trójfosforan sodu',
                        'Mączka wapienna',
                        'Mączka dolomitowa',
                        'Mączka skaleniowa',
                        'Węglan baru']
        # informacje nt poszczególnuch tlenków
        # nazwa_tlenku, masa_molowa, stan w szkle, lotność, p-alfa
        self.ox_data = [['SiO2', 60.06, 's', 0.005, 'calc'],  # 0
                        ['Al2O3', 101.96, 's', 0, -35],
                        ['TiO2', 79.866, 's', 0, 'calc'],
                        # p-alfa dla FeO przeliczyć
                        ['Fe2O3', 159.69, 's', 0, 55],
                        ['Na2O', 61.99, 's', 0.035, 'calc_r'],
                        ['CO2', 0, 'g', 0.99, None],  # 5
                        ['NxOx', 0, 'g', 0.99, None],
                        ['Kriolit', 209.9, 's', 0.5, 480],
                        ['K2O', 94.19, 's', 0.12, 'calc_r'],
                        ['ZnO', 81.406, 's', 0.04, 50],  # 9
                        ['SOx', 0, 'g', 0.99, None],
                        ['B2O3', 69.64, 's', 0.15, 'calc'],
                        ['H2O', 0, 'g', 0.99, None],
                        ['Sb2O3', 291.52, 's', 0, 75],
                        ['Li2O', 29.88, 's', 0.5, 'calc_r'],
                        ['P2O5', 283.89, 's', 0, 140],  # 15
                        ['CaO', 56.0774, 's', 0, 130],
                        ['MgO', 40.304, 's', 0, 60],
                        ['SrO', 103.619, 's', 0, 160],
                        ['BaO', 153.326, 's', 0.15, 200]]

        # skład tlenkowy suroców z analizy jakościowej
        # surowiec, tlenek, sklad_prc
        self.QC_data = [['Piasek szkl kl. 1', self.ox_data[0][0], 0.996],
                        ['Piasek szkl kl. 1', self.ox_data[1][0], 0.0012],
                        ['Piasek szkl kl. 1', self.ox_data[2][0], 0.0003],
                        ['Piasek szkl kl. 1', self.ox_data[3][0], 0.000108],
                        ['Soda cieżka', self.ox_data[4][0], 0.585],
                        ['Soda cieżka', self.ox_data[5][0], 0.415],
                        ['Azotan sodu', self.ox_data[4][0], 0.365],
                        ['Azotan sodu', self.ox_data[6][0], 0.635],
                        ['Kriolit', self.ox_data[7][0], 1],
                        ['Węglan potasu', self.ox_data[8][0], 0.682],
                        ['Węglan potasu', self.ox_data[5][0], 0.318],
                        ['Tlenek cynku', self.ox_data[9][0], 1],
                        ['Siarczan sodu', self.ox_data[4][0], 0.436],
                        ['Siarczan sodu', self.ox_data[10][0], 0.564],
                        ['Boraks pięciowodny', self.ox_data[11][0], 0.4781],
                        ['Boraks pięciowodny', self.ox_data[4][0], 0.2128],
                        ['Boraks pięciowodny', self.ox_data[12][0], 0.3091],
                        ['Trójtlenek antymonu', self.ox_data[13][0], 1],
                        ['Wodorotlenek glinu', self.ox_data[1][0], 0.654],
                        ['Wodorotlenek glinu', self.ox_data[12][0], 0.346],
                        ['Węglan litu', self.ox_data[14][0], 0.3936],
                        ['Węglan litu', self.ox_data[5][0], 0.6031],
                        ['Trójfosforan sodu', self.ox_data[15][0], 0.57],
                        ['Trójfosforan sodu', self.ox_data[4][0], 0.43],
                        ['Mączka wapienna', self.ox_data[16][0], 0.554],
                        ['Mączka wapienna', self.ox_data[17][0], 0.0036],
                        ['Mączka wapienna', self.ox_data[0][0], 0.0028],
                        ['Mączka wapienna', self.ox_data[3][0], 0.0003],
                        ['Mączka wapienna', self.ox_data[1][0], 0.0002],
                        ['Mączka wapienna', self.ox_data[5][0], 0.439],
                        ['Mączka dolomitowa', self.ox_data[16][0], 0.303],
                        ['Mączka dolomitowa', self.ox_data[17][0], 0.214],
                        ['Mączka dolomitowa', self.ox_data[3][0], 0.0003],
                        ['Mączka dolomitowa', self.ox_data[5][0], 0.4827],
                        ['Mączka skaleniowa', self.ox_data[1][0], 0.185],
                        ['Mączka skaleniowa', self.ox_data[3][0], 0.0005],
                        ['Mączka skaleniowa', self.ox_data[8][0], 0.062],
                        ['Mączka skaleniowa', self.ox_data[16][0], 0.007],
                        ['Mączka skaleniowa', self.ox_data[4][0], 0.057],
                        ['Mączka skaleniowa', self.ox_data[0][0], 0.677],
                        ['Węglan baru', self.ox_data[19][0], 0.7783],
                        ['Węglan baru', self.ox_data[5][0], (1-0.7783)]]


class RecipeData():
    def __init__(self, glassRecipe):

        dp = DefaultProp()
        self.__ox_data = dp.ox_data
        self.__QC_data = dp.QC_data

        self.Glass_Recipe = self.__GlassCompound(glassRecipe)
        self.Weight_Of_The_Batch = self.Glass_Recipe['ilosc'].sum()

        self.__oxide_compound_rawmaterial = list()
        self.__oxide_compound_glass = list()
        self.__oxide_compound_gas = list()

        self.__OxidesInGlassRecipe()

        # self.Oxides_In_Glass_Recipe = self.__OxidesInGlassRecipe()
        self.__ocr = DataFrame(self.__oxide_compound_rawmaterial,
                               columns=['Tlenek', 'ilosc_kg'])

        self.Oxides_In_Glass_Recipe = self.__ocr.groupby('Tlenek').sum()
        self.Oxides_In_Glass_Recipe['mass_prc'] = self.Oxides_In_Glass_Recipe['ilosc_kg'] / \
            self.Oxides_In_Glass_Recipe['ilosc_kg'].sum() * 100

    def Oxides_In_Melted_Glass(self):
        self.__OxidesInMeltedGlass()

        df = DataFrame(
            self.__oxide_compound_glass, columns=['Tlenek', 'mass_prc'])

        return df

    def __GlassCompound(self, recipe):
        '''
        load rawnaterials in sepecific recypi execep cullet from db. Return Dataframe

        recipy: name of recipy
        '''
        db = DBConnection()

        query = '''select t.nazwa as Surowiec, s.ilosc, t.id_Jednostka from dbo.RecepturySklady s
        join dbo.Receptury r on r.id = s.id_Receptury
        join dbo.Towary t on t.id = s.id_Towary
        where r.nazwaReceptury = ?'''

        df = db.ShowQuerry(query, [recipe])

        # df.set_index('Surowiec', inplace=True)

        df.loc[df['id_Jednostka'] == 3, 'ilosc'] = df['ilosc'] * 1000

        df['procent_surowca'] = df['ilosc']/df['ilosc'].sum()*100

        return df

    def __OxidesInGlassRecipe(self):

        rawmaterial = self.Glass_Recipe['Surowiec'].to_list()

        for i in rawmaterial:
            for j in range(len(self.__QC_data)):
                if (self.__QC_data[j][0] == i):
                    self.__oxide_compound_rawmaterial.append([self.__QC_data[j][1], self.__QC_data[j][2] *
                                                              self.Glass_Recipe['ilosc'].loc[self.Glass_Recipe['Surowiec'] == i].values[0]])

        o_c_r = DataFrame(self.__oxide_compound_rawmaterial,
                          columns=['Tlenek', 'ilosc_kg'])
        ocr = o_c_r.groupby('Tlenek').sum()
        ocr['mass_prc'] = ocr['ilosc_kg'] / ocr['ilosc_kg'].sum() * 100

        # return ocr

    def __OxidesInMeltedGlass(self):

        for i in range(len(self.__oxide_compound_rawmaterial)):
            for j in self.__ox_data:
                if (j[3] != 'g'):
                    if (self.__oxide_compound_rawmaterial[i][0] == j[0]):

                        a = [self.__oxide_compound_rawmaterial[i][0],
                             self.__oxide_compound_rawmaterial[i][1]*(1-j[3])]

                        self.__oxide_compound_glass.append(a)
                else:
                    if (self.__oxide_compound_rawmaterial[i][0] == j[0]):

                        b = [self.__oxide_compound_rawmaterial[i][0],
                             self.__oxide_compound_rawmaterial[i][1]]

                        self.__oxide_compound_gas.append(b)
