# -*- coding: utf-8 -*-
import unittest
from olimpiadas import calcula_ranking, Pais

class TestOlimpiadas(unittest.TestCase):

    def setUp(self):
        self.brasil = Pais("Brasil", 1, 0, 0)
        self.eua = Pais("EUA", 0, 0, 0)
        self.cuba = Pais("Cuba", 2, 0, 0)
        self.japao = Pais("Japão", 0, 1, 0)
        self.portugal = Pais("Portugal", 0, 1, 1)
        self.africa_do_sul = Pais("Africa do Sul", 0, 1, 1)
        self.alemanha = Pais ("Alemanha", 0, 0, 0)
        
    def test_1_pais_retorna_mesmo_pais(self):
        entrada = [self.brasil]
        self.assertEquals(["Brasil"], calcula_ranking(entrada))

    def test_Brasil_EUA_retorna_Brasil_EUA(self):
        entrada = [self.brasil, self.eua]
        self.assertEquals(["Brasil", "EUA"], calcula_ranking(entrada))

    def test_EUA_Brasil_retorna_Brasil_EUA(self):
        entrada = [self.eua, self.brasil]
        self.assertEquals(["Brasil", "EUA"], calcula_ranking(entrada))

    def test_EUA_Brasil_Cuba_retorna_Cuba_Brasil_EUA(self):
        entrada = [self.eua, self.brasil, self.cuba]
        self.assertEquals(["Cuba", "Brasil", "EUA"], calcula_ranking(entrada))
        
    def test_EUA_Brasil_Cuba_Japao_retorna_Cuba_Brasil_Japao_EUA(self):
        entrada = [self.eua, self.brasil, self.cuba, self.japao]
        self.assertEquals(["Cuba", "Brasil", "Japão", "EUA"], calcula_ranking(entrada))
        
    def test_EUA_Brasil_Cuba_Japao_Portugal_retorna_Cuba_Brasil_Portugal_Japao_EUA(self):
        entrada = [self.eua, self.brasil, self.cuba, self.japao, self.portugal]
        self.assertEquals(["Cuba", "Brasil", "Portugal", "Japão", "EUA"], calcula_ranking(entrada))
        
    def test_EUA_Brasil_Cuba_Japao_Portugal_AfricaDoSul_retorna_Cuba_Brasil_AfricaDoSul_Portugal_Japao_EUA(self):
        entrada = [self.eua, self.brasil, self.cuba, self.japao, self.portugal, self.africa_do_sul]
        self.assertEquals(["Cuba", "Brasil", "Africa do Sul", "Portugal", "Japão", "EUA"], calcula_ranking(entrada))
        
    def test_EUA_Brasil_Cuba_Japao_Portugal_AfricaDoSul_Alemanha_retorna_Cuba_Brasil_AfricaDoSul_Portugal_Japao_Alemanha_EUA(self):
        entrada = [self.eua, self.brasil, self.cuba, self.japao, self.portugal, self.africa_do_sul, self.alemanha]
        self.assertEquals(["Cuba", "Brasil", "Africa do Sul", "Portugal", "Japão", "Alemanha", "EUA"], calcula_ranking(entrada))

if __name__ == '__main__':
    unittest.main()
